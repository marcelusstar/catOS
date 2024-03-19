//
//  NetworkReachability.swift
//  catOS
//
//  Created by rosadiez on 19/3/24.
//

import Foundation
import Network

class NetworkReachability {

    private var pathMonitor: NWPathMonitor!
    private var path: NWPath?
    private let backgroudQueue = DispatchQueue.global(qos: .background)

    var isNetworkAvailable: Bool {
        guard let path = self.path else { return false }
        return path.status == .satisfied
    }

    init() {
        pathMonitor = NWPathMonitor()
        pathMonitor.pathUpdateHandler = { [weak self] path in
            guard let self = self else { return }
            self.path = path
            // Call a completion handler or delegate method here
        }
        pathMonitor.start(queue: backgroudQueue)
    }

    // Add a method to stop monitoring if needed
    func stopMonitoring() {
        pathMonitor.cancel()
    }
}

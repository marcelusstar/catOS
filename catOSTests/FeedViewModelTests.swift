//
//  FeedViewModelTests.swift
//  catOSTests
//
//  Created by rosadiez on 1/9/24.
//

import XCTest
@testable import catOS

class FeedViewModelTests: XCTestCase {
    
    var viewModel: FeedViewModel!
    var apiManager: ApiManagerProtocol!
    
    override func setUp() {
        super.setUp()
        apiManager = ApiManagerMock()
        viewModel = FeedViewModel(apiManager: apiManager)
    }
    
    override func tearDown() {
        apiManager = nil
        viewModel = nil
        super.tearDown()
    }
    
    @MainActor
    func testGetFeedImagesSuccess() async {

        XCTAssertTrue(viewModel.cardViewModels.isEmpty)
        XCTAssertFalse(viewModel.loadingData)
        XCTAssertFalse(viewModel.visibleReloadButton)
        
        // When
        await viewModel.getFeedImages()
        
        let feedImagesNumber = try! await apiManager.getFeedImages(page: 0).count

        // Then
        XCTAssertEqual(viewModel.cardViewModels.count, feedImagesNumber)
        XCTAssertFalse(viewModel.loadingData)
        XCTAssertFalse(viewModel.visibleReloadButton)
        XCTAssertNil(viewModel.error)
    }
    
    func testPaginationNotIncrementsIfImagesAreNotEmpty() async {
        
        XCTAssertEqual(viewModel.paginationFeedImages, 0)
        
        // When
        await viewModel.getFeedImages()
        await viewModel.getFeedImages()
        await viewModel.getFeedImages()
        XCTAssertEqual(viewModel.paginationFeedImages, 1)
    }
    
    func testPaginationNotIncrementsIfImagesAreEmpty() async {
        
        XCTAssertEqual(viewModel.paginationFeedImages, 0)
        
        // When
        await viewModel.getFeedImages()
        viewModel.cardViewModels.removeAll()
        await viewModel.getFeedImages()
        viewModel.cardViewModels.removeAll()
        await viewModel.getFeedImages()
        viewModel.cardViewModels.removeAll()
        XCTAssertEqual(viewModel.paginationFeedImages, 3)
    }
}

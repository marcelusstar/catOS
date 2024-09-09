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
    var apiManagerSuccess: ApiManagerProtocol!
    var apiManagerFailure: ApiManagerProtocol!
    
    override func setUp() {
        super.setUp()
        apiManagerSuccess = ApiManagerMock()
        apiManagerFailure = ApiManagerMockFailure()
        
    }
    
    override func tearDown() {
        apiManagerSuccess = nil
        apiManagerFailure = nil
        super.tearDown()
    }
    
    @MainActor
    func testGetFeedImagesSuccess() async {
        
        viewModel = FeedViewModel(apiManager: apiManagerSuccess)

        XCTAssertTrue(viewModel.cardViewModels.isEmpty)
        XCTAssertFalse(viewModel.loadingData)
        XCTAssertFalse(viewModel.visibleReloadButton)
        
        // When
        await viewModel.getFeedImages()
        
        let feedImagesNumber = try! await apiManagerSuccess.getFeedImages(page: 0).count

        // Then
        XCTAssertEqual(viewModel.cardViewModels.count, feedImagesNumber)
        XCTAssertFalse(viewModel.loadingData)
        XCTAssertFalse(viewModel.visibleReloadButton)
        XCTAssertNil(viewModel.error)
    }
    
    func testGetFeedImagesFailure() async {
        // Given
        let viewModel = FeedViewModel(apiManager: apiManagerFailure)
        
        
        XCTAssertTrue(viewModel.cardViewModels.isEmpty)
        XCTAssertFalse(viewModel.loadingData)
        XCTAssertFalse(viewModel.visibleReloadButton)
        
        // When
        await viewModel.getFeedImages()
        
        // Then
        XCTAssertFalse(viewModel.loadingData) // Should be false after loading completes
        XCTAssertTrue(viewModel.cardViewModels.isEmpty) // No items should be present
        XCTAssertTrue(viewModel.visibleReloadButton) // Reload button should be visible on error
        XCTAssertEqual(viewModel.error, CatError.genericError) // Error should be set
    }
    
    func testPaginationNotIncrementsIfImagesAreNotEmpty() async {
        
        viewModel = FeedViewModel(apiManager: apiManagerSuccess)
        
        XCTAssertEqual(viewModel.paginationFeedImages, 0)
        
        // When
        await viewModel.getFeedImages()
        await viewModel.getFeedImages()
        await viewModel.getFeedImages()
        XCTAssertEqual(viewModel.paginationFeedImages, 1)
    }
    
    func testPaginationNotIncrementsIfImagesAreEmpty() async {
        
        viewModel = FeedViewModel(apiManager: apiManagerSuccess)
        
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
    
    func testLikeImageAndRemoveItAfter() async {
        viewModel = FeedViewModel(apiManager: apiManagerSuccess)

        await viewModel.getFeedImages()
        
        let numberImagesPreviousLike = viewModel.cardViewModels.count
        
        viewModel.like()
        
        // Then
        let expectation = XCTestExpectation(description: "Wait for async operation")
        DispatchQueue.main.asyncAfter(deadline: .now() + CardViewModel.disappearanceAnimationTime + 0.2) {
            expectation.fulfill()
        }
        
        await fulfillment(of: [expectation], timeout: 2.0)
        

        let numberImagesAfterLike = viewModel.cardViewModels.count
        XCTAssertEqual(numberImagesAfterLike, numberImagesPreviousLike - 1)
    }
    
    func testLikeImageOnEmptyImages() async {
        viewModel = FeedViewModel(apiManager: apiManagerSuccess)
        
        let numberImagesPreviousLike = viewModel.cardViewModels.count
        
        viewModel.like()
        
        // Then
        let expectation = XCTestExpectation(description: "Wait for async operation")
        DispatchQueue.main.asyncAfter(deadline: .now() + CardViewModel.disappearanceAnimationTime + 0.2) {
            expectation.fulfill()
        }
        
        await fulfillment(of: [expectation], timeout: 2.0)
        let numberImagesAfterLike = viewModel.cardViewModels.count
        XCTAssertGreaterThan(numberImagesAfterLike, 0)
    }
}

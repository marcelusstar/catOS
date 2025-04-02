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
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    private func getViewModel(shouldSucceed: Bool) -> FeedViewModel {
        var repository = ImagesRepositoryMock()
        repository.shouldSucceed = shouldSucceed
        let useCase = GetFeedImagesUseCaseDefault(repository: repository)
        viewModel = FeedViewModel(getFeedImagesUseCase: GetFeedImagesUseCaseDefault(repository: repository))
        return viewModel
    }
    
    @MainActor
    func testGetFeedImagesSuccess() async {
        
        var repository = ImagesRepositoryMock()
        repository.shouldSucceed = true
        let useCase = GetFeedImagesUseCaseDefault(repository: repository)
        viewModel = getViewModel(shouldSucceed: true)

        XCTAssertTrue(viewModel.cardViewModels.isEmpty)
        XCTAssertFalse(viewModel.loadingData)
        XCTAssertFalse(viewModel.visibleReloadButton)
        
        // When
        await viewModel.getFeedImages()
        
        let feedImagesNumber = try! await useCase.execute(limit: 10).count

        // Then
        XCTAssertEqual(viewModel.cardViewModels.count, feedImagesNumber)
        XCTAssertFalse(viewModel.loadingData)
        XCTAssertFalse(viewModel.visibleReloadButton)
        XCTAssertNil(viewModel.error)
    }
    
    func testGetFeedImagesFailure() async {
        // Given
        var repository = ImagesRepositoryMock()
        repository.shouldSucceed = false
        let useCase = GetFeedImagesUseCaseDefault(repository: repository)
        viewModel = FeedViewModel(getFeedImagesUseCase: GetFeedImagesUseCaseDefault(repository: repository))
        
        
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
    
    func testLikeImageAndRemoveItAfter() async {
        // Given
        var repository = ImagesRepositoryMock()
        repository.shouldSucceed = false
        let useCase = GetFeedImagesUseCaseDefault(repository: repository)
        viewModel = FeedViewModel(getFeedImagesUseCase: GetFeedImagesUseCaseDefault(repository: repository))

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
        // TODO: Refactor this to
        var repository = ImagesRepositoryMock()
        repository.shouldSucceed = false
        let useCase = GetFeedImagesUseCaseDefault(repository: repository)
        viewModel = FeedViewModel(getFeedImagesUseCase: GetFeedImagesUseCaseDefault(repository: repository))
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

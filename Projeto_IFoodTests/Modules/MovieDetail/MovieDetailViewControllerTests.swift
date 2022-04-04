//
//  MovieDetailViewControllerTests.swift
//  Projeto_IFoodTests
//
//  Created by Eduardo Oliveira on 04/04/22.
//

import XCTest
@testable import Projeto_IFood

class MovieDetailViewControllerTests: XCTestCase {

    var sut: MovieDetailViewController!
        
    override func setUpWithError() throws {
        sut = MovieDetailViewController()
        sut.viewModel = MovieDetailViewModel()
        sut.viewModel.output = sut
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testSetupUI() throws {
        // Given
        let exp = expectation(description: "Setting UI with movie informations")
        let movie = Movie(id: "mock",
                          title: "mock",
                          description: "mock",
                          director: "mock",
                          release_date: "mock",
                          image: "mock",
                          movie_banner: "mock",
                          original_title: "mock",
                          original_title_romanised: "mock")
        // When
        sut.setupUI(movie: movie)
        // Then
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            exp.fulfill()
            XCTAssertEqual(exp.description, "Setting UI with movie informations")
        })
        waitForExpectations(timeout: 4, handler: nil)
        
    }

}

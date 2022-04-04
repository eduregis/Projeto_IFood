//
//  ListMovieViewControllerTests.swift
//  Projeto_IFoodTests
//
//  Created by Eduardo Oliveira on 03/04/22.
//

import XCTest
@testable import Projeto_IFood

class ListMovieViewControllerTests: XCTestCase {

    var sut: ListMovieViewController!
        
    override func setUpWithError() throws {
        sut = ListMovieViewController()
        sut.viewModel = ListMovieViewModel()
        sut.viewModel.output = sut
        sut.loadViewIfNeeded()
        sut.loadView()
        sut.viewDidLoad()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testNumberOfRowsInSection() throws {
        // Given
        let indexPath = IndexPath(row: 0, section: 0)
        sut.viewModel.listMovies?.append(Movie(id: "mock",
                                               title: "mock",
                                               description: "mock",
                                               director: "mock",
                                               release_date: "mock",
                                               image: "mock",
                                               movie_banner: "mock",
                                               original_title_romanised: "mock"))
        // When
        let result = sut.tableView(sut.tableView, numberOfRowsInSection: indexPath.section)
        // Then
        XCTAssertEqual(result, 1)
    }
    
    func testCellForRowAt() throws {
        // Given
        let indexPath = IndexPath(row: 0, section: 0)
        sut.viewModel.listMovies?.append(Movie(id: "mock",
                                               title: "mock",
                                               description: "mock",
                                               director: "mock",
                                               release_date: "mock",
                                               image: "mock",
                                               movie_banner: "mock",
                                               original_title_romanised: "mock"))
        // When
        let result = sut.tableView(sut.tableView, cellForRowAt: indexPath)
        // Then
        XCTAssertNotNil(result)
    }
    
    func testHeightForRowAt() throws {
        // Given
        let indexPath = IndexPath(row: 0, section: 0)
        // When
        let result = sut.tableView(sut.tableView, heightForRowAt: indexPath)
        // Then
        XCTAssertEqual(result, 60.0)
    }
    
    func testDidSelectRowAt() throws {
        // Given
        let exp = expectation(description: "Selecting a row")
        let indexPath = IndexPath(row: 0, section: 0)
        sut.viewModel.listMovies?.append(Movie(id: "mock",
                                               title: "mock",
                                               description: "mock",
                                               director: "mock",
                                               release_date: "mock",
                                               image: "mock",
                                               movie_banner: "mock",
                                               original_title_romanised: "mock"))
        // When
        sut.tableView(sut.tableView, didSelectRowAt: indexPath)
        // Then
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            exp.fulfill()
            XCTAssertEqual(exp.description, "Selecting a row")
        })
        waitForExpectations(timeout: 4, handler: nil)
    }
    
    func testUpdateSearchResults() throws {
        // Given
        let exp = expectation(description: "Making a new search with a text")
        let searchController = UISearchController()
        // When
        sut.updateSearchResults(for: searchController)
        // Then
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            exp.fulfill()
            XCTAssertEqual(exp.description, "Making a new search with a text")
        })
        waitForExpectations(timeout: 4, handler: nil)
    }

}


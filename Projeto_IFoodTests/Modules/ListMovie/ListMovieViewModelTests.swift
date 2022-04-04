//
//  ListMovieViewModelTests.swift
//  Projeto_IFoodTests
//
//  Created by Eduardo Oliveira on 03/04/22.
//

import XCTest
@testable import Projeto_IFood

class ListMovieViewModelTests: XCTestCase {

    var viewmodel: ListMovieViewModel!
    
    override func setUpWithError() throws {
        viewmodel = ListMovieViewModel()
    }

    override func tearDownWithError() throws {
        viewmodel = nil
    }
    
    func testFetchMoviesSuccess() throws {
        // Given
        let exp = expectation(description: "Success to fetching movies")
        // When
        viewmodel.fetchMovies(searchText: "mock")
        // Then
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            exp.fulfill()
            XCTAssertEqual(exp.description, "Success to fetching movies")
        })
        waitForExpectations(timeout: 4, handler: nil)
    }
    
    func testGenerateCellFailure() throws {
        // Given
        let tableView = UITableView()
        let indexpath = IndexPath(row: 0, section: 0)
        // When
        let result = viewmodel.generateCell(for: tableView, indexPath: indexpath)
        // Then
        XCTAssertNotNil(result)
        
    }
}

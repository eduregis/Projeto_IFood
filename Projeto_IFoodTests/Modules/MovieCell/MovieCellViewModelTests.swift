//
//  MovieCellViewModelTests.swift
//  Projeto_IFoodTests
//
//  Created by Eduardo Oliveira on 03/04/22.
//

import XCTest
import Combine
@testable import Projeto_IFood

class MovieCellViewModelTests: XCTestCase {

    var viewmodel: MovieCellViewModel!
//    var service: MovieCellServiceMock!
    var cancellables: Set<AnyCancellable>!
    override func setUpWithError() throws {
//        service = MovieCellServiceMock()
        viewmodel = MovieCellViewModel()
        cancellables = Set<AnyCancellable>()
    }

    override func tearDownWithError() throws {
//        service = nil
        viewmodel = nil
        cancellables.forEach { $0.cancel() }
        cancellables = nil
    }
    
    func 

}

//
//  ApiServiceError.swift
//  Projeto_IFood
//
//  Created by Eduardo Oliveira on 02/04/22.
//


import Foundation
import Network

enum ApiServiceError: Error {
    // Enum com alguns casos de erro.
    case invalidUrl
    case noInternetConnection
    case decodingError
    case responseError
    case quoteNotFound
}

class NetworkMonitor {
    // classe para monitorar a conexão com a internet.
  static let shared = NetworkMonitor()
  var isReachable: Bool { status == .satisfied }

  private let monitor = NWPathMonitor()
  private var status = NWPath.Status.requiresConnection

  private init() {
    startMonitoring()
  }

  func startMonitoring() {
    monitor.pathUpdateHandler = { [weak self] path in
      self?.status = path.status
    }
    let queue = DispatchQueue(label: "NetworkMonitor")
    monitor.start(queue: queue)
  }

  func stopMonitoring() {
    monitor.cancel()
  }
}

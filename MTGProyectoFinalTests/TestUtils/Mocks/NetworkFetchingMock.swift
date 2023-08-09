//
//  NetworkFetchingMock.swift
//  MTGProyectoFinalTests
//
//  Created by Díez Sobrino Cristina on 8/8/23.
//

import Foundation
@testable import MTGProyectoFinal

class NetworkFetchingMock: NetworkFetchingProtocol {
    
    let result: Result<Data, Error>

    init(returning result: Result<Data, Error>) {
        self.result = result
    }
    
    func data(url: URLRequest) async throws -> (Data, URLResponse) {
        // Not needed as it is done with the URLProtocol
        return ("".data(using: .utf8)!,URLResponse()) // Not needed
    }
}

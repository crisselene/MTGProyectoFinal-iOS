//
//  URLSessionExtension.swift
//  MTGProyectoFinal
//
//  Created by Díez Sobrino Cristina on 8/8/23.
//

import Foundation

extension URLSession: NetworkFetchingProtocol {
    func data(url: URLRequest) async throws -> (Data, URLResponse) {
        return try await data(for: url)
    }
    
}

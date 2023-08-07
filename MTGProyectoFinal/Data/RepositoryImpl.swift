//
//  RepositoryImpl.swift
//  MTGProyectoFinal
//
//  Created by Díez Sobrino Cristina on 2/8/23.
//

import Foundation
import Combine

final class RepositoryImpl: RepositoryProtocol {
    
    // MARK: - Properties
    private let remoteDataSource: RemoteDataSourceProtocol
    
    // MARK: - Init
    init(remoteDataSource: RemoteDataSourceProtocol) {
        self.remoteDataSource = remoteDataSource
    }
    
    func getCards() async throws -> [Card]? {
        return try? await remoteDataSource.getCards()
    }
    
    func getSymbols() async throws -> [Symbol]? {
        return try? await remoteDataSource.getSymbols()
    }
    
}

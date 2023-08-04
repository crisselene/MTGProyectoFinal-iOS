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
    
    func getCards(name:String) async throws -> [Card]? {
        return try? await remoteDataSource.getCards(name:name)
    }
    
}

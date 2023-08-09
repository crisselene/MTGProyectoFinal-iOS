//
//  RemoteDatasourceImpl.swift
//  MTGProyectoFinal
//
//  Created by Díez Sobrino Cristina on 2/8/23.
//

import Foundation
import Combine

enum NetworkError: Error, Equatable {
    case malformedURL
    case noData
    case errorCode(Int?)
    case decoding
    case other
}

final class RemoteDataSourceImpl: RemoteDataSourceProtocol {
    
    private let session: NetworkFetchingProtocol
    private let cardsServer: String = "https://api.magicthegathering.io/v1/cards"

    init(session: NetworkFetchingProtocol = URLSession.shared) {
        self.session = session
    }
    
    func getCards() async throws -> [Card]? {
     
        // Get url session
        guard let url = getSessionCards() else {
            throw NetworkError.malformedURL
        }
        
        // Obetener la data de la llamada
        let (data, _) = try await session.data(url: url)
        
        var allCardsData: AllCards = AllCards(cards: [])
        do {
            allCardsData = try JSONDecoder().decode(AllCards.self, from: data)
        } catch {
            print(error)
        }
        
        return allCardsData.cards
    }
    
}

extension RemoteDataSourceImpl{
    
    func getSessionCards() -> URLRequest? {
        // Get URL
        // tratar los errores
        guard let url = URL(string: "\(cardsServer)") else {
            print("URL Error")
            return nil
        }

        // URL request
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"

        return urlRequest
    }
}


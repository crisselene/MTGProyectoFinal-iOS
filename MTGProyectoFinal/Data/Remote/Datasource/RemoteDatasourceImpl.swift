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
    
    private let server: String = "https://api.magicthegathering.io/v1/cards"

    func getCards(name: String) async throws -> [Card]? {
        // Get url session
        guard let url = URL(string: "\(server)") else {
            print("URL Error")
            return nil
        }
        
        
        // Obetener la data de la llamada
        let (data, _) = try await URLSession.shared.data(from: url)
        var allCardsData: AllCards = AllCards(cards: [])
        do {
            allCardsData = try JSONDecoder().decode(AllCards.self, from: data)
        } catch {
            print(error)
        }
        print(allCardsData.cards.first?.name) // Log para comprobar que la decodificación ha sido satisfactoria
        
        return allCardsData.cards
    }
}


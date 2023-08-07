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
    
    private let cardsServer: String = "https://api.magicthegathering.io/v1/cards"
    private let manaServer: String = "https://api.scryfall.com/symbology"

    func getCards() async throws -> [Card]? {
        // Get url session
        guard let url = URL(string: "\(cardsServer)") else {
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
        
        return allCardsData.cards
    }
    
    func getSymbols() async throws -> [Symbol]? {
        // Get url session
        guard let url = URL(string: "\(manaServer)") else {
            print("URL Error")
            return nil
        }
        
        
        // Obetener la data de la llamada
        let (data, _) = try await URLSession.shared.data(from: url)
        var allSymbolsData: AllSymbols = AllSymbols(symbols: [])
        do {
            allSymbolsData = try JSONDecoder().decode(AllSymbols.self, from: data)
        } catch {
            print(error)
        }
        
        return allSymbolsData.symbols
    }
    
}


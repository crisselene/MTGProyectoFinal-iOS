//
//  HomeViewModel.swift
//  MTGProyectoFinal
//
//  Created by Díez Sobrino Cristina on 2/8/23.
//

import SwiftUI
import Combine

final class HomeViewModel: ObservableObject {
    // MARK: Properties
    private let repository: RepositoryProtocol
    @Published var cards: [Card] = []
    
    init(repository: RepositoryProtocol) {
        self.repository = repository
        DispatchQueue.main.async {
            Task {
                guard let cardsFromApi = try? await repository.getCards(name: "") else {
                    self.cards = []
                    print("Unable to get cards from api")
                    return
                }
                self.cards = cardsFromApi
                let prueba = self.cards[0].manaCost.replacingOccurrences(of: "}", with: "} ")
                print(prueba.components(separatedBy: " "))
            }
        }
    }
}

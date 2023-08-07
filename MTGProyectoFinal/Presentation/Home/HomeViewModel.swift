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
    @Published var searchText: String = ""
    
    //computed property
    var filteredCards: [Card] {
        guard !searchText.isEmpty else { return cards }

        return cards.filter { card in
            card.name.lowercased().contains(searchText.lowercased()) ||             card.type.lowercased().contains(searchText.lowercased())
            }
        }
    
    
    init(repository: RepositoryProtocol) {
        self.repository = repository
        DispatchQueue.main.async {
            Task {
                guard let cardsFromApi = try? await repository.getCards() else {
                    self.cards = []
                    print("Unable to get cards from api")
                    return
                }
                //filter only cards with image
                self.cards = cardsFromApi.filter({ $0.imageUrl != nil })
            }
        }
    }
}

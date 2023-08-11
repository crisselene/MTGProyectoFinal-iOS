//
//  HomeViewModel.swift
//  MTGProyectoFinal
//
//  Created by Díez Sobrino Cristina on 2/8/23.
//

import SwiftUI
import Combine

enum CardsTypes: String, CaseIterable, Identifiable {
    case all = "All types"
    case creature = "Creature"
    case artifact = "Artifact"
    case enchantment = "Enchantment"
    case instant = "Instant"
    case land = "Land"
    case sorcery = "Sorcery"
    case planeswalker = "Planeswalker"
    
    var id: CardsTypes {self}
}

final class HomeViewModel: ObservableObject {
    // MARK: Properties
    let repository: RepositoryProtocol
    @Published var cards: [Card] = []
    @Published var selectedType: CardsTypes = .all
    @Published var searchText: String = ""
    
    //computed property
    var searchedCards: [Card] {
        guard !searchText.isEmpty else {
            return cardTypeSelected
        }
        return cardTypeSelected.filter { card in
            card.name.lowercased().contains(searchText.lowercased()) ||             card.type.lowercased().contains(searchText.lowercased())
            }
        }
    
    var cardTypeSelected: [Card] {
        switch (selectedType){
        case .all:
            return cards
        default:
            return cards.filter {$0.type.contains(selectedType.rawValue)}
        }
    }
    
    
    init(repository: RepositoryProtocol) {
        self.repository = repository
        getCards()
    }
    
    func getCards(completion: @escaping () -> () = {}) {
        DispatchQueue.main.async {
            Task {
                guard let cardsFromApi = try? await self.repository.getCards() else {
                    self.cards = []
                    print("Unable to get cards from api")
                    return
                }
                //filter only cards with image
                self.cards = cardsFromApi.filter({ $0.imageUrl != nil })
                completion()
            }
        }
    }
}

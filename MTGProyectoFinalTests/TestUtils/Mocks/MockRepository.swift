//
//  MockRepository.swift
//  MTGProyectoFinalTests
//
//  Created by Díez Sobrino Cristina on 8/8/23.
//

import Foundation
@testable import MTGProyectoFinal


final class MockRespository: RepositoryProtocol {
    
    func getCards() async throws -> [MTGProyectoFinal.Card]? {
        return [Card(imageUrl: "", name: "one", text: "", cmc: 0, colors: nil, manaCost: "", type: "", types: [""], supertypes: nil, subtypes: nil, rarity: "", power: "", toughness: "")]
    }

}

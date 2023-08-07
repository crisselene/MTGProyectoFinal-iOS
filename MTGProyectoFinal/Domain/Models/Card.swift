//
//  Card.swift
//  MTGProyectoFinal
//
//  Created by Díez Sobrino Cristina on 1/8/23.
//

import Foundation
import SwiftUI

struct AllCards: Decodable{
    let cards: [Card]
}

struct Card: Decodable, Hashable {
    let imageUrl: String?
    let name: String
    let text: String //description of habilities
    
    let cmc: Int //Converted mana cost. Always a float number
    
    let colors: [String]? //Blue, green, red, black, white or whithout color
    
    let manaCost: String //use cmc and colors to query

    let type: String //supertypes types - subtypes. UTF8 ‘long dash’
    
    let types: [String]
    let supertypes: [String]?
    let subtypes: [String]?
    
    let rarity: String //The rarity of the card. Examples: Common, Uncommon, Rare, Mythic Rare, Special, Basic Land
    
    // Only for creatures. This is a string, not an integer
    let power: String?
    let toughness: String?
    
    
    func replaceTextWithSymbols() {
        //example: "{3}{W}{R}"
        var includingSpacesToSplit = self.manaCost.replacingOccurrences(of: "}", with: " ")
        var arrayOfManaCostSplited = includingSpacesToSplit.components(separatedBy: " ")
        arrayOfManaCostSplited.popLast() //last will be empty
        
    }
}



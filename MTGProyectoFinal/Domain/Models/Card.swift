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
    
    let types: [String] //The card type. UTF8 ‘long dash’
    
    let supertypes: [String]?
    let subtypes: [String]?
    
    let rarity: String //The rarity of the card. Examples: Common, Uncommon, Rare, Mythic Rare, Special, Basic Land
    
    // Only for creatures. This is a string, not an integer
    let power: String?
    let toughness: String?
    
    //supertype type – subtype
    func getAllTypesConcatenated() -> String {
        let typesConcatenated = self.types.joined(separator: " ")
        guard let supertypesConcatenated = self.supertypes?.joined(separator: " ") else { return " " }
        guard let subtypesConcatenated = self.subtypes?.joined(separator: " ") else { return " " }
        
        let allTypesConcatenated: String = supertypesConcatenated + " " + typesConcatenated + " - " + subtypesConcatenated
        
        return allTypesConcatenated
    }
    
    func transformManaCostStringToManaIcons() {
        //example: "{3}{W}{R}"
        var includingSpacesToSplit = self.manaCost.replacingOccurrences(of: "}", with: " ")
        var arrayOfManaCostSplited = includingSpacesToSplit.components(separatedBy: " ")
        arrayOfManaCostSplited.popLast() //last will be empty
        
    }
}



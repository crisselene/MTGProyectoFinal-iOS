//
//  Mana.swift
//  MTGProyectoFinal
//
//  Created by Díez Sobrino Cristina on 4/8/23.
//

import Foundation
import SwiftUI

struct AllSymbols: Decodable{
    let symbols: [Symbol]
}

struct Symbol: Decodable, Hashable {
    let symbol: String
    let svg_uri: String
}

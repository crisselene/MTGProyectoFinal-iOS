//
//  RepositoryProtocol.swift
//  MTGProyectoFinal
//
//  Created by Díez Sobrino Cristina on 2/8/23.
//

import Foundation
import Combine

protocol RepositoryProtocol {
    func getCards() async throws -> [Card]?
}

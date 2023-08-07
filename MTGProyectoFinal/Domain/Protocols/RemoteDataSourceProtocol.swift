//
//  RemoteDataSourceProtocol.swift
//  MTGProyectoFinal
//
//  Created by Díez Sobrino Cristina on 2/8/23.
//

import Foundation

import Foundation
import Combine


protocol RemoteDataSourceProtocol {
    func getCards() async throws -> [Card]?
    func getSymbols() async throws -> [Symbol]? 
}

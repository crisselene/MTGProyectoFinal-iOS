//
//  DetailViewModel.swift
//  MTGProyectoFinal
//
//  Created by Díez Sobrino Cristina on 7/8/23.
//

import SwiftUI
import Combine
import UIKit

final class DetailViewModel: ObservableObject {
    
    // MARK: Properties
    var card: Card
    private let repository: RepositoryProtocol
    
    init(card: Card, repository: RepositoryProtocol) {
        self.card = card
        self.repository = repository
    }
    
}



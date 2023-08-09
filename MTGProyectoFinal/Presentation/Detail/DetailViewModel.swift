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
    private let repository: RepositoryProtocol
    
    init(repository: RepositoryProtocol) {
        self.repository = repository
    }
    
}



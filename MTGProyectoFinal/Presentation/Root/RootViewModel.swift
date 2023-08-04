//
//  RootViewModel.swift
//  MTGProyectoFinal
//
//  Created by Díez Sobrino Cristina on 2/8/23.
//

import Foundation
import Combine

enum Status {
    case none
    case loading
    case loaded
    case error(error: String)
}


final class RootViewModel: ObservableObject {
    
    // MARK: - Properties
    let repository: RepositoryProtocol
    @Published var status = Status.none
    private var subscribers = Set<AnyCancellable>()
    
    
    init(repository: RepositoryProtocol) {
        self.repository = repository
    }
    
    func onSplashDone(){
        self.status = .loaded
    }

}


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
    
    /*func onLogin(user: String, password: String) {
    // Set status to loading
        //status = .loading
        
        repository.login(withUser: user, andPassword: password)
            .sink { completion in
                switch completion {
                case .failure(_): // NO ES NINGUNA TONTERÍA PONERLE _ PORQUE SI NO TE CHILLA EL COMPILADOR
                    print("Error while login")
                    self.status = .error(error: "Error while login")
                case .finished:
                    print("Login finished")
                    self.status = .loaded
                }
            } receiveValue: { token in
                print(token)
            }.store(in: &subscribers)
    }*/
}


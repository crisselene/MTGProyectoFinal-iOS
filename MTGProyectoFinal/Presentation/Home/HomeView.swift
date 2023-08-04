//
//  HomeView.swift
//  MTGProyectoFinal
//
//  Created by Díez Sobrino Cristina on 2/8/23.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var homeViewModel: HomeViewModel
    
    init(homeViewModel: HomeViewModel) {
        self.homeViewModel = homeViewModel
    }
    
    var body: some View {
        NavigationStack {
            List{
                ForEach(homeViewModel.cards, id: \.self) { card in
                    CardCellView(card: card)
                }
            }
        }
            .navigationTitle("MTGuide") // Título de la lista
            .navigationBarTitleDisplayMode(.inline) // Meter en el centro el título pequeño
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(homeViewModel: HomeViewModel(repository: RepositoryImpl(remoteDataSource: RemoteDataSourceImpl())))
    }
}

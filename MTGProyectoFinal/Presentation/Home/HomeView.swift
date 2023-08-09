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
            List (homeViewModel.searchedCards, id: \.self){ card in
                NavigationLink(destination: DetailView(card: card, detailViewModel: DetailViewModel(repository: RepositoryImpl(remoteDataSource: RemoteDataSourceImpl())))){
                    CardCellView(card: card)}
                }
            .navigationTitle("MTGuide") // Título de la lista
            .searchable(text: $homeViewModel.searchText)
            .toolbar {
                ToolbarItem {
                    HStack(spacing: 0) {
                        Picker("Card type", selection: $homeViewModel.selectedType){
                            ForEach(CardsTypes.allCases) { type in
                                Text(type.rawValue).tag(type)
                            }
                        }
                        
                    }
                }
            }
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(homeViewModel: HomeViewModel(repository: RepositoryImpl(remoteDataSource: RemoteDataSourceImpl())))
    }
}

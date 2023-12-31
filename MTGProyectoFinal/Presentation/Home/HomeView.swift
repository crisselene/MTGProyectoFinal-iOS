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
                NavigationLink(destination: DetailView( detailViewModel: DetailViewModel(card: card,repository: homeViewModel.repository))){
                    CardCellView(card: card)}
            }
            .navigationTitle("MTGuide") // Título de la lista
            .searchable(text: $homeViewModel.searchText)
            .toolbar {
                ToolbarItem {
                    HStack(spacing: 0) {
                        
                        Picker("Card type", selection: $homeViewModel.selectedType){
                            ForEach(CardsTypes.allCases) { type in
                                if(type == .all){
                                    HStack{
                                        Image(systemName: "line.horizontal.3.decrease")
                                        Text(type.rawValue).tag(type)
                                    }.frame(width: 10, height: 10)
                                    
                                }else{
                                    Text(type.rawValue).tag(type)
                                }
                               
                                
                            }
                        }
                        
                    }.accessibilityLabel("filter").accessibilityHint("Press to filter by type")
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

//
//  RootView.swift
//  MTGProyectoFinal
//
//  Created by Díez Sobrino Cristina on 2/8/23.
//

import SwiftUI

struct RootView: View {
    
    // MARK: - Properties
    @EnvironmentObject var rootViewModel: RootViewModel
    
    
    var body: some View {
        switch (rootViewModel.status) {
            
        case Status.none:
            SplashView2()
        
        case Status.loading:
            SplashView2()
        
        case Status.error(error: let errorString):
            Text("Error \(errorString)")
            
        case Status.loaded:
            HomeView(homeViewModel: HomeViewModel(repository: rootViewModel.repository))
            
        }
        
    }
}


struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
            .environmentObject(RootViewModel(repository: RepositoryImpl(remoteDataSource: RemoteDataSourceImpl())))
    }
}



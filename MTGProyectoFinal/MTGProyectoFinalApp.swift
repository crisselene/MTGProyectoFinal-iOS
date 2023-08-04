//
//  MTGProyectoFinalApp.swift
//  MTGProyectoFinal
//
//  Created by Díez Sobrino Cristina on 1/8/23.
//

import SwiftUI

@main
struct MTGProyectoFinalApp: App {
    var body: some Scene {
        WindowGroup {
            let remoteDataSource = RemoteDataSourceImpl()
            let repository = RepositoryImpl(remoteDataSource: remoteDataSource)
            RootView()
                .environmentObject(RootViewModel(repository: repository))
        }
    }
}

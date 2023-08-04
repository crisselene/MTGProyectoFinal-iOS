//
//  SplashView.swift
//  MTGProyectoFinal
//
//  Created by Díez Sobrino Cristina on 2/8/23.
//

import SwiftUI

struct SplashView: View {
    
    @EnvironmentObject var rootViewModel: RootViewModel
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    
    var body: some View {
        
        VStack{
            Image("splashImage")
            Text("MTGuide")
        } .scaleEffect(size)
            .opacity(opacity)
            .onAppear {
                withAnimation(.easeIn(duration: 1.2)){
                    self.size = 0.9
                    self.opacity = 1.0
                }
                
            }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        rootViewModel.onSplashDone()
                    }
                }
    }
        
    
}

struct SplashViewPreviews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}

//
//  SplashView.swift
//  MTGProyectoFinal
//
//  Created by Díez Sobrino Cristina on 2/8/23.
//

import SwiftUI
import Lottie

struct SplashView: View {
    
    @EnvironmentObject var rootViewModel: RootViewModel
    @State private var size = 0.5
    @State private var opacity = 0.5
    
    
    var body: some View {
        
        VStack{
            Text("MTGuide").font(.custom("Palatino", size: 40)).bold()
            LottieView(loopMode: .loop).scaleEffect(size).frame(height: 300)
        }
            .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        rootViewModel.onSplashDone()
                    }
                }
    }
        
    
}

struct LottieView: UIViewRepresentable{
    
    
    let loopMode : LottieLoopMode
    
    func updateUIView(_ uiView: Lottie.LottieAnimationView, context: Context) {}
    
    func makeUIView(context: Context) -> Lottie.LottieAnimationView {
        let animationView = LottieAnimationView(name: "mtgLottieanimation")
        animationView.play()
        animationView.loopMode = loopMode
        animationView.contentMode = .scaleAspectFit
        return animationView
    }
}

struct SplashViewPreviews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}

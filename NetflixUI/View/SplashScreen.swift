//
//  SplashScreen.swift
//  NetflixUI
//
//  Created by 川尻辰義 on 2024/04/14.
//

import SwiftUI
import Lottie

struct SplashScreen: View {
    @Environment(AppData.self) private var appData
    @State private var progress: CGFloat = 0.0
    
    var body: some View {
        Rectangle()
            .fill(.black)
            .overlay {
                LottieView {
                    await LottieAnimation.loadedFrom(url: jsonURL!)
                }
                .playing(.fromProgress(0, toProgress: progress, loopMode: .playOnce))
                .animationDidFinish({ completed in
                    appData.isSplashFinished = progress != 0 && completed
                })
                .frame(width: 600, height: 400)
                .task {
                    try? await Task.sleep(for: .seconds(0.15))
                    progress = 1.0
                }
            }
            .ignoresSafeArea()
    }
    
    private var jsonURL: URL? {
        if let bundlePath = Bundle.main.path(forResource: "Logo", ofType: "json") {
            return URL(filePath: bundlePath)
        }
        
        return nil
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}

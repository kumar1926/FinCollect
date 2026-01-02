//
//  ContentView.swift
//  FinCollect
//
//  Created by BizMagnets on 30/12/25.
//

import SwiftUI

struct ContentView: View {
    @State private var isActive = false
    @AppStorage("isFirstLaunch") var isFirstLaunch: Bool = true
    var body: some View {
        ZStack{
            if isActive {
                if isFirstLaunch {
                    OnboardingScreen(skipAction: {
                        isFirstLaunch = false
                    }, finishAction: {
                        isFirstLaunch = false
                    })
                } else {
                    LoginView()
                }
            } else {
                SplashScreen()
            }
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5, execute: {
                isActive = true
            })
        }
    }
}

#Preview {
    ContentView()
}

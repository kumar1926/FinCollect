//
//  ContentView.swift
//  FinCollect
//
//  Created by BizMagnets on 30/12/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var authVM = AuthViewModel()
    @State private var isActive = false
    @State private var isSignUp: Bool = false
    @State private var isSignIn: Bool = false
    @State private var isForgotPassword: Bool = false
    @AppStorage("isFirstLaunch") var isFirstLaunch: Bool = true
    var body: some View {
        ZStack{
            if isActive {
                if authVM.isAuthenticated {
                    Text("Home View")
                }else{
                    if isFirstLaunch {
                        OnboardingScreen(skipAction: {
                            isFirstLaunch = false
                            isSignIn = true
                        }, finishAction: {
                            isFirstLaunch = false
                            isSignIn = true
                        })
                    } else if isSignIn {
                        LoginView(signUpAction: {
                            isSignUp = true
                            isSignIn = false
                            isForgotPassword = false
                        }, forgotPasswordAction: {
                            
                        })
                    }else if isSignUp {
                        SignUpView(signInAction: {
                            isSignIn = true
                            isSignUp = false
                            isForgotPassword = false
                        })
                    }else{
                        LoginView(signUpAction: {
                            isSignUp = true
                            isSignIn = false
                            isForgotPassword = false
                        }, forgotPasswordAction: {
                            
                        })
                    }
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

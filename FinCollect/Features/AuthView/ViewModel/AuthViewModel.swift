//
//  AuthViewModel.swift
//  FinCollect
//
//  Created by BizMagnets on 12/01/26.
//

import Foundation
import SwiftUI
import Combine

@MainActor
class AuthViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    @Published var isAuthenticated: Bool = false
    @Published var showError: Bool = false
    @Published var showSuccess: Bool = false
    init(){
        checkSession()
    }
    func checkSession(){
        if AuthManager.shared.isCurrentuser{
            self.isAuthenticated = true
        }
    }
    func loginUser() {
        isLoading = true
        errorMessage = nil
        Task{
            do{
                try await AuthManager.shared.signIn(email: email, password: password)
                isAuthenticated = true
                print("User logged in successfully")
                showSuccess = true
            }catch{
                errorMessage = error.localizedDescription
                showError = true
            }
            isLoading = false
        }
    }
    
    func registerUser() {
        guard !name.isEmpty, !email.isEmpty, !password.isEmpty else {
            errorMessage = "Please fill in all fields."
            return
        }
        
        guard password == confirmPassword else {
            errorMessage = "Passwords do not match."
            return
        }
        isLoading = true
        errorMessage = nil
        Task{
            do{
                try await AuthManager.shared.signUp(name: name, email: email, password: password)
                errorMessage = "Account created successfully! Please log in."
                showSuccess = true
            }catch{
                errorMessage = error.localizedDescription
                showError = true
            }
            isLoading = false
        }
    }
}

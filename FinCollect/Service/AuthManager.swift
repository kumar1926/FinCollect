//
//  AuthManager.swift
//  FinCollect
//
//  Created by BizMagnets on 07/01/26.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class AuthManager: NSObject {
    static let shared = AuthManager()
    private let db = Firestore.firestore()
    
    var isCurrentuser: Bool{
        Auth.auth().currentUser != nil
    }
    
    func signUp(name: String, email: String, password: String) async throws {
        let authUser = try await Auth.auth().createUser(withEmail: email, password: password)
        let newUser = AppUser(id: authUser.user.uid, name: name, email: email, joinedDate: Date())
        try await saveUserToDatabase(newUser)
    }
    
    private func saveUserToDatabase(_ user: AppUser) async throws {
        guard let uid = Auth.auth().currentUser?.uid else {
            throw NSError(domain: "Auth", code: 401)
        }

        try await db.collection("users")
            .document(uid)
            .setData([
                "id": uid,
                "name": user.name,
                "email": user.email,
                "joinedDate": Timestamp(date: user.joinedDate),
            ])
    }

    func signIn(email: String, password: String) async throws {
        try await Auth.auth().signIn(withEmail: email, password: password)
    }
    func signOut() async throws {
        try await Auth.auth().signOut()
    }
}

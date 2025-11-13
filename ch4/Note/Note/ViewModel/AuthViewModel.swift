//
//  AuthViewModel.swift
//  Note
//
//  Created by Gideon Tobing on 12/11/2025.
//

import SwiftUI
import FirebaseAuth
import Combine

final class AuthViewModel: ObservableObject {
    @Published var user: User?
    
    func listenToAuthState() {
        Auth.auth().addStateDidChangeListener{
            [weak self] _, user in
            guard let self = self else {
                return
            }
            self.user = user
        }
    }
    
    // function to sign-in
    func signIn (
        emailAddress: String,
        password: String){
            Auth.auth().signIn(withEmail: emailAddress, password: password){ result, error in
                if let error = error {
                    print("an error occured : \(error.localizedDescription)")
                    return
                }
            }
        }
    
    // function to create an account
    func signUp (
        emailAddress: String,
        password: String){
            Auth.auth().createUser(withEmail: emailAddress, password: password){ result, error in
                if let error = error {
                    print("an error occured : \(error.localizedDescription)")
                    return
                }
            }
        }
    
    // function to logout
    func singOut(){
        do {
            try Auth.auth().signOut()
        } catch let signOutError as NSError {
            print("Error signing out: %@",signOutError)
        }
    }
    
    // function to reset password
}

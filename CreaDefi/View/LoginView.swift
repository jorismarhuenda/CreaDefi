//
//  LoginView.swift
//  CreaDefi
//
//  Created by marhuenda joris on 14/12/2023.
//

import SwiftUI
import Firebase
import FBSDKLoginKit

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showAlert = false
    @State private var alertMessage = ""
    @Binding var isLoggedIn: Bool
    
    init(isLoggedIn: Binding<Bool>) {
        _isLoggedIn = isLoggedIn
    }

    var body: some View {
        NavigationView {
            VStack {
                Text("Bienvenue sur CréaDéfi")
                    .font(.title)
                    .padding()

                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                SecureField("Mot de passe", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button(action: {
                    loginUser()
                }) {
                    Text("Connexion")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }

                Button(action: {
                    loginWithFacebook()
                }) {
                    Text("Connexion avec Facebook")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }

                NavigationLink(destination: SignUpView()) {
                    Text("Créer un compte")
                        .foregroundColor(.blue)
                }

                Spacer()
            }
            .padding()
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Erreur"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
    }

    private func loginUser() {
            Auth.auth().signIn(withEmail: email, password: password) { result, error in
                if let error = error {
                    self.showAlert(message: error.localizedDescription)
                } else {
                    // Mise à jour de l'état de connexion après la connexion réussie
                    isLoggedIn = true
                }
            }
        }
    
    private func loginWithFacebook() {
        let manager = LoginManager()

        manager.logIn(permissions: ["email"], from: nil) { result, error in
            if let error = error {
                showAlert(message: error.localizedDescription)
            } else if result?.isCancelled == true {
                showAlert(message: "Connexion avec Facebook annulée.")
            } else {
                guard let token = AccessToken.current else {
                    return
                }

                let credential = FacebookAuthProvider.credential(withAccessToken: token.tokenString)

                Auth.auth().signIn(with: credential) { result, error in
                    if let error = error {
                        showAlert(message: error.localizedDescription)
                    } else {
                        // Navigue vers la vue principale après la connexion réussie
                        // Peut-être à la Vue Principale ou au Tableau de Bord
                    }
                }
            }
        }
    }

    private func showAlert(message: String) {
            alertMessage = message
            showAlert = true
        }
    }

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(isLoggedIn: .constant(false))
    }
}

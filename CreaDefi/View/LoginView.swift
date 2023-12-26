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
    @State private var showingForgotPassword = false // Nouvelle variable d'état pour gérer la navigation vers "Mot de Passe Oublié"

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

                // Nouveau bouton pour naviguer vers la vue "Mot de Passe Oublié"
                Button(action: {
                    showingForgotPassword = true
                }) {
                    Text("Mot de Passe Oublié ?")
                        .foregroundColor(.blue)
                }
                .sheet(isPresented: $showingForgotPassword) {
                    ForgotPasswordView()
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
        // ... (le reste du code reste inchangé)
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

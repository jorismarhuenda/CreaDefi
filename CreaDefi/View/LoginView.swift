//
//  LoginView.swift
//  CreaDefi
//
//  Created by marhuenda joris on 13/12/2023.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Bienvenue sur CréaDéfi!")
                    .font(.title)
                    .padding()

                // Boutons de connexion
                LoginButton(imageName: "facebook", buttonText: "Se connecter avec Facebook", action: loginWithFacebook)
                    .padding()

                LoginButton(imageName: "envelope.fill", buttonText: "Se connecter avec Gmail", action: loginWithGmail)
                    .padding()

                // Autres éléments ou fonctionnalités de la LoginView
            }
            .navigationTitle("Connexion")
        }
    }

    private func loginWithFacebook() {
        // Mettre en place l'authentification via Facebook
        print("Connexion avec Facebook")
    }

    private func loginWithGmail() {
        // Mettre en place l'authentification via Gmail
        print("Connexion avec Gmail")
    }
}

struct LoginButton: View {
    var imageName: String
    var buttonText: String
    var action: () -> Void

    var body: some View {
        Button(action: {
            // Appeler la fonction d'authentification spécifique
            action()
        }) {
            HStack {
                Image(systemName: imageName)
                    .foregroundColor(.white)

                Text(buttonText)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(8)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


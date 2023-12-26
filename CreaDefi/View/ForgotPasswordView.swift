//
//  ForgotPasswordView.swift
//  CreaDefi
//
//  Created by marhuenda joris on 25/12/2023.
//

import SwiftUI
import Firebase

struct ForgotPasswordView: View {
    @State private var email: String = ""
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var isPasswordReset = false

    var body: some View {
        VStack {
            Text("Mot de Passe Oublié")
                .font(.title)
                .padding()

            TextField("Adresse Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button(action: {
                resetPassword()
            }) {
                Text("Réinitialiser le Mot de Passe")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
            }

            Spacer()
        }
        .padding()
        .navigationBarTitle("Mot de Passe Oublié", displayMode: .inline)
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Message"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
    }

    private func resetPassword() {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if let error = error {
                alertMessage = "Erreur : \(error.localizedDescription)"
            } else {
                alertMessage = "Un e-mail de réinitialisation de mot de passe a été envoyé à votre adresse e-mail."
                isPasswordReset = true
            }

            showAlert = true
        }
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}

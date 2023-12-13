//
//  ChallengeConfirmationView.swift
//  CreaDefi
//
//  Created by marhuenda joris on 13/12/2023.
//

import SwiftUI

struct ChallengeConfirmationView: View {
    var body: some View {
        VStack {
            Text("Confirmer la Réponse à l'Énigme")
                .font(.title)
                .padding()

            // Affichage de l'énigme et de la réponse proposée
            ChallengeView()

            // Champ de texte pour la réponse
            TextField("Votre réponse", text: .constant(""))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            // Bouton pour confirmer la réponse
            ConfirmAnswerButton(action: confirmAnswer)
                .padding()

            // Autres éléments ou fonctionnalités de la ChallengeConfirmationView
        }
        .navigationTitle("Confirmation Réponse")
    }

    private func confirmAnswer() {
        // Mettre en place les actions lors de la confirmation de la réponse
        print("Réponse confirmée!")
    }
}

struct ConfirmAnswerButton: View {
    var action: () -> Void

    var body: some View {
        Button(action: {
            // Appeler la fonction de confirmation de la réponse
            action()
        }) {
            Text("Confirmer la Réponse")
                .foregroundColor(.white)
                .padding()
                .background(Color.blue)
                .cornerRadius(8)
        }
    }
}

struct ChallengeConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeConfirmationView()
    }
}

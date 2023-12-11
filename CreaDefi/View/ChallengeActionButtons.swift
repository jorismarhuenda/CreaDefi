//
//  ChallengeActionButtons.swift
//  CreaDefi
//
//  Created by marhuenda joris on 11/12/2023.
//

import SwiftUI

struct ChallengeActionButtons: View {
    var body: some View {
        HStack {
            Button(action: {
                // Action lors du clic sur le bouton Accepter
                acceptChallenge()
            }) {
                Text("Accepter le Défi")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(8)
            }

            Button(action: {
                // Action lors du clic sur le bouton Refuser
                refuseChallenge()
            }) {
                Text("Refuser")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.red)
                    .cornerRadius(8)
            }
        }
    }

    // Fonction appelée lors de l'acceptation du défi
    private func acceptChallenge() {
        // Mettre en place les actions nécessaires
        print("Défi accepté!")
    }

    // Fonction appelée lors du refus du défi
    private func refuseChallenge() {
        // Mettre en place les actions nécessaires
        print("Défi refusé.")
    }
}

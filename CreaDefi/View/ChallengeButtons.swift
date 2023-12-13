//
//  ChallengeButtons.swift
//  CreaDefi
//
//  Created by marhuenda joris on 13/12/2023.
//

import SwiftUI

struct ChallengeButtons: View {
    var acceptAction: () -> Void
    var refuseAction: () -> Void
    var shareAction: () -> Void
    var detailAction: () -> Void

    var body: some View {
        HStack {
            // Bouton pour accepter le défi
            Button(action: {
                acceptAction()
            }) {
                Text("Accepter le Défi")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(8)
            }

            // Bouton pour refuser le défi
            Button(action: {
                refuseAction()
            }) {
                Text("Refuser")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.red)
                    .cornerRadius(8)
            }

            // Bouton pour partager le défi
            Button(action: {
                shareAction()
            }) {
                Text("Partager le Défi")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }

            // Bouton pour voir les détails du défi
            Button(action: {
                detailAction()
            }) {
                Text("Détails du Défi")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.orange)
                    .cornerRadius(8)
            }
        }
    }
}

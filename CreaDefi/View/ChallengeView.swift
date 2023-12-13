//
//  ChallengeView.swift
//  CreaDefi
//
//  Created by marhuenda joris on 11/12/2023.
//

import SwiftUI

struct ChallengeView: View {
    var body: some View {
        VStack {
            Text("Défi du Jour")
                .font(.headline)
                .padding()

            // Ici, tu peux afficher l'énigme ou le défi du jour
            Text("Résoudre une énigme mystère!")
                .font(.title)
                .multilineTextAlignment(.center)
                .padding()

            // Utilisation de ChallengeButtons pour les boutons communs
            ChallengeButtons(
                acceptAction: { /* Mettre en place les actions nécessaires */ },
                refuseAction: { /* Mettre en place les actions nécessaires */ },
                shareAction: { /* Mettre en place les actions nécessaires */ },
                detailAction: { /* Mettre en place les actions nécessaires */ }
            )
            .padding()

            // Autres éléments spécifiques au défi
        }
        .padding()
    }
}

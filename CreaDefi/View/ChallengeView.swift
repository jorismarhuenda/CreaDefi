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

            // Autres éléments spécifiques au défi
        }
        .padding()
    }
}

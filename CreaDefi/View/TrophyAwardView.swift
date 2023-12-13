//
//  TrophyAwardView.swift
//  CreaDefi
//
//  Created by marhuenda joris on 13/12/2023.
//

import SwiftUI

struct TrophyAwardView: View {
    var trophyName: String

    var body: some View {
        VStack {
            Text("Félicitations!")
                .font(.title)
                .padding()

            // Affichage du trophée attribué
            TrophyView(trophy: trophyName, isHidden: false)
                .padding()

            Text("Vous avez remporté le trophée \(trophyName)!")
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding()

            // Bouton pour revenir à la vue principale
            NavigationLink(destination: ContentView()) {
                Text("Retour à l'accueil")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            .padding()
        }
        .navigationTitle("Trophée Remporté")
    }
}

struct TrophyAwardView_Previews: PreviewProvider {
    static var previews: some View {
        TrophyAwardView(trophyName: "Bronze")
    }
}

//
//  HomeView.swift
//  CreaDefi
//
//  Created by marhuenda joris on 11/12/2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Bienvenue sur CréaDéfi!")
                    .font(.title)
                    .padding()

                // Affichage du défi quotidien ou de l'énigme
                ChallengeView()

                // Bouton pour accepter ou refuser le défi
                ChallengeActionButtons()
                    .padding()

                // Autres éléments ou fonctionnalités de la HomeView
            }
            .navigationTitle("Accueil")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

//
//  DragonTrophyAnnouncementView.swift
//  CreaDefi
//
//  Created by marhuenda joris on 13/12/2023.
//

import SwiftUI

struct DragonTrophyAnnouncementView: View {
    var body: some View {
        VStack {
            Text("Félicitations!")
                .font(.title)
                .padding()

            // Affichage du badge ou de l'icône spéciale pour le Trophée Dragon
            Image(systemName: "flame.fill")
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundColor(.orange)
                .padding()

            Text("Vous avez remporté le Trophée Dragon!")
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
        .navigationTitle("Trophée Dragon Remporté")
    }
}

struct DragonTrophyAnnouncementView_Previews: PreviewProvider {
    static var previews: some View {
        DragonTrophyAnnouncementView()
    }
}

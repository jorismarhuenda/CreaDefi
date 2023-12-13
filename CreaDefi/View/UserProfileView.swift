//
//  UserProfileView.swift
//  CreaDefi
//
//  Created by marhuenda joris on 13/12/2023.
//

import SwiftUI

struct UserProfileView: View {
    var body: some View {
        VStack {
            // Photo de profil et pseudo
            UserProfileHeader()

            // Total de points
            PointsView()

            // Historique des défis et trophées
            ChallengeHistoryView()
        }
        .navigationTitle("Profil")
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}

struct UserProfileHeader: View {
    var body: some View {
        VStack {
            Image(systemName: "person.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .padding()

            Text("Nom d'utilisateur")
                .font(.title)
                .padding()
        }
    }
}

struct PointsView: View {
    var body: some View {
        VStack {
            Text("Total de Points:")
                .font(.headline)
                .padding()

            Text("250")
                .font(.title)
                .padding()
        }
    }
}

struct ChallengeHistoryView: View {
    var body: some View {
        VStack {
            Text("Historique des Défis et Trophées:")
                .font(.headline)
                .padding()

            // Ici, tu peux afficher une liste d'éléments d'historique
            Text("Défi 1 - Réussi (+5 points)")
                .padding()

            Text("Défi 2 - Échoué (-1 point)")
                .padding()

            // ... Ajoute d'autres éléments d'historique
        }
        .padding()
    }
}

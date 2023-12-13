//
//  CommunityView.swift
//  CreaDefi
//
//  Created by marhuenda joris on 13/12/2023.
//

import SwiftUI

struct CommunityView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Communauté")
                    .font(.title)
                    .padding()

                // Liste des créations partagées par les utilisateurs
                CommunityListView()

                // Autres éléments ou fonctionnalités de la CommunityView
            }
            .navigationTitle("Communauté")
        }
    }
}

struct CommunityListView: View {
    var body: some View {
        List {
            ForEach(0..<10) { index in
                // Ici, tu peux personnaliser chaque élément de la liste
                NavigationLink(destination: CommunityDetailsView()) {
                    CommunityListItem()
                }
            }
        }
    }
}

struct CommunityListItem: View {
    var body: some View {
        VStack(alignment: .leading) {
            // Ici, tu peux afficher des détails sur la création (auteur, date, etc.)
            Text("Création de l'utilisateur")
                .font(.headline)

            // Ici, tu peux afficher l'image ou le texte de la création
            Text("Dessin créatif ou texte inspirant.")
                .foregroundColor(.gray)
                .font(.subheadline)

            // Boutons pour interagir avec la création
            HStack {
                Button(action: {
                    // Action pour aimer la création
                    print("Création aimée!")
                }) {
                    Image(systemName: "heart")
                    Text("J'aime")
                }

                Button(action: {
                    // Action pour commenter la création
                    print("Commentaire ajouté!")
                }) {
                    Image(systemName: "bubble.left")
                    Text("Commenter")
                }
            }
            .foregroundColor(.blue)
        }
        .padding()
    }
}

struct CommunityDetailsView: View {
    var body: some View {
        VStack {
            Text("Détails de la Création")
                .font(.title)
                .padding()

            // Afficher les détails complets de la création ici
        }
    }
}

struct CommunityView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityView()
    }
}

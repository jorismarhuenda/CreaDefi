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
                CommunityListItem()
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
        }
        .padding()
    }
}

struct CommunityView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityView()
    }
}

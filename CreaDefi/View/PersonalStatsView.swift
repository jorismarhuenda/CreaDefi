//
//  PersonalStatsView.swift
//  CreaDefi
//
//  Created by marhuenda joris on 25/12/2023.
//

import SwiftUI
import Firebase

struct PersonalStatsView: View {
    @State private var userPoints = 0
    @State private var userTrophies: [String] = [] // Liste des trophées de l'utilisateur

    var body: some View {
        VStack {
            Text("Statistiques Personnelles")
                .font(.title)
                .padding()

            Text("Points: \(userPoints)")
                .padding()

            Text("Trophées:")
                .padding()

            List(userTrophies, id: \.self) { trophy in
                Text(trophy)
            }
        }
        .padding()
        .navigationBarTitle("Statistiques Personnelles", displayMode: .inline)
        .onAppear {
            loadUserData()
        }
    }

    private func loadUserData() {
        // Récupérer l'ID de l'utilisateur actuellement connecté
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }

        // Référence à la base de données Firestore
        let db = Firestore.firestore()

        // Référence au document utilisateur dans Firestore
        let userDocRef = db.collection("users").document(userId)

        // Observer les modifications du document utilisateur
        userDocRef.addSnapshotListener { documentSnapshot, error in
            guard let document = documentSnapshot else {
                print("Erreur de récupération du document utilisateur: \(error?.localizedDescription ?? "Inconnue")")
                return
            }

            guard let data = document.data() else {
                print("Document utilisateur vide")
                return
            }

            // Mettre à jour les points et trophées de l'utilisateur
            if let points = data["points"] as? Int {
                userPoints = points
            }

            if let trophies = data["trophies"] as? [String] {
                userTrophies = trophies
            }
        }
    }
}

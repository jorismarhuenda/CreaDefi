//
//  TrophiesView.swift
//  CreaDefi
//
//  Created by marhuenda joris on 25/12/2023.
//

import SwiftUI
import Firebase

struct TrophiesView: View {
    @State private var userPoints = 0
    @State private var userTrophies: [String] = []

    var body: some View {
        VStack {
            Text("Trophées")
                .font(.title)
                .padding()

            // Liste des trophées
            List(userTrophies, id: \.self) { trophy in
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .padding(.trailing, 5)
                    Text(trophy)
                }
            }
        }
        .padding()
        .navigationBarTitle("Trophées", displayMode: .inline)
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
                updateTrophies()
            }

            if let trophies = data["trophies"] as? [String] {
                userTrophies = trophies
            }
        }
    }

    private func updateTrophies() {
        // Mettre à jour les trophées en fonction des points de l'utilisateur
        // Exemple : Adapter cette logique en fonction de tes critères
        if userPoints >= 50 && !userTrophies.contains("Bois") {
            userTrophies.append("Bois")
        }

        if userPoints >= 120 && !userTrophies.contains("Bronze") {
            userTrophies.append("Bronze")
        }

        if userPoints >= 200 && !userTrophies.contains("Argent") {
            userTrophies.append("Argent")
        }

        if userPoints >= 350 && !userTrophies.contains("Or") {
            userTrophies.append("Or")
        }

        if userPoints >= 1000 && !userTrophies.contains("Diamant") {
            userTrophies.append("Diamant")
        }

        // Exemple d'un trophée basé sur une condition spécifique
        if userPoints >= 5 && !userTrophies.contains("Dragon") {
            let consecutiveDays = 10 // Définir le nombre de jours consécutifs requis
            // Vérifier si l'utilisateur a atteint le nombre de jours consécutifs avec 5 points
            if let lastLoginDate = UserDefaults.standard.object(forKey: "lastLoginDate") as? Date,
               Date().timeIntervalSince(lastLoginDate) <= 86400 * Double(consecutiveDays) {
                userTrophies.append("Dragon")
            }
        }
    }
}

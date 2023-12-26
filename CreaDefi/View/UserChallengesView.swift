//
//  UserChallengesView.swift
//  CreaDefi
//
//  Created by marhuenda joris on 25/12/2023.
//

import SwiftUI
import FirebaseFirestore
import FirebaseAuth

struct UserChallengesView: View {
    @State private var userChallenges: [Challenge] = []

    var body: some View {
        NavigationView {
            VStack {
                Text("Vos Défis Soumis")
                    .font(.title)
                    .padding()

                List(userChallenges) { challenge in
                    VStack(alignment: .leading) {
                        Text(challenge.content)
                            .font(.headline)
                        Text("Type : \(challenge.type)")
                            .font(.subheadline)
                        Text("Soumis le : \(formattedDate(challenge.timestamp.dateValue()))")
                            .font(.subheadline)
                    }
                }
                .onDelete(perform: deleteChallenge)

                Spacer()
            }
            .onAppear {
                fetchUserChallenges()
            }
            .navigationBarTitle("Historique des Défis", displayMode: .inline)
            .navigationBarItems(trailing: EditButton())
        }
    }

    private func fetchUserChallenges() {
        guard let userId = Auth.auth().currentUser?.uid else {
            print("Erreur : L'utilisateur n'est pas connecté.")
            return
        }

        let challengeRef = Firestore.firestore().collection("challenges")
        challengeRef.whereField("userId", isEqualTo: userId).getDocuments { querySnapshot, error in
            if let error = error {
                print("Erreur lors de la récupération des défis de l'utilisateur : \(error.localizedDescription)")
            } else {
                userChallenges = querySnapshot?.documents.compactMap { document in
                    try? document.data(as: Challenge.self)
                } ?? []
            }
        }
    }

    private func deleteChallenge(at offsets: IndexSet) {
        guard let userId = Auth.auth().currentUser?.uid else {
            print("Erreur : L'utilisateur n'est pas connecté.")
            return
        }

        let challengeRef = Firestore.firestore().collection("challenges")

        offsets.forEach { index in
            let challenge = userChallenges[index]
            if challenge.userId == userId {
                challengeRef.document(challenge.id).delete { error in
                    if let error = error {
                        print("Erreur lors de la suppression du défi : \(error.localizedDescription)")
                    } else {
                        userChallenges.remove(at: index)
                    }
                }
            }
        }
    }

    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}

struct Challenge: Identifiable, Codable {
    var id: String
    var type: String
    var userId: String
    var content: String
    var timestamp: Timestamp
}

struct UserChallengesView_Previews: PreviewProvider {
    static var previews: some View {
        UserChallengesView()
    }
}

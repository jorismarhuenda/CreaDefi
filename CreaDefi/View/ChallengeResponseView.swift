//
//  ChallengeResponseView.swift
//  CreaDefi
//
//  Created by marhuenda joris on 17/12/2023.
//

import SwiftUI
import FirebaseFirestore
import FirebaseAuth

struct ChallengeResponseView: View {
    @State private var userResponse: String = ""
    @State private var challengeType: ChallengeType = .enigma
    @State private var wordCountError: Bool = false

    enum ChallengeType {
        case enigma
        case creativeWriting
    }

    var body: some View {
        VStack {
            Text("Répondez à l'énigme ou écrivez une nouvelle sur le thème donné")
                .font(.title)
                .padding()

            if challengeType == .enigma {
                Text("Enigme à résoudre")
                    .padding()
            } else {
                Text("Thème de la nouvelle : Animaux fantastiques")
                    .padding()
            }

            TextField("Votre réponse", text: $userResponse)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            if challengeType == .creativeWriting {
                Text("Nombre de mots : \(wordCount(userResponse))")
                    .foregroundColor(wordCountError ? .red : .black)
                    .padding()
            }

            Button(action: {
                submitResponse()
            }) {
                Text("Soumettre la réponse")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
            }

            Spacer()
        }
        .padding()
        .navigationBarTitle("Défi Quotidien", displayMode: .inline)
    }

    private func submitResponse() {
        switch challengeType {
        case .enigma:
            checkEnigmaResponse()
        case .creativeWriting:
            submitCreativeWriting()
        }
    }

    private func checkEnigmaResponse() {
        let correctAnswer = "RéponseEnigme"
        if userResponse.lowercased() == correctAnswer.lowercased() {
            print("Réponse correcte !")
        } else {
            print("Réponse incorrecte. Essayez à nouveau.")
        }
    }

    private func submitCreativeWriting() {
        let minimumWordCount = 300
        let currentWordCount = wordCount(userResponse)

        if currentWordCount >= minimumWordCount {
            guard let userId = Auth.auth().currentUser?.uid else {
                print("Erreur : L'utilisateur n'est pas connecté.")
                return
            }

            let challengeRef = Firestore.firestore().collection("challenges")

            challengeRef.addDocument(data: [
                "type": "creativeWriting",
                "userId": userId,
                "content": userResponse,
                "timestamp": Date()
            ]) { error in
                if let error = error {
                    print("Erreur lors de l'ajout du défi créatif : \(error.localizedDescription)")
                } else {
                    print("Défi créatif ajouté avec succès à Firestore.")
                }
            }
        } else {
            wordCountError = true
            print("La nouvelle doit contenir au moins \(minimumWordCount) mots.")
        }
    }

    private func wordCount(_ text: String) -> Int {
        let words = text.split { !$0.isLetter }
        return words.count
    }
}

struct ChallengeResponseView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeResponseView()
    }
}

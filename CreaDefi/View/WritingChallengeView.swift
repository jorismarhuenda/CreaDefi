//
//  WritingChallengeView.swift
//  CreaDefi
//
//  Created by marhuenda joris on 13/12/2023.
//

import SwiftUI

struct WritingChallengeView: View {
    @State private var text = ""
    @State private var wordCount = 0

    var body: some View {
        VStack {
            Text("Défi d'Écriture")
                .font(.headline)
                .padding()

            // Contrôle du nombre de mots
            Text("Nombre de Mots: \(wordCount)")
                .foregroundColor(wordCount >= 250 ? .green : .red)
                .padding()

            // Zone de texte pour le défi d'écriture
            TextEditor(text: $text)
                .frame(minHeight: 200)
                .padding()

            // Bouton de publication
            Button(action: {
                // Action lors du clic sur le bouton Publier
                publishWritingChallenge()
            }) {
                Text("Publier")
                    .foregroundColor(.white)
                    .padding()
                    .background(wordCount >= 250 ? Color.blue : Color.gray)
                    .cornerRadius(8)
                    .disabled(wordCount < 250)
            }
        }
        .padding()
        .onAppear {
            updateWordCount()
        }
        .onChange(of: text) { _ in
            updateWordCount()
        }
    }

    // Fonction pour mettre à jour le nombre de mots
    private func updateWordCount() {
        let words = text.split { !$0.isLetter }
        wordCount = words.count
    }

    // Fonction appelée lors de la publication du défi d'écriture
    private func publishWritingChallenge() {
        // Vérifier que le nombre de mots atteint la contrainte minimale
        guard wordCount >= 250 else {
            // Afficher une alerte ou une indication à l'utilisateur sur la contrainte non respectée
            return
        }

        // Mettre en place les actions nécessaires pour la publication
        print("Défi d'écriture publié!")
    }
}

struct WritingChallengeView_Previews: PreviewProvider {
    static var previews: some View {
        WritingChallengeView()
    }
}

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
    @State private var isAlertPresented = false

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

            // Bouton pour réinitialiser le texte
            Button(action: {
                // Action lors du clic sur le bouton Réinitialiser
                resetText()
            }) {
                Text("Réinitialiser")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.orange)
                    .cornerRadius(8)
            }
        }
        .padding()
        .onAppear {
            updateWordCount()
        }
        .onChange(of: text) { _ in
            updateWordCount()
        }
        .alert(isPresented: $isAlertPresented) {
            Alert(
                title: Text("Erreur"),
                message: Text("Le défi d'écriture doit contenir au moins 250 mots."),
                dismissButton: .default(Text("OK"))
            )
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
            // Afficher une alerte sur la contrainte non respectée
            isAlertPresented = true
            return
        }

        // Mettre en place les actions nécessaires pour la publication
        print("Défi d'écriture publié!")
    }

    // Fonction pour réinitialiser le texte
    private func resetText() {
        text = ""
        wordCount = 0
    }
}

struct WritingChallengeView_Previews: PreviewProvider {
    static var previews: some View {
        WritingChallengeView()
    }
}

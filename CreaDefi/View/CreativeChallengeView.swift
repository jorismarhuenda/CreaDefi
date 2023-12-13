//
//  CreativeChallengeView.swift
//  CreaDefi
//
//  Created by marhuenda joris on 13/12/2023.
//

import SwiftUI
import PencilKit

struct CreativeChallengeView: View {
    @State private var drawing = PKDrawing()
    @State private var drawingColor = Color.black

    var body: some View {
        VStack {
            Text("Défi Créatif - Dessin")
                .font(.headline)
                .padding()

            // Zone de dessin avec PencilKit
            DrawingCanvas(drawing: $drawing, drawingColor: $drawingColor)
                .frame(width: 300, height: 300)
                .border(Color.black, width: 1)
                .padding()

            // Bouton pour publier le dessin
            Button(action: {
                // Action lors du clic sur le bouton Publier
                publishDrawing()
            }) {
                Text("Publier le Dessin")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }

            // Bouton pour effacer le dessin
            Button(action: {
                // Action lors du clic sur le bouton Effacer
                clearDrawing()
            }) {
                Text("Effacer le Dessin")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.red)
                    .cornerRadius(8)
            }

            // Aperçu du dessin actuel
            DrawingPreview(drawing: drawing)
                .frame(width: 200, height: 200)
                .border(Color.black, width: 1)
                .padding()
        }
        .padding()
    }

    // Fonction appelée lors de la publication du dessin
    private func publishDrawing() {
        // Mettre en place les actions nécessaires, par exemple sauvegarder le dessin
        print("Dessin publié!")
    }

    // Fonction appelée lors de l'effacement du dessin
    private func clearDrawing() {
        drawing = PKDrawing()
        print("Dessin effacé!")
    }
}

struct DrawingPreview: View {
    var drawing: PKDrawing

    var body: some View {
        // Mettre en place l'aperçu du dessin ici
        Image(uiImage: drawing.image(from: drawing.bounds, scale: UIScreen.main.scale))
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

struct CreativeChallengeView_Previews: PreviewProvider {
    static var previews: some View {
        CreativeChallengeView()
    }
}

//
//  DrawingCanvas.swift
//  CreaDefi
//
//  Created by marhuenda joris on 13/12/2023.
//

import SwiftUI
import PencilKit

struct DrawingCanvas: UIViewRepresentable {
    @Binding var drawing: PKDrawing
    @Binding var drawingColor: Color

    class Coordinator: NSObject, PKCanvasViewDelegate {
        var parent: DrawingCanvas

        init(parent: DrawingCanvas) {
            self.parent = parent
        }

        // Ajoute des fonctions delegate pour gérer les interactions de dessin
        // ...

        func canvasViewDrawingDidChange(_ canvasView: PKCanvasView) {
            // Mettre à jour le dessin dans le modèle avec la nouvelle couleur
            parent.drawing = canvasView.drawing
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }

    func makeUIView(context: Context) -> PKCanvasView {
        let canvasView = PKCanvasView()
        canvasView.delegate = context.coordinator
        canvasView.tool = PKInkingTool(.pen, color: UIColor(drawingColor), width: 15)

        return canvasView
    }

    func updateUIView(_ uiView: PKCanvasView, context: Context) {
        uiView.drawing = drawing
        uiView.tool = PKInkingTool(.pen, color: UIColor(drawingColor), width: 15)
    }
}

struct DrawingCanvas_Previews: PreviewProvider {
    static var previews: some View {
        DrawingCanvas(drawing: .constant(PKDrawing()), drawingColor: .constant(.black))
    }
}

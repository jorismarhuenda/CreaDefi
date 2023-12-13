//
//  TrophiesView.swift
//  CreaDefi
//
//  Created by marhuenda joris on 13/12/2023.
//

import SwiftUI

struct TrophiesView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Vos Trophées")
                    .font(.title)
                    .padding()

                // Affichage des trophées et du progrès
                TrophyProgressView(trophy: "Bois", progress: 30)
                TrophyProgressView(trophy: "Bronze", progress: 80)
                TrophyProgressView(trophy: "Argent", progress: 150)
                TrophyProgressView(trophy: "Or", progress: 280)
                TrophyProgressView(trophy: "Diamant", progress: 750)

                // Trophée Dragon
                TrophyView(trophy: "Dragon", isHidden: true)
                    .padding()

                // Autres éléments ou fonctionnalités de la TrophiesView
            }
            .navigationTitle("Trophées")
        }
    }
}

struct TrophyProgressView: View {
    var trophy: String
    var progress: Int

    var body: some View {
        HStack {
            Text("\(trophy) - \(progress) points")
                .padding()

            Spacer()

            // Barre de progression
            RoundedRectangle(cornerRadius: 8)
                .frame(width: CGFloat(progress), height: 20)
                .foregroundColor(progress >= 100 ? .green : .blue)
        }
    }
}

struct TrophyView: View {
    var trophy: String
    var isHidden: Bool

    var body: some View {
        VStack {
            if !isHidden {
                Image(systemName: "rosette")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.orange)

                Text(trophy)
                    .font(.headline)
                    .padding()
            } else {
                EmptyView()
            }
        }
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray, lineWidth: 1)
        )
    }
}

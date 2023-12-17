//
//  MainView.swift
//  CreaDefi
//
//  Created by marhuenda joris on 14/12/2023.
//

import SwiftUI
import Firebase

struct MainView: View {
    @State private var challenge: String = "Répondez à cette énigme !"
    @State private var isChallengeAccepted = false
    @State private var isChallengeCompleted = false
    @State private var timer: Timer?
    @State private var timeRemaining = 86400 // 24 heures en secondes
    @State private var showAlert = false
    @State private var alertMessage = ""

    var body: some View {
        VStack {
            Text("Défi Quotidien")
                .font(.title)
                .padding()

            Text(challenge)
                .padding()

            if !isChallengeAccepted {
                Button(action: {
                    acceptChallenge()
                }) {
                    Text("Accepter le Défi")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            } else {
                Text("Temps restant : \(timeFormatted(timeRemaining))")
                    .padding()

                Button(action: {
                    // Navigue vers la vue de réponse aux énigmes ou aux défis créatifs
                    // Ajoute la logique nécessaire pour déterminer quel défi est actuellement relevé
                    // Puis, active la navigation vers la vue suivante
                    // par exemple, en utilisant la navigationLink ou en modifiant l'état de la vue principale
                }) {
                    Text("Relever le Défi")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
                Button(action: {
                    // Navigue vers la vue de réponse aux énigmes ou aux défis créatifs
                }) {
                    Text("Relever le Défi")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
        }
        .padding()
        .navigationBarTitle("Défi Quotidien", displayMode: .inline)
        .onAppear {
            loadChallenge()
        }
        .onDisappear {
            timer?.invalidate()
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Erreur"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
    }

    private func loadChallenge() {
        // Code pour charger le défi quotidien depuis Firebase ou autre source
    }

    private func acceptChallenge() {
        isChallengeAccepted = true
        startTimer()
    }

    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                timer?.invalidate()
                isChallengeAccepted = false
                // Gère le passage automatique au nouveau défi ou déclenche un nouveau type de défi créatif
            }
        }
    }

    private func timeFormatted(_ totalSeconds: Int) -> String {
        let hours: Int = totalSeconds / 3600
        let minutes: Int = (totalSeconds % 3600) / 60
        let seconds: Int = totalSeconds % 60
        
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

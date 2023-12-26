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
    @State private var showingUserChallenges = false
    @State private var showingPersonalStats = false // Nouvelle variable d'état pour gérer la navigation

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

                NavigationLink(destination: UserChallengesView(), isActive: $showingUserChallenges) {
                    EmptyView()
                }
                .hidden()

                Button(action: {
                    // Navigue vers la vue d'historique des défis lorsque le défi est relevé
                    // Peut-être déclencher d'autres logiques spécifiques à l'énigme ou au défi créatif
                    showingUserChallenges = true
                }) {
                    Text("Relever le Défi")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }

                Button(action: {
                    // Navigue vers la vue des Statistiques Personnelles
                    showingPersonalStats = true
                }) {
                    Text("Voir Statistiques")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .sheet(isPresented: $showingPersonalStats) {
                    PersonalStatsView()
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

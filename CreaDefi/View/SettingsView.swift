//
//  SettingsView.swift
//  CreaDefi
//
//  Created by marhuenda joris on 13/12/2023.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        Form {
            Section(header: Text("Paramètres Généraux")) {
                Toggle("Notifications", isOn: .constant(true))
                Toggle("Sons", isOn: .constant(true))
            }

            Section(header: Text("Préférences de Défi")) {
                Toggle("Défi Quotidien", isOn: .constant(true))
                Toggle("Défi Créatif", isOn: .constant(true))
            }

            Section(header: Text("Compte")) {
                NavigationLink(destination: AccountDetailsView()) {
                    Text("Détails du Compte")
                }
                Button(action: {
                    // Ajoutez ici la logique de déconnexion
                }) {
                    Text("Se Déconnecter")
                        .foregroundColor(.red)
                }
            }
        }
        .navigationTitle("Paramètres")
    }
}

struct AccountDetailsView: View {
    var body: some View {
        Form {
            Section {
                Text("Nom d'utilisateur: JohnDoe")
            }

            Section(header: Text("Modifier le Mot de Passe")) {
                // Ajoutez les champs de modification du mot de passe ici
            }

            // Ajoutez d'autres sections pour les informations du compte si nécessaire
        }
        .navigationTitle("Détails du Compte")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

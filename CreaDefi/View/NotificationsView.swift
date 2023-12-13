//
//  NotificationsView.swift
//  CreaDefi
//
//  Created by marhuenda joris on 13/12/2023.
//

import SwiftUI

struct NotificationsView: View {
    var body: some View {
        VStack {
            Text("Notifications")
                .font(.title)
                .padding()

            // Liste des notifications
            List {
                NotificationRow(title: "Défi du jour disponible", date: "08:00 AM")
                NotificationRow(title: "Rappel de défi quotidien", date: "12:00 PM")
                // Ajouter d'autres notifications si nécessaire
            }
        }
        .navigationTitle("Notifications")
    }
}

struct NotificationRow: View {
    var title: String
    var date: String

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                Text(date)
                    .font(.caption)
            }
            Spacer()
        }
        .padding()
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}

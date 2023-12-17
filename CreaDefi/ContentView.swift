//
//  ContentView.swift
//  CreaDefi
//
//  Created by marhuenda joris on 11/12/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var isLoggedIn = false // Ajoute cette variable pour gérer l'état de connexion

    var body: some View {
        NavigationView {
            if isLoggedIn {
                MainView()
            } else {
                LoginView(isLoggedIn: $isLoggedIn)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

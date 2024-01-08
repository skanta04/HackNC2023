//
//  ContentView.swift
//  DyslexiQuiz
//
//  Created by Saishreeya Kantamsetty on 10/28/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = "One"
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
            .tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }
            FlashcardsView()
                .tabItem {
                    Label("Flashcards", systemImage: "menucard.fill")
                }
                .tag("2")
            ReadingView()
                .tabItem {
                    Label("EasyReader", systemImage: "book.fill")
                }
                .tag("3")
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
                .tag("4")
        }
    }
}



#Preview {
    ContentView()
}

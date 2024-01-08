//
//  HomeView.swift
//  DyslexiQuiz
//
//  Created by Jordan Weinstein on 10/28/23.
//

import SwiftUI
import AVFoundation

struct HomeView: View {
    @State private var nameInput: String = ""
    @State private var tabSelection = 1
    @State private var welcome : String = "Welcome"
    let textToSpeechManager = TextToSpeechManager()
    
    var body: some View {
        ZStack {
            Color.cream
                .ignoresSafeArea()
            VStack (spacing: 41) {
                Image("Logo")
                    .resizable()
                    .frame(width: 300, height: 200)
                    .aspectRatio(contentMode: .fit)
                
                Text("DyslexiQuiz")
                    .padding()
                    .font(.custom("OpenDyslexicThree-Regular", size: 40))
                
                Button {
                    textToSpeechManager.speak(input: "Hi \(nameInput)!! Welcome to diss-lexie-quiz. Click on the flashcards icon to practice spelling and comprehension, or check out the easy reader to view any text in the open dyslexic font. Track your progress along the way!!")
                } label: {
                    Image(systemName: "speaker.wave.2.fill")
                }
                
                Text("Enter Your Name:")
                    .font(.custom("OpenDyslexicThree-Regular", size: 25))
                
                TextField("Name", text: $nameInput)
                    .padding()
                    .foregroundColor(.black)
                    .frame(width: 300, height: 50)
                    .background(Color.lightPurple)
                    .cornerRadius(12)
                    .shadow(color: Color.gray, radius: 5, x: 0, y: 4)
                
                Spacer()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

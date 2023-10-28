//
//  HomeView.swift
//  DyslexiQuiz
//
//  Created by Jordan Weinstein on 10/28/23.
//

import Foundation
import SwiftUI
import AVFoundation

func speakText(text: String) {
    let utterance = AVSpeechUtterance(string: text)
    utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
    utterance.rate = 0.1

    let synthesizer = AVSpeechSynthesizer()
    synthesizer.speak(utterance)
}
struct HomeView: View {
    @State private var nameInput = ""
    @State private var tabSelection = 1
    @State private var welcome : String = "Welcome"
    var body: some View {
        
        ZStack{
            Color.cream
            VStack (spacing: 20) {
                Image("Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Button(action: {
                    let utterance = AVSpeechUtterance(string: welcome)
                    utterance.voice = AVSpeechSynthesisVoice(language: "en-AU")
                    utterance.rate = 1
                    
                    let synthesizer = AVSpeechSynthesizer()
                    synthesizer.speak(utterance)
                }, label: {
                    Image(systemName: "speaker.wave.2.fill")
                })
                
                Text("DyslexiQuiz")
                    .padding()
                    .font(.custom("OpenDyslexicThree-Regular", size: 40))
                Text("Enter Your Name:")
                    .font(.custom("OpenDyslexicThree-Regular", size: 17))
                
                TextField("Name", text: $nameInput)
                    .padding()
                    .foregroundColor(.black)
                    .frame(width: 300, height: 50)
                    .background(Color.pastelBlue)
                    .cornerRadius(12) // Rounded corners
                    .shadow(color: Color.gray, radius: 5, x: 0, y: 4)
                Spacer()
            }
        }
    }
}

#Preview {
    HomeView()
}

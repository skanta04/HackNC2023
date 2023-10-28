//
//  ContentView.swift
//  DyslexiQuiz
//
//  Created by Saishreeya Kantamsetty on 10/28/23.
//

import SwiftUI
import AVFoundation

func speakText(text: String) {
    let utterance = AVSpeechUtterance(string: text)
    utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
    utterance.rate = 0.1

    let synthesizer = AVSpeechSynthesizer()
    synthesizer.speak(utterance)
}
struct ContentView: View {
    @State private var nameInput = ""
    
    var body: some View {
        ZStack{
            VStack {
                Image("Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Button(action: {
                    speakText(text: "Hello")
                }, label: {
                    Image(systemName: "speaker.wave.2.fill")
                })
                Text("DyslexiQuiz")
                    .padding()
                    .font(.system(size: 48))
                Text("Enter Your Name:")
                
                TextField("Name", text: $nameInput)
                    .padding()
            }
        }
    }
}

#Preview {
    ContentView()
    
}

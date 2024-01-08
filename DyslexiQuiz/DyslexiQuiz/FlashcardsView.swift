//
//  FlashcardsView.swift
//  DyslexiQuiz
//
//  Created by Jordan Weinstein on 10/28/23.
//

import Foundation
import SwiftUI
import AVKit

struct FlashcardsView: View {
    private var animalNames = ["Dog", "Cat", "Lion", "Zebra", "Shark"]
    @State private var isFront = true
    @State private var userInput = ""
    @State private var index = 0
    @State private var cardColor: Color = Color.lightPurple
    let textToSpeechManager = TextToSpeechManager()

    var body: some View {
        ZStack {
            Color.cream
                .ignoresSafeArea()
            VStack (spacing: 41) {
                Text("Learn Animals!!")
                    .font(.custom("OpenDyslexicThree-Regular", size: 40))
                    .padding()
                Text("\(index + 1)/\(animalNames.count)")
                    .padding(.bottom, 30)
                    .font(.custom("OpenDyslexicThree-Regular", size: 30))
                    .fontWeight(.bold)
                Rectangle()
                    .fill(cardColor)
                    .frame(width: 280, height: 200)
                    .cornerRadius(20)
                    .onTapGesture {
                        flipCard()
                    }
                    .overlay(
                        Group {
                            if (isFront) {
                                ForEach(animalNames, id: \.self) { animal in
                                    Text(animalNames[index])
                                        .foregroundColor(.black)
                                        .font(.custom("OpenDyslexicThree-Regular", size: 40))
                                }
                            }
                            else {
                                VStack {
                                    TextField("Type the word", text: $userInput)
                                        .multilineTextAlignment(.center)
                                        .font(.custom("OpenDyslexicThree-Regular", size: 20))
                                        .padding(.vertical, 0)
                                        .padding(.horizontal, 30)
                                        .background(Color.lightPurple)
                                        .cornerRadius(20)
                                    Button {
                                        correctWord()
                                        textToSpeechManager.speak(input: userInput)
                                    } label: {
                                        Text("Enter")
                                            .foregroundColor(.black)
                                            .frame(minWidth: 0, maxWidth: 50)
                                            .frame(height: 25)
                                            .font(.custom("OpenDyslexicThree-Regular", size: 15))
                                            .padding(.all, 15)

                                        
                                    }
                                        .background(Color.black)
                                        .cornerRadius(15)
                                }
                            }
                        }
                    )
                Spacer().frame(height: 50)
                
                HStack {
                    Image(systemName: "arrow.left.square.fill")
                        .resizable()
                        .foregroundColor(Color("LightPurple"))
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                        .onTapGesture {
                            lastCard()
                        }
                    Image(systemName: "arrow.right.square.fill")
                        .resizable()
                        .foregroundColor(Color("LightPurple"))
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                        .onTapGesture {
                            nextCard()
                        }
                }
            }
        }
    }
    func flipCard() {
        isFront.toggle()
    }
    func nextCard() {
        if index < animalNames.count - 1 {
            index = index + 1
            isFront = true
            cardColor = Color.lightPurple
            userInput = ""
        }
    }
    func lastCard() {
        if index > 0 {
            index = index - 1
            isFront = true
            cardColor = Color.lightPurple
            userInput = ""
        }
    }
    func correctWord() {
        if userInput.caseInsensitiveCompare(animalNames[index]) == .orderedSame {
            cardColor = Color.green
        }
        else {
            cardColor = Color.red
        }
    }
}

#Preview {
    FlashcardsView()
}

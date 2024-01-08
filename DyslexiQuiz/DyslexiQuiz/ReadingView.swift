//
//  ReadingView.swift
//  DyslexiQuiz
//
//  Created by Jordan Weinstein on 10/28/23.
//

import SwiftUI

struct ReadingView: View {
    @State private var originalText = ""
    @State private var displayText = ""
    @State private var isFontApplied = false

    var body: some View {
        ZStack {
            Color.cream
                .ignoresSafeArea()
            VStack(spacing: 41) {
                Text("EasyReader")
                    .font(.custom("OpenDyslexicThree-Regular", size: 47))
                    .padding(.top, 20)
                
                TextField("Enter Text", text: $originalText)
                    .padding()
                    .frame(width: 350, height: 100)
                    .border(Color.black, width: 1)
                    .font(.system(size: 16))
                
                Button(action: {
                    displayText = originalText
                    isFontApplied = true
                }) {
                    Text("Apply OpenDyslexic Font")
                        .foregroundColor(.white)
                        .padding(.vertical, 20)
                        .padding(.horizontal, 24)
                        .background(.lightPurple)
                        .cornerRadius(15)
                        .shadow(color: Color.gray.opacity(0.5), radius: 4, x: 0, y: 2)
                        .font(Font.custom("OpenDyslexicThree-Regular", size: 16))
                }
                .padding()
                
                Text(displayText)
                    .font(isFontApplied ? .custom("OpenDyslexicThree-Regular", size: 30) : .system(size: 30))
                
                Spacer()
            }
            .padding()
            .background(Color.cream.ignoresSafeArea())
        }
    }
}
        

struct ReadingView_Previews: PreviewProvider {
    static var previews: some View {
        ReadingView()
    }
}

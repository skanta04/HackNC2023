//
//  ReadingView.swift
//  DyslexiQuiz
//
//  Created by Jordan Weinstein on 10/28/23.
//

import Foundation
import SwiftUI

struct ReadingView: View {
    @State private var originalText = ""
    @State private var displayText = ""
    @State private var isFontApplied = false

    var body: some View {
        NavigationStack {
            
        ZStack {
            Color.cream
                .ignoresSafeArea()
            VStack (spacing: 41){
                Text("EasyReader")
                    .font(.custom("OpenDyslexicThree-Regular", size: 47))
                TextField("Enter Text", text: $originalText)
                    .padding()
                    .frame(width: 350, height: 100)
                    .border(Color.black , width: 1)
                    .font(.system(size: 16))
                
                Button(action: {
                    displayText = originalText
                    isFontApplied = true
                }) {
                    Text("Apply OpenDyslexic Font")
                        .foregroundColor(.black)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.pastelBlue)
                        .cornerRadius(12) 
                        .shadow(color: Color.gray, radius: 5, x: 0, y: 4)
                        .font(.custom("OpenDyslexicThree-Regular", size: 19))
                }
                .padding()
                if isFontApplied {
                    Text(displayText)
                        .font(.custom("OpenDyslexicThree-Regular", size: 30))
                }
                Spacer()
            }
            .padding()
        }
    }
    }
}


struct OpenDyslexicFont: ViewModifier {
    func body(content: Content) -> some View {
        content.font(.custom("OpenDyslexicThree-Regular", size: 16))
    }
}

#Preview {
    ReadingView()
}

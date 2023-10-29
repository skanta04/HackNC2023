//
//  HomeView.swift
//  DyslexiQuiz
//
//  Created by Jordan Weinstein on 10/28/23.
//

import Foundation
import SwiftUI

struct HomeView: View {
    @State private var nameInput: String = ""
    @State private var tabSelection = 1
    @State private var welcome : String = "Welcome"
    var body: some View {
        
        ZStack{
            Color.cream
            VStack (spacing: 30) {
                Image("Logo")
                    .resizable()
                    .frame(width:300, height: 200)
                    .aspectRatio(contentMode: .fit)
                Text("DyslexiQuiz")
                    .padding()
                    .font(.custom("OpenDyslexicThree-Regular", size: 40))
                Image(systemName: "speaker.wave.2.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.black)
                Text("Enter Your Name:")
                    .font(.custom("OpenDyslexicThree-Regular", size: 25))
                
                TextField("Name", text: $nameInput)
                    .padding()
                    .foregroundColor(.black)
                    .frame(width: 300, height: 50)
                    .background(Color.lightPurple)
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

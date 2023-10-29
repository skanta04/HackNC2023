//
//  ProfileView.swift
//  DyslexiQuiz
//
//  Created by Jordan Weinstein on 10/28/23.
//

import Foundation
import SwiftUI

struct ProfileView: View {
@State private var calendarDates: [CalendarDate] = []
@State private var checkedCount: Int = 0

var body: some View {
    ZStack {
        Color.cream
            .ignoresSafeArea()
        VStack {
            HStack {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding(.leading, 40)
                Spacer()
                Text("Hello Jane!")
                    .font(.custom("OpenDyslexicThree-Regular", size: 30))
                Spacer()
            }
            HStack (spacing: 30) {
                if checkedCount < 5 {
                    Image(systemName: "circle.fill")
                        .resizable()
                        .frame(width: 83, height: 83)
                } else {
                    Image("Achievement5")
                        .resizable()
                        .frame(width: 83, height: 83)
                }
                if checkedCount < 15 {
                    Image(systemName: "circle.fill")
                        .resizable()
                        .frame(width: 83, height: 83)
                } else {
                    Image("Achievement15")
                        .resizable()
                        .frame(width: 83, height: 83)
                }
                if checkedCount < 30 {
                    Image(systemName: "circle.fill")
                        .resizable()
                        .frame(width: 83, height: 83)
                } else {
                    Image("Achievement30")
                        .resizable()
                        .frame(width: 83, height: 83)
                }
                
            }
            .padding()
            List(calendarDates) { date in
                HStack {
                    Text(dateFormatter.string(from: date.date))
                        .font(.custom("OpenDyslexicThree-Regular", size: 17))
                    Spacer()
                    Image(systemName: date.isChecked ? "checkmark.square" : "square")
                        .onTapGesture {
                            toggleCheckState(for: date)
                        }
                }
                
            }
            
            .onAppear {
                populateCalendarDates()
            }
            
            Text("Points: \(checkedCount)")
                .font(.custom("OpenDyslexicThree-Regular", size: 17))
                .padding()
        }
    }
}
    
    func toggleCheckState(for date: CalendarDate) {
        if let index = calendarDates.firstIndex(where: { $0.id == date.id }) {
            calendarDates[index].isChecked.toggle()
            checkedCount = checkedCount + 1
        }
    }

    func populateCalendarDates() {
        let today = Date()
        var dates: [CalendarDate] = []

        for i in 0..<7 {
            if let date = Calendar.current.date(byAdding: .day, value: i, to: today) {
                dates.append(CalendarDate(date: date))
            }
        }
        calendarDates = dates
    }
}

struct CalendarDate: Identifiable {
    let id = UUID()
    let date: Date
    var isChecked: Bool = false
}

let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd MMM yyyy"
    return formatter
}()

#Preview {
    ProfileView()
}

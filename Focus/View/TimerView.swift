//
//  TimerView.swift
//  Focus
//
//  Created by Louise Bishop on 07/04/2021.
//

import SwiftUI

// @ObservedObject var timer: Timer
//    @State var timeRemaining = 200
//    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

struct TimerView: View {
  
  @ObservedObject var focusSession: FocusSession
  @Binding var numberOfSessions: Double
  
    var body: some View {
      VStack {
        HStack {
          Image("smallTomato")
            .resizable()
            .frame(width: 25, height: 25, alignment: .center)
          Text("Focus")
            .modifier(BodyText())
        }
        
        Text("Session 1 of \(Int(numberOfSessions))")
          .modifier(BodyText())
          .padding()
        Text("\(focusSession.focusTaskName)")
          .modifier(MediumTitle())
        
        Spacer()
        Text("\(Double(focusSession.sessionDurations[focusSession.sessionDurationIndex]), specifier: "%.2f")")
          .modifier(TimerText())
        
        Spacer()
        UnfilledButton(title: "I got distracted")
        FilledButton(title: "Start")
      }
      .padding()
      .navigationBarBackButtonHidden(true)
      .navigationBarHidden(true)
    }
}

//struct TimerView_Previews: PreviewProvider {
//    static var previews: some View {
//      TimerView(focusTaskName: "")
//    }
//}

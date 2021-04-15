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

struct FocusSessionView: View {
  
  @ObservedObject var focusSession: FocusSession
  @Binding var numberOfSessions: Double
//  @State private var showPausedState : Bool
  
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
          Text("\(focusSession.getSecondsToDuration())")
//        Text(focusSession.timerActive ? "\(focusSession.timerDuration)" : "\(focusSession.getSecondsToDuration())")
          .modifier(TimerText())
        
        Spacer()
        UnfilledButton(title: "I got distracted")
//        FilledButton(title: "Pause", action: focusSession.pauseTimer())
        
          Button(action: {
            focusSession.pauseTimer()
          }) {
            Text("Sneaky")
          }
          .buttonStyle(FilledFormButtonStyle())
          .opacity(focusSession.timerActive ? 0 : 1)
          
          Button(action: {
            focusSession.pauseTimer()
          }) {
            Text("Even Sneakier")
          }.buttonStyle(FilledFormButtonStyle())
          
          Button(action: {
            focusSession.pauseTimer()
          }) {
            Text("Pause")
          }.buttonStyle(FilledFormButtonStyle())
      .padding()
      .navigationBarBackButtonHidden(true)
      .navigationBarHidden(true)
    }
    }
}

//struct TimerView_Previews: PreviewProvider {
//    static var previews: some View {
//      TimerView(focusTaskName: "")
//    }
//}

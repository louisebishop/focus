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
  
  @EnvironmentObject var navigationHelper: NavigationHelper
  @ObservedObject var focusSession: FocusSession
  @Binding var numberOfSessions: Double
  @State private var showPausedState = false
  
    var body: some View {
      VStack {
        
        FocusTitleView()
        
        Text("Session 1 of \(Int(numberOfSessions))")
          .modifier(BodyText())
          .padding()
        
        Text("\(focusSession.focusTaskName)")
          .modifier(MediumTitle())
        
        Spacer()
        
        Text("\(focusSession.getSecondsToDuration())")
          .modifier(TimerText())
        
        Spacer()
        
        VStack {
          Button(action: { focusSession.distractionCounted() }) {
            Text("I got distracted")
          }.buttonStyle(UnfilledButtonStyle())
          
          Button(action: {
            focusSession.pauseTimer()
            showPausedState = true
          }) {
            Text("Pause")
          }.buttonStyle(FilledButtonStyle(background: .focusBlack))
        }
      }.statusBar(hidden: true)
      .padding()
      .background(showPausedState ? Color.lightGrey : Color.focusWhite)
      .modifier(PausedModifier(focusSession: focusSession, showPausedState: $showPausedState))
      .navigationBarBackButtonHidden(true)
      .navigationBarHidden(true)
      
    }
}

//struct TimerView_Previews: PreviewProvider {
//    static var previews: some View {
//      TimerView(focusTaskName: "")
//    }
//}



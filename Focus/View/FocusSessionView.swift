//
//  TimerView.swift
//  Focus
//
//  Created by Louise Bishop on 07/04/2021.
//

import SwiftUI

struct FocusSessionView: View {
  
  @EnvironmentObject var navigationHelper: NavigationHelper
  @ObservedObject var focusSession: FocusSession
  
    var body: some View {
      
      if focusSession.sessionEnded {
        FocusSessionSummaryView()
      } else {
        VStack {
          FocusTitleView(textColor: focusSession.focusTime ? Color.focusBlack : Color.focusWhite)
            .padding(.top, 40)
          Text(focusSession.focusTime ? "Session \(focusSession.currentSession) of \(Int(focusSession.numberOfSessions))" : "Break \(focusSession.currentBreak) of \(Int(focusSession.numberOfBreaks))")
            .modifier(focusSession.focusTime ? BodyText(textColor: Color.focusBlack) : BodyText(textColor: Color.focusWhite))
            .padding()
          
          Text("\(focusSession.focusTime ? focusSession.focusTaskName : focusSession.breakText)")
            .modifier(focusSession.focusTime ? MediumTitle(textColor: Color.focusBlack) : MediumTitle(textColor: Color.focusWhite))
          
          Spacer()
          
          Text("\(focusSession.getSecondsToDuration(timerDuration: focusSession.focusTime ? focusSession.focusTimerDuration : focusSession.breakTimerDuration))")
            .modifier(focusSession.focusTime ? TimerText(textColor: Color.focusBlack) : TimerText(textColor: Color.focusWhite))
          
          Spacer()
          
          VStack {
            if focusSession.focusTime {
              Button(action: { focusSession.distractionCounted() }) {
                Text("I got distracted")
              }.buttonStyle(UnfilledButtonStyle())
              
              Button(action: { focusSession.timerActive ? focusSession.pauseFocusTimer() : focusSession.startTimer()}) {
                Text(focusSession.timerActive ? "Pause Timer" : "Start Timer")
              }.buttonStyle(FilledButtonStyle(background: .focusBlack))
              
            } else {
              
              Button(action: {focusSession.timerActive ? focusSession.pauseBreakTimer() : focusSession.startTimer()}) {
                Text(focusSession.timerActive ? "Pause Timer" : "Start Timer")
              }.buttonStyle(FilledButtonStyle(background: .cherryRed))
              
              Button(action: {
                focusSession.skipBreak()
              }) {
                Text("Skip to next focus")
              }.buttonStyle(InvertedUnfilledButtonStyle())
            }
          }.padding(.bottom, 20)
        }
        .padding()
        .foregroundColor(focusSession.focusTime ? Color.focusBlack: Color.focusWhite)
        .background(focusSession.showPausedState ? Color.lightGrey : focusSession.setBackground())
        .modifier(PausedModifier(focusSession: focusSession))
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(.all)
      }
    }
}

//struct TimerView_Previews: PreviewProvider {
//    static var previews: some View {
//      TimerView(focusTaskName: "")
//    }
//}



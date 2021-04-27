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
      // If the focus session has ended, show the summary view
      if focusSession.sessionEnded {
        FocusSessionSummaryView(focusSession: focusSession)
      } else {
        // Otherwise show the focus timer
        VStack {
          // Show either the focus timer session text or the break session text
          FocusTitleView(textColor: focusSession.invertColors(), image: focusSession.setImage())
            .padding(.top, 40)
          Text(focusSession.focusTime ? "Session \(focusSession.currentSession) of \(Int(focusSession.numberOfSessions))" : "Break \(focusSession.currentBreak) of \(Int(focusSession.numberOfBreaks))")
            .modifier(BodyText(textColor: focusSession.invertColors()))
            .padding(.horizontal, 20)
            .padding(.top, 40)
          
          Text("\(focusSession.focusTime ? focusSession.focusTaskName : focusSession.breakText)")
            .modifier(MediumTitle(textColor: focusSession.invertColors()))
            .padding(.top, 20)
          
          Spacer()
          
          Text("\(focusSession.getSecondsToDuration(timerDuration: focusSession.focusTime ? focusSession.focusTimerDuration : focusSession.breakTimerDuration))")
            .modifier(TimerText(textColor: focusSession.invertColors()))
          
          Spacer()
          
          VStack(spacing: 15) {
            
            // If it's focus time...
            if focusSession.focusTime {
              // Show the distraction counter button
              Button(action: { focusSession.distractionCounted() }) {
                Text(focusSession.isDistracted ? "+1" : "I got distracted")
              }.buttonStyle(UnfilledButtonStyle(background: focusSession.setFocusBackgroundColor(), textColor: focusSession.invertColors()))
              
              // Show the focus timer button
              Button(action: { focusSession.timerActive ? focusSession.pauseFocusTimer() : focusSession.startTimer()}) {
                Text(focusSession.timerActive ? "Pause Timer" : "Start Timer")
              }
              .buttonStyle(FilledButtonStyle(background: focusSession.invertColors(), textColor: focusSession.setFocusBackgroundColor()))
              
              
            } else {
              
              // If it's break time...
              // Show the break timer button
              // If the timer is active, pause it, otherwise start it
              Button(action: {focusSession.timerActive ? focusSession.pauseBreakTimer() : focusSession.startTimer()}) {
                Text(focusSession.timerActive ? "Pause Timer" : "Start Timer")
              }.buttonStyle(FilledButtonStyle(background: focusSession.timerActive ? .focusWhite : .cherryRed, textColor: focusSession.timerActive ? .focusBlack : .focusWhite))
              
              // Show the skip break button
              Button(action: {
                focusSession.skipBreak()
              }) {
                Text("Skip to next focus")
              }.buttonStyle(InvertedUnfilledButtonStyle())
            }
          }.padding(.bottom, 40)
        }
        .padding()
//        .foregroundColor(focusSession.invertColors())
        .background(focusSession.setFocusBackgroundColor())
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



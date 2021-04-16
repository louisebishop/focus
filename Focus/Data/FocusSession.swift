//
//  Timer.swift
//  Focus
//
//  Created by Louise Bishop on 07/04/2021.
//

import SwiftUI

class FocusSession: ObservableObject {
  
  // Session properties
  @Published var focusTaskName: String = ""
  @Published var focusDurationIndex: Int = 0
  var currentSession: Int = 1
  @Published var numberOfSessions: Double = 3
  @Published var numberOfBreaks: Int = 1
  @Published var colorSelection: String = ""
  @Published var sessionEnded: Bool = false
  @Published var showPausedState: Bool = false
  
  // Break properties
  @Published var breakDurationIndex: Int = 0
  var currentBreak: Int = 1
  @Published var breakText = "Take a break"
  //  @Published var breakFrequencyIndex: Int = 0
  
  //Timer
  var focusTimer = Timer()
  var breakTimer = Timer()
  @Published var timerActive = false
  @Published var focusTimerDuration = 0
  @Published var breakTimerDuration = 0
  @Published var focusTime = true
  
  let focusDurations = [1, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60]
  let breakDurations = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
//  let longBreakFrequencies = [3, 4, 5, 6]
  
  var distractionTotal = 0
  
  //Start a session
  func startSession() {
    print("session started")
    setFocusTimer()
    setBreakTimer()
  }
  
  //Count distraction
  func distractionCounted() {
    distractionTotal += 1
  }
  
  //Set focus session timer or reset it
  func setFocusTimer() {
    let focusDuration = focusDurations[focusDurationIndex] * 60
      focusTimerDuration = focusDuration
      startTimer()
  }
  
  //Set break session timer
  func setBreakTimer() {
    numberOfBreaks = Int(numberOfSessions) - 1
    let breakDuration = breakDurations[breakDurationIndex] * 60
      breakTimerDuration = breakDuration
  }
  
  func startTimer() {
    
    timerActive = true
     if focusTime {
      
      // Sets the timer variable with a new timer
      focusTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
        // For each second
        // Remove 1 from duration
        self.focusTimerDuration -= 1
        if self.focusTimerDuration == 0 { self.stopFocusTimer() }
      }
     } else {
      // Sets the timer variable with a new timer
      breakTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
        // For each second
        // Remove 1 from duration
        self.breakTimerDuration -= 1
        if self.breakTimerDuration == 0 { self.stopBreakTimer() }
     }
     }
  }
  
  // Seconds to duration
  
  func getSecondsToDuration(timerDuration: Int) -> String {
    let minutes = timerDuration / 60 % 60
    let seconds = timerDuration % 60
    return String(format:"%02i:%02i", minutes, seconds)
  }
  
  // set background
  
  func setBackground() -> Color {
    if focusTime {
      return Color.focusWhite
    } else {
      return Color.focusBlack
    }
  }
  
  //Pause the timer
  func pauseFocusTimer() {
    timerActive = false
    focusTimer.invalidate()
  }
  
  func pauseBreakTimer() {
    timerActive = false
    breakTimer.invalidate()
  }
  
  //Stop the timer
  func stopFocusTimer() {
    timerActive = false
    focusTimer.invalidate()
    focusTimerDuration = 0
    while currentSession < Int(numberOfSessions) {
      print("increase focus session")
      currentSession += 1
      setBreakTimer()
      focusTime = false
    }
  }
  
  func stopBreakTimer() {
    timerActive = false
    focusTimer.invalidate()
    breakTimerDuration = 0
    while currentBreak < numberOfBreaks {
      print("increase break session")
      currentBreak += 1
      setFocusTimer()
      focusTime = true
    }
    sessionEnded = true
  }
  
  func skipBreak() {
    stopBreakTimer()
    focusTime = true
    setFocusTimer()
  }
  
  
}



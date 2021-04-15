//
//  Timer.swift
//  Focus
//
//  Created by Louise Bishop on 07/04/2021.
//

import SwiftUI

enum TimerType {
  case focusTimer
  case breakTimer
}

class FocusSession: ObservableObject {
  
  // Session properties
  @Published var focusTaskName: String = ""
  @Published var sessionDurationIndex: Int = 0
  @Published var numberOfSessions: Int = 0
  @Published var breakDurationIndex: Int = 0
  @Published var breakFrequencyIndex: Int = 0
  @Published var colorSelection: String = ""
  
  //Timer
  var timer = Timer()
  @Published var timerActive = false
  @Published var timerDuration = 0
  @Published var timerType: TimerType = .focusTimer
  
  
  let sessionDurations = [10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60]
  let breakDurations = [2, 3, 4, 5, 6, 7, 8, 9, 10]
  let longBreakFrequencies = [3, 4, 5, 6]
  
  var distractionTotal = 0
  
  //Start a session
  func startSession() {
    print("session started")
    setSessionTimer()
  }
  
  //Count distraction
  func distractionCounted() {
    distractionTotal += 1
  }
  
  //Stop a session
  func pauseSession() {
    print("crumbs")
  }
  
  //Set focus session timer
  func setSessionTimer() {
    let sessionDuration = sessionDurations[sessionDurationIndex] * 60
      timerDuration = sessionDuration
      startTimer()
  }
  
  //Set break session timer
  func setBreakTimer() {
    let breakDuration = breakDurations[breakDurationIndex]
    if breakDuration != 0 {
      _ = breakDuration * 60
      timerDuration = breakDuration
      startTimer()
    }
  }
  
  func startTimer() {
    timerActive = true
    // Sets the timer variable with a new timer
    timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
      // For each second
      // Remove 1 from duration
      self.timerDuration -= 1
      if self.timerDuration <= 0 { self.stopTimer() }
    }
  }
  
  // Seconds to duration
  
  func getSecondsToDuration() -> String {
    let minutes = timerDuration / 60 % 60
    let seconds = timerDuration % 60
    return String(format:"%02i:%02i", minutes, seconds)
  }
  
  //Pause the timer
  
  func pauseTimer() {
    print("timer paused")
    timerActive = false
    timer.invalidate()
  }
  
  //Stop the timer
  func stopTimer() {
    timerActive = false
    timer.invalidate()
    timerDuration = 0
  }
  
  //Set timer
  func setTimerType() {
    
  }
  
}



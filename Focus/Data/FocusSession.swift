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

enum TimerActivity {
  case timerActive
  case timerInactive
}

class FocusSession: ObservableObject {
  
  // Session properties
  @Published var focusTaskName: String = ""
  @Published var sessionDurationIndex: Int = 0
  @Published var numberOfSessions: Int = 0
  @Published var breakDurationIndex: Int = 0
  @Published var breakFrequencyIndex: Int = 0
  @Published var colorSelection: String = ""
  
  let sessionDurations = [10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60]
  let breakDurations = [2, 3, 4, 5, 6, 7, 8, 9, 10]
  let longBreakFrequencies = [3, 4, 5, 6]
  
  //Start a session
  //Stop a session
  
  //Start the timer
  //Pause the timer
  //Stop the timer
  
}



//
//  FocusApp.swift
//  Focus
//
//  Created by Louise Bishop on 16/02/2021.
//

import SwiftUI

@main
struct FocusApp: App {
  @AppStorage("isOnboarding") var isOnboarding: Bool = true
  
  var body: some Scene {
    WindowGroup {
      OnboardingNavigationView()
    }
  }
}

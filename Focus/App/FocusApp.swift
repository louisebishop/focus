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
  @StateObject var nav = OnboardingController()
  
  var body: some Scene {
    WindowGroup {
//      if isOnboarding {
//        OnboardingView()
//      } else {
//        ContentView()
//      }
      
//        if viewRouter.hasOnboarded {
//          ContentView()
//        } else {
          OnboardingStartView().environmentObject(nav)
//        }
      }
  }
}

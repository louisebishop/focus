//
//  OnboardingStartView.swift
//  Focus
//
//  Created by Louise Bishop on 06/04/2021.
//

import SwiftUI

struct OnboardingNavigationView: View {
  @AppStorage("isOnboarding") var isOnboarding: Bool = true
  
  var body: some View {
    
    if isOnboarding {
      OnboardingView()
    } else {
      ContentView()
    }
  }
  
}
struct OnboardingStartView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingNavigationView()
    }
}

//
//  OnboardingStartView.swift
//  Focus
//
//  Created by Louise Bishop on 06/04/2021.
//

import SwiftUI

struct OnboardingNavigationView: View {
  @AppStorage("isOnboarding") var isOnboarding: Bool = true
  @StateObject var navigationHelper = NavigationHelper()

  var body: some View {
    
    if isOnboarding {
      OnboardingView()
    } else {
      ContentView().environmentObject(navigationHelper)
    }
  }
  
}
struct OnboardingStartView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingNavigationView()
    }
}

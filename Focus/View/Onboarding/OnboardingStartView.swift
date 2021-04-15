//
//  OnboardingStartView.swift
//  Focus
//
//  Created by Louise Bishop on 06/04/2021.
//

import SwiftUI

struct OnboardingStartView: View {
  @EnvironmentObject var nav: OnboardingController
  
  var body: some View {
    switch nav.currentPage {
    case .onboarding:
      OnboardingView()
        .transition(.move(edge: .trailing))
    case .home:
      ContentView()
        .transition(.move(edge: .trailing))
    }
  }
  
}
struct OnboardingStartView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingStartView()
    }
}

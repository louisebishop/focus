//
//  ViewRouter.swift
//  Focus
//
//  Created by Louise Bishop on 06/04/2021.
//

import SwiftUI

enum Page {
  case onboarding
  case home
}

class OnboardingController: ObservableObject {
  
  @Published var currentPage: Page = .onboarding
  @Published var onboardingTabSelection = 0
}


//
//  ContentView.swift
//  Focus
//
//  Created by Louise Bishop on 16/02/2021.
//

import SwiftUI

struct ContentView: View {
//  @AppStorage("isOnboarding") var isOnboarding: Bool = false
  @EnvironmentObject var nav: OnboardingController
  let viewModel = TimerViewModel()
  
  var body: some View {
    
    NavigationView {
      VStack {
        Image("background-tomato")
          .resizable()
          .aspectRatio(contentMode: .fit)
        Text("Focus")
          .modifier(LargeTitle())
        Text("Do more mindfully")
          .modifier(BodyText())
          .padding(.top, 3)
        Spacer()
        Spacer()
        NavigationLink(destination: CreateNewFocusView()) {
          FilledButton(title: "Create a new focus")
        }
        .padding(.horizontal, 20)
        Spacer()
        Spacer()
      }
      .background(Color.onboardingBackgroundColor)
      .ignoresSafeArea()
    }
    .navigationBarTitle("")
    .navigationBarBackButtonHidden(true)
    .navigationBarHidden(true)
    
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro"))
      .previewDisplayName("iPhone 11 Pro")
  }
}

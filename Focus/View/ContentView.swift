//
//  ContentView.swift
//  Focus
//
//  Created by Louise Bishop on 16/02/2021.
//

import SwiftUI

struct ContentView: View {
  @EnvironmentObject var navigationHelper: NavigationHelper
  
  var body: some View {
    
    NavigationView {
      VStack {
        Image("background-tomato")
          .resizable()
          .aspectRatio(contentMode: .fit)
        Text("Focus")
          .modifier(LargeTitle(textColor: Color.focusBlack))
        Text("Do more mindfully")
          .modifier(BodyText(textColor: Color.focusBlack))
          .padding(.top, 3)
        Spacer()
        Spacer()
        NavigationLink(destination: CreateNewFocusView(), tag: "Create", selection: $navigationHelper.selection) {
          FilledButton(title: "Create a new focus", action: (), background: Color.focusBlack)
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

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
        GeometryReader { geo in
          Image("background-tomato")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: geo.size.width)
        }
        Text("Focus")
          .modifier(LargeTitle(textColor: Color.focusBlack))
        Text("Do more mindfully")
          .modifier(BodyText(textColor: Color.focusBlack))
          .padding(.top, 3)
          .padding(.bottom, 80)
        Spacer()
        NavigationLink(destination: CreateNewFocusView(), tag: "Create", selection: $navigationHelper.selection) {
          
//          Button(action: {}) {
//            Text("Create a new focus")
//          }.buttonStyle(FilledButtonStyle(background: .focusBlack, textColor: .focusWhite))
          FilledButton(title: "Create a new focus", action: (), background: Color.focusBlack)
        }
        .padding(.horizontal, 20)
        Spacer()
      }
      .padding(.bottom, 40)
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

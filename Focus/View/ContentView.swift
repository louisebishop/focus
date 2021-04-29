//
//  ContentView.swift
//  Focus
//
//  Created by Louise Bishop on 16/02/2021.
//

import SwiftUI

struct ContentView: View {
  @EnvironmentObject var navigationHelper: NavigationHelper
  @State private var isAnimating = false
  
  var animation: Animation {
    Animation.linear(duration: 240)
      .repeatForever(autoreverses: false)
  }
  
  var body: some View {
    
    NavigationView {
      VStack {
        GeometryReader { geo in
       
          Image("background-tomato")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .offset(y: -100)
            .frame(width: geo.size.width)
          
          Image("tomato-seeds")
            .resizable()
            .frame(width: 889, height: 1013)
            .rotationEffect(Angle.degrees(isAnimating ? 360 : 0), anchor: UnitPoint(x: 0.5, y: 0.5))
            .animation(animation)
            .offset(x: -410, y: -400)
            .onAppear {
              self.isAnimating = true
            }
          
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

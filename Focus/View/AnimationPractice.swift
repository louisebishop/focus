//
//  AnimationPractice.swift
//  Focus
//
//  Created by Louise Bishop on 27/04/2021.
//

import SwiftUI

struct AnimationPractice: View {
  
  @State private var isAnimating = false
  @State var scale: CGFloat = 1
  
  var animation: Animation {
    Animation.linear(duration: 40)
      .repeatForever(autoreverses: false)
  }
  
    var body: some View {
      NavigationView {
        VStack {
//          GeometryReader { geo in
            ZStack {
              
              Image("tomato-background")
                .resizable()
//               .aspectRatio(contentMode: .fit)
                .frame(width: 900, height: 1000)
//                .offset(x: -40, y: -140)
                .animation(animation)

              Image("tomato-background-two")
                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: geo.size.width)
                .frame(width: 400, height: 400)
//                .offset(x: -80, y: -150)
                .animation(animation)
//
              Image("tomato-seeds")
                .resizable()
                .frame(width: 2000, height: 2000)
                .rotationEffect(Angle.degrees(isAnimating ? 90 : 0), anchor: UnitPoint(x: 0.5, y: 0.5))
                .animation(animation)
                .offset(x: -100.0)
              
//
//              Image("tomato-seeds")
//                .resizable()
//                .aspectRatio(contentMode: .fill)
////                .frame(width: geo.size.width)
//            }
            } .onAppear {
              self.isAnimating = true
//              let baseAnimation = Animation.easeInOut(duration: 1)
//              let repeated = baseAnimation.repeatForever(autoreverses: true)
//              withAnimation(repeated) {
//                scale = 0.5              }
            }
          Text("Focus")
            .modifier(LargeTitle(textColor: Color.focusBlack))
          Text("Do more mindfully")
            .modifier(BodyText(textColor: Color.focusBlack))
            .padding(.top, 3)
            .padding(.bottom, 80)
          Spacer()
          NavigationLink(destination: CreateNewFocusView()) {
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

struct AnimationPractice_Previews: PreviewProvider {
    static var previews: some View {
        AnimationPractice()
    }
}

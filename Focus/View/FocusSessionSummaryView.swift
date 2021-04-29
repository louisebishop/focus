//
//  FocusSessionSummaryView.swift
//  Focus
//
//  Created by Louise Bishop on 16/04/2021.
//

import SwiftUI

struct FocusSessionSummaryView: View {
  @EnvironmentObject var navigationHelper: NavigationHelper
  @ObservedObject var focusSession: FocusSession
  @State private var isAnimating = false
  
  var animation: Animation {
    Animation.linear(duration: 240)
      .repeatForever(autoreverses: false)
  }
  
  
  var body: some View {
 
      ZStack(alignment: .bottom) {

        Image("summary-tomato")
          .resizable()
          .frame(height: 300)
        
        GeometryReader { geo in
          
          Image("tomato-seeds-flipped")
            .resizable()
            .frame(width: 889, height: 1013)
            .rotationEffect(Angle.degrees(isAnimating ? 360 : 0), anchor: UnitPoint(x: 0.5, y: 0.5))
            .animation(animation)
            .offset(x: -90, y: 580)
            .onAppear {
              self.isAnimating = true
            }
        }
      
        VStack {
          FocusTitleView(textColor: Color.focusBlack, image: "focused-tomato")
            .padding(.top, 40)
          VStack(alignment: .leading) {
            Group {
              Text("Congratulations on finishing your Focus session!")
                .fixedSize(horizontal: false, vertical: true)
                .modifier(MediumTitle(textColor: Color.focusBlack))
                .padding(.vertical)
              
              Text("Amount of focused time")
                .modifier(BodyText(textColor: Color.focusBlack))
              Text(focusSession.getTotalTime(timerDuration: focusSession.totalFocusTime))
                .modifier(MediumTitle(textColor: Color.focusBlack))
                .padding(.bottom)
              
              Text("Amount of break time")
                .modifier(BodyText(textColor: Color.focusBlack))
              Text(focusSession.getTotalTime(timerDuration: focusSession.totalBreakTime))
                .modifier(MediumTitle(textColor: Color.focusBlack))
                .padding(.bottom)
              
              Text("Times you got distracted")
                .modifier(BodyText(textColor: Color.focusBlack))
              Text("\(focusSession.distractionTotal)")
                .modifier(MediumTitle(textColor: Color.focusBlack))
            }
            
            Spacer()
            Button(action: {
              navigationHelper.selection = nil
            }) {
              Text("Create a new focus")
            }
            .buttonStyle(FilledButtonStyle(background: .focusBlack, textColor: Color.focusWhite))
            .padding(.bottom, 40)
          }.padding(.top, 40)
        }.padding()
          
        }
    .ignoresSafeArea()
    .navigationBarTitle("", displayMode: .inline)
    .navigationBarBackButtonHidden(true)
    .navigationBarHidden(true)
  }
}


//struct FocusSessionSummaryView_Previews: PreviewProvider {
//  static var previews: some View {
//    FocusSessionSummaryView()
//  }
//}

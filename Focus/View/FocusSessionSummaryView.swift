//
//  FocusSessionSummaryView.swift
//  Focus
//
//  Created by Louise Bishop on 16/04/2021.
//

import SwiftUI

struct FocusSessionSummaryView: View {
  @EnvironmentObject var navigationHelper: NavigationHelper
  //  @ObservedObject var focusSession: FocusSession
  
  var body: some View {
 
      ZStack(alignment: .bottom) {
        Image("summary-tomato")
          .resizable()
          .frame(height: 300)
        VStack {
          Spacer()
          FocusTitleView(textColor: Color.focusBlack, image: "focused-tomato")
//            .frame(width:200, height:100)
            .padding(.top, 40)
          VStack(alignment: .leading) {
            Group {
              Text("Congrats on finishing up your Focus session!")
                .fixedSize(horizontal: false, vertical: true)
                .modifier(MediumTitle(textColor: Color.focusBlack))
                .padding(.vertical)
              
              Text("Amount of focused time")
                .modifier(BodyText(textColor: Color.focusBlack))
              Text("01:20:00")
                .modifier(MediumTitle(textColor: Color.focusBlack))
                .padding(.bottom)
              
              Text("Amount of break time")
                .modifier(BodyText(textColor: Color.focusBlack))
              Text("00:15:00")
                .modifier(MediumTitle(textColor: Color.focusBlack))
                .padding(.bottom)
              
              Text("Times you got distracted")
                .modifier(BodyText(textColor: Color.focusBlack))
              Text("8")
                .modifier(MediumTitle(textColor: Color.focusBlack))
            }
            Spacer()
            Button(action: {
              navigationHelper.selection = nil
            }) {
              Text("Create a new focus")
            }.buttonStyle(FilledButtonStyle(background: .focusBlack, textColor: Color.focusWhite))
          }
          .padding(.horizontal)
          .padding(.vertical, 40)
        }
        
    }
    .ignoresSafeArea()
    .navigationBarTitle("", displayMode: .inline)
    .navigationBarBackButtonHidden(true)
    .navigationBarHidden(true)
  }
}


struct FocusSessionSummaryView_Previews: PreviewProvider {
  static var previews: some View {
    FocusSessionSummaryView()
  }
}

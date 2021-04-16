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
          FocusTitleView()
            .frame(width:200, height:100)
          VStack(alignment: .leading) {
            Group {
              Text("Congrats on finishing up your Focus session!")
                .fixedSize(horizontal: false, vertical: true)
                .modifier(MediumTitle())
                .padding(.vertical)
              
              Text("Amount of focused time")
                .modifier(BodyText())
              Text("01:20:00")
                .modifier(MediumTitle())
                .padding(.bottom)
              
              Text("Amount of break time")
                .modifier(BodyText())
              Text("00:15:00")
                .modifier(MediumTitle())
                .padding(.bottom)
              
              Text("Times you got distracted")      .modifier(BodyText())
              Text("8")
                .modifier(MediumTitle())
            }
            Spacer()
            Button(action: {
              navigationHelper.selection = nil
            }) {
              Text("Create a new focus")
            }.buttonStyle(FilledButtonStyle(background: .focusBlack))
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

//VStack {
//
//  VStack(alignment: .leading) {
//
//    Text("Congrats on finishing up your Focus session!").modifier(MediumTitle())
//
//    Text("Amount of focused time")
//      .modifier(BodyText())
//    Text("01:20:00")
//      .modifier(MediumTitle())
//
//    Text("Amount of break time")
//      .modifier(BodyText())
//    Text("00:15:00")
//      .modifier(MediumTitle())
//
//    Text("Times you got distracted")
//      .modifier(BodyText())
//    Text("8")
//      .modifier(MediumTitle())
//
//    Button(action: {
//      navigationHelper.selection = nil
//    }) {
//      Text("Create a new focus")
//    }.buttonStyle(FilledButtonStyle(background: .focusBlack))
//
//  }.ignoresSafeArea()
//.padding()
//  .navigationBarTitle("")
//  .navigationBarBackButtonHidden(true)
//  .navigationBarHidden(true)
//}

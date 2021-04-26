//
//  ContentView.swift
//  Focus
//
//  Created by Louise Bishop on 16/02/2021.
//

import SwiftUI

struct CreateNewFocusView: View {

  @EnvironmentObject var navigationHelper: NavigationHelper
  @StateObject var focusSession = FocusSession()
  @State private var presentView = false
  @State private var backColour = Color.white

    var body: some View {
        Form {
          
          Section(header: Text("Today, I will complete...")) {
            TextField("", text: $focusSession.focusTaskName)
          }
          
          Section(header: Text("I will spend ___ minutes")) {
            Picker(selection: $focusSession.focusDurationIndex, label: Text("")) {
              ForEach(0 ..< focusSession.focusDurations.count) { index in
                Text("\(focusSession.focusDurations[index]) mins")
              }
            }
          }
          
          Section(header: Text("No. of sessions")) {
            VStack(alignment: .leading){
              Text("\(Int(focusSession.numberOfSessions)) sessions")
                .padding(.vertical)
              Slider(value: $focusSession.numberOfSessions, in: 2...10, step: 1)
                .accentColor(.focusBlack)
                .padding()
            }
          }
          
          Section(header: Text("I will break for ___ minutes")) {
            Picker(selection: $focusSession.breakDurationIndex, label: Text("")) {
              ForEach(0 ..< focusSession.breakDurations.count) {
                Text("\(focusSession.breakDurations[$0]) mins")
              }
            }
          }
          
//          Section(header: Text("I need a longer break (15 mins)...")) {
//            Picker(selection: $focusSession.breakFrequencyIndex, label: Text("")) {
//              ForEach(0 ..< focusSession.longBreakFrequencies.count) {
//                Text("Every \(focusSession.longBreakFrequencies[$0]) sessions")
//              }
//            }
//            .pickerStyle(WheelPickerStyle())
//          }
        
          Section(header: Text("Color scheme")) {
            ColorSwatchView(selection: $focusSession.colorSelection)
          }
          
        }
      NavigationLink(destination: FocusSessionView(focusSession: focusSession), isActive: $presentView) {
        Button(action: {
          focusSession.setFocusTimer()
          presentView = true
        }) {
          Text("Start Session")
        }.buttonStyle(FilledButtonStyle(background: .focusBlack, textColor: Color.focusWhite))
      }.padding(20)
        .modifier(BodyText(textColor: Color.focusBlack))
        .navigationBarTitle(Text("Create new focus"))
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(false)
    
    }
}


//struct CreateNewFocusView_Previews: PreviewProvider {
//    static var previews: some View {
//      CreateNewFocusView()
//        .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro"))
//        .previewDisplayName("iPhone 11 Pro")
//    }
//}

//
//  ContentView.swift
//  Focus
//
//  Created by Louise Bishop on 16/02/2021.
//

import SwiftUI

struct CreateNewFocusView: View {

  @StateObject var focusSession = FocusSession()
  @State var numberOfSessionsIndex: Double = 4

    var body: some View {
        Form {
          Section(header: Text("I will focus on...")) {
            TextField("", text: $focusSession.focusTaskName)
          }
          Section(header: Text("I want to focus for...")) {
            Picker(selection: $focusSession.sessionDurationIndex, label: Text("")) {
              ForEach(0 ..< focusSession.sessionDurations.count) { index in
                Text("\(focusSession.sessionDurations[index]) mins")
              }
            }
          }
          
          Section(header: Text("Over..")) {
            VStack(alignment: .leading){
              Text("\(Int(numberOfSessionsIndex)) sessions")
                .padding(.vertical)
              Slider(value: $numberOfSessionsIndex, in: 2...10, step: 1)
                .accentColor(.focusBlack)
                .padding()
            }
          }
          
          Section(header: Text("I will break for...")) {
            Picker(selection: $focusSession.breakDurationIndex, label: Text("")) {
              ForEach(0 ..< focusSession.breakDurations.count) {
                Text("\(focusSession.breakDurations[$0]) mins")
              }
            }
          }
          
          Section(header: Text("I need a long break (15 mins)...")) {
            Picker(selection: $focusSession.breakFrequencyIndex, label: Text("")) {
              ForEach(0 ..< focusSession.longBreakFrequencies.count) {
                Text("Every \(focusSession.longBreakFrequencies[$0]) sessions")
              }
            }
            .pickerStyle(WheelPickerStyle())
          }

        
          Section(header: Text("Color scheme")) {
            ColorSwatchView(selection: $focusSession.colorSelection)
          }
          NavigationLink(destination: TimerView(focusSession: focusSession, numberOfSessions: $numberOfSessionsIndex)) {
            FilledButton(title: "Start my focus")
          }
        }
        .modifier(BodyText())
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

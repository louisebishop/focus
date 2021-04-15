//
//  ContentView.swift
//  Focus
//
//  Created by Louise Bishop on 16/02/2021.
//

import SwiftUI

struct CreateNewFocusView: View {

//  @EnvironmentObject var nav: OnboardingController
  @StateObject var viewModel = TimerViewModel()
  
//  @State var focusTaskName = ""
  
  @State var numberOfSessionsIndex: Double = 4
//  @State var breakMinutesIndex = 0
//  @State var breakFrequencyIndex = 0
//  @State var selectedColorScheme = ""
//  @State var colorSelection: String = "tomatoRed"

    var body: some View {
        Form {
          Section(header: Text("I will focus on...")) {
            TextField("", text: $viewModel.focusTaskName)
          }
          Section(header: Text("I want to focus for...")) {
            Picker(selection: $viewModel.sessionDurationIndex, label: Text("")) {
              ForEach(0 ..< viewModel.sessionDurations.count) { index in
                Text("\(viewModel.sessionDurations[index]) mins")
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
            Picker(selection: $viewModel.breakDurationIndex, label: Text("")) {
              ForEach(0 ..< viewModel.breakDurations.count) {
                Text("\(viewModel.breakDurations[$0]) mins")
              }
            }
          }
          
          
          Section(header: Text("I need a long break (15 mins)...")) {
            Picker(selection: $viewModel.breakFrequencyIndex, label: Text("")) {
              ForEach(0 ..< viewModel.longBreakFrequencies.count) {
                Text("Every \(viewModel.longBreakFrequencies[$0]) sessions")
              }
            }
            .pickerStyle(WheelPickerStyle())
          }

        
          Section(header: Text("Color scheme")) {
            ColorSwatchView(selection: $viewModel.colorSelection)
          }
//          NavigationLink(destination: TimerView(viewModel: viewModel, focusTaskName: $viewModel.focusTaskName, sessionDuration: $viewModel.sessionDurationIndex, numberOfSessions: $numberOfSessionsIndex, breakDuration: $viewModel.breakDurationIndex, breakFrequency: $viewModel.breakFrequencyIndex, colorSelection: $viewModel.colorSelection), isActive: self.$nav.showTimerView) {
//            FilledButton(title: "Start my focus")
          NavigationLink(destination: TimerView(viewModel: viewModel, numberOfSessions: $numberOfSessionsIndex)) {
            FilledButton(title: "Start my focus")
          }
          
        }
        .modifier(BodyText())
        .navigationBarTitle(Text("Create new focus"))
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(false)
//        .sheet(isPresented: $showTimer) {
//          Timer(focusTaskName: focusTaskName, sessionLength: sessionLengths[sessionLengthIndex], numberOfSessions: numberOfSessions[Int(numberOfSessionsIndex)-1], breakLength: breakLengths[breakLengthIndex], breakFrequency: longBreakFrequencies[breakFrequencyIndex], colorScheme: colorSelection)
//          TimerView(timer: self.timer)
  //      }

      
      
        
    }
}


//struct CreateNewFocusView_Previews: PreviewProvider {
//    static var previews: some View {
//      CreateNewFocusView()
//        .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro"))
//        .previewDisplayName("iPhone 11 Pro")
//    }
//}

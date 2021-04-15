//
//  TimerView.swift
//  Focus
//
//  Created by Louise Bishop on 07/04/2021.
//

import SwiftUI

// @ObservedObject var timer: Timer
//    @State var timeRemaining = 200
//    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

struct TimerView: View {
  
  @ObservedObject var viewModel: TimerViewModel
//  @Binding var focusTaskName: String
  // Bunch of timer related bindings from the view model that this view needs to set itself up
//  @Binding var focusTaskName: String
//  @Binding var sessionDuration: Int
  @Binding var numberOfSessions: Double
//  @Binding var breakDuration: Int
//  @Binding var breakFrequency: Int
//  @Binding var colorSelection: String
  
    var body: some View {
      VStack {
        HStack {
          Image("smallTomato")
            .resizable()
            .frame(width: 25, height: 25, alignment: .center)
          Text("Focus")
            .modifier(BodyText())
        }
        
        Text("Session 1 of \(Int(viewModel.numberOfSessionsIndex))")
          .modifier(BodyText())
          .padding()
        Text("\(viewModel.focusTaskName)")
          .modifier(MediumTitle())
        
        Spacer()
        Text("\(Double(viewModel.sessionDurations[viewModel.sessionDurationIndex]), specifier: "%.2f")")
          .modifier(TimerText())
        
        Spacer()
        UnfilledButton(title: "I got distracted")
        FilledButton(title: "Start")
      }
      .padding()
      .navigationBarBackButtonHidden(true)
      .navigationBarHidden(true)
    }
}

//struct TimerView_Previews: PreviewProvider {
//    static var previews: some View {
//      TimerView(focusTaskName: "")
//    }
//}

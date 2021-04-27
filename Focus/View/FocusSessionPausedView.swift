//
//  TestAnimation.swift
//  Focus
//
//  Created by Louise Bishop on 16/04/2021.
//

import SwiftUI

struct FocusSessionPausedView: View {
  @EnvironmentObject var navigationHelper: NavigationHelper
  @ObservedObject var focusSession: FocusSession
  @State private var presentView = false
  
  var body: some View {
    VStack(spacing: 15) {
      Button(action: {
        focusSession.startTimer()
        focusSession.showPausedState = false
      }) { Text("Resume Focus") }.buttonStyle(FilledButtonStyle(background: focusSession.invertColors(), textColor: focusSession.setPausedStateButtonTextColor()))
    
    Button(action: {
      focusSession.setFocusTimer()
      focusSession.showPausedState = false
    }) { Text("Reset Timer") }.buttonStyle(FilledButtonStyle(background: focusSession.invertColors(), textColor: focusSession.setPausedStateButtonTextColor()))
    
      NavigationLink(destination: FocusSessionSummaryView(focusSession: focusSession), isActive: $presentView) {
        Button(action: {
          presentView = true
        }) {
          Text("End Session")
        }.buttonStyle(FilledButtonStyle(background: focusSession.setEndSessionButtonColor(), textColor: focusSession.setEndSessionButtonTextColor()))
      }
    }.padding(.bottom, 40)
  }
}

struct PausedModifier: ViewModifier {
  @ObservedObject var focusSession: FocusSession
  
  func body(content: Content) -> some View {
    // overlay the following
    content.overlay(
      VStack {               // << holder container needed to make animation work !!
        // if timer is paused
        if focusSession.showPausedState {
          // create a vstack
          VStack {
            // then a hstack
            Spacer()
            FocusSessionPausedView(focusSession: focusSession)
          }
          .padding()
          .transition(AnyTransition.move(edge: .bottom).combined(with: .opacity))
          .onTapGesture {
            withAnimation {
              focusSession.showPausedState = false
            }
          }
//          .gesture(
//            DragGesture()
//              .onChanged { _ in
//                withAnimation {
//                  showPausedState = false
//                }
//              }
//          )
        }
      }
      .animation(.easeInOut)         // << here !!
    )
  }
}


//struct TestBannerModifier: View {
//  @State var showPausedState : Bool
//  var body: some View {
//    VStack {
//      Button("Test") { showPausedState = true }
//      Button("Reset") { showPausedState = false }
//    }
//    .frame(maxWidth: .infinity, maxHeight: .infinity)
//    .modifier(MenuModifier(showPausedState: $showPausedState))
//  }
//}
//
//struct TestAnimation_Previews: PreviewProvider {
//    static var previews: some View {
//      TestBannerModifier(showPausedState: true)
//    }
//}



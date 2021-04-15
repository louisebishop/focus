//
//  TestAnimation.swift
//  Focus
//
//  Created by Louise Bishop on 16/04/2021.
//

import SwiftUI

struct BannerModifier: ViewModifier {
  @Binding var showPausedState: Bool
  
  func body(content: Content) -> some View {
    // overlay the following
    content.overlay(
      VStack {               // << holder container !!
        // if timer is paused
        if showPausedState {
          // create a vstack
          VStack {
            // then a hstack
            Spacer()
            HStack(alignment: .firstTextBaseline) {
              Image(systemName: "exclamationmark.triangle.fill")
              VStack(alignment: .leading) {
                Text("Hello")
                  .font(.headline)
                
                  Text("This is some text")
                  .font(.footnote)
              }
            }
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity)
            .foregroundColor(.white)
            .background(Color.red)
            .cornerRadius(10)
            .shadow(radius: 10)
           
            HStack(alignment: .firstTextBaseline) {
              Image(systemName: "exclamationmark.triangle.fill")
              VStack(alignment: .leading) {
                Text("Hello")
                  .font(.headline)
                
                Text("This is some text")
                  .font(.footnote)
              }
            }
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity)
            .foregroundColor(.white)
            .background(Color.red)
            .cornerRadius(10)
            .shadow(radius: 10)
            
          }
          .padding()
          .transition(AnyTransition.move(edge: .bottom).combined(with: .opacity))
          .onTapGesture {
            withAnimation {
              showPausedState = false
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

struct TestBannerModifier: View {
  @State var showPausedState : Bool
  var body: some View {
    VStack {
      Button("Test") { showPausedState = true }
      Button("Reset") { showPausedState = false }
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .modifier(BannerModifier(showPausedState: $showPausedState))
  }
}

struct TestAnimation_Previews: PreviewProvider {
    static var previews: some View {
      TestBannerModifier(showPausedState: true)
    }
}

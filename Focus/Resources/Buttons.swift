//
//  Buttons.swift
//  Focus
//
//  Created by Louise Bishop on 26/03/2021.
//

import Foundation
import SwiftUI

struct FilledButtonStyle: ButtonStyle {
  let background : Color
  let textColor : Color
  func makeBody(configuration: Self.Configuration) -> some View {
    configuration.label
      .modifier(BodyText(textColor: textColor))
      .padding()
      .frame(maxWidth: .infinity)
      .background(background)
      .cornerRadius(8)
      .shadow(color: Color.shadowGrey, radius: 4, x: 0.0, y: 4)
      .shadow(color: Color.shadowGrey, radius: 4, x: 0.0, y: 4)
  }
}

struct UnfilledButtonStyle: ButtonStyle {
  let background : Color
  let textColor : Color
  func makeBody(configuration: Self.Configuration) -> some View {
    configuration.label
      .modifier(BodyText(textColor: textColor))
      .frame(maxWidth: .infinity)
      .padding()
      .background(background.opacity(0.0))
      .cornerRadius(8)
      .overlay(
        RoundedRectangle(cornerRadius: 8)
          .stroke(textColor, lineWidth: 3)
      )
      .shadow(color: Color.shadowGrey, radius: 4, x: 0.0, y: 4)
      .shadow(color: Color.shadowGrey, radius: 4, x: 0.0, y: 4)
  }
}

struct InvertedUnfilledButtonStyle: ButtonStyle {
  func makeBody(configuration: Self.Configuration) -> some View {
    configuration.label
      .modifier(BodyText(textColor: .focusWhite))
      .frame(maxWidth: .infinity)
      .padding()
      .background(Color.focusBlack)
      .cornerRadius(8)
      .overlay(
        RoundedRectangle(cornerRadius: 8)
          .stroke(Color.focusWhite, lineWidth: 3)
      )
      .shadow(color: Color.shadowGrey, radius: 4, x: 0.0, y: 4)
      .shadow(color: Color.shadowGrey, radius: 4, x: 0.0, y: 4)
  }
}

struct FilledButton: View {
    let title: String
    let action: ()
    let background: Color

    var body: some View {
        Text(title)
          .modifier(BodyText(textColor: .focusWhite))
            .frame(maxWidth: .infinity)
            .padding()
            .background(background)
            .cornerRadius(8)
            .shadow(color: Color.shadowGrey, radius: 4, x: 0.0, y: 4)
            .shadow(color: Color.shadowGrey, radius: 4, x: 0.0, y: 4)
    }
}
//
//struct UnfilledButton: View {
//  let title: String
//  
//  var body: some View {
//    Text(title)
//      .foregroundColor(.focusBlack)
//      .frame(maxWidth: .infinity)
//      .padding()
//      .background(Color.focusWhite)
//      .cornerRadius(8)
//      .overlay(
//        RoundedRectangle(cornerRadius: 8)
//          .stroke(Color.focusBlack, lineWidth: 3)
//      )
//      .shadow(color: Color.shadowGrey, radius: 4, x: 0.0, y: 4)
//      .shadow(color: Color.shadowGrey, radius: 4, x: 0.0, y: 4)
//  }
//}


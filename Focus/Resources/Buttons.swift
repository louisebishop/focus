//
//  Buttons.swift
//  Focus
//
//  Created by Louise Bishop on 26/03/2021.
//

import Foundation
import SwiftUI

struct FilledButton: View {
    let title: String

    var body: some View {
        Text(title)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.focusBlack)
            .cornerRadius(8)
            .shadow(color: Color.shadowGrey, radius: 4, x: 0.0, y: 4)
            .shadow(color: Color.shadowGrey, radius: 4, x: 0.0, y: 4)
    }
}

struct UnfilledButton: View {
  let title: String
  
  var body: some View {
    Text(title)
      .foregroundColor(.focusBlack)
      .frame(maxWidth: .infinity)
      .padding()
      .background(Color.focusWhite)
      .cornerRadius(8)
      .overlay(
        RoundedRectangle(cornerRadius: 8)
          .stroke(Color.focusBlack, lineWidth: 3)
      )
      .shadow(color: Color.shadowGrey, radius: 4, x: 0.0, y: 4)
      .shadow(color: Color.shadowGrey, radius: 4, x: 0.0, y: 4)
  }
}


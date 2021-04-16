//
//  FontExtension.swift
//  Focus
//
//  Created by Louise Bishop on 26/03/2021.
//

import Foundation
import SwiftUI

struct LargeTitle: ViewModifier {
  let textColor : Color
  func body(content: Content) -> some View {
    content
      .font(.custom("Archivo-Regular", size: 72, relativeTo: .largeTitle))
      .foregroundColor(textColor)
  }
}

struct MediumTitle: ViewModifier {
  let textColor : Color
  func body(content: Content) -> some View {
    content
      .font(.custom("Archivo-SemiBold", size: 34, relativeTo: .largeTitle))
      .foregroundColor(textColor)
  }
}

struct BodyText: ViewModifier {
  let textColor : Color
  func body(content: Content) -> some View {
    content
      .font(.custom("Archivo-Regular", size: 18, relativeTo: .body))
      .foregroundColor(textColor)
  }
}

struct TimerText: ViewModifier {
  let textColor : Color
  func body(content: Content) -> some View {
    content
      .font(.custom("ArchivoNarrow-Bold", size: 140))
      .foregroundColor(textColor)
  }
}


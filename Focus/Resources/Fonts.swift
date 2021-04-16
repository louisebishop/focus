//
//  FontExtension.swift
//  Focus
//
//  Created by Louise Bishop on 26/03/2021.
//

import Foundation
import SwiftUI

struct LargeTitle: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.custom("Archivo-Regular", size: 72, relativeTo: .largeTitle))
      .foregroundColor(.focusBlack)
  }
}

struct MediumTitle: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.custom("Archivo-SemiBold", size: 34, relativeTo: .largeTitle))
      .foregroundColor(.focusBlack)
  }
}

struct BodyText: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.custom("Archivo-Regular", size: 18, relativeTo: .body))
      .foregroundColor(.focusBlack)
  }
}

struct TimerText: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.custom("ArchivoNarrow-Bold", size: 140))
      .foregroundColor(.focusBlack)
  }
}


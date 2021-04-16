//
//  FocusTitleView.swift
//  Focus
//
//  Created by Louise Bishop on 16/04/2021.
//

import SwiftUI

struct FocusTitleView: View {
    var body: some View {
      HStack {
        Image("smallTomato")
          .resizable()
          .frame(width: 25, height: 25, alignment: .center)
        Text("Focus")
          .modifier(BodyText())
      }
    }
}

struct FocusTitleView_Previews: PreviewProvider {
    static var previews: some View {
        FocusTitleView()
    }
}

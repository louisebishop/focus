//
//  FocusTitleView.swift
//  Focus
//
//  Created by Louise Bishop on 16/04/2021.
//

import SwiftUI

struct FocusTitleView: View {
  let textColor : Color
  let image : String
    var body: some View {
      HStack {
        Image(image)
          .resizable()
          .aspectRatio(contentMode: .fill)
          .frame(width: 50, height: 50, alignment: .center)
          .offset(x: 10)
        Text("Focus")
          .modifier(TitleText(textColor: textColor))
      }.offset(x: -10)
    }
}

//struct FocusTitleView_Previews: PreviewProvider {
//    static var previews: some View {
//        FocusTitleView()
//    }
//}

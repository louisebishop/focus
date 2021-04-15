//
//  ColorSwatchView.swift
//  Focus
//
//  Created by Louise Bishop on 07/04/2021.
//

import SwiftUI

struct ColorSwatchView: View {
  
  @Binding var selection: String
  
  var body: some View {
    
    let swatches = [
      "FocusWhite",
      "TomatoRed",
      "TomatoHighlight",
      "TomatoYellow",
      "FocusBlack"
    ]
    
    let columns = [
      GridItem(.adaptive(minimum: 30))
    ]
    
    LazyVGrid(columns: columns, spacing: 10) {
      ForEach(swatches, id: \.self){ swatch in
        ZStack {
          Circle()
            .strokeBorder(Color.black,lineWidth: 0.1)
            .background(Circle().foregroundColor(Color(swatch)))
            .frame(width: 30, height: 30)
            .onTapGesture(perform: {
              selection = swatch
            })
            .padding(10)
          
          if selection == swatch {
            Circle()
              .stroke(Color.black, lineWidth: 1.5)
              .frame(width: 30, height: 30)
            Circle()
              .stroke(Color.black, lineWidth: 0.5)
              .frame(width: 25, height: 25)
          }
        }
      }
    }
    .padding(10)
  }
}

struct ColorSwatchView_Previews: PreviewProvider {
    static var previews: some View {
      ColorSwatchView(selection: .constant("tomatoRed"))
    }
}

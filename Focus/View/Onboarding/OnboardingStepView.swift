//
//  OnboardingStepView.swift
//  Focus
//
//  Created by Louise Bishop on 24/03/2021.
//

import SwiftUI

struct OnboardingStepView: View {
  
    var data: OnboardingDataModel
    var body: some View {
      
      VStack {
        
        VStack {
          Image(data.image)
            .padding(.vertical, 20)
            .frame(width: 300, height: 300, alignment: .center)
        }
      
        VStack(alignment: .leading) {
              Text(data.heading)
                .font(Font.custom("Archivo-SemiBold", size: 34, relativeTo: .largeTitle))
                  .padding(.bottom, 20)
              Text(data.text)
                .font(Font.custom("Archivo-SemiBold", size: 18, relativeTo: .body))
                
        }
        Spacer()
      }.padding(.top, 20)
      
      
    }
}

struct OnboardingStepView_Previews: PreviewProvider {
    static var data = OnboardingDataModel.data[1]
    static var previews: some View {
      OnboardingStepView(data: data)
            .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
            .previewDisplayName("iPhone 12")

    }
}

//
//  Onboarding.swift
//  Focus
//
//  Created by Louise Bishop on 24/03/2021.
//

import SwiftUI

struct OnboardingView: View {
  // MARK: - Private Properties
  @EnvironmentObject var nav: OnboardingController
  var data = OnboardingDataModel.data
  
  init() {
    UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(Color.cherryRed)
    UIPageControl.appearance().pageIndicatorTintColor = UIColor(Color.tomatoRed).withAlphaComponent(0.3)
  }
  
  // MARK: - Body
  var body: some View {
        ZStack(alignment: .bottom) {
          TabView(selection: self.$nav.onboardingTabSelection) {
            ForEach(0..<data.count, id: \.self) { index in
              OnboardingStepView(data: data[index])
                .tag(index)
            }
        }
            .padding(.horizontal, 20)
            .padding(.bottom, 30)
            .background(Color.onboardingBackgroundColor)
            .ignoresSafeArea()
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
          
          
          HStack {
            Button("Skip") {
              nav.currentPage = .home
            }.foregroundColor(.focusBlack)
            Spacer()
              
            Button(action: {
              withAnimation() {
                if nav.onboardingTabSelection < 2 {
                  nav.onboardingTabSelection += 1
                  print(nav.onboardingTabSelection)
                  print(data.count)
                } else {
                  nav.currentPage = .home
                }
              }
            }, label: {
              Text("Next")
            })
            .foregroundColor(.focusBlack)
            
          }
          .modifier(BodyText())
          .padding(.horizontal, 20)
          .padding(.bottom, 13)
        }
      }
    }
  
  
  
  struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
      Group {
        OnboardingView()
          .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro"))
          .previewDisplayName("iPhone 11 Pro")
        //        Onboarding()
        //          .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro"))
        //          .previewDisplayName("iPhone 11 Pro")
      }
     
    }
    
  }

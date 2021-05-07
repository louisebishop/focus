//
//  OnboardingDataModel.swift
//  Focus
//
//  Created by Louise Bishop on 24/03/2021.
//

import Foundation
import SwiftUI

struct OnboardingStep {
    var image: String
    var heading: String
    var text: String
}

extension OnboardingStep {
    static var data: [OnboardingStep] = [
        OnboardingStep(image: "focused-tomato", heading: "Focus is a time management superpower.", text: """
            Drawing inspiration from the scientifically proven Pomodoro Technique, Focus helps you to stay hyper-focused, avoid mental overload, and become more productive.
            Sounds ideal, right?

            Using a timer, you’ll set intervals to focus on a task and take short breaks in-between.
            """),
        OnboardingStep(image: "flexible-tomato", heading: "We like to keep things flexible.", text: """
            You can adapt the number and length of sessions, and give yourself a longer break when you need it.

            Taking time out between your focus intervals is essential for a happy, healthy mind. Burnout, be gone!
            """),
        OnboardingStep(image: "distracted-tomato", heading: "Spoiler alert: you’ll get distracted.", text: """
            It happens. You’re human.

            That’s why we made a handy tracking tool. Simply click ‘I got distracted’ when you catch your mind wandering.

            You’ll learn about your habits which will help you to become less distracted – and more focused!
            """)
    ]
}

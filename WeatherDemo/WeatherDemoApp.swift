//
//  WeatherDemoApp.swift
//  WeatherDemo
//
//  Created by Steve Hobbs on 21/10/2022.
//

import SwiftUI

@main
struct WeatherDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(days: [
                Day(name: "TUE", imageName: "cloud.sun.fill", temperature: 16),
                Day(name: "WED", imageName: "sun.max.fill", temperature: 18),
                Day(name: "THU", imageName: "sun.max.fill", temperature: 19),
                Day(name: "FRI", imageName: "cloud.sun.fill", temperature: 18),
                Day(name: "SAT", imageName: "cloud.sun.fill", temperature: 17)
            ])
        }
    }
}

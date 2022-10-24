//
//  ContentView.swift
//  WeatherDemo
//
//  Created by Steve Hobbs on 21/10/2022.
//

import SwiftUI

class Day {
    var name: String
    var imageName: String
    var temperature: Int
    
    init(name: String, imageName: String, temperature: Int) {
        self.name = name
        self.imageName = imageName
        self.temperature = temperature
    }
}

struct ContentView: View {
    @State private var isNight = false
    @Environment(\.verticalSizeClass) var heightSizeClass
    @Environment(\.horizontalSizeClass) var widthSizeClass
    var days: [Day]
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack(spacing: 0) {
                Text("Whitburn, UK")
                    .foregroundColor(.white)
                    .font(.system(size: 32))
                    .padding(.top, heightSizeClass == .regular ? 10 : 30)
            
                AdaptiveStack {
                    Spacer()
                
                    VStack {
                        MainWeatherView(imageName: "cloud.sun.fill", temperature: 17)
                    }
                    
                    Spacer()
                    
                    VStack {
                        if (heightSizeClass == .regular) {
                            Spacer()
                        }
                        
                        HStack (spacing: widthSizeClass == .regular ? 40 : 10) {
                            ForEach(days, id: \.name) { day in
                                DayWeatherView(day: day)
                            }
                            
                        }
                        
                        if (heightSizeClass == .regular) {
                            Spacer()
                        }
                        
                        Button {
                            isNight.toggle()
                        } label: {
                            BigButton(text: isNight ? "Change to day" : "Change to night")
                        }
                        
                    }
                    
                    Spacer()
                }
                                
            }
            .preferredColorScheme(isNight ? .dark : .light)
        }
    }
}

struct AdaptiveStack<Content: View>: View {
    @Environment(\.verticalSizeClass) var heightSizeClass
    let content: () -> Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content;
    }
    
    var body: some View {
        if (heightSizeClass == .regular) {
            VStack(content: self.content)
        }
        else {
            HStack(content: self.content)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let days = [
            Day(name: "TUE", imageName: "cloud.sun.fill", temperature: 16),
            Day(name: "WED", imageName: "sun.max.fill", temperature: 18),
            Day(name: "THU", imageName: "sun.max.fill", temperature: 19),
            Day(name: "FRI", imageName: "cloud.sun.fill", temperature: 18),
            Day(name: "SAT", imageName: "cloud.sun.fill", temperature: 17)
        ]
        
        ContentView(days: days)
            .previewDisplayName("iPhone")
        
        ContentView(days: days)
            .previewInterfaceOrientation(.landscapeLeft)
            .previewDisplayName("iPhone (landscape)")
        
        ContentView(days: days)
            .previewDevice("iPad (9th generation)")
            .previewDisplayName("iPad")
    }
}

struct DayWeatherView: View {
    var day: Day
    @Environment(\.horizontalSizeClass) var widthSizeClass
    
    var body: some View {
        VStack(spacing: widthSizeClass == .regular ? 10 : 3) {
            Text(day.name)
                .foregroundColor(.white)
                .font(.system(size: widthSizeClass == .regular ? 38 : 18))
                .padding(.bottom)
            Image(systemName: day.imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: widthSizeClass == .regular ? 84 : 54, height: widthSizeClass == .regular ? 95 : 45)
            Text("\(day.temperature)°")
                .foregroundColor(.white)
                .font(.system(size: widthSizeClass == .regular ? 48 : 32))
                .padding(.top)
            
        }
    }
}

struct BackgroundView: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [
            Color("GradientTop"),
            Color("GradientBottom")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct MainWeatherView: View {
    var imageName: String
    var temperature: Int
    @Environment(\.horizontalSizeClass) var widthSizeClass
    @Environment(\.verticalSizeClass) var heightSizeClass
    
    var body: some View {
        VStack(spacing: 8) {
            Spacer()
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: widthSizeClass == .regular ? 250 : 180, height: 180)
            
            if (heightSizeClass == .regular) {
                Spacer()
            }
            
            Text("\(temperature)°")
                .foregroundColor(.white)
                .font(.system(size: widthSizeClass == .regular ? 84 : 64, weight: .light))
        }
        .padding(.bottom, 40)
    }
}

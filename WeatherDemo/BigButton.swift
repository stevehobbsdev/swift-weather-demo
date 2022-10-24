//
//  BigButton.swift
//  WeatherDemo
//
//  Created by Steve Hobbs on 21/10/2022.
//

import SwiftUI

struct BigButton: View {
    var text = "Click me"
    var backgroundColor = Color("ButtonBackground")
    var textColor = Color.blue
    
    var body: some View {
        Text(text)
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .cornerRadius(10)
            .font(.system(size: 16, weight: .bold))
    }
}

//
//  PrimaryButton.swift
//  DesignCombine
//
//  Created by SEAN BLAKE on 2/15/22.
//

import SwiftUI

struct PrimaryButton: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    var text: String = "Contact Support"

    var body: some View {
        if colorScheme == .dark {
            darkModeButton
        } else {
            lightModeButton
        }
    }

    var lightModeButton: some View {
        VStack {
            Text(text)
                .font(.headline)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 50)
        .background(
            LinearGradient(gradient: Gradient(colors: [Color(red: 0.262745098, green: 0.862745098, blue: 0.858823529), Color(red: 0.5647058824, green: 0.462745098, blue: 0.9058823529)]), startPoint: .top, endPoint: .bottom)
        )
        .cornerRadius(16)
        .foregroundColor(.white)
    }

    // dark mode button
    var darkModeButton: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .frame(height: 50)
                .angularGradientGlow(
                    colors: [
                        Color(red: 0.3843137255, green: 0.5176470588, blue: 1),
                        Color(red: 1, green: 0.4470588235, blue: 0.7137254902),
                        Color(red: 0.8509803922, green: 0.6862745098, blue: 0.8509803922),
                        Color(red: 0.5921568627, green: 0.8509803922, blue: 0.8823529412),
                        Color(red: 0.3843137255, green: 0.5176470588, blue: 1)
                    ]
                )
                .blur(radius: 8)

            Text(text)
                .linearGradientBackground(
                    colors: [
                        Color(red: 0.6196078431, green: 0.6784313725, blue: 1),
                        Color(red: 1, green: 0.5607843137, blue: 0.9803921569)
                    ]
                )
                .font(.headline)
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background(
                    Color(red: 0.1019607843, green: 0.0705882359, blue: 0.2431372549).opacity(0.9)
                )
                .cornerRadius(16)
                .overlay(
                    RoundedRectangle(cornerRadius: 16).stroke(Color.white, lineWidth: 1).blendMode(.overlay)
                )
        }
        .frame(height: 50)
    }

}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton()
            .preferredColorScheme(.dark)

    }
}

//
//  Extensions.swift
//  DesignCombine
//
//  Created by SEAN BLAKE on 2/15/22.
//

import SwiftUI

extension View {
    // angular gradient
    func angularGradientGlow(colors: [Color]) -> some View {
        self.overlay(AngularGradient(gradient: Gradient(colors: colors), center: .center, angle: .degrees(0.0)))
            .mask(self)
    }

    // linear gradient
    func linearGradientBackground(colors: [Color]) -> some View {
        self.overlay(LinearGradient(gradient: .init(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing))
            .mask(self)
    }

    // blur background
    func blurBackground() -> some View {
        self
            .padding(16)
            .background(Color("Background 1"))
            .background( 
                VisualEffectBlur(blurStyle: .systemUltraThinMaterialDark)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .stroke(Color(red: 1.0, green: 1.0, blue: 1.0), lineWidth:1)
                    .blendMode(.overlay)
            )
            .mask(
                RoundedRectangle(cornerRadius: 20, style: .continuous)
            )
    }

    // profile picture
    var profilePicture: some View {
        VStack {
            Image("Profile")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 66, height: 66, alignment: .center)
                .cornerRadius(50)
        }
        .overlay(
            Circle()
                .stroke(style: StrokeStyle(lineWidth: 2))
                .foregroundColor(Color(red: 1.0, green: 1.0, blue: 1.0))
                .opacity(0.7)
        )
    }

    var glowIcon: some View {
        ZStack {
            AngularGradient(
                gradient: Gradient(
                    colors: [
                        Color(red: 0.3960784314, green: 0.524901961, blue: 1),
                        Color(red: 1, green: 0.2509803922, blue: 0.3137254902),
                        Color(red: 0.4274509804, green: 1, blue: 0.7254901961),
                        Color(red: 0.4274509804, green: 1, blue: 0.7254901961)
                    ]
                ), center: .center, startAngle: .init(degrees: -190), endAngle: .degrees(155))
                .blur(radius: 8)
                .shadow(radius: 30)
                .frame(width: 36, height: 36)

            Image(systemName: "square.stack.fill")
                .linearGradientBackground(colors: [
                    Color(red: 0.6196078431, green: 0.6784313725, blue: 1),
                    Color(red: 1, green: 0.5607843137, blue: 0.9803921569)
                ])
                .frame(width: 36.0, height: 36.0)
                .background(Color(red: 0.1019607843, green: 0.07058823529, blue: 0.2431372549).opacity(0.8))
                .mask(RoundedRectangle(cornerRadius: 12, style: .continuous))
                .overlay(RoundedRectangle(cornerRadius: 12, style: .continuous).stroke(Color.white.opacity(0.7), lineWidth: 1).blendMode(.overlay))
        }
    }
}

// date formatter for humans to read
extension Date {
    func formatDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        dateFormatter.setLocalizedDateFormatFromTemplate("MMMM d, yyyy")
        return dateFormatter.string(from: self)
    }
}

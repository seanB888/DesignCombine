//
//  GradientIcon.swift
//  DesignCombine
//
//  Created by SEAN BLAKE on 2/13/22.
//

import SwiftUI

struct GradientIcon: View {
    // Variable for the icon
    var icon: String = "questionmark"

    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color(red: 0.6196078431, green: 0.6784313725, blue: 1), Color(red: 1, green: 0.5607843137, blue: 0.9803921569)]), startPoint: .topLeading, endPoint: .bottomTrailing)
            // masked icon
            .mask(Image(systemName: icon).font(.system(size: 17)))
            .background(LinearGradient(gradient: Gradient(colors: [Color(red: 0.1019607843, green: 0.07058823529, blue: 0.2431372549)]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .frame(width: 36, height: 36)
            .mask(RoundedRectangle(cornerRadius: 12, style: .continuous))
            .overlay(RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .stroke(lineWidth: 1)
                        .foregroundColor(Color(red: 1.0, green:1.0, blue: 1.0)).opacity(1)
                        .blendMode(.overlay)
            )

    }
}

struct GradientIcon_Previews: PreviewProvider {
    static var previews: some View {
        GradientIcon()
    }
}

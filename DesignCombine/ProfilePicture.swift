//
//  ProfilePicture.swift
//  DesignCombine
//
//  Created by SEAN BLAKE on 2/15/22.
//

import SwiftUI

struct ProfilePicture: View {
    var body: some View {
        ZStack {
            Image(systemName: "circle.fill")
                .resizable()
                .font(.system(size: 66))
                .angularGradientGlow(
                    colors:
                        [
                        Color(red: 0.2274509804, green: 0.4, blue: 1),
                        Color(red: 0.2156862745, green: 1, blue: 0.6235294118),
                        Color(red: 1, green: 0.9176470588, blue: 0.1960784314),
                        Color(red: 1, green: 0.2039215686, blue: 0.2745098039)
                    ]
                )
                .frame(width: 66, height: 66)
                .blur(radius: 10)
        }
    }
}

struct ProfilePicture_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePicture()
    }
}

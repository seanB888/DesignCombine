//
//  ProfileRow.swift
//  DesignCombine
//
//  Created by SEAN BLAKE on 2/15/22.
//

import SwiftUI

struct ProfileRow: View {
    var body: some View {
        HStack(alignment: .center, spacing: 16.0) {
            profilePicture

            VStack(alignment: .leading, spacing: 2.0) {
                Text("Stephanie Blake")
                    .font(.title2)
                    .fontWeight(.bold)
                    .lineLimit(1)
                    .foregroundColor(.white)

                Text("View Certificates")
                    .font(.footnote)
                    .foregroundColor(Color.white.opacity(0.7))
            }

            Spacer()

            glowIcon
        }
        .blurBackground()
    }
}

struct ProfileRow_Previews: PreviewProvider {
    static var previews: some View {
        ProfileRow()
    }
}

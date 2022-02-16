//
//  MenuRow.swift
//  DesignCombine
//
//  Created by SEAN BLAKE on 2/13/22.
//

import SwiftUI

struct MenuRow: View {
    // variables
    var title: String = "FAQ / Contact"
    var leftIcon: String = "questionmark"
    var rightIcon: String = "chevron.right"

    var body: some View {
        HStack(spacing: 12.0) {
            // Image(systemName: leftIcon)
            GradientIcon(icon: leftIcon)

            Text(title)
                .font(.subheadline)
                .fontWeight(.semibold)

            Spacer()

            Image(systemName: rightIcon)
                .font(.system(size: 15, weight: .semibold))
                .opacity(0.3)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        //.blurBackground()
    }
}

struct MenuRow_Previews: PreviewProvider {
    static var previews: some View {
        MenuRow()
    }
}

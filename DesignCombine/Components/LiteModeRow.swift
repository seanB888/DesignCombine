//
//  LightModeRow.swift
//  DesignCombine
//
//  Created by SEAN BLAKE on 2/18/22.
//

import SwiftUI

struct LiteModeRow: View {
    @State private var isLiteMode: Bool = false

    var body: some View {
        Toggle(isOn: $isLiteMode, label: {
            HStack(spacing: 20) {
                GradientIcon(icon: "speedometer")

                VStack(alignment: .leading) {
                    Text("Lite Mode")
                        .font(.subheadline)
                        .fontWeight(.semibold)

                    Text("Better performance. Recommended\nfor iPhone X and older.")
                        .font(.caption2)
                        .opacity(0.2)
                }
            }
        })
            .toggleStyle(SwitchToggleStyle(tint: Color(red: 138, green: 57, blue: 225)))
    }
}

struct LightModeRow_Previews: PreviewProvider {
    static var previews: some View {
        LiteModeRow()
    }
}

//
//  NotificationsView.swift
//  DesignCombine
//
//  Created by SEAN BLAKE on 2/18/22.
//

import SwiftUI

struct NotificationsView: View {
    @State private var subscribed: Bool = false

    var body: some View {
        Toggle(isOn: $subscribed, label: {
            HStack(spacing: 12) {
                GradientIcon(icon: "bell.fill")

                VStack(alignment: .leading) {
                    Text("Notify me of new Content")
                        .font(.subheadline)
                        .fontWeight(.semibold)

                    Text("Max once a week")
                        .font(.caption2)
                        .opacity(0.2)
                }
            }
        })
        .toggleStyle(SwitchToggleStyle(tint: Color.white))
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}

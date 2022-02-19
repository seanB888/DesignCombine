//
//  NotificationsView.swift
//  DesignCombine
//
//  Created by SEAN BLAKE on 2/18/22.
//

import SwiftUI

struct NotificationsRow: View {
    @StateObject var notificationVW = NotificationViewModel()
    @Environment(\.scenePhase) private var scenePhase

    var body: some View {
        Group {
            if notificationVW.permission == .authorized {
                Toggle(isOn: $notificationVW.subscribedToAllNotifications, label: {
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
            } else {
                VStack(alignment: .leading, spacing: 12) {
                    Text("Notifications are disabled")
                        .font(.subheadline)
                        .fontWeight(.bold)

                    Text("We can't notify you when new content is available.")
                        .font(.caption2)
                        .opacity(0.7)

                    Link(destination: URL(string: UIApplication.openSettingsURLString), label: {
                        Text("Open Settings")
                            .font(.headline)
                            .fontWeight(.semibold)
                    })
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .onAppear {
            notificationVW.getNotificationSettings()
        }
        .onChange(of: ScenePhase, perform: { newPhase in
            if newPhase == .active {
                notificationVW.getNotificationSettings()
            }
        })
    }
}

struct NotificationsRow_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsRow()
    }
}

//
//  ContentView.swift
//  DesignCombine
//
//  Created by SEAN BLAKE on 2/12/22.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @State private var contentOffset = CGFloat(0)
    @State private var showCertificates: Bool = false

    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                TrackableScrollView(offsetChanged: { offsetPoint in
                    contentOffset = offsetPoint.y
                }) {
                    content
                        .sheet(isPresented: $showCertificates, content: {
                            CertificatesView()
                        })
                }

                // Creats a blur effect on the status bar when scrolled 16
                // pixels to the bottom
                VisualEffectBlur(blurStyle: .systemMaterial)
                    .opacity(contentOffset < -16 ? 1 : 0)
                    .animation(.easeIn)
                    .ignoresSafeArea()
                    .frame(height: 0)
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .background(AccountBackground())
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
         .accentColor(colorScheme == .dark ? .white : Color(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694))
    }

    // menu view
    var content: some View {
        VStack {
            // profile Row
            ProfileRow()
                .onTapGesture {
                    showCertificates.toggle()
                }

            // notification Row
            VStack {
                NotificationsRow()

                divider

                LiteModeRow()
            }
            .blurBackground()
            .padding(.top, 20)

            // menu Row
            VStack {
                NavigationLink(destination: FAQView()) {
                    MenuRow()
                }
                divider
                NavigationLink(destination: PackagesView()) {
                    MenuRow(title: "SwiftUI Package", leftIcon: "square.stack.3d.up.fill")
                }
                divider
                Link(destination: URL(string: "https://www.youtube.com/channel/UCTIhf0opxukTIRkbXJ3kN-g")!, label: {
                    MenuRow(title: "Youtube Channel", leftIcon: "play.rectangle.fill", rightIcon: "link")
                })
            }
            .padding(16)
            .background(Color("Background 1"))
            .background(VisualEffectBlur(blurStyle: .systemUltraThinMaterialDark))
            .overlay(RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .stroke(Color(red: 1.0, green: 1.0, blue: 1.0), lineWidth: 1).blendMode(.overlay))
            .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .padding(.top, 20)

            Text("Version 1.00")
                .foregroundColor(Color.white.opacity(0.7))
                .padding(.top, 20)
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
                .font(.footnote)
        }
        .foregroundColor(.white)
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .padding(.bottom, 10)
    }

    // divider
    var divider: some View {
        Divider().background(Color.white).blendMode(.overlay)
    }
}

private struct ScrollOffsetPrefernceKey: PreferenceKey {
    static var defaultValue: CGPoint = .zero

    static func reduce(value: inout CGPoint, nextValue: () -> CGPoint) {}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

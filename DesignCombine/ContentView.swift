//
//  ContentView.swift
//  DesignCombine
//
//  Created by SEAN BLAKE on 2/12/22.
//

import SwiftUI

struct ContentView: View {
    @State private var contentOffset = CGFloat(0)

    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                TrackableScrollView(offsetChanged: { offsetPoint in
                    contentOffset = offsetPoint.y
                }) {
                    content
                }

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
        // .accentColor(colorScheme == .dark ? .white : Color(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694))
    }

    // menu view
    var content: some View {
        VStack {
            // profile Row
            ProfileRow()

            // menu Row
            VStack {
                NavigationLink(destination: FAQView()) {
                    MenuRow()
                }
                divider
                NavigationLink(destination: PackagesView()) {
                    MenuRow(title: "Swift Package", leftIcon: "square.stack.3d.up.fill")
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

// TrackableScrollView
struct TrackableScrollView<Content: View>: View {

    let axes: Axis.Set
    let offsetChangeed: (CGPoint) -> Void
    let content: Content

    init(
        axes: Axis.Set = .vertical,
        offsetChanged: @escaping (CGPoint) -> Void = { _ in },
        @ViewBuilder content: () -> Content
    ) {
        self.axes = axes
        self.offsetChangeed = offsetChanged
        self.content = content()
    }

    var body: some View {
        SwiftUI.ScrollView(axes) {
            GeometryReader { geometry in
                Color.clear.preference(
                    key: ScrollOffsetPrefernceKey.self,
                    value: geometry.frame(in: .named("scrollView")).origin
                )
            }
            .frame(width: 0, height: 0)

            content
        }
        .coordinateSpace(name: "scrollView")
        .onPreferenceChange(ScrollOffsetPrefernceKey.self, perform: offsetChangeed
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

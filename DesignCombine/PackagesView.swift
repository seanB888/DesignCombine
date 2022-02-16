//
//  PackagesView.swift
//  DesignCombine
//
//  Created by SEAN BLAKE on 2/14/22.
//

import SwiftUI

struct PackagesView: View {
    @State private var contentOffset = CGFloat(0)

    var body: some View {
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
        .navigationTitle("Swift UI Package").font(.largeTitle)
        .background(Color("Background 2").edgesIgnoringSafeArea(.all))
    }

    // content variable
    var content: some View {
        VStack(alignment: .leading, spacing: 16.0) {
            Text("This App was made using 100% Swift UI. This was re-created by me.")
                .font(.subheadline)
                .opacity(0.7)
                .frame(maxWidth: .infinity, alignment: .leading)
                .fixedSize(horizontal: false, vertical: true)

            // looping through the packesData
            ForEach(PackagesData, id: \.id) { package in
                PackageRow(package: package)
            }
        }
        .padding(.horizontal, 20)
    }
}

struct PackagesView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PackagesView()
            PackagesView()
                .environment(\.colorScheme, .dark)
        }
    }
}

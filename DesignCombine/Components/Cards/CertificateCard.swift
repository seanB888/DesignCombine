//
//  CertificateCard.swift
//  DesignCombine
//
//  Created by SEAN BLAKE on 2/16/22.
//

import SwiftUI

struct CertificateCard: View {
    @EnvironmentObject var certificateVM: CertificateViewModel
    @Binding var selection: Int

    // var certificate: Certificate

    var body: some View {

        ZStack {
            Image("CertificateBackground")
                .resizable()
                .aspectRatio(contentMode: .fill)

            if certificateVM.certificates.count > 0 {
                content
            } else {
                Text("There are no certificate yet.")
            }

        }
        .frame(maxWidth: 754, maxHeight: 465)
        .background(RadialGradient(gradient: Gradient(colors: [
                    Color(red: 0.9921568627, green: 0.2470588235, blue: 0.2).opacity(0.8),
                    Color(red: 0.2980392157, green: 0, blue: 0.7843137255).opacity(0.2)]),
                           center: .bottomTrailing, startRadius: 5, endRadius: 900))
        .overlay(RoundedRectangle(cornerRadius: 30.0, style: .continuous)
                .stroke(Color.white)
                .blendMode(.overlay)
        )
        .background(VisualEffectBlur(blurStyle: .systemUltraThinMaterialDark))
        .clipShape(RoundedRectangle(cornerRadius: 30.0, style: .continuous))
        .shadow(color: Color(red: 0.1647058824, green: 0.1098039216, blue: 0.3568627451).opacity(0.5), radius: 30, x: 0, y: 15)
    }

    // The content on the certificate
    var content: some View {
        VStack(spacing: 20) {
            Image(certificateVM.certificates[selection].logo)
                    .resizable()
                    .frame(width: 28, height: 28)
                    .padding(8)
                    .background(VisualEffectBlur(blurStyle: .systemUltraThinMaterialDark))
                    .mask(Circle())
                    .background(Circle().stroke(Color.white.opacity(0.4), lineWidth: 0.5))

            Section {
                Text("certificate of completion")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)

                Text("this is  to certify that")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(.white.opacity(0.7))
            }
            .textCase(.uppercase)

            Text("Sean")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)

            Text("successfully completed the online course \(certificateVM.certificates[selection].course) on \(certificateVM.certificates[selection].date)")
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .foregroundColor(.white.opacity(0.7))
                .frame(maxWidth: 250)
                .fixedSize(horizontal: false, vertical: true)
            // the instructor row
            Section {
                Divider()
                instructorRow

                Divider()
                certificateDataRow
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.footnote)
            .foregroundColor(.white.opacity(0.7))
            .padding(.horizontal, 20)
        }
    }

    // variable for the instructorRow
    var instructorRow: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("5FOUR Lab Instructor:")
            Text(certificateVM.certificates[selection].instruction)
        }
    }

    // variable for the certificateDataRow
    var certificateDataRow: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Certificate no: DC-\(certificateVM.certificates[selection].id)")

            Text("Certificate url: designcode.io/certificate/\(certificateVM.certificates[selection].id)")
        }
    }
}

struct CertificateCard_Previews: PreviewProvider {
    static var previews: some View {
        CertificateCard(selection: Binding.constant(0))
            .environmentObject(CertificateViewModel())
    }
}

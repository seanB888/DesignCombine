//
//  CertificateCard.swift
//  DesignCombine
//
//  Created by SEAN BLAKE on 2/16/22.
//

import SwiftUI

struct CertificateCard: View {

    var certificate: Certificate

    var body: some View {

        ZStack {
            Image("CertificateBackground")
                .resizable()
                .aspectRatio(contentMode: .fill)
            VStack(spacing: 20) {

                Image(certificate.logo)
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
                        .foregroundColor(Color(red: 1, green: 1, blue: 1))
                }
                .textCase(.uppercase)

                Text("Sean")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)

                Text("successfully completed the online course \(certificate.course) on \(certificate.date)")
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 1, green: 1, blue: 1))
                    .frame(maxWidth: 250)
                    .fixedSize(horizontal: false, vertical: true)

                Section {
                    Divider()
                    instructorRow

                    Divider()
                    certificateDataRow
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.footnote)
                .foregroundColor(Color(red: 1, green: 1, blue: 1))
                .padding(.horizontal, 20)
            }
        }
        .frame(maxWidth: 754, maxHeight: 465)
        .background(
            RadialGradient(gradient: Gradient(
                colors: [
                    Color(red: 0.9921568627, green: 0.2470588235, blue: 0.2).opacity(0.8),
                    Color(red: 0.2980392157, green: 0, blue: 0.7843137255).opacity(0.2)]),
                           center: .bottomTrailing, startRadius: 5, endRadius: 900))
        .overlay(
            RoundedRectangle(
                cornerRadius: 30.0, style: .continuous
            )
                .stroke(Color.white)
                .blendMode(.overlay)
        )
        .background(VisualEffectBlur(blurStyle: .systemUltraThinMaterialDark))
        .clipShape(RoundedRectangle(cornerRadius: 30.0, style: .continuous))
        .shadow(color: Color(red: 0.1647058824, green: 0.1098039216, blue: 0.3568627451).opacity(0.5), radius: 30, x: 0, y: 15)
    }


    var instructorRow: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("5FOUR Lab Instructor:")
            Text(certificate.instruction)
        }
    }


    var certificateDataRow: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Certificate no: DC-\(certificate.id)")

            Text("Certificate url: designcode.io/certificate/\(certificate.id)")
        }
    }
}

struct CertificateCard_Previews: PreviewProvider {
    static var previews: some View {
        let certificate = Certificate(id: "12345", course: "Swimming", date: "March 9th 2022", logo: "Logo SwiftUI", instruction: "Nadine Blake")

        CertificateCard(certificate: certificate)
    }
}

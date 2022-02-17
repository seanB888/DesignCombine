//
//  CertificatesView.swift
//  DesignCombine
//
//  Created by SEAN BLAKE on 2/16/22.
//

import SwiftUI


struct CertificatesView: View {
    // creating an instance of the CertificateViewModel
    @StateObject var certificateVM = CertificateViewModel()
    @State private var selection: Int = 0

    var body: some View {
        TabView(selection: $selection) {
            ForEach(certificateVM.certificates, id: \.id) { certificate in
                CertificateCard(certificate: certificate)
                    .padding(.horizontal, 8)
            }
        }
        .background(AccountBackground())
    }
}

struct CertificatesView_Previews: PreviewProvider {
    static var previews: some View {
        CertificatesView()
    }
}

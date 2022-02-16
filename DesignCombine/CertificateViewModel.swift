//
//  CertificateViewModel.swift
//  DesignCombine
//
//  Created by SEAN BLAKE on 2/16/22.
//

import Foundation
import Firesbase

final class CertificateViewModel: ObservableObject {
    @Published var certificate = [Certificate] = []

    func fetchCertificates() {
        let db = Firestore.firestore()
    }
}



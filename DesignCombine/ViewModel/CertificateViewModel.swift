//
//  CertificateViewModel.swift
//  DesignCombine
//
//  Created by SEAN BLAKE on 2/16/22.
//

import Foundation
import Firebase

final class CertificateViewModel: ObservableObject {
    @Published var certificates: [Certificate] = []

    // initiaize
    init() {
        fetchCertificates()
    }

    func fetchCertificates() {
        let db = Firestore.firestore()

        db.collection("certificates").getDocuments() { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                if let querySnapshot = querySnapshot {
                    for document in querySnapshot.documents {
                        let data = document.data()

                        let id = data["id"] as? String ?? ""
                        let course = data["course"] as? String ?? ""
                        let dateValue = (data["date"] as AnyObject).dateValue()
                        let date = dateValue.formatDate()
                        let logo = data["logo"] as? String ?? ""
                        let instructor = data["instructor"] as? String ?? ""

                        // The instance of certificate
                        let certificate = Certificate(id: id, course: course, date: date, logo: logo, instruction: instructor)

                        self.certificates.append(certificate)

                    }
                }
            }
        }
    }
}



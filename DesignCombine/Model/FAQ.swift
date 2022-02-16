//
//  FAQ.swift
//  DesignCombine
//
//  Created by SEAN BLAKE on 2/15/22.
//

import Foundation

struct FAQ: Decodable, Identifiable {
    var id: Int
    var question: String
    var answer: String
}

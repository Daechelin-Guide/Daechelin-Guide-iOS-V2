//
//  data.swift
//  Daechelin-Guide-V2
//
//  Created by 이민규 on 2023/03/31.
//

import Foundation

struct Data: Decodable {
    var date: String
    var breakfast: String?
    var dinner: String?
    var lunch: String?
    var week: String?
}

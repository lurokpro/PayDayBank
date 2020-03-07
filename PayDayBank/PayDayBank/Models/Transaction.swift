//
//  Transaction.swift
//  PayDayBank
//
//  Created by Сергей Мирошниченко on 07.03.2020.
//  Copyright © 2020 7rlines. All rights reserved.
//

import Foundation

struct Transaction: Codable {
    let id : Int
    let accountId : Int
    let amount : String
    let vendor : String
    let category : String
    let date : String

    enum CodingKeys: String, CodingKey {
        case id
        case accountId = "account_id"
        case amount
        case vendor
        case category
        case date
    }
}

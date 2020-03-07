//
//  Account.swift
//  PayDayBank
//
//  Created by Сергей Мирошниченко on 07.03.2020.
//  Copyright © 2020 7rlines. All rights reserved.
//

import Foundation

struct Account: Codable {
    let id : Int
    let customerId : Int
    let iban : String
    let type : String
    let date : String
    let active : Bool
    
    enum CodingKeys: String, CodingKey {
        case id
        case customerId = "customer_id"
        case iban
        case type
        case date  = "date_created"
        case active
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = (try? container.decode(Int.self, forKey: .id)) ?? 0
        self.active = (try? container.decode(Bool.self, forKey: .active)) ?? false
        self.customerId = (try? container.decode(Int.self, forKey: .customerId)) ?? 0
        self.iban = (try? container.decode(String.self, forKey: .iban)) ?? ""
        self.date = (try? container.decode(String.self, forKey: .date)) ?? ""
        self.type = (try? container.decode(String.self, forKey: .type)) ?? ""
    }
}


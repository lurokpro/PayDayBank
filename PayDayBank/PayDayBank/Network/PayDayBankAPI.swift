//
//  PayDayBankAPI.swift
//  PayDayBank
//
//  Created by Сергей Мирошниченко on 07.03.2020.
//  Copyright © 2020 7rlines. All rights reserved.
//

import Foundation

enum PayDayBankAPI {
    case authenticate
    case customers
    case accounts
    case transactions
}

extension PayDayBankAPI: EndpointType {
    var baseURL: URL {
        return URL(string: "http://localhost:3000")!
    }

    var path: String {
        switch self {
        case .authenticate:
            return "/authenticate"
        case .customers:
            return "/customers"
        case .accounts:
            return "/accounts"
        case .transactions:
            return "/transactions"
        }
        
    }
}

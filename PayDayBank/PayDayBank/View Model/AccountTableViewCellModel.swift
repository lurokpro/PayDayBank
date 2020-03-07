//
//  AccountTableViewCellModel.swift
//  PayDayBank
//
//  Created by Сергей Мирошниченко on 07.03.2020.
//  Copyright © 2020 7rlines. All rights reserved.
//

import Foundation

class AccountTableViewCellModel {

    private let account: Account

    init(account: Account) {
        self.account = account
    }

    var id: Int {
        return account.id
    }
    
    var customerId: Int? {
        return account.customerId
    }
    
    var iban: String {
        return account.iban
    }
    
    var type: String {
        return account.type
    }
    
    var date: String {
        return account.date
    }
    
    var active: Bool {
        return account.active
    }
}

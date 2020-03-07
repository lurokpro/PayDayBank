//
//  TransactionsTableViewCellModel.swift
//  PayDayBank
//
//  Created by Сергей Мирошниченко on 07.03.2020.
//  Copyright © 2020 7rlines. All rights reserved.
//

import Foundation

class TransactionsTableViewCellModel {

    private let transaction: Transaction

    init(transaction: Transaction) {
        self.transaction = transaction
    }

    var id: Int {
        return transaction.id
    }
    
    var accountId: Int {
        return transaction.accountId
    }
    
    var amount: String {
        return transaction.amount
    }
    
    var vendor: String {
        return transaction.vendor
    }
    
    var category: String {
        return transaction.category
    }
    
    var date: String {
        return transaction.date
    }
}

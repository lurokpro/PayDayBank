//
//  ViewModel.swift
//  PayDayBank
//
//  Created by Сергей Мирошниченко on 07.03.2020.
//  Copyright © 2020 7rlines. All rights reserved.
//

import UIKit

class ViewModel: NSObject {
    
    private let networking = Networking()
    private var transaction : Transaction?
    public var transactionsPayload : [Transaction] = []
    
    //MARK: API Requests
    public func getTransactions(completion: (() -> Void)?) {
        networking.performNetworkTask(endpoint: PayDayBankAPI.transactions,
                                      type: Transaction.self) { [weak self] (response) in
                                        print(response)
                                        self?.transactionsPayload = response
                                        completion?()
        }
    }
    
    // MARK: Prepare cells
    public func cellTableViewModel(index: Int) -> TransactionsTableViewCellModel? {
        guard let transaction = transactionsPayload[index] as Transaction? else { return nil}
        let transactionsTableViewCellModel = TransactionsTableViewCellModel(transaction: transaction)
        return transactionsTableViewCellModel
    }
    
}

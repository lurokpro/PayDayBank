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
    private var account : Account?
    public var transactionsPayload : [Transaction] = []
    public var accountsPayload : [Account] = []
    public var user : User?
    
    //MARK: API Requests
    public func getTransactions(completion: (() -> Void)?) {
        networking.performNetworkTask(endpoint: PayDayBankAPI.transactions,
                                      type: Transaction.self) { [weak self] (response) in
                                        self?.transactionsPayload = response
                                        completion?()
        }
    }
    
    public func getAccounts(completion: (() -> Void)?) {
        networking.performNetworkTask(endpoint: PayDayBankAPI.accounts,
                                      type: Account.self) { [weak self] (response) in
                                        self?.accountsPayload = response
                                        completion?()
        }
    }
    
    public func authenticate(completion: (() -> Void)?) {
        print ("authenticate")
        completion?()
    }
    
    public func customers(completion: (() -> Void)?) {
        print ("customers")
        completion?()
    }
//    public func authenticate(completion: (() -> Void)?) {
//        networking.performNetworkTask(endpoint: PayDayBankAPI.authenticate,
//                                      type: User.self,
//                                      params: ) { ([weak self]) (response) in
//                                        completion?()
//                                        
//        }
//    }
    
    // MARK: Prepare cells
    public func cellTableViewModel(index: Int) -> TransactionsTableViewCellModel? {
        guard let transaction = transactionsPayload[index] as Transaction? else { return nil}
        let transactionsTableViewCellModel = TransactionsTableViewCellModel(transaction: transaction)
        return transactionsTableViewCellModel
    }
    
    public func cellAccountTableViewModel(index: Int) -> AccountTableViewCellModel? {
        guard let account = accountsPayload[index] as Account? else { return nil}
        let accountTableViewCellModel = AccountTableViewCellModel(account: account)
        return accountTableViewCellModel
    }
    
}

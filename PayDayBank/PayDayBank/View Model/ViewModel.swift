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
    static public var user : User?
    
    //MARK: API Requests
    public func getTransactions(completion: (() -> Void)?) {
        networking.performNetworkTask(endpoint: PayDayBankAPI.transactions,
                                      type: Transaction.self) { [weak self] (response) in
                                        for transaction in response {
                                            if transaction.accountId == ViewModel.user?.id {
                                                self?.transactionsPayload.append(transaction)
                                            }
                                        }
                                        self?.transactionsPayload.sort(by: { (item0, item1) -> Bool in
                                            item0.date < item1.date
                                        })
                                        completion?()
        }
    }
    
    public func getAccounts(completion: (() -> Void)?) {
        networking.performNetworkTask(endpoint: PayDayBankAPI.accounts,
                                      type: Account.self) { [weak self] (response) in
                                        for account in response {
                                            if account.customerId == ViewModel.user?.id {
                                                self?.accountsPayload.append(account)
                                            }
                                        }
                                        self?.accountsPayload.sort(by: { (item0, item1) -> Bool in
                                            item0.date < item1.date
                                        })
                                        completion?()
        }
    }
    
    public func authenticate(email: String,
                             password: String,
                             completion: (() -> Void)?) {
        let params: [String: Any] = ["email": email,
                                     "password": password]
        networking.performNetworkTaskPostRequest(endpoint: PayDayBankAPI.authenticate,
                                      type: User.self,
                                      params: params) { [weak self] (response) in
                                        ViewModel.user = response
                                        completion?()
        }
    }
    
    public func customers(email: String,
                          password: String,
                          firstname: String,
                          lastname: String,
                          gender: String,
                          phone: String,
                          dob: String,
                          completion: (() -> Void)?) {
        let params: [String: Any] = ["email": email,
                                     "password": password,
                                     "firstname": firstname,
                                     "lastname": lastname,
                                     "gender": gender,
                                     "phone": phone,
                                     "dob": dob]
        networking.performNetworkTaskPostRequest(endpoint: PayDayBankAPI.customers,
                                      type: User.self,
                                      params: params) { [weak self] (response) in
                                        completion?()
        }
    }
    
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

//
//  AccountsVC.swift
//  PayDayBank
//
//  Created by Сергей Мирошниченко on 07.03.2020.
//  Copyright © 2020 7rlines. All rights reserved.
//

import UIKit

class AccountsVC: UITableViewController {
    
    let accountCellID = "AccountCellID"
    public let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = .white
        tableView.register(AccountTableViewCell.self, forCellReuseIdentifier: accountCellID)
        tableView.rowHeight = UITableView.automaticDimension
        
        viewModel.getAccounts(completion: {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }
    
}

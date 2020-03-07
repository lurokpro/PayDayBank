//
//  TransactionsVC.swift
//  PayDayBank
//
//  Created by Сергей Мирошниченко on 07.03.2020.
//  Copyright © 2020 7rlines. All rights reserved.
//

import UIKit

class TransactionsVC: UITableViewController {
    
    let cellID = "TransactionCellID"
    public let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(TransactionTableViewCell.self, forCellReuseIdentifier: cellID)
        tableView.rowHeight = UITableView.automaticDimension
        
        viewModel.getTransactions {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
}

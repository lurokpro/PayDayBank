//
//  AccountsVC+TableViewDataSource.swift
//  PayDayBank
//
//  Created by Сергей Мирошниченко on 07.03.2020.
//  Copyright © 2020 7rlines. All rights reserved.
//

import UIKit

extension AccountsVC {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return viewModel.accountsPayload.count
        }
        return super.tableView(tableView, numberOfRowsInSection: section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: accountCellID, for: indexPath) as! AccountTableViewCell
            cell.viewModel = viewModel.cellAccountTableViewModel(index: indexPath.row)
            return cell
        }
        return super.tableView(tableView, cellForRowAt: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

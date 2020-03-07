//
//  TransactionsVC + TableViewDelegate.swift
//  PayDayBank
//
//  Created by Сергей Мирошниченко on 07.03.2020.
//  Copyright © 2020 7rlines. All rights reserved.
//

import UIKit

extension TransactionsVC {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

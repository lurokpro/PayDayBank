//
//  TransactionTableViewCell.swift
//  PayDayBank
//
//  Created by Сергей Мирошниченко on 07.03.2020.
//  Copyright © 2020 7rlines. All rights reserved.
//

import UIKit

class TransactionTableViewCell: UITableViewCell {
    
    let vendorLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    let amountLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    let categoryLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    let dateLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    public var viewModel: TransactionsTableViewCellModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            vendorLabel.text = "Vendor: \(viewModel.vendor)"
            amountLabel.text = "Ammount: \(viewModel.amount)"
            categoryLabel.text = "Category: \(viewModel.category)"
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
            if let date = formatter.date(from: viewModel.date) {
                formatter.dateStyle = .medium
                dateLabel.text = "Date: \(formatter.string(from: date))"
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        addSubview(vendorLabel)
        vendorLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        vendorLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        vendorLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        
        addSubview(categoryLabel)
        categoryLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        categoryLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        categoryLabel.topAnchor.constraint(equalTo: vendorLabel.bottomAnchor, constant: 16).isActive = true
        
        addSubview(amountLabel)
        amountLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        amountLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        amountLabel.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 16).isActive = true
        
        addSubview(dateLabel)
        dateLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        dateLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        dateLabel.topAnchor.constraint(equalTo: amountLabel.bottomAnchor, constant: 16).isActive = true
        dateLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//
//  AccountTableViewCell.swift
//  PayDayBank
//
//  Created by Сергей Мирошниченко on 07.03.2020.
//  Copyright © 2020 7rlines. All rights reserved.
//

import UIKit

class AccountTableViewCell: UITableViewCell {
    
    let ibanLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    let typeLabel : UILabel = {
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
    let activeLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    public var viewModel: AccountTableViewCellModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            if viewModel.active {
                ibanLabel.text = "IBAN: \(viewModel.iban)"
                typeLabel.text = "Type: \(viewModel.type)"
                activeLabel.text = "Active: Yes"
                let formatter = DateFormatter()
                formatter.dateFormat = "MM/dd/yyyy"
                if let date = formatter.date(from: viewModel.date) {
                    formatter.dateStyle = .medium
                    dateLabel.text = "Date created: \(formatter.string(from: date))"
                }
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        addSubview(ibanLabel)
        ibanLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        ibanLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        ibanLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        
        addSubview(typeLabel)
        typeLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        typeLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        typeLabel.topAnchor.constraint(equalTo: ibanLabel.bottomAnchor, constant: 16).isActive = true
        
        addSubview(activeLabel)
        activeLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        activeLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        activeLabel.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 16).isActive = true
        
        addSubview(dateLabel)
        dateLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        dateLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        dateLabel.topAnchor.constraint(equalTo: activeLabel.bottomAnchor, constant: 16).isActive = true
        dateLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

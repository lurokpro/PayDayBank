//
//  MainVC.swift
//  PayDayBank
//
//  Created by Сергей Мирошниченко on 06.03.2020.
//  Copyright © 2020 7rlines. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var tabBar: UITabBar!
    let transactionsVC = TransactionsVC()
    let accountVC = AccountVC()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.delegate = self
        self.tabBar.selectedItem = tabBar.items?.first
        changeVC(index: 0)
        let callItem = UIBarButtonItem(image: UIImage(named: "phone"), style: .done, target: self, action: #selector(callSupport(sender:)))
        callItem.tintColor = .white
        navigationItem.rightBarButtonItems = [callItem]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationItem.setHidesBackButton(true, animated: true);
    }
    
    func changeVC (index : Int) {
        switch index {
        case 0:
            addChild(transactionsVC)
            containerView.addSubview(transactionsVC.view)
            transactionsVC.view.frame = containerView.bounds
            transactionsVC.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            transactionsVC.didMove(toParent: self)
            break
        default:
            addChild(accountVC)
            containerView.addSubview(accountVC.view)
            accountVC.view.frame = containerView.bounds
            accountVC.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            accountVC.didMove(toParent: self)
            break
        }
    }
    
    @objc func callSupport(sender: UIBarButtonItem) {
        let number = "+15412345678"
        if let url = URL(string: "tel://\(number)"), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
}

extension MainVC: UITabBarDelegate {
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        changeVC(index: (tabBar.items?.firstIndex(of: item))!)
    }
    
}

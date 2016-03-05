//
//  SecondViewController.swift
//  MessageCall
//
//  Created by Mayank Yadav on 05/03/16.
//  Copyright © 2016 Code52. All rights reserved.
//

import UIKit

class FriendsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var dataSource: FriendsViewDataSource?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupDataSource();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    private func setupDataSource() {
        self.dataSource = FriendsViewDataSource(tableView: self.tableView)
        self.tableView.dataSource = dataSource
        self.dataSource?.loadData()
    }
}


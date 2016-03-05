//
//  FriendsListViewDataSource.swift
//  First
//
//  Created by Mayank Yadav on 04/10/15.
//  Copyright © 2015 First. All rights reserved.
//

import UIKit

class FriendsViewDataSource: NSObject, UITableViewDataSource {

    var tableView: UITableView
    var friends = [Person]()
    var person: Person? = nil;
    let modelStore = ModelStore()

    init(tableView: UITableView) {

        self.tableView = tableView;
        super.init();
    }

    //MARK: - UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cellIdentifier = "cell"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: cellIdentifier)
        }

        let constCell = cell!
        let contact = self.friends[indexPath.row]
        constCell.textLabel?.text = contact.name

        return constCell;
    }

    //MARK: - Data Fetching
    private func startFetchingData() {
        self.modelStore.fetchContacts { (persons) -> Void in
            if let persons = persons {
                print(persons)
                self.updateFriends(persons)
            } else {
                print("Error fetching persons")
            }
        }
    }

    func loadData() {
        self.startFetchingData()
    }

    private func updateFriends(friends: [Person]) {
        self.friends.appendContentsOf(friends)
        self.tableView.reloadData()
    }
}
//
//  ModelStore.swift
//  MessageCall
//
//  Created by Mayank Yadav on 05/03/16.
//  Copyright © 2016 Code52. All rights reserved.
//

import Foundation
import CloudKit

class ModelStore {

    let dataStore = DataStore()

    func fetchContacts(completion:([Person]?) -> Void) {
        dataStore.fetchAddressbookFriends { (userInfos) -> Void in
            if let userInfos = userInfos {
                completion(self.personsFromUserInfos(userInfos))
                print("Sucessfully fetched contacts")
            } else {
                completion(nil)
                print("Error fetching user infos")
            }
        }
    }

    func personsFromUserInfos(userInfos:[CKDiscoveredUserInfo]) -> [Person] {
        var mutablePersons = [Person]()
        for index in 0..<userInfos.count {
            let userInfo = userInfos[index]
            let familyName = (userInfo.displayContact?.familyName)!
            let givenName = (userInfo.displayContact?.givenName)!
            let person = Person(userName: givenName+" "+familyName, userIdentifier: NSUUID().UUIDString)
            mutablePersons.append(person)
        }
        return mutablePersons
    }
}
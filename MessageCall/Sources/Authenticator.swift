//
//  Authentication.swift
//  First
//
//  Created by Mayank Yadav on 30/08/15.
//  Copyright © 2015 First. All rights reserved.
//

import CloudKit

class Authenticator {

    let container:CKContainer

    init() {
        container = CKContainer.defaultContainer()
    }

    func requestPermissions(completion:(Bool) -> Void) {
        self.requestCloudKitPermission { (success) -> Void in
            if success {
                self.requestCloudKitDiscoveryPermission({ (success) -> Void in
                    if success {
                        completion(true)
                    } else {
                        completion(false)
                    }
                })
            } else {
                completion(false)
            }
        }
    }

    private func requestCloudKitPermission(completion:(Bool) -> Void) {

        container.accountStatusWithCompletionHandler { (status, error) -> Void in
            if status == CKAccountStatus.Available {
                completion(true)
            } else {
                print("iCloud Account does not exist")
                completion(false)
            }
        }
    }

    private func requestCloudKitDiscoveryPermission(completion:(Bool)-> Void) {
        container.requestApplicationPermission(CKApplicationPermissions.UserDiscoverability) { (status, error) -> Void in

            if status == CKApplicationPermissionStatus.Granted {
                completion(true)
            } else {
                completion(false)
            }
        }
    }
}
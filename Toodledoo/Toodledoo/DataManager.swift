//
//  DataManager.swift
//  Toodledoo
//
//  Created by Paul Ardeleanu on 09/03/2017.
//  Copyright © 2017 Hello24. All rights reserved.
//

import Foundation
import UIKit

protocol DataSource {
    var numberOfActiveItems: Int { get }
    var numberOfCompletedItems: Int { get }
}


class DataManager: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var dataSource: DataSource!
    
    init(dataSource: DataSource) {
        self.dataSource = dataSource
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return dataSource.numberOfActiveItems
        }
        return dataSource.numberOfCompletedItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}

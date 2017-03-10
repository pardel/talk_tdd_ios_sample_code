//
//  Task.swift
//  Toodledoo
//
//  Created by Paul Ardeleanu on 09/03/2017.
//  Copyright © 2017 Hello24. All rights reserved.
//

import Foundation

class Task {
    var name: String
    var completedAt: Date?
    
    init?(name: String) {
        if name.characters.count == 0 {
            return nil
        }
        self.name = name
    }
    
    var wasCompleted: Bool {
        return nil != completedAt
    }
    
    func complete() {
        completedAt = Date()
    }
    func reactivate() {
        completedAt = nil
    }
}


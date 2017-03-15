//
//  Task.swift
//  DoIt
//
//  Created by Venkateswari Srinivasan on 13/03/17.
//  Copyright © 2017 Thoughtworks. All rights reserved.
//

import Foundation

class Task {
    
    var name = "";
    var important = false;
    
    init(name: String, important: Bool) {
        self.name = name
        self.important = important
    }

}

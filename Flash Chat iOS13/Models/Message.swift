//
//  Message.swift
//  Flash Chat iOS13
//
//  Created by Artem Tkachuk on 7/27/20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import Foundation

struct Message {
    let sender: String
    let body: String
    
    init(_ sender: String, _ body: String) {
        self.sender = sender
        self.body = body
    }
}

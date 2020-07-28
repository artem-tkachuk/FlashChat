//
//  Contants.swift
//  Flash Chat iOS13
//
//  Created by Artem Tkachuk on 7/27/20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

// static means that the property becomes a datatype property instead of an instance property
struct K {
    static let appName = "⚡️FlashChat"
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "MessageCell"
    static let registerToChatSegueID = "GoFromRegisterToChat"
    static let loginToChatSegueID = "GoFromLoginToChat"
    
    struct BrandColors {
        static let purple = "BrandPurple"
        static let lightPurple = "BrandLightPurple"
        static let blue = "BrandBlue"
        static let lighBlue = "BrandLightBlue"
    }
    
    struct Firestore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
}

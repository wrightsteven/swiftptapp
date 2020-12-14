//
//  Chat.swift
//  swiftPTApp
//
//  Created by Steven Wright on 12/13/20.
//

import Foundation

struct Chat {
    var users: [String]
    var dictionary: [String: Any] {
    return ["users": users]
    }
}

extension Chat {
    init?(dictionary: [String:Any]) {
    guard let chatUsers = dictionary["users"] as? [String] else {return nil}
    self.init(users: chatUsers)
    }
}

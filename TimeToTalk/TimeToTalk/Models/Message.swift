//
//  Message.swift
//  TimeToTalk
//
//  Created by Tijmen on 18/05/2021.
//

import Foundation

struct Message: Hashable {
    var content: String
    var user: User
}

struct DataSource {
    static let firstUser = User(name: "Evaline", avatar: "person.circle", color: .pink)
    static let fourthUser = User(name: "Tijmen", avatar: "person.circle", color: .green)
    static var secondUser = User(name: "Mark", avatar: "person.circle", color: .purple, isCurrentUser: true)
    static let thirdUser = User(name: "Erik", avatar: "person.circle", color: .orange)
    static let messages = [
        Message(content: "Hi, how are you doing?", user: DataSource.firstUser),
        Message(content: "Pretty good hbu?", user: DataSource.secondUser),
        Message(content: "Could be better", user: DataSource.firstUser),
        Message(content: "How's your day going?", user: DataSource.firstUser),
    
    ]
    static let groupMessages = [
        Message(content: "Heya guys!", user: DataSource.firstUser),
        Message(content: "Good talk", user: DataSource.secondUser),
        Message(content: "Wanna start a call?", user: DataSource.thirdUser),
        Message(content: "Sure?", user: DataSource.fourthUser),
    
    ]
}

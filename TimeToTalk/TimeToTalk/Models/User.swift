//
//  User.swift
//  TimeToTalk
//
//  Created by Tijmen on 18/05/2021.
//

import Foundation
import SwiftUI

struct User: Hashable {
    var name: String
    var avatar: String
    var color: Color
    var isCurrentUser: Bool = false
}

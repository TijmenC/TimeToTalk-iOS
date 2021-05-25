//
//  MessageView.swift
//  TimeToTalk
//
//  Created by Tijmen on 18/05/2021.
//

import SwiftUI

struct MessageView : View {
    var currentMessage: Message
    var body: some View {
        HStack(alignment: .bottom, spacing: 15) {
            if !currentMessage.user.isCurrentUser {
                VStack {
                Image(systemName: currentMessage.user.avatar)
                .resizable()
                .frame(width: 40, height: 40, alignment: .center)
                .cornerRadius(20)
                    .foregroundColor(currentMessage.user.color)
                    Text(currentMessage.user.name).font(.caption2)
                }
                
            } else {
                Spacer()
            }
            ContentMessageView(contentMessage: currentMessage.content,
                               isCurrentUser: currentMessage.user.isCurrentUser)
        }.padding()
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(currentMessage: Message(content: "This is a test :)", user: DataSource.firstUser))
    }
}

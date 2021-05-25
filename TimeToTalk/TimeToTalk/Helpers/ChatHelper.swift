//
//  ChatHelper.swift
//  TimeToTalk
//
//  Created by Tijmen on 18/05/2021.
//
import Combine


class ChatHelper : ObservableObject {
    var didChange = PassthroughSubject<Void, Never>()
    @Published var realTimeMessages = DataSource.messages
    @Published var realTimeMessagesGroup = DataSource.groupMessages
    
    func sendMessage(_ chatMessage: Message) {
        realTimeMessages.append(chatMessage)
        realTimeMessagesGroup.append(chatMessage)
        didChange.send(())
    }
}

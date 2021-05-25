//
//  MessageScreenDetailedGroup.swift
//  TimeToTalk
//
//  Created by Tijmen on 20/05/2021.
//

import SwiftUI

struct MessageScreenDetailedGroup: View {
    @State var message: String = ""
    @State var typingMessage: String = ""
    @EnvironmentObject var chatHelper: ChatHelper
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "person.2.circle.fill").padding()
                    .font(Font.system(size: 40))
                Text("Group")
                    .font(.title)
                NavigationLink(
                    destination: GroupCallScreen()) {
                Image(systemName: "phone.fill").padding()
                    .font(Font.system(size: 30))
                    .padding(.leading, 130)
                }.foregroundColor(.black)
                Spacer()
            }
            .background(Color(UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0)))
            VStack {
               List {
                   ForEach(chatHelper.realTimeMessagesGroup, id: \.self) { msg in
                    MessageView(currentMessage: msg)
                   }
               }
                
                
            }
            
            
            
            HStack {
                TextField("Type a message...", text: $typingMessage)
                    .textFieldStyle(MyTextFieldStyle())
                Button(action: {
                    sendMessage()
                }, label: {
                    Image(systemName: "arrow.right")
                })
                .padding()
                .font(Font.system(size: 30))
                .padding(.leading, -20)
            }
            
            }
        .padding(.top, -50)
            
        }
    func sendMessage() {
           chatHelper.sendMessage(Message(content: typingMessage, user: DataSource.secondUser))
           typingMessage = ""
       }
    struct MyTextFieldStyle: TextFieldStyle {
        func _body(configuration: TextField<Self._Label>) -> some View {
            configuration
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 20, style: .continuous )
                    .stroke(Color.black, lineWidth: 3)
                
            ).padding()
    }
    }
}

struct MessageScreenDetailedGroup_Previews: PreviewProvider {
    static var previews: some View {
        MessageScreenDetailedGroup()
            .environmentObject(ChatHelper())
    }
}

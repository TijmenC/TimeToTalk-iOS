//
//  MessageScreenDetailed.swift
//  TimeToTalk
//
//  Created by Tijmen on 17/05/2021.
//

import SwiftUI

struct MessageScreenDetailed: View {
    @State var message: String = ""
    @State var typingMessage: String = ""
    @EnvironmentObject var chatHelper: ChatHelper
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "person.circle.fill").padding()
                    .font(Font.system(size: 40))
                Text(DataSource.firstUser.name)
                    .font(.title)
                NavigationLink(
                    destination: CallScreenView()) {
                    Image(systemName: "phone.fill").padding()
                        .font(Font.system(size: 30))
                        .padding(.leading, 20)
                }.foregroundColor(.black)
                NavigationLink(
                    destination: VideoCallView()) {
                    Image(systemName: "video.fill")
                        .font(Font.system(size: 30))
                }.foregroundColor(.black)
                NavigationLink(
                    destination: ReportView(userName: DataSource.firstUser.name)) {
                    Image(systemName: "exclamationmark.triangle.fill")
                        .font(Font.system(size: 30))
                }.foregroundColor(.black)
                
                
                Spacer()
            }
            .background(Color(UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0)))
            VStack {
               List {
                   ForEach(chatHelper.realTimeMessages, id: \.self) { msg in
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



struct MessageScreenDetailed_Previews: PreviewProvider {
    static var previews: some View {
        MessageScreenDetailed()
            .environmentObject(ChatHelper())
    }
}

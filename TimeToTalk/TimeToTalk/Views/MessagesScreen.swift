//
//  MessagesScreen.swift
//  TimeToTalk
//
//  Created by Tijmen on 17/05/2021.
//

import SwiftUI

struct MessagesScreen: View {
    var body: some View {
        VStack {
            Image(systemName: "message").padding()
                .font(Font.system(size: 80))
              HStack {
                Image(systemName: "person.circle.fill").font(Font.system(size: 40))
                Text(DataSource.firstUser.name)
                      .font(.title)
                  Spacer()
                Text("1 New Message")
                    .font(.headline).foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                NavigationLink(
                    destination: MessageScreenDetailed()
                        .environmentObject(ChatHelper())) {
                Image(systemName: "message.circle").padding()
                    .font(Font.system(size: 40))
                }
                .foregroundColor(.blue)
              }
              .padding(5)
                 .overlay(
                     RoundedRectangle(cornerRadius: 16)
                         .stroke(Color.black, lineWidth: 1)
                 )

            Divider()
            HStack {
                Image(systemName: "person.2.circle.fill").font(Font.system(size: 40))
                Text("Group chat")
                    .font(.title)
                Spacer()
                NavigationLink(
                    destination: MessageScreenDetailedGroup().environmentObject(ChatHelper()))
                {
                Image(systemName: "message.circle").padding()
                    .font(Font.system(size: 40))
                }
                .foregroundColor(.black)
            }
            .padding(5)
               .overlay(
                   RoundedRectangle(cornerRadius: 16)
                       .stroke(Color.black, lineWidth: 1)
               )
            
            Spacer()
          }
        .navigationTitle("Messages")
          .padding()
      }
    }


struct MessagesScreen_Previews: PreviewProvider {
    static var previews: some View {
        MessagesScreen()
    }
}

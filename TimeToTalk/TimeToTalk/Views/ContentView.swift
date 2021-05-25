//
//  ContentView.swift
//  TimeToTalk
//
//  Created by Denny Cox on 12/05/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var name = "Mark"
    @State var isActive : Bool = false
    @State var isActiveGroup : Bool = false
    
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Goodmorning " + name + "!")
                    .padding()
                    .font(.title)
                Text("What do you want to do?")
                    .padding()
                    .font(.title)
                VStack {
                    NavigationLink(
                        destination: TalkView(rootIsActive: self.$isActive),
                        isActive: self.$isActive) {

                        Text("I want to talk").foregroundColor(.white).fontWeight(.semibold).font(.title)
                    }
                    .isDetailLink(false)
                    Image(systemName: "person.2")
                        .font(Font.system(size: 40)).foregroundColor(.white)
                }.frame(minWidth: 0, maxWidth: 300)
                .padding()
                .foregroundColor(.black)
                .font(.title2)
                .background(LinearGradient(gradient: Gradient(colors: [Color("DarkGreen"), Color("LightGreen")]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(20)
                .padding()
                VStack {
                    NavigationLink(
                        destination: TalkViewGroup(rootIsActive: self.$isActive),
                        isActive: self.$isActiveGroup) {
                        Text("I want to talk in a group").foregroundColor(.white).fontWeight(.semibold).font(.title)
                    }
                    .isDetailLink(false)
                    Image(systemName: "person.3")
                        .font(Font.system(size: 40)).foregroundColor(.white)
                }.frame(minWidth: 0, maxWidth: 300)
                .padding()
                .foregroundColor(.black)
                .font(.title2)
                .background(LinearGradient(gradient: Gradient(colors: [Color("DarkGreen"), Color("LightGreen")]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(20)
                .padding()
                VStack {
                    NavigationLink(
                        destination: MessagesScreen()) {
                        Text("Messages").foregroundColor(.white).fontWeight(.semibold).font(.title)
                    }
                    Image(systemName: "message")
                        .font(Font.system(size: 40)).foregroundColor(.white)
                }.frame(minWidth: 0, maxWidth: 300)
                .padding()
                .foregroundColor(.black)
                .font(.title2)
                .background(LinearGradient(gradient: Gradient(colors: [Color("DarkGreen"), Color("LightGreen")]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(20)
                .padding()
                Spacer()
            }
            .navigationTitle("TimeToTalk")
            .toolbar {
                NavigationLink(
                    destination: SettingsView()) {
                    VStack {
                        Image(systemName: "gearshape")
                            .font(Font.system(size: 28))
                        Text("")
                    }
                }.buttonStyle(PlainButtonStyle())
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

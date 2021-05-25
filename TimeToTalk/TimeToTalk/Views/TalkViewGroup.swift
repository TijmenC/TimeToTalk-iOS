//
//  TalkViewGroup.swift
//  TimeToTalk
//
//  Created by Tijmen on 19/05/2021.
//

import SwiftUI

struct TalkViewGroup: View {
    var topic = ["General", "School", "Work", "Family", "Friends"]
    @State private var selectedTopic = "General"
    @State private var isAnonymous = false
    @Binding var rootIsActive : Bool
    var body: some View {
        VStack {
            Image(systemName: "person.3").padding()
                .font(Font.system(size: 60))
            Form {
                Section{
                    Picker("Topic of conversation", selection: $selectedTopic) {
                        ForEach(topic, id: \.self) {
                            Text($0)
                        }
                    }.padding().font(.title2)
                }
                Section{
                    Toggle(isOn: $isAnonymous) {
                        Text("Talk anonymously").font(.title2)
                    }.padding()
                }
                Section {
                    HStack {
                        Image(systemName: "info.circle").foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        NavigationLink(
                            destination: InformationView()) {
                            Text("How does it work?").foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        }
                    }.padding()
                }
            }
            Spacer()
            HStack {
                Image(systemName: "magnifyingglass")
                    .font(Font.system(size: 40)).foregroundColor(.white)
                NavigationLink(
                    destination: TalkIntroductionGroupView(audioRecorder: AudioRecorder(),subject: selectedTopic, anonymous: isAnonymous, rootIsActive: self.$rootIsActive)) {
                    Text("Start searching for a group").foregroundColor(.white).fontWeight(.semibold).font(.title)
                }.isDetailLink(false)
                .frame(minWidth: 0, maxWidth: 200)
                
            }.frame(minWidth: 0, maxWidth: 300)
            .padding()
            .foregroundColor(.black)
            .font(.title2)
            .background(LinearGradient(gradient: Gradient(colors: [Color("DarkGreen"), Color("LightGreen")]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(20)
            .padding()
            Spacer()
        }
        .navigationTitle("I want to talk in a group")
    }
}

struct TalkViewGroup_Previews: PreviewProvider {
    static var previews: some View {
        TalkViewGroup(rootIsActive: .constant(true))
    }
}

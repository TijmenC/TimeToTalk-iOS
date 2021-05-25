//
//  TalkAnswersView.swift
//  TimeToTalk
//
//  Created by Denny Cox on 19/05/2021.
//

import SwiftUI

struct TalkAnswersView: View {
    @State private var user = "Tijmen"
    var contentMessage: String
    var subject: String
    var anonymous: Bool
    @ObservedObject var audioRecorder: AudioRecorder
    @Binding var rootIsActive : Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("What do you want to tell about " + subject + "?").font(.title).padding()
            HStack {
                Image(systemName: "person.circle.fill").font(Font.system(size: 30))
                Text(user + " answered:").font(.body)
                NavigationLink(
                    destination: ReportView(userName: "Evaline")) {
                        Image(systemName: "exclamationmark.triangle.fill")
                            .font(Font.system(size: 20))
                }.foregroundColor(.black)
            }
            Text("I want to talk about something my teacher said to me")
                .padding(15)
                .foregroundColor(Color.black)
                .background(Color(UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0)))
                .cornerRadius(10)
            HStack {
                anonymous ? Image(systemName: "eyeglasses").font(Font.system(size: 30)) : Image(systemName: "person.circle.fill").font(Font.system(size: 30))
                Text("You answered:").font(.body)
            }
            VStack(alignment: .leading) {
                Text(contentMessage).foregroundColor(Color.white)
                if(audioRecorder.recordings.isEmpty) { Text("")
                } else {
                RecordingsList(audioRecorder: audioRecorder).frame(maxHeight:50)
                }
            }.padding(10)
            .background(Color.blue)
            .cornerRadius(10)
            
            Spacer()
            HStack {
                Image(systemName: "arrow.right")
                    .font(Font.system(size: 40)).foregroundColor(.white)
                NavigationLink(
                    destination: TalkChoiceView(shouldPopToRootView: self.$rootIsActive)) {
                    Text("Next question").foregroundColor(.white).fontWeight(.semibold).font(.title)
                } .isDetailLink(false)
                .frame(minWidth: 0, maxWidth: 200)
            }.frame(minWidth: 0, maxWidth: 300)
            .padding()
            .foregroundColor(.black)
            .font(.title2)
            .background(LinearGradient(gradient: Gradient(colors: [Color("DarkGreen"), Color("LightGreen")]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(20)
            .padding()
        }.navigationTitle("Introduction answers").padding()
        }
    }


struct TalkAnswersView_Previews: PreviewProvider {
    static var previews: some View {
        TalkAnswersView(contentMessage: "Text", subject: "school", anonymous: false, audioRecorder: AudioRecorder(), rootIsActive: .constant(true))
    }
}

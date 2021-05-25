//
//  TalkIntroductionGroupView.swift
//  TimeToTalk
//
//  Created by Tijmen on 19/05/2021.
//

import SwiftUI

struct TalkIntroductionGroupView: View {
    @ObservedObject var audioRecorder: AudioRecorder
    @State private var answer = ""
    @State private var selectedTopic = "General"
    var subject: String
    var anonymous: Bool
    @Binding var rootIsActive : Bool
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("Talk to: ").font(.body)
                    Image(systemName: "person.3.fill").font(Font.system(size: 30))
                    Text("Group").font(.body)
                }.padding(.leading)
                HStack {
                    Text("Talk as: ").font(.body)
                    anonymous ? Image(systemName: "eyeglasses").font(Font.system(size: 30))
                        : Image(systemName: "person.circle.fill").font(Font.system(size: 30))
                    anonymous ? Text("Anonymous").font(.body) :
                        Text("Mark").font(.body)
                }.padding(.leading)
            }
            Form {
                Section {
                    Text("What do you want to tell about " + subject + "? (question 1 of 3)").font(.title2).padding(.leading)
                }
                TextField("Type in your answer...", text: $answer).padding()
                
                RecordingsList(audioRecorder: audioRecorder)
                if audioRecorder.recording == false {
                    Button(action: {self.audioRecorder.startRecording()}) {
                        HStack {
                            Image(systemName: "mic")
                                .font(.title)
                            Text("Start recording")
                                .fontWeight(.semibold)
                                .font(.body)
                        }.foregroundColor(.white)
                        .frame(minWidth: 0, maxWidth: 300)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(20)
                    }
                } else {
                    Button(action: {self.audioRecorder.stopRecording()}) {
                        HStack {
                            Image(systemName: "mic")
                                .font(.title)
                            Text("Stop recordinig")
                                .fontWeight(.semibold)
                                .font(.body)
                        }.foregroundColor(.white)
                        .frame(minWidth: 0, maxWidth: 300)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(20)
                    }
                }
                
            }
            Spacer()
            HStack {
                Image(systemName: "message")
                    .font(Font.system(size: 40)).foregroundColor(.white)
                NavigationLink(
                    destination: TalkAnswerViewGroup(contentMessage: answer, anonymous: anonymous, audioRecorder: AudioRecorder(), rootIsActive: self.$rootIsActive)) {
                    Text("Enter answer").foregroundColor(.white).fontWeight(.semibold).font(.title)
                }.isDetailLink(false)
                .frame(minWidth: 0, maxWidth: 200)
            }.frame(minWidth: 0, maxWidth: 300)
            .padding()
            .foregroundColor(.black)
            .font(.title2)
            .background(LinearGradient(gradient: Gradient(colors: [Color("DarkGreen"), Color("LightGreen")]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(20)
            .padding()
        }.navigationTitle("Introduction")
        .navigationBarItems(trailing: EditButton())
    }
}


struct TalkIntroductionGroupView_Previews: PreviewProvider {
    static var previews: some View {
        TalkIntroductionGroupView(audioRecorder: AudioRecorder(),subject: "school", anonymous: false, rootIsActive: .constant(true))
    }
}

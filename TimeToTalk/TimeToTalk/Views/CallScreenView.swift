//
//  CallScreenView.swift
//  TimeToTalk
//
//  Created by Denny Cox on 20/05/2021.
//

import SwiftUI
import Combine

struct CallScreenView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    // Add lines 6 -> 8
    @State var hours: Int = 0
    @State var minutes: Int = 0
    @State var seconds: Int = 0
    @State var timerIsPaused: Bool = true
    
    @State var timer: Timer? = nil
    
    var body: some View {
        VStack {
            Image(systemName: "person.circle.fill").padding(.top, 300)
            .font(Font.system(size: 120))
            Text("You").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).padding(10)
            Text("\(hours):\(minutes):\(seconds)")
            Spacer()
            HStack {
                VStack {
                Image(systemName: "person.circle.fill").padding()
                    .font(Font.system(size: 60)).foregroundColor(DataSource.firstUser.color)
                    Text(DataSource.firstUser.name).font(.title3)
                }
                .padding(.bottom, 170)
            }.onAppear { self.startTimer() }
            HStack {
                Image(systemName: "speaker.slash").padding(.bottom, 400).padding(.trailing, 50)
                    .font(Font.system(size: 50)).foregroundColor(.black)
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "phone.down.fill").padding(.bottom, 400).padding()
                        .font(Font.system(size: 50)).foregroundColor(.red)
                })
            }
            }
    }
    func startTimer(){
        timerIsPaused = false
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ tempTimer in
          if self.seconds == 59 {
            self.seconds = 0
            if self.minutes == 59 {
              self.minutes = 0
              self.hours = self.hours + 1
            } else {
              self.minutes = self.minutes + 1
            }
          } else {
            self.seconds = self.seconds + 1
          }
        }
      }
}

struct CallScreenView_Previews: PreviewProvider {
    static var previews: some View {
        CallScreenView()
    }
}

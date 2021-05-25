//
//  VideoCallView.swift
//  TimeToTalk
//
//  Created by Tijmen on 20/05/2021.
//

import SwiftUI
import CameraView

struct VideoCallView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    // Add lines 6 -> 8
    @State var hours: Int = 0
    @State var minutes: Int = 0
    @State var seconds: Int = 0
    @State var timerIsPaused: Bool = true
    
    @State var timer: Timer? = nil
    
    var body: some View {
        VStack {
            Text("\(hours):\(minutes):\(seconds)")
            HStack {
                CameraView().frame(minWidth: 300, maxWidth: 300, minHeight: 300, maxHeight: 300, alignment: .center)
                }.onAppear { self.startTimer() }
                Spacer()
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
    
    struct VideoCallView_Previews: PreviewProvider {
        static var previews: some View {
            VideoCallView()
        }
    }

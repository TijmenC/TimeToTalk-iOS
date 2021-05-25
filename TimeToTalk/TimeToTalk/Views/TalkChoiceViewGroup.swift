//
//  TalkChoiceViewGroup.swift
//  TimeToTalk
//
//  Created by Tijmen on 21/05/2021.
//

import SwiftUI

struct TalkChoiceViewGroup: View {
    @Binding var shouldPopToRootView : Bool
    var body: some View {
       
        VStack {
            Text("Those were all the questions!").font(.title).padding()
            Text("Do you want to continue talking?").font(.title).padding()
            HStack {
                NavigationLink(
                    destination: MessageScreenDetailedGroup().environmentObject(ChatHelper())) {
                    Text("Yes").fontWeight(.semibold)
                }.frame(minWidth: 0, maxWidth: 200, minHeight: 0, maxHeight: 50)
                .foregroundColor(.white)
                .font(.title2)
                .background(Color.blue)
                .cornerRadius(20)
                .padding()
                Button (action: { self.shouldPopToRootView = false } ){
                              Text("No")
                }.frame(minWidth: 0, maxWidth: 200, minHeight: 0, maxHeight: 50)
                .foregroundColor(.white)
                .font(.title2)
                .background(Color.gray)
                .cornerRadius(20)
                .padding()
            }
            Spacer()
        }
        }
    }
struct TalkChoiceViewGroup_Previews: PreviewProvider {
    static var previews: some View {
        TalkChoiceViewGroup(shouldPopToRootView: .constant(true))
    }
}

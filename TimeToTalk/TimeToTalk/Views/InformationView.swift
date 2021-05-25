//
//  InformationView.swift
//  TimeToTalk
//
//  Created by Denny Cox on 20/05/2021.
//

import SwiftUI

struct InformationView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "info.circle").font(Font.system(size: 30))
                Text("About talking").font(.title)
            }
            Text("Select the topic you want to talk about").font(.body).padding()
            Text("After this, we look for people that also want to talk about the same topic").font(.body).padding()
            Text("Next, everybody answers three introduction questions").font(.body).padding()
            Text("After that, continue talking or find other people").font(.body).padding()
            Spacer()
        }.navigationTitle("Information").padding()
        
    }
}

struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
        InformationView()
    }
}

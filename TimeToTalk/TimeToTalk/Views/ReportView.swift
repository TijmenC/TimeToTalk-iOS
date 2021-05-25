//
//  ReportView.swift
//  TimeToTalk
//
//  Created by Tijmen on 19/05/2021.
//

import SwiftUI

struct ReportView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var language = ["Inappropiate Language", "Bullying", "Self harm implications", "Other"]
    @State private var selectedReason = "Select"
    @State private var typingMessage = ""
    var userName: String
    var body: some View {
        VStack {
            Text(userName).font(.title2).bold()
            Form {
                Section{
            Picker("Report for", selection: $selectedReason) {
                ForEach(language, id: \.self) {
                    Text($0)
                }
            }.font(.title2)
                }
                Section {
                    TextField("Type the reason...", text: $typingMessage)
                        .textFieldStyle(MyTextFieldStyle())
                }
            }
            VStack {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "arrow.up")
                        .font(Font.system(size: 40)).foregroundColor(.white)
                })
                NavigationLink(
                    destination: TalkView(rootIsActive: .constant(true))) {
                    Text("Submit").foregroundColor(.white).fontWeight(.semibold).font(.title)
                }.frame(minWidth: 0, maxWidth: 500)
            }.frame(minWidth: 0, maxWidth: 200)
            .padding()
            .foregroundColor(.black)
            .font(.title2)
            .background(LinearGradient(gradient: Gradient(colors: [Color("DarkGreen"), Color("LightGreen")]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(20)
            .padding()
        }.navigationTitle("Report user")
        }
    struct MyTextFieldStyle: TextFieldStyle {
        func _body(configuration: TextField<Self._Label>) -> some View {
            configuration
            .padding()
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .topLeading)
        }
    }
    }


struct ReportView_Previews: PreviewProvider {
    static var previews: some View {
        ReportView(userName: DataSource.firstUser.name)
    }
}

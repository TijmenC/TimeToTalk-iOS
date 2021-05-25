//
//  SettingsView.swift
//  TimeToTalk
//
//  Created by Tijmen on 19/05/2021.
//

import SwiftUI

struct SettingsView: View {
    let dateFormatter: DateFormatter = {
          let formatter = DateFormatter()
          formatter.dateStyle = .long
          return formatter
      }()
    var language = ["English", "Dutch", "German", "French", "Mandarin"]
    @State private var birthDate = Calendar.current.date(byAdding: DateComponents(year: -20), to: Date()) ?? Date()
    @State private var selectedLanguage = "English"
    @State private var isAnonymous = false
    var body: some View {
        VStack {
            Image(systemName: "gearshape").padding()
                .font(Font.system(size: 60))
            Form {
                Section(header: Text("Personal information").font(.body)){
                    Text("Name                   " + DataSource.secondUser.name)
                    DatePicker(selection: $birthDate, in: ...Date(), displayedComponents: .date) {
                                 Text("Birthday")
                             }.pickerStyle(SegmentedPickerStyle())

                }.padding().font(.title2)
                Section(header: Text("Preferences").font(.body)){
                    Picker("Preferred language", selection: $selectedLanguage) {
                        ForEach(language, id: \.self) {
                            Text($0)
                        }
                    }.padding().font(.title2)
                }
               
                    Toggle(isOn: $isAnonymous) {
                        Text("Always talk anonymously").font(.title2)
                    }.padding()
                }
                
            }
        .navigationTitle("Settings")
        }
    }


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

//
//  Settings.swift
//  SwiftUIDemo
//
//  Created by LEE on 2019/10/19.
//  Copyright © 2019 Lee. All rights reserved.
//

import SwiftUI

struct Settings: View {
    @State var toggleOn = true
    @State var number = 1
    @State var selection = 1
    @State var date = Date()
    @State var email = ""
    @State var submit = false
    var body: some View {
        NavigationView {
            Form {
                Toggle(isOn: $toggleOn) {
                    Text("Hello")
                }
                Stepper(value: $number, in: 1...10) {
                    Text("\(number) WORLD\(number > 1 ? "s" : "")")
                }
                Picker(selection: $selection, label: Text("Picker")) {
                    Text("111").tag(1)
                    Text("222").tag(2)
                }
                DatePicker(selection: $date, label: { Text("Date") })
                Section(header: Text("Email")) {
                    TextField("your email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                Button(action: {self.submit.toggle()}) {
                    Text("submit")
                }
                .alert(isPresented: $submit) {
                    Alert(title: Text("Thanks"), message: Text("\(email)"))
                }
                
            }
            .navigationBarTitle("Settings")
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}

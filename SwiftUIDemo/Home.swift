//
//  Home.swift
//  SwiftUIDemo
//
//  Created by Lee on 2019/9/25.
//  Copyright © 2019 Lee. All rights reserved.
//

import SwiftUI

struct Home: View {
    
    @State var show: Bool = false
    @State var showProfile: Bool = false
    
    var body: some View {
        ZStack {
            
            HomeList()
                .blur(radius: show ? 20 : 0)
                .scaleEffect(showProfile ? 0.95 : 1)
                .animation(.default)
            
            ContentView()
                .cornerRadius(30)
                .shadow(radius: 20)
                .animation(.spring())
                .offset(y: showProfile ? 40 : UIScreen.main.bounds.height)
            
            MenuButton(show: $show)
                .offset(x: -30, y: showProfile ? 0 : 80)
                .animation(.spring())

            MenuRight(show: $showProfile)
                .offset(x: -16, y: showProfile ? 0 : 88)
                .animation(.spring())

            MenuView(show: $show)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct MenuRow: View {
    var image = "person.crop.circle"
    var text = "Hello World!"
    var body: some View {
        HStack {
            Image(systemName: image)
                .imageScale(.large)
                .foregroundColor(.red)
                .frame(width: 32, height: 32)
            Text(text)
                .font(.headline)
            Spacer()
        }
    }
}

struct Menu: Identifiable {
    var id = UUID()
    var title : String
    var icon : String
}

let menuData = [
    Menu(title: "Hello World!", icon: "person.crop.circle"),
    Menu(title: "lee", icon: "square.and.arrow.up"),
    Menu(title: "Hello jiang", icon: "trash"),
    Menu(title: "Hello bo", icon: "paperplane"),
]


struct MenuView: View {
    
    @Binding var show : Bool
    let menu = menuData
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            ForEach(menu) { item in
                MenuRow(image: item.icon, text: item.title)
            }
            Spacer()
        }
        .padding(.top, 20)
        .padding(30)
        .background(Color.white)
        .frame(minWidth: 0, maxWidth: .infinity)
        .cornerRadius(30.0)
        .padding(.trailing, 60)
        .shadow(radius: 20)
        .animation(.default)
        .rotation3DEffect(Angle(degrees: show ? 0 : 60), axis: (x: 0, y: 10.0, z: 0))
        .offset(x: show ? 0 : -UIScreen.main.bounds.width)
        .onTapGesture {
            self.show.toggle()
        }
    }
}

struct CircleButton: View {
    var icon = "person.crop.circle"
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.black)
        }
        .frame(width: 44, height: 44)
        .background(Color.white)
        .cornerRadius(22)
        .shadow(color: Color("buttonShadow"), radius: 10, x: 0, y: 10)
    }
}

struct MenuButton: View {
    @Binding var show : Bool
    var body: some View {
        VStack() {
            HStack {
                Button(action: {
                    self.show.toggle()
                }) {
                    HStack {
                        Spacer()
                        Image(systemName: "list.dash")
                            .foregroundColor(.black)
                    }
                    .padding(.trailing, 20)
                    .frame(width: 90, height: 60)
                    .background(Color.white)
                    .cornerRadius(30)
                    .shadow(color: Color("buttonShadow"), radius: 10, x: 0, y: 10)
                }
                Spacer()
            }
            Spacer()
        }
    }
}

struct MenuRight: View {
    @Binding var show : Bool
    var body: some View {
        VStack() {
            HStack {
                Spacer()
                Button(action: {
                    self.show.toggle()
                }) {
                    CircleButton(icon: "person.crop.circle")
                }
                
                Button(action: {
                    self.show.toggle()
                }) {
                    CircleButton(icon: "bell")
                }
            }
            Spacer()
        }
    }
}

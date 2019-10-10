//
//  UpdateList.swift
//  SwiftUIDemo
//
//  Created by LEE on 2019/10/9.
//  Copyright © 2019 Lee. All rights reserved.
//

import SwiftUI

struct UpdateList: View {
    
    var updates = updateDate
    
    @State var present = false
    
    var body: some View {
        NavigationView {
            List(updates) { item in
                NavigationLink(destination: UpdateDetail(title: item.title, text: item.text, image: item.image)) {
                    HStack(spacing: 12.0) {
                        Image(item.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                            .background(Color("background"))
                            .cornerRadius(20)
                            
                        VStack(alignment: .leading) {
                            Text(item.title)
                                .font(.headline)
                            Text(item.text)
                                .lineLimit(2)
                                .lineSpacing(4)
                                .font(.subheadline)
                            Text(item.date)
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundColor(.gray)
                        }
                    }
                }
                .padding(.vertical, 8)
            }
            .navigationBarTitle("Updates")
            .navigationBarItems(trailing:
                Button(action: {
                    self.present.toggle()
                }) {
                    Image(systemName: "gear")
                }
                .sheet(isPresented: $present, content: {
                    Text("hehe")
                })
            )
        }
    }
}

struct UpdateList_Previews: PreviewProvider {
    static var previews: some View {
        UpdateList()
    }
}

struct Update: Identifiable {
    var id = UUID()
    var image: String
    var title: String
    var text: String
    var date: String
}

let updateDate = [
    Update(image: "Illustration1", title: "swiftui", text: "大家忽视覅偶尔回复而韩国is的hi多少个is多个收到货IGis个his读后感is多个hi韩国ID深V出魔抗VBUI欧盟是的归属感就是 属地化工is多个hi是个 是个hi第三帝国会死哦低功耗is电话公司工会", date: "JUN 26"),
    Update(image: "Illustration2", title: "swiftui", text: "大家忽视覅偶尔回复而韩国is的hi多少个is多个收到货IGis个his读后感is多个hi韩国ID深V出魔抗VBUI欧盟是的归属感就是 属地化工is多个hi是个 是个hi第三帝国会死哦低功耗is电话公司工会", date: "JUN 26"),
    Update(image: "Illustration3", title: "swiftui", text: "大家忽视覅偶尔回复而韩国is的hi多少个is多个收到货IGis个his读后感is多个hi韩国ID深V出魔抗VBUI欧盟是的归属感就是 属地化工is多个hi是个 是个hi第三帝国会死哦低功耗is电话公司工会", date: "JUN 26"),
    Update(image: "Illustration4", title: "swiftui", text: "大家忽视覅偶尔回复而韩国is的hi多少个is多个收到货IGis个his读后感is多个hi韩国ID深V出魔抗VBUI欧盟是的归属感就是 属地化工is多个hi是个 是个hi第三帝国会死哦低功耗is电话公司工会", date: "JUN 26"),
    Update(image: "Certificate1", title: "swiftui", text: "大家忽视覅偶尔回复而韩国is的hi多少个is多个收到货IGis个his读后感is多个hi韩国ID深V出魔抗VBUI欧盟是的归属感就是 属地化工is多个hi是个 是个hi第三帝国会死哦低功耗is电话公司工会", date: "JUN 26"),
    Update(image: "Certificate2", title: "swiftui", text: "大家忽视覅偶尔回复而韩国is的hi多少个is多个收到货IGis个his读后感is多个hi韩国ID深V出魔抗VBUI欧盟是的归属感就是 属地化工is多个hi是个 是个hi第三帝国会死哦低功耗is电话公司工会", date: "JUN 26"),
    Update(image: "Certificate3", title: "swiftui", text: "大家忽视覅偶尔回复而韩国is的hi多少个is多个收到货IGis个his读后感is多个hi韩国ID深V出魔抗VBUI欧盟是的归属感就是 属地化工is多个hi是个 是个hi第三帝国会死哦低功耗is电话公司工会", date: "JUN 26"),
]

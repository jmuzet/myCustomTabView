//
//  CustomTabView.swift
//  CustomTabView
//
//  Created by Jerome on 08/07/2024.
//

import SwiftUI

public struct CustomTabView: View {
    private let titles: [String]
    private let icons: [String]
    private let tabViews: [AnyView]
    
    @State private var selection = 0
    @State private var indexHovered = -1
    
    public init(content: [(title: String, icon: String, view: AnyView)]) {
        self.titles = content.map{ $0.title }
        self.icons = content.map{ $0.icon }
        self.tabViews = content.map{ $0.view }
    }
    
    public var tabBar: some View {
        HStack {
            Spacer()
            ForEach(0..<titles.count, id: \.self) { index in

                VStack {
                    Image(systemName: self.icons[index])
                        .font(.largeTitle)
                    Text(self.titles[index])
                }
                .frame(height: 30)
                .padding(15)
                .background(Color.gray.opacity(((self.selection == index) || (self.indexHovered == index)) ? 0.3 : 0),
                            in: RoundedRectangle(cornerRadius: 8, style: .continuous))

                .frame(height: 80)
                .padding(.horizontal, 0)
                .foregroundColor(self.selection == index ? Color("SettingsV4") : Color("SettingsV5"))
                .onHover(perform: { hovering in
                    if hovering {
                        indexHovered = index
//                        print ("\(hovering) on \(indexHovered)")
                    } else {
                        indexHovered = -1
                    }
                })
                .onTapGesture {
                    self.selection = index
                }
            }
            Spacer()
        }
        .padding(0)
        .background(Color("SettingsV1"))
    }

    public var body: some View {
        VStack(spacing: 0) {
            tabBar

            tabViews[selection]
                .padding(0)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .padding(0)
    }
}

#Preview {
//    ContentView()
    CustomTabView(content: [
        (title: "Tab 1", icon: "apple.logo", view: AnyView(Text("Tab #1"))),
        (title: "Tab 2", icon: "apple.logo", view: AnyView(Text("Tab #2"))),
        (title: "Tab 3", icon: "apple.logo", view: AnyView(Text("Tab #3")))])
}

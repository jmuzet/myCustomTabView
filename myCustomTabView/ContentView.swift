//
//  ContentView.swift
//  myCustomTabView
//
//  Created by Jerome on 16/07/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        CustomTabView(
            content: [
                (
                    title: "Profile",
                    icon: "person.crop.circle",
                    view: AnyView (
                        ProfileSettingsView()
                    )
                ),
                (
                    title: "Appearance",
                    icon: "paintpalette",
                    view: AnyView(
                        AppearanceSettingsView()
                    )
                ),
                (
                    title: "Privacy",
                    icon: "hand.raised",
                    view: AnyView (
                        PrivacySettingsView()
                    )
                ),
                (
                    title: "Folders",
                    icon: "folder.badge.gearshape",
                    view: AnyView (
                        FoldersSettingsView()
                    )
                ),
                (
                    title: "Paint",
                    icon: "paintbrush",
                    view: AnyView(
                        PaintSettingsView()
                    )
                ),
                (
                    title: "Draw",
                    icon: "paintbrush.pointed",
                    view: AnyView(
                        DrawSettingsView()
                    )
                ),
                (
                    title: "Apple",
                    icon: "apple.logo",
                    view: AnyView(
                        AppleSettingsView()
                    )
                )
            ]
        )
    }
}

#Preview {
    ContentView()
}

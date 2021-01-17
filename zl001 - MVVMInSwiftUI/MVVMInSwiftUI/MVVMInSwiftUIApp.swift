//
//  MVVMInSwiftUIApp.swift
//  MVVMInSwiftUI
//
//  Created by huang on 2021/1/17.
//

import SwiftUI

@main
struct MVVMInSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: PersonInfo())
        }
    }
}

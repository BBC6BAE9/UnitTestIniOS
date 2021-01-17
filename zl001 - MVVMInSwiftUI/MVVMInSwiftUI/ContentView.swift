//
//  ContentView.swift
//  TryYiTry
//
//  Created by huang on 2021/1/16.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: PersonInfo
    var body: some View {
        Text(viewModel.displayText)
            .padding()
            .onTapGesture(perform: {
                viewModel.newScore(score:2)
            });
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: PersonInfo())
    }
}

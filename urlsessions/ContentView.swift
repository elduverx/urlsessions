//
//  ContentView.swift
//  urlsessions
//
//  Created by duverney muriel on 7/08/23.
//

import SwiftUI

struct ContentView: View {
    private var viewModel: ViewModel = ViewModel()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Button("http request") {
                    viewModel.getApi()
            }

        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

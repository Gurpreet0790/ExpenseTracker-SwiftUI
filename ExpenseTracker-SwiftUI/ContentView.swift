//
//  ContentView.swift
//  ExpenseTracker-SwiftUI
//
//  Created by ReetDhillon on 2024-01-30.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            ScrollView{
                
            }
            .background(Color.gray)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    Image(systemName: "bell.badge")
                        .renderingMode(.original)
                        .symbolRenderingMode(.palette)
                        .foregroundColor(.blue)
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}

#Preview {
    ContentView()
}

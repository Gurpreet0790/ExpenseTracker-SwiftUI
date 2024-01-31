//
//  ExpenseTracker_SwiftUIApp.swift
//  ExpenseTracker-SwiftUI
//
//  Created by ReetDhillon on 2024-01-30.
//

import SwiftUI

@main
struct ExpenseTracker_SwiftUIApp: App {
   @StateObject var transactionListVM = TransactionListViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListVM)
        }
    }
}

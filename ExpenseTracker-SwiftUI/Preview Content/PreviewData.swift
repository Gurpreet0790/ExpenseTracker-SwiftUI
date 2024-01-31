//
//  PreviewData.swift
//  ExpenseTracker-SwiftUI
//
//  Created by ReetDhillon on 2024-01-31.
//

import Foundation

var transactionPreviewData = Transaction(id: 1, date: "01/02/2024", institution: "Sviet", account: "Visa Account", merchant: "Apple", amount: 15.50, type: "debit", categoryId: 101, category: "Software", isPending: false, isTransafer: false, isExpense: true, isEdited: false)

var transactionListPreviewData = [Transaction](repeating: transactionPreviewData, count: 10)
 

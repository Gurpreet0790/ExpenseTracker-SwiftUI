//
//  TransactionModel.swift
//  ExpenseTracker-SwiftUI
//
//  Created by ReetDhillon on 2024-01-31.
//

import Foundation
import SwiftUIFontIcon

struct Transaction: Identifiable, Decodable, Hashable {
    let id : Int
    let date : String
    let institution: String
    let account: String
    var merchant: String
    let amount: Double
    let type: TransactionType.RawValue
    var categoryId: Int
    var category: String
    let isPending: Bool
    var isTransafer: Bool
    var isExpense: Bool
    var isEdited: Bool
    
    var dateParsed: Date {
        date.dateParsed()
    }
    
    var signedAmount : Double {
        return type == TransactionType.credit.rawValue ? amount : -amount
    }
}

enum TransactionType: String {
    case debit = "debit"
    case credit = "credit"
}

struct Category {
    let id: Int
    let name: String
    let icon: FontAwesomeCode
    var mainCategoryId: Int?
}

extension Category{
    static let entertainment = Category(id: 1, name: "Entertainment", icon: .film)
    static let billsAndUtilities = Category(id: 2, name: "Bills & Utilities", icon: .file_invoice_dollar)
    static let autoAndTransport = Category(id: 3, name: "Auto & Transport", icon: .car_alt)
    
    static let publicTransportation = Category(id: 4, name: "Public Transportation", icon: .film)
    static let taxi = Category(id: 5, name: "Taxi", icon: .file_invoice_dollar)
    static let moviesAndDVD = Category(id: 6, name: "Movies & DVD's", icon: .car_alt)
}

extension Category {
    static let categories : [Category] = [
        .entertainment,
        .billsAndUtilities,
        .autoAndTransport,

    ]
    
    static let subCategories : [Category] = [
        .publicTransportation,
        .taxi,
        .moviesAndDVD,
    ]
    
    static let all : [Category] = categories + subCategories
}


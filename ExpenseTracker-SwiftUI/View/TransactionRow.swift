//
//  TransactionRow.swift
//  ExpenseTracker-SwiftUI
//
//  Created by ReetDhillon on 2024-01-31.
//

import SwiftUI
import SwiftUIFontIcon

struct TransactionRow: View {
    var transaction : Transaction
    
    var body: some View {
        HStack(spacing: 20)
        {
            //Mark: - Trsanction Category Icon
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: .continuous)
                .fill(Color.iconColor.opacity(0.3))
                .frame(width: 44, height: 44)
                .overlay {
                    FontIcon.text(.awesome5Solid(code: .icons), fontsize: 24, color: Color.iconColor)
                }
            
            VStack(alignment: .leading, spacing: 8) {
                //Mark: - Trsanction Merchant
                Text(transaction.merchant)
                    .font(.subheadline)
                    .bold()
                    .lineLimit(1)
                
                //Mark: - Trsanction Category
                Text(transaction.category)
                    .font(.footnote)
                    .bold()
                    .lineLimit(1)
                
                //Mark: - Trsanction Date
                Text(transaction.dateParsed, format: .dateTime.year().month().day())
                    .font(.footnote)
                    .foregroundColor(.secondary)
                
            }
            
             Spacer()
            //Mark: - Trsanction Amount
            Text(transaction.signedAmount, format: .currency(code: "USD"))
                .bold()
                .foregroundColor(transaction.type == TransactionType.credit.rawValue ? Color.textColor : .primary)
            
            
        }
        .padding([.top, .bottom], 10)
    }
}

#Preview {
    TransactionRow(transaction: transactionPreviewData)
}

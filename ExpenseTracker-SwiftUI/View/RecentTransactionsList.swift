//
//  RecentTransactionsList.swift
//  ExpenseTracker-SwiftUI
//
//  Created by ReetDhillon on 2024-02-01.
//

import SwiftUI

struct RecentTransactionsList: View {
    var body: some View {
        VStack{
            HStack{
                //MARK: Header Title
                Text("Recent Transactions")
                    .bold()
                
                Spacer()
                
                //MARK: Header Link
                NavigationLink{
                    
                } label:{
                    HStack(spacing:4){
                        Text("See All")
                        Image(systemName: "chevron.right")
                        
                    }
                    .foregroundColor( Color.textColor)
                }
                
                
            }
            .padding(.top)
        }
        .padding()
        .background(Color.systemBackgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 20 ,style:.continuous))
        .shadow(color: Color.primary.opacity(0.2), radius: 10, x: 0, y: 5)
    }
}

#Preview {
    RecentTransactionsList()
}
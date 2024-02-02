//
//  TransactionListViewModel.swift
//  ExpenseTracker-SwiftUI
//
//  Created by ReetDhillon on 2024-01-31.
//

import Foundation
import Combine

final class TransactionListViewModel: ObservableObject {
    @Published var transactions : [Transaction] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    init()
    {
        getTransactions()
    }
    func getTransactions () {
        guard let url = URL(string: "https://designcode.io/data/transactions.json") else {
            print("Invalid URL")
            return}
        
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { (data, response) -> Data in
                print("data is", data)
                print("response", response)
                print("httpsResponse.statusCode", response as? HTTPURLResponse ?? "")
                guard let httpsResponse = response as? HTTPURLResponse, httpsResponse.statusCode == 200 else {
                    dump(response) //Dump is like print but in a more readble format, good for looging objects
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: [Transaction].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink{ completion in
                switch completion {
                case .failure (let error):
                    print("Error Fetching Transactions", error.localizedDescription)
                case .finished:
                    print("Finished Fetching Transactions")
                }
                } receiveValue: { [weak self] result in
                    self?.transactions = result
//                    dump(self?.transactions)
                }
                .store(in: &cancellables)
    }
    
}

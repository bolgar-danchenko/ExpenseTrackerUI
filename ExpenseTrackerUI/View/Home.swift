//
//  Home.swift
//  ExpenseTrackerUI
//
//  Created by Konstantin Bolgar-Danchenko on 22.01.2023.
//

import SwiftUI

struct Home: View {
    @StateObject var expenseViewModel: ExpenseViewModel = .init()
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 12) {
                HStack(spacing: 15) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Welcome,")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                        
                        Text("Constantine")
                            .font(.title2.bold())
                    } // VStack
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    NavigationLink {
                        FilteredDetailView()
                            .environmentObject(expenseViewModel)
                    } label: {
                        Image(systemName: "hexagon.fill")
                            .foregroundColor(.gray)
                            .overlay(content: {
                                Circle()
                                    .stroke(.white, lineWidth: 2)
                                    .padding(7)
                            })
                            .frame(width: 40, height: 40)
                            .background(Color.white, in:
                                            RoundedRectangle(
                                                cornerRadius: 10,
                                                style: .continuous))
                            .shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: 5)
                    }

                } // HStack
                ExpenseCard()
                    .environmentObject(expenseViewModel)
                TransactionsView()
            } // VStack
            .padding()
        } // Scrollview
        .background {
            Color("background")
                .ignoresSafeArea()
        }
        .fullScreenCover(isPresented: $expenseViewModel.addNewExpense) {
            expenseViewModel.clearData()
        } content: {
            NewExpense()
                .environmentObject(expenseViewModel)
        }
        .overlay(alignment: .bottomTrailing) {
            AddButton()
        }
    } // body
    
    // MARK: Add New Expense Button
    @ViewBuilder
    func AddButton() -> some View {
        Button {
            expenseViewModel.addNewExpense.toggle()
        } label: {
            Image(systemName: "plus")
                .font(.system(size: 25, weight: .medium))
                .foregroundColor(.white)
                .frame(width: 55, height: 55)
                .background {
                    Circle()
                        .fill(.linearGradient(colors: [
                            Color("gradient1"),
                            Color("gradient2"),
                            Color("gradient3"),
                        ], startPoint: .topLeading, endPoint: .bottomTrailing))
                }
                .shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: 5)
        }
        .padding()
    }
    
    // MARK: Transactions View
    @ViewBuilder
    func TransactionsView() -> some View {
        VStack(spacing: 15) {
            Text("Transactions")
                .font(.title2.bold())
                .opacity(0.7)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom)
            
            ForEach(expenseViewModel.expenses) { expense in
                // MARK: Transaction Card View
                TransactionCardView(expense: expense)
                    .environmentObject(expenseViewModel)
            }
        } // VStack
        .padding(.top)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

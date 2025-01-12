import SwiftUI

struct ContentView: View {
    @State private var totalIncome = 0
    @State private var totalExpenses = 0
    
    @State private var income: String = "Enter Income"
    @State private var expenses: String = "Enter Expenses"
    @State var emptyIncomeArr: [Int] = []
    @State var emptyExpensesArr: [Int] = []
    
    var body: some View {
        VStack(spacing: 20) {
            VStack {
                HStack {
                    Text("Expenses")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .bold))
                    Spacer()
                }
                HStack(spacing: 50) {
                    Text("Incomes")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .bold))
                    Button(action: {
                        emptyIncomeArr.append(0)
                    }) {
                        RoundedRectangle(cornerRadius:5)
                            .frame(width: 50, height: 30)
                            .overlay(
                                Image(systemName: "plus")
                                    .foregroundColor(.white)
                            )
                    }
                    Button(action: {
                        emptyIncomeArr.removeLast()
                    }) {
                        RoundedRectangle(cornerRadius:5)
                            .frame(width: 50, height: 30)
                            .overlay(
                                Image(systemName: "minus")
                                    .foregroundColor(.white)
                            )
                    }
                    Spacer()
                }
                ScrollView {
                    ForEach(0..<emptyIncomeArr.count, id: \.self) { index in
                        HStack {
                            NumberTextField(textFieldName: income, textFieldValue: $emptyIncomeArr[index])
                        }
                    }
                    Text("Total Income: \(totalIncome)")
                }
                .onChange(of: emptyIncomeArr) { income in
                    totalIncome = income.reduce(0, +)
                }
            }
            
            VStack {
                HStack(spacing: 50) {
                    Text("Expenses")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .bold))
                    Button(action: {
                        emptyExpensesArr.append(0)
                    }) {
                        RoundedRectangle(cornerRadius:5)
                            .frame(width: 50, height: 30)
                            .overlay(
                                Image(systemName: "plus")
                                    .foregroundColor(.white)
                            )
                    }
                    Button(action: {
                        emptyExpensesArr.removeLast()
                    }) {
                        RoundedRectangle(cornerRadius:5)
                            .frame(width: 50, height: 30)
                            .overlay(
                                Image(systemName: "minus")
                                    .foregroundColor(.white)
                            )
                    }
                    Spacer()
                }
                ScrollView {
                    ForEach(0..<emptyExpensesArr.count, id: \.self) { index in
                        NumberTextField(textFieldName: expenses, textFieldValue: $emptyExpensesArr[index])
                    }
                    Text("Total Expenses: \(totalExpenses)")
                }
                .onChange(of: emptyExpensesArr) { expenses in
                    totalExpenses = expenses.reduce(0, +)
                }
                
            }
            Spacer()
            HStack {
                Text("Your Budget is: \(totalIncome - totalExpenses)")
                    .foregroundColor(.white)
                    .font(.system(size: 26, weight: .heavy))
                Spacer()
            }
        }
        .padding()
    }
}
struct NumberTextField: View {
    @State var textFieldName: String
    @Binding var textFieldValue: Int
    var body: some View {
        TextField(textFieldName, value: $textFieldValue, format: .number)
            .textFieldStyle(.roundedBorder)
    }
}

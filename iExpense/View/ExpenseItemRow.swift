import SwiftUI

struct ExpenseItemRow: View {
    
    var item: ExpenseItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text(item.type)
            }
            Spacer()
            Text("$\(item.amount)").expenseStyle(with: item.amount)
        }
    }
}

struct ExpenseItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseItemRow(item: ExpenseItem(name: "iPhone", type: "Personal", amount: 500))
    }
}

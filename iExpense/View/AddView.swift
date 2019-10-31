import SwiftUI

struct AddView: View {
    
    @ObservedObject var expenses: Expenses
    @Environment(\.presentationMode) var presentationMode
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = ""
    @State private var showValidationError = false
    
    static let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                Picker("Type", selection: $type) {
                    ForEach(Self.types, id: \.self) {
                        Text($0)
                    }
                }
                TextField("Amount", text: $amount)
                    .keyboardType(.numberPad)
            }
        .alert(isPresented: $showValidationError, content: {
            Alert(title: Text("Whaat?"), message: Text("Dude, that's not an amount"), dismissButton: .default(Text("Ok"), action: { self.amount = "" }))
        })
            .navigationBarTitle("Add new expense")
            .navigationBarItems(trailing: Button("Save") {
                guard let actualAmount = Int(self.amount) else {
                    self.showValidationError = true
                    return
                }
                let item = ExpenseItem(name: self.name, type: self.type, amount: actualAmount)
                self.expenses.items.append(item)
                self.presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var listRowGradient: some View {
        LinearGradient(
            gradient: Gradient(
                 colors: [
                     Color("BG-gradient-start"),
                     Color("BG-gradient-end")
            ]),
            startPoint: .top,
            endPoint: .bottom)
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                listRowGradient.edgesIgnoringSafeArea(.all)
                List {
                    ForEach(expenses.items) { item in
                        ExpenseItemRow(item: item)
                    }
                    .onDelete(perform: removeItems)
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: self.expenses)
            }
            .navigationBarTitle("iExpense")
            .navigationBarItems(
                leading: EditButton(),
                trailing: Button(action: {
                    self.showingAddExpense = true
                }) {
                    Image(systemName: "plus")
            })
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

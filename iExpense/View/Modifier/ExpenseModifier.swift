import SwiftUI

struct ExpenseModifier: ViewModifier {
    
    let amount: Int
    let font: Font
    let color: Color
    
    init(amount: Int) {
        self.amount = amount
        if amount < 10 {
            self.font = .body
            self.color = Color.primary
            
        } else if amount < 100 {
            self.font = .title
            self.color = Color.orange
        } else {
            self.font = .largeTitle
            self.color = Color.red
        }
    }
    
    func body(content: Content) -> some View {
        content.font(self.font).foregroundColor(self.color)
    }
}

extension View {
    
    func expenseStyle(with amount: Int) -> some View {
        return self.modifier(ExpenseModifier(amount: amount))
    }
    
}

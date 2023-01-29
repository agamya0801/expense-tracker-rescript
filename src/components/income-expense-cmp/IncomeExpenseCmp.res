%%raw("import './IncomeExpenseCmp.css'")

@react.component
let make = (~transactions: array<Transaction.t>) => {
  let netIncome = AmountUtils.calculateIncome(~transactions = transactions)
  let netExpense = AmountUtils.calculateExpense(~transactions = transactions)
  let netIncome = AmountUtils.getShortenedAmount(~amount = netIncome)
  let netExpense = AmountUtils.getShortenedAmount(~amount = netExpense)

  <div className="income-expense-container">
    <div className="income-container">
      <p className="income-title">{"INCOME" -> React.string}</p>
      <p className="income-amount">{AmountUtils.getAmountString(netIncome) -> React.string}</p>
    </div>
    <div className="vertical-line"></div>
    <div className="expense-container">
      <p className="expense-title">{"EXPENSE" -> React.string}</p>
      <p className="expense-amount">{AmountUtils.getAmountString(netExpense) -> React.string}</p>
    </div>
  </div>
}
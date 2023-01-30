%%raw("import './IncomeExpenseCmp.css'")

@react.component
let make = (~transactions: array<Transaction.t>) => {
  open AmountUtils
  let netIncome = calculateIncome(~transactions = transactions)
  let netExpense = calculateExpense(~transactions = transactions)
  let netIncomeString = getAmountString(netIncome)
  let netExpenseString = getAmountString(netExpense)
  let netExpenseString = Js.String.sliceToEnd(~from=1, netExpenseString)

  <div className="income-expense-container">
    <div className="income-container">
      <p className="income-title">{"INCOME" -> React.string}</p>
      <p className="income-amount">{netIncomeString -> React.string}</p>
    </div>
    <div className="vertical-line"></div>
    <div className="expense-container">
      <p className="expense-title">{"EXPENSE" -> React.string}</p>
      <p className="expense-amount">{netExpenseString -> React.string}</p>
    </div>
  </div>
}
%%raw("import './IncomeExpenseCmp.css'")

@react.component
let make = (~transactions: array<TransactionType.t>) => {
  let netIncome = AmountUtils.calculateIncome(~transactions = transactions)
  let netExpense = AmountUtils.calculateExpense(~transactions = transactions)
  let netExpense = netExpense *. -1.0
  let isRoundedInc = AmountUtils.isRounded(~amount = netIncome)
  let isRoundedExp = AmountUtils.isRounded(~amount = netExpense)
  let netIncome = AmountUtils.round(~amount = netIncome, ~isRoundedAmount = isRoundedInc)
  let netExpense = AmountUtils.round(~amount = netExpense, ~isRoundedAmount = isRoundedExp)

  <div className="income-expense-container">
    <div className="income-container">
      <p className="income-title">{"INCOME" -> React.string}</p>
      <p className="income-amount">{`\u20B9${netIncome}` -> React.string}</p>
    </div>
    <div className="vertical-line"></div>
    <div className="expense-container">
      <p className="expense-title">{"EXPENSE" -> React.string}</p>
      <p className="expense-amount">{`\u20B9${netExpense}` -> React.string}</p>
    </div>
  </div>
}
%%raw("import './IncomeExpense.css'")

@react.component
let make = (~transactions: array<Transaction.t>) => {
  let netIncome = CalculateAmounts.calculateIncome(~transactions = transactions)
  let netExpense = CalculateAmounts.calculateExpense(~transactions = transactions)
  let netExpense = netExpense *. -1.0
  let isRoundedInc = IsRoundedAmount.isRounded(~amount = netIncome)
  let isRoundedExp = IsRoundedAmount.isRounded(~amount = netExpense)
  let netIncome = AmountRoundOf.round(~amount = netIncome, ~isRoundedAmount = isRoundedInc)
  let netExpense = AmountRoundOf.round(~amount = netExpense, ~isRoundedAmount = isRoundedExp)

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
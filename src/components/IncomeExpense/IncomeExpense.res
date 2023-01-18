%%raw("import './IncomeExpense.css'")

@react.component
let make = (~transactions: array<Transaction.t>) => {
  let netIncome = Belt.Array.reduce(
                    transactions, 
                    0.0, 
                    (acc, value) => (Belt.Float.fromString(value.amount) >= Some(0.0) ? acc +. switch Belt.Float.fromString(value.amount) { | None => 0. | Some(v) => v } : acc +. 0.0)
                  )

  let netExpense = Belt.Array.reduce(
                    transactions, 
                    0.0, 
                    (acc, value) => (Belt.Float.fromString(value.amount) < Some(0.0) ? acc +. switch Belt.Float.fromString(value.amount) { | None => 0. | Some(v) => v } : acc +. 0.0)
                  )

  let netExpense = netExpense *. -1.0
  let isRoundedPos = netIncome >= 10000000.0 ? true : false
  let isRoundedNeg = netExpense >= 10000000.0 ? true: false
  let netIncome = isRoundedPos ? Js.String.concat("K", Js.Float.toFixedWithPrecision((netIncome /. 10000000.0), ~digits=2)) : Js.Float.toFixedWithPrecision(netIncome, ~digits=2)
  let netExpense = isRoundedNeg ? Js.String.concat("K", Js.Float.toFixedWithPrecision((netExpense /. 10000000.0), ~digits=2)) : Js.Float.toFixedWithPrecision(netExpense, ~digits=2)

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
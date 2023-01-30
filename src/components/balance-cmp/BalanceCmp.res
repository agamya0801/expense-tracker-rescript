%%raw("import './BalanceCmp.css'")
@react.component
let make = (~transactions: array<Transaction.t>) => {
  open AmountUtils
  let netBalance = calculateBalance(~transactions = transactions)
  let color = getAmountColourClassName(netBalance)
  let netBalanceString = getAmountString(netBalance)
  <div className="balance-container">
    <p className="balance-title">{"YOUR BALANCE" -> React.string}</p>
    <p className=`balance-amount ${color}`>{netBalanceString -> React.string}</p>
  </div>
}
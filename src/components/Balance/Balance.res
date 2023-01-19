%%raw("import './Balance.css'")
@react.component
let make = (~transactions: array<TransactionType.t>) => {
  let netBalance = AmountUtils.calculateBalance(~transactions = transactions)
  let sign = AmountUtils.check(~amount = netBalance)
  let color = netBalance >= 0.0 ? "positive-text" : "negative-text"
  let isRoundedBal = AmountUtils.isRounded(~amount = netBalance)
  let netBalance = AmountUtils.round(~isRoundedAmount = isRoundedBal, ~amount = netBalance)
  let netBalance = AmountUtils.refactor(~amount = netBalance)
  <div className="balance-container">
    <p className="balance-title">{"YOUR BALANCE" -> React.string}</p>
    <p className=`balance-amount ${color}`>{`${sign} \u20B9${netBalance}` -> React.string}</p>
  </div>
}
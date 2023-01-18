%%raw("import './Balance.css'")
@react.component
let make = (~transactions: array<Transaction.t>) => {
  let netBalance = CalculateAmounts.calculateBalance(~transactions = transactions)
  let sign = CheckSign.check(~amount = netBalance)
  let color = netBalance >= 0.0 ? "positive-text" : "negative-text"
  let isRoundedBal = IsRoundedAmount.isRounded(~amount = netBalance)
  let netBalance = AmountRoundOf.round(~isRoundedAmount = isRoundedBal, ~amount = netBalance)
  let netBalance = RefactorNegAmount.refactor(~amount = netBalance)
  <div className="balance-container">
    <p className="balance-title">{"YOUR BALANCE" -> React.string}</p>
    <p className=`balance-amount ${color}`>{`${sign} \u20B9${netBalance}` -> React.string}</p>
  </div>
}
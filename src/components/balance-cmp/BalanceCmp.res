%%raw("import './BalanceCmp.css'")
@react.component
let make = (~transactions: array<Transaction.t>) => {
  open AmountUtils
  let netBalance = calculateBalance(~transactions = transactions)
  let sign = getSign(~amount = netBalance)
  let color = getAmountColourClassName(netBalance)
  let netBalance = getShortenedAmount(~amount = netBalance)
  <div className="balance-container">
    <p className="balance-title">{"YOUR BALANCE" -> React.string}</p>
    <p className=`balance-amount ${color}`>{`${sign} \u20B9${netBalance}` -> React.string}</p>
  </div>
}
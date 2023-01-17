%%raw("import './Balance.css'")
@react.component
let make = (~transactions: array<Transaction.t>) => {
  let netBalance = Belt.Array.reduce(
                    transactions, 
                    0.0, 
                    (acc, value) => acc +. switch Belt.Float.fromString(value.amount) { | None => 0. | Some(v) => v }
                  )

  let sign = netBalance >= 0.0 ? "" : "-"
  let color = netBalance >= 0.0 ? "positive-text" : "negative-text"
  let netBalance = Js.Float.toFixedWithPrecision(netBalance, ~digits=2)
  let netBalance = Belt.Float.fromString(netBalance) < Some(0.0) ? Js.String.sliceToEnd(~from=1, netBalance) : netBalance
  <div className="balance-container">
    <p className="balance-title">{"YOUR BALANCE" -> React.string}</p>
    <p className=`balance-amount ${color}`>{`${sign} \u20B9${netBalance}` -> React.string}</p>
  </div>
}
%%raw("import './Balance.css'")
@react.component
let make = (~transactions: array<Transaction.t>) => {
  let netBalance = Belt.Array.reduce(
                    transactions, 
                    0.0, 
                    (acc, value) => acc +. switch Belt.Float.fromString(value.amount) { | None => 0. | Some(v) => v }
                  )
    // let color = "positive-text" -> React.string
  let netBalance = Belt.Float.toString(netBalance)
  <div className="balance-container">
    <p className="balance-title">{"YOUR BALANCE" -> React.string}</p>
    <p className="balance-amount">{`\u20B9${netBalance}` -> React.string}</p>
  </div>
}
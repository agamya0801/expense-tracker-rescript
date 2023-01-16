%%raw("import './Balance.css'")
@react.component
let make = () => {
    // let color = "positive-text" -> React.string
    <div className="balance-container">
      <p className="balance-title">{"YOUR BALANCE" -> React.string}</p>
      <p className="balance-amount">{"0.00" -> React.string}</p>
    </div>
}
%%raw("import './AddTransactions.css'")
@react.component
let make = () => {
    let (text, setText) = React.useState(_ => "")
    let (amount, setAmount) = React.useState(_ => "0.00")

    let handleTextChange = event => {
      let updatedText = ReactEvent.Form.target(event)["value"]
      setText(_ => updatedText)
    }

    let handleAmountChange = event => {
      let updatedAmout = ReactEvent.Form.target(event)["value"]
      setAmount(_ => updatedAmout)
    }

    let handleSubmit = event => {
      ReactEvent.Synthetic.preventDefault(event)
      Js.log(text)
      Js.log(amount)
      setText(_ => "")
      setAmount(_ => "0.00")
    }

    <div className="new-txn-container">
          <p className="new-txn-title">{"Add New Transactions" -> React.string}</p>
          <hr className="horizontal-line" />
          <form className="new-txn-form" onSubmit={handleSubmit}>
            <label className="label">{"Text" -> React.string}</label>
            <input 
              className="input-field"
              type_="text"
              placeholder="Enter text"
              value={text}
              onChange={handleTextChange}
            />
            <label className="label">
              <div className="amount">
                <p className="amount-subheading">{"Amount" -> React.string}</p>
                <p className="amount-subheading">{"(negative-expense, positive-income)" -> React.string}</p>
              </div>
            </label>
            <input 
              className="input-field"
              type_="number"
              placeholder="Enter Amount"
              value={amount}
              onChange={handleAmountChange}
            />
            <button className="add-txn-button" type_="submit">{"Add Transaction" -> React.string}</button>
          </form>
        </div>
}
%%raw("import './AddTransactionCmp.css'")


  @react.component
  let make = (~submitHandler: (~text: string, ~amount: string) => unit) => {
    let (text, setText) = React.useState(_ => "")
    let (amount, setAmount) = React.useState(_ => "")

    let handleTextChange = event => {
      let updatedText = ReactEvent.Form.target(event)["value"]
      setText(_ => updatedText)
    }

    let handleAmountChange = event => {
      let updatedAmount = ReactEvent.Form.target(event)["value"]
      setAmount(_ => updatedAmount)
    }

    let handleSubmit = event => {
      ReactEvent.Synthetic.preventDefault(event)
      submitHandler(~text, ~amount)
      setText(_ => "")
      setAmount(_ => "")
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
        <button className="add-txn-button" type_="submit" onClick={handleSubmit}>{"Add Transaction" -> React.string}</button>
      </form>
    </div>
  } // Module contents

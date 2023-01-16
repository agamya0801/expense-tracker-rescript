%%raw("import './IncomeExpense.css'")
@react.component
let make = (~transactions) => {
    <div className="income-expense-container">
      <div className="income-container">
          <p className="income-title">{"INCOME" -> React.string}</p>
          <p className="income-amount">{"0.00" -> React.string}</p> //Dummy Value
        //   <p className="income-amount">{`\u20B9${netIncome}`}</p>
      </div>
      <div className="vertical-line"></div>
      <div className="expense-container">
          <p className="expense-title">{"EXPENSE" -> React.string}</p>
          <p className="expense-amount">{"0.00" -> React.string}</p> //Dummy Value
        //   <p className="expense-amount">{`\u20B9${netExpense}`}</p>
      </div>
    </div>
}
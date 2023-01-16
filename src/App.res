%%raw("import './App.css'")

type transaction = {text: string, amount: float}

let initialTransaction: array<transaction> = [{text: "", amount: 0.00}]

@react.component
let make = () => {
    let (transactions: array<transaction>, setTransactions) = React.useState(_ => initialTransaction)

    let addTransaction = (text, amount) => {
        let prevTransactionArray = Js.Array.copy(transactions)
        let newTransactionArray = Js.Array.concat([{text, amount}], prevTransactionArray)
        setTransactions(_ => newTransactionArray)
        Js.log(newTransactionArray)
    }

    <div className="main-container">
        <Header />
        <Balance transactions/>
        <IncomeExpense transactions/>
        <History transactions/>
        <AddTransactions submitHandler=addTransaction />
    </div>
}

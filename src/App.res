%%raw("import './App.css'")

let initialTransaction: array<Transaction.t> = [{text: "", amount: ""}]

@react.component
let make = () => {
    let (transactions, setTransactions) = React.useState(_ => initialTransaction)

    let addTransaction = (~text: string, ~amount: string) => {
        let prevTransactionArray = Js.Array.copy(transactions)
        let latestTransaction: array<Transaction.t> = [{text: text, amount: amount}]
        let newTransactionArray = Js.Array.concat(latestTransaction, prevTransactionArray)
        setTransactions(_ => newTransactionArray)
    }

    <div className="main-container">
        <Header />
        <Balance transactions/>
        <IncomeExpense transactions />
        <History transactions/>
        <AddTransactions submitHandler=addTransaction />
    </div>
}

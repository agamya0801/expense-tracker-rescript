%%raw("import './App.css'")

@scope("JSON") @val
external parseIntoMyData: string => array<TransactionType.t> = "parse"
let initialTransaction: array<TransactionType.t> = [{text: "", amount: ""}]

@react.component
let make = () => {
    let localTxn = Dom.Storage2.getItem(Dom.Storage2.localStorage, "storedTxn") 
    let (transactions: array<TransactionType.t>, setTransactions) = React.useState(_ => switch localTxn{ | None => initialTransaction | Some(value: string) => parseIntoMyData(value) })

    React.useEffect1(() => {
        Dom.Storage2.setItem(Dom.Storage2.localStorage, "storedTxn", switch Js.Json.stringifyAny(transactions: array<TransactionType.t>) { | None => "" | Some(v) => v })
        None
    }, [transactions])

    let addTransaction = (~text: string, ~amount: string) => {
        let prevTransactionArray = Js.Array.copy(transactions)
        let latestTransaction: array<TransactionType.t> = [{text: text, amount: amount}]
        let newTransactionArray = Js.Array.concat(prevTransactionArray, latestTransaction)
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

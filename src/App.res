%%raw("import './App.css'")

let initialTransaction: array<Transaction.t> = []

@react.component
let make = () => {
    open TransactionUtils
    let (transactions: array<Transaction.t>, setTransactions) = React.useState(_ => getInitialTransaction(initialTransaction))
    let (inputValidity: bool, setInputValidity) = React.useState(_ => true)

    React.useEffect1(() => {
        setLatestTransactions(transactions)
        None
    }, [transactions])

    let addTransaction = (~text: string, ~amount: float) => {
        if(text != "" && amount != 0.) {
            setInputValidity(_ => true)
            let newTransactionArray = Js.Array.concat(transactions, [{text: text, amount: amount}])
            setTransactions(_ => newTransactionArray)
        } else {
            setInputValidity(_ => false)
        }
    }

    <div className="main-container">
        <HeaderCmp />
        <BalanceCmp transactions />
        <IncomeExpenseCmp transactions />
        <HistoryCmp transactions />
        <AddTransactionCmp submitHandler=addTransaction inputValidity=inputValidity/>
    </div>
}

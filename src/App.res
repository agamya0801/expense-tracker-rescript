%%raw("import './App.css'")
@react.component
let make = () => {
    <div className="main-container">
        <Header />
        <Balance />
        <IncomeExpense />
        <History />
        <AddTransactions />
    </div>
}

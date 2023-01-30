%%raw("import './HistoryCmp.css'")
@react.component
let make = (~transactions: array<Transaction.t>) => {
    <div className="history-container">
        <p className="history-title">{"History" -> React.string}</p>
        <hr className="horizontal-line" />
        <div className="list">
            <HistoryList transaction=transactions />
        </div>
    </div>
}
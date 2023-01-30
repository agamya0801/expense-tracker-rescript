%%raw("import './HistoryCmp.css'")
@react.component
let make = (~transaction: array<Transaction.t>) => {
    open AmountUtils
    open TextUtils
    {transaction -> Js.Array2.map((ele) => {
        let stripColorClassName = ele.amount >= 0.0 ? "positive" : "negative"
        let netAmountString = getAmountString(ele.amount)
        let newText = getTruncatedText(~text = ele.text)
        <div className="list-items">
            <div className="list-items-content">
                <p className="item-text">{newText->React.string}</p>
                <div className="amount-and-strip">
                    <p className="item-amount">{netAmountString -> React.string}</p>
                    <div className={`strip ${stripColorClassName}`} />
                </div>
            </div>
        </div>
        })->React.array
    }
}
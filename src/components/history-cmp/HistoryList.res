%%raw("import './HistoryCmp.css'")
@react.component
let make = (~transaction: array<Transaction.t>) => {
    {transaction -> Js.Array2.map((ele) => {
        let sign = AmountUtils.getSign(~amount = ele.amount)
        let stripColorClassName = ele.amount >= 0.0 ? "positive" : "negative"
        let netAmount = AmountUtils.getShortenedAmount(~amount = ele.amount)
        let newText = TextUtils.getTruncatedText(~text = ele.text)
        <div className="list-items">
            <div className="list-items-content">
                <p className="item-text">{newText->React.string}</p>
                <div className="amount-and-strip">
                    <p className="item-amount">{`${sign}\u20B9${netAmount}` -> React.string}</p>
                    <div className={`strip ${stripColorClassName}`} />
                </div>
            </div>
        </div>
        })->React.array
    }
}
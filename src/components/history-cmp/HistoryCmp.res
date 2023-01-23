%%raw("import './HistoryCmp.css'")
@react.component
let make = (~transactions: array<TransactionType.t>) => {
    let notEmpty = (x: TransactionType.t) => (x.text != "" && x.amount != 0.)
    let finalArray = {open Js.Array2
                        transactions -> filter(notEmpty)}
    <div className="history-container">
        <p className="history-title">{"History" -> React.string}</p>
        <hr className="horizontal-line" />
        <div className="list">
            {finalArray -> Js.Array2.map((ele) => {
                let sign = AmountUtils.check(~amount = ele.amount)
                let stripColor = ele.amount >= 0.0 ? "positive" : "negative"
                let isRoundedAmount = AmountUtils.isRounded(~amount = ele.amount)
                let netAmount = AmountUtils.round(~amount = ele.amount, ~isRoundedAmount = isRoundedAmount)
                let newAmount = AmountUtils.refactor(~amount = netAmount)
                let newText = Js.String2.length(ele.text) > 16 ? Js.String.concat("...", Js.String.substrAtMost(~from= 0, ~length= 16, ele.text)) : ele.text
                <div className="list-items">
                    <HistoryList text={newText} amount={newAmount} sign={sign} stripColor={stripColor}/>
                </div>
                }) -> React.array
            }
        </div>
    </div>
}
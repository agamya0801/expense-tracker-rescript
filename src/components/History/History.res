%%raw("import './History.css'")
@react.component
let make = (~transactions: array<Transaction.t>) => {
    let notEmpty = (x: Transaction.t) => (x.text != "" && x.amount != "")
    let finalArray = {open Js.Array2
                        transactions -> filter(notEmpty)}
    <div className="history-container">
        <p className="history-title">{"History" -> React.string}</p>
        <hr className="horizontal-line" />
        <div className="list">
            {finalArray -> Js.Array2.map((ele) => {
                let netAmount = Belt.Float.fromString(ele.amount)
                let netAmount = switch netAmount {
                    | None => 0.0
                    | Some(v) => v
                }
                let sign = CheckSign.check(~amount = netAmount)
                let stripColor = netAmount >= 0.0 ? "positive" : "negative"
                let isRoundedAmount = IsRoundedAmount.isRounded(~amount = netAmount)
                let netAmount = AmountRoundOf.round(~amount = netAmount, ~isRoundedAmount = isRoundedAmount)
                let newAmount = RefactorNegAmount.refactor(~amount = netAmount)
                let newText = Js.String2.length(ele.text) > 16 ? Js.String.concat("...", Js.String.substrAtMost(~from= 0, ~length= 16, ele.text)) : ele.text
                <div className="list-items">
                    <HistoryList text={newText} amount={newAmount} sign={sign} stripColor={stripColor}/>
                </div>
                }) -> React.array
            }
        </div>
    </div>
}
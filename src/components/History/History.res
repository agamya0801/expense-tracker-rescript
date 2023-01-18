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
                let sign = Belt.Float.fromString(ele.amount) >= Some(0.0) ? "" : "-"
                let stripColor = Belt.Float.fromString(ele.amount) >= Some(0.0) ? "positive" : "negative"
                let newAmount = Belt.Float.fromString(ele.amount) < Some(0.0) ? Js.String.sliceToEnd(~from=1, ele.amount) : ele.amount
                let newText = Js.String2.length(ele.text) > 16 ? Js.String.concat("...", Js.String.substrAtMost(~from= 0, ~length= 16, ele.text)) : ele.text
                <div className="list-items">
                    <HistoryList text={newText} amount={newAmount} sign={sign} stripColor={stripColor}/>
                </div>
                }) -> React.array
            }
        </div>
    </div>
}
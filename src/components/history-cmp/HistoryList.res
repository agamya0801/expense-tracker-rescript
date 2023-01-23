%%raw("import './HistoryCmp.css'")
@react.component
let make = (~text, ~amount, ~sign, ~stripColor) => {
    <div className="list-items-content">
        <p className="item-text">{text->React.string}</p>
        <div className="amount-and-strip">
            <p className="item-amount">{`${sign}\u20B9${amount}` -> React.string}</p>
            <div className={`strip ${stripColor}`} />
        </div>
    </div>
}
%%raw("import './History.css'")
@react.component
let make = (~transactions) => {
    <div className="history-container">
        <p className="history-title">{"History" -> React.string}</p>
        <hr className="horizontal-line" />
    </div>
}
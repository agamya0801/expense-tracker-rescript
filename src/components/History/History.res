%%raw("import './History.css'")
@react.component
let make = () => {
    <div className="history-container">
        <p className="history-title">{"History" -> React.string}</p>
        <hr className="horizontal-line" />
    </div>
}
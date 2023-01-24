%%raw("import './HeaderCmp.css'")
@react.component
let make = () => { 
    <p className="expense-tracker-header">{"Expense Tracker" -> React.string}</p>
}
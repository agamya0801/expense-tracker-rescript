let calculateBalance = (~transactions: array<Transaction.t>) => {
    Belt.Array.reduce(
        transactions, 
        0.0, 
        (acc, value) => acc +. value.amount
    )
}

let calculateIncome = (~transactions: array<Transaction.t>) => {
    Belt.Array.reduce(
        transactions, 
        0.0, 
        (acc, value) => (value.amount >= 0. ? acc +. value.amount : acc)
    )
}

let calculateExpense = (~transactions: array<Transaction.t>) => {
    Belt.Array.reduce(
        transactions, 
        0.0, 
        (acc, value) => (value.amount < 0. ? acc +. value.amount : acc)
    )
}

let getAmountString = (amount:float) => {
    let sign:string = amount >= 0. ? "" : "-"
    let amount = Js.Math.abs_float(amount)
    let amountString:string = amount >= 10000000.0 ? 
                Js.String.concat("K", Js.Float.toFixedWithPrecision((amount /. 10000000.0), ~digits=2))
                : Belt.Float.toString(amount)
    `${sign}₹${amountString}`
}

let getAmountColourClassName = (amount:float) => {
    amount >= 0.0 ? "positive-text" : "negative-text"
}
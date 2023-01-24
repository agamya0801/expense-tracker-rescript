let calculateBalance = (~transactions: array<TransactionType.t>) => {
    Belt.Array.reduce(
        transactions, 
        0.0, 
        (acc, value) => acc +. value.amount
    )
}

let calculateIncome = (~transactions: array<TransactionType.t>) => {
    Belt.Array.reduce(
        transactions, 
        0.0, 
        (acc, value) => (value.amount >= 0. ? acc +. value.amount : acc +. 0.0)
    )
}

let calculateExpense = (~transactions: array<TransactionType.t>) => {
    Belt.Array.reduce(
        transactions, 
        0.0, 
        (acc, value) => (value.amount < 0. ? acc +. value.amount : acc +. 0.0)
    )
}

let check = (~amount) => {
    amount >= 0. ? "" : "-"
} 

let isRounded = (~amount) => {
    amount <= -10000000.0 || amount >= 10000000.0 ? true: false
}

let round = (~amount, ~isRoundedAmount) => {
    isRoundedAmount ? Js.String.concat("K", Js.Float.toFixedWithPrecision((amount /. 10000000.0), ~digits=2)) : Belt.Float.toString(amount)
}

let refactor = (~amount) => {
    Belt.Float.fromString(amount) < Some(0.0) ? Js.String.sliceToEnd(~from=1, amount) : amount
}
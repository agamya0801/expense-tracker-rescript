let calculateBalance = (~transactions: array<TransactionType.t>) => {
    Belt.Array.reduce(
        transactions, 
        0.0, 
        (acc, value) => acc +. switch Belt.Float.fromString(value.amount) { | None => 0. | Some(v) => v }
    )
}

let calculateIncome = (~transactions: array<TransactionType.t>) => {
    Belt.Array.reduce(
        transactions, 
        0.0, 
        (acc, value) => (Belt.Float.fromString(value.amount) >= Some(0.0) ? acc +. switch Belt.Float.fromString(value.amount) { | None => 0. | Some(v) => v } : acc +. 0.0)
    )
}

let calculateExpense = (~transactions: array<TransactionType.t>) => {
    Belt.Array.reduce(
        transactions, 
        0.0, 
        (acc, value) => (Belt.Float.fromString(value.amount) < Some(0.0) ? acc +. switch Belt.Float.fromString(value.amount) { | None => 0. | Some(v) => v } : acc +. 0.0)
    )
}

let check = (~amount) => {
    amount >= 0. ? "" : "-"
} 

let isRounded = (~amount) => {
    amount <= -10000000.0 || amount >= 10000000.0 ? true: false
}

let round = (~amount, ~isRoundedAmount) => {
    isRoundedAmount ? Js.String.concat("K", Js.Float.toFixedWithPrecision((amount /. 10000000.0), ~digits=2)) : Js.Float.toFixedWithPrecision(amount, ~digits=2)
}

let refactor = (~amount) => {
    Belt.Float.fromString(amount) < Some(0.0) ? Js.String.sliceToEnd(~from=1, amount) : amount
}
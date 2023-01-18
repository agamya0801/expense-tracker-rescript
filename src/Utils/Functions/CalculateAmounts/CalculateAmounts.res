let calculateBalance = (~transactions: array<Transaction.t>) => {
    Belt.Array.reduce(
        transactions, 
        0.0, 
        (acc, value) => acc +. switch Belt.Float.fromString(value.amount) { | None => 0. | Some(v) => v }
    )
}

let calculateIncome = (~transactions: array<Transaction.t>) => {
    Belt.Array.reduce(
        transactions, 
        0.0, 
        (acc, value) => (Belt.Float.fromString(value.amount) >= Some(0.0) ? acc +. switch Belt.Float.fromString(value.amount) { | None => 0. | Some(v) => v } : acc +. 0.0)
    )
}

let calculateExpense = (~transactions: array<Transaction.t>) => {
    Belt.Array.reduce(
        transactions, 
        0.0, 
        (acc, value) => (Belt.Float.fromString(value.amount) < Some(0.0) ? acc +. switch Belt.Float.fromString(value.amount) { | None => 0. | Some(v) => v } : acc +. 0.0)
    )
}
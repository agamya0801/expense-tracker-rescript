@scope("JSON") @val
external parseTransactions: string => array<Transaction.t> = "parse"

let getInitialTransaction = (initialTransaction) => {
    let storedTransactions = Dom.Storage2.getItem(Dom.Storage2.sessionStorage, "storedTransactions")
    switch storedTransactions{ 
        | None => initialTransaction 
        | Some(value: string) => parseTransactions(value) 
    }
}

let setLatestTransactions = (transactions) => {
    Dom.Storage2.setItem(Dom.Storage2.sessionStorage, "storedTransactions", switch Js.Json.stringifyAny(transactions: array<Transaction.t>) { | None => "" | Some(v) => v })
}
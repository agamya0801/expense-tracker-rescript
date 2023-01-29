@scope("JSON") @val
external parseIntoMyData: string => array<Transaction.t> = "parse"

let getInitialTransaction = (storedTxn, initialTransaction) => {
    switch storedTxn{ 
        | None => initialTransaction 
        | Some(value: string) => parseIntoMyData(value) 
    }
}
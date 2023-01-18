let round = (~amount, ~isRoundedAmount) => {
    isRoundedAmount ? Js.String.concat("K", Js.Float.toFixedWithPrecision((amount /. 10000000.0), ~digits=2)) : Js.Float.toFixedWithPrecision(amount, ~digits=2)
}
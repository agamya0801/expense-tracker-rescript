let refactor = (~amount) => {
    Belt.Float.fromString(amount) < Some(0.0) ? Js.String.sliceToEnd(~from=1, amount) : amount
}
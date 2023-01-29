let getTruncatedText = (~text:string) => {
    Js.String2.length(text) > 16 ? Js.String.concat("...", Js.String.substrAtMost(~from= 0, ~length= 16, text)) : text
}
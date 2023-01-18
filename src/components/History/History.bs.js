// Generated by ReScript, PLEASE EDIT WITH CARE

import * as React from "react";
import * as CheckSign from "../../Utils/Functions/CheckSign/CheckSign.bs.js";
import * as Js_string from "rescript/lib/es6/js_string.js";
import * as Belt_Float from "rescript/lib/es6/belt_Float.js";
import * as HistoryList from "./HistoryList.bs.js";
import * as AmountRoundOf from "../../Utils/Functions/AmountRoundOf/AmountRoundOf.bs.js";
import * as IsRoundedAmount from "../../Utils/Functions/IsRoundedAmount/IsRoundedAmount.bs.js";
import * as RefactorNegAmount from "../../Utils/Functions/RefactorNegAmount/RefactorNegAmount.bs.js";

import './History.css'
;

function $$History(Props) {
  var transactions = Props.transactions;
  var notEmpty = function (x) {
    if (x.text !== "") {
      return x.amount !== "";
    } else {
      return false;
    }
  };
  var finalArray = transactions.filter(notEmpty);
  return React.createElement("div", {
              className: "history-container"
            }, React.createElement("p", {
                  className: "history-title"
                }, "History"), React.createElement("hr", {
                  className: "horizontal-line"
                }), React.createElement("div", {
                  className: "list"
                }, finalArray.map(function (ele) {
                      var netAmount = Belt_Float.fromString(ele.amount);
                      var netAmount$1 = netAmount !== undefined ? netAmount : 0.0;
                      var sign = CheckSign.check(netAmount$1);
                      var stripColor = netAmount$1 >= 0.0 ? "positive" : "negative";
                      var isRoundedAmount = IsRoundedAmount.isRounded(netAmount$1);
                      var netAmount$2 = AmountRoundOf.round(netAmount$1, isRoundedAmount);
                      var newAmount = RefactorNegAmount.refactor(netAmount$2);
                      var newText = ele.text.length > 16 ? Js_string.concat("...", Js_string.substrAtMost(0, 16, ele.text)) : ele.text;
                      return React.createElement("div", {
                                  className: "list-items"
                                }, React.createElement(HistoryList.make, {
                                      text: newText,
                                      amount: newAmount,
                                      sign: sign,
                                      stripColor: stripColor
                                    }));
                    })));
}

var make = $$History;

export {
  make ,
}
/*  Not a pure module */

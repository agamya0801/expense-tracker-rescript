// Generated by ReScript, PLEASE EDIT WITH CARE

import * as React from "react";
import * as CheckSign from "../../Utils/Functions/CheckSign/CheckSign.bs.js";
import * as AmountRoundOf from "../../Utils/Functions/AmountRoundOf/AmountRoundOf.bs.js";
import * as IsRoundedAmount from "../../Utils/Functions/IsRoundedAmount/IsRoundedAmount.bs.js";
import * as CalculateAmounts from "../../Utils/Functions/CalculateAmounts/CalculateAmounts.bs.js";
import * as RefactorNegAmount from "../../Utils/Functions/RefactorNegAmount/RefactorNegAmount.bs.js";

import './Balance.css'
;

function Balance(Props) {
  var transactions = Props.transactions;
  var netBalance = CalculateAmounts.calculateBalance(transactions);
  var sign = CheckSign.check(netBalance);
  var color = netBalance >= 0.0 ? "positive-text" : "negative-text";
  var isRoundedBal = IsRoundedAmount.isRounded(netBalance);
  var netBalance$1 = AmountRoundOf.round(netBalance, isRoundedBal);
  var netBalance$2 = RefactorNegAmount.refactor(netBalance$1);
  return React.createElement("div", {
              className: "balance-container"
            }, React.createElement("p", {
                  className: "balance-title"
                }, "YOUR BALANCE"), React.createElement("p", {
                  className: "balance-amount " + color + ""
                }, "" + sign + " \u20B9" + netBalance$2 + ""));
}

var make = Balance;

export {
  make ,
}
/*  Not a pure module */

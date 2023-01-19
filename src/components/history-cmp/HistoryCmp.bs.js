// Generated by ReScript, PLEASE EDIT WITH CARE

import * as React from "react";
import * as Js_string from "rescript/lib/es6/js_string.js";
import * as Belt_Float from "rescript/lib/es6/belt_Float.js";
import * as AmountUtils from "../../utils/AmountUtils.bs.js";
import * as HistoryList from "./HistoryList.bs.js";

import './HistoryCmp.css'
;

function HistoryCmp(Props) {
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
                      var sign = AmountUtils.check(netAmount$1);
                      var stripColor = netAmount$1 >= 0.0 ? "positive" : "negative";
                      var isRoundedAmount = AmountUtils.isRounded(netAmount$1);
                      var netAmount$2 = AmountUtils.round(netAmount$1, isRoundedAmount);
                      var newAmount = AmountUtils.refactor(netAmount$2);
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

var make = HistoryCmp;

export {
  make ,
}
/*  Not a pure module */
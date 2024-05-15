// Generated by ReScript, PLEASE EDIT WITH CARE

import * as React from "react";
import * as Js_string from "rescript/lib/es6/js_string.js";
import * as AmountUtils from "../../utils/AmountUtils.bs.js";
import * as HistoryList from "./HistoryList.bs.js";

import './HistoryCmp.css'
;

function HistoryCmp(Props) {
  var transactions = Props.transactions;
  var notEmpty = function (x) {
    if (x.text !== "") {
      return x.amount !== 0;
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
                      var sign = AmountUtils.check(ele.amount);
                      var stripColor = ele.amount >= 0.0 ? "positive" : "negative";
                      var isRoundedAmount = AmountUtils.isRounded(ele.amount);
                      var netAmount = AmountUtils.round(ele.amount, isRoundedAmount);
                      var newAmount = AmountUtils.refactor(netAmount);
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
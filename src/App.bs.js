// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Curry from "rescript/lib/es6/curry.js";
import * as React from "react";
import * as Js_array from "rescript/lib/es6/js_array.js";
import * as HeaderCmp from "./components/header-cmp/HeaderCmp.bs.js";
import * as BalanceCmp from "./components/balance-cmp/BalanceCmp.bs.js";
import * as HistoryCmp from "./components/history-cmp/HistoryCmp.bs.js";
import * as IncomeExpenseCmp from "./components/income-expense-cmp/IncomeExpenseCmp.bs.js";
import * as AddTransactionCmp from "./components/add-transaction-cmp/AddTransactionCmp.bs.js";

import './App.css'
;

var initialTransaction = [{
    text: "",
    amount: 0
  }];

function App(Props) {
  var storedTxn = sessionStorage.getItem("storedTxn");
  var match = React.useState(function () {
        if (storedTxn !== null) {
          return JSON.parse(storedTxn);
        } else {
          return initialTransaction;
        }
      });
  var setTransactions = match[1];
  var transactions = match[0];
  React.useEffect((function () {
          var v = JSON.stringify(transactions);
          sessionStorage.setItem("storedTxn", v !== undefined ? v : "");
        }), [transactions]);
  var addTransaction = function (text, amount) {
    if (text !== "" && amount !== 0) {
      var prevTransactionArray = transactions.slice();
      var latestTransaction = [{
          text: text,
          amount: amount
        }];
      var newTransactionArray = Js_array.concat(prevTransactionArray, latestTransaction);
      return Curry._1(setTransactions, (function (param) {
                    return newTransactionArray;
                  }));
    }
    window.alert("Invalid Input");
  };
  return React.createElement("div", {
              className: "main-container"
            }, React.createElement(HeaderCmp.make, {}), React.createElement(BalanceCmp.make, {
                  transactions: transactions
                }), React.createElement(IncomeExpenseCmp.make, {
                  transactions: transactions
                }), React.createElement(HistoryCmp.make, {
                  transactions: transactions
                }), React.createElement(AddTransactionCmp.make, {
                  submitHandler: addTransaction
                }));
}

var make = App;

export {
  initialTransaction ,
  make ,
}
/*  Not a pure module */

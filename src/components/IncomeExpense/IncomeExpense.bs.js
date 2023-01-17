// Generated by ReScript, PLEASE EDIT WITH CARE

import * as React from "react";
import * as Caml_obj from "rescript/lib/es6/caml_obj.js";
import * as Belt_Array from "rescript/lib/es6/belt_Array.js";
import * as Belt_Float from "rescript/lib/es6/belt_Float.js";

import './IncomeExpense.css'
;

function IncomeExpense(Props) {
  var transactions = Props.transactions;
  var netIncome = Belt_Array.reduce(transactions, 0.0, (function (acc, value) {
          if (!Caml_obj.greaterequal(Belt_Float.fromString(value.amount), 0.0)) {
            return acc + 0.0;
          }
          var v = Belt_Float.fromString(value.amount);
          return acc + (
                  v !== undefined ? v : 0
                );
        }));
  var netExpense = Belt_Array.reduce(transactions, 0.0, (function (acc, value) {
          if (!Caml_obj.lessthan(Belt_Float.fromString(value.amount), 0.0)) {
            return acc - 0.0;
          }
          var v = Belt_Float.fromString(value.amount);
          return acc - (
                  v !== undefined ? v : 0
                );
        }));
  var netIncome$1 = String(netIncome);
  var netExpense$1 = String(netExpense);
  return React.createElement("div", {
              className: "income-expense-container"
            }, React.createElement("div", {
                  className: "income-container"
                }, React.createElement("p", {
                      className: "income-title"
                    }, "INCOME"), React.createElement("p", {
                      className: "income-amount"
                    }, "\u20B9" + netIncome$1 + "")), React.createElement("div", {
                  className: "vertical-line"
                }), React.createElement("div", {
                  className: "expense-container"
                }, React.createElement("p", {
                      className: "expense-title"
                    }, "EXPENSE"), React.createElement("p", {
                      className: "expense-amount"
                    }, "\u20B9" + netExpense$1 + "")));
}

var make = IncomeExpense;

export {
  make ,
}
/*  Not a pure module */

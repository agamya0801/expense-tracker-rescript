// Generated by ReScript, PLEASE EDIT WITH CARE

import * as React from "react";

import './IncomeExpense.css'
;

function IncomeExpense(Props) {
  return React.createElement("div", {
              className: "income-expense-container"
            }, React.createElement("div", {
                  className: "income-container"
                }, React.createElement("p", {
                      className: "income-title"
                    }, "INCOME"), React.createElement("p", {
                      className: "income-amount"
                    }, "0.00")), React.createElement("div", {
                  className: "vertical-line"
                }), React.createElement("div", {
                  className: "expense-container"
                }, React.createElement("p", {
                      className: "expense-title"
                    }, "EXPENSE"), React.createElement("p", {
                      className: "expense-amount"
                    }, "0.00")));
}

var make = IncomeExpense;

export {
  make ,
}
/*  Not a pure module */

// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Curry from "rescript/lib/es6/curry.js";
import * as React from "react";

import './AddTransactionCmp.css'
;

function AddTransactionCmp(Props) {
  var submitHandler = Props.submitHandler;
  var match = React.useState(function () {
        return "";
      });
  var setText = match[1];
  var text = match[0];
  var match$1 = React.useState(function () {
        return "";
      });
  var setAmount = match$1[1];
  var amount = match$1[0];
  var handleTextChange = function ($$event) {
    var updatedText = $$event.target.value;
    Curry._1(setText, (function (param) {
            return updatedText;
          }));
  };
  var handleAmountChange = function ($$event) {
    var updatedAmount = $$event.target.value;
    Curry._1(setAmount, (function (param) {
            return updatedAmount;
          }));
  };
  var handleSubmit = function ($$event) {
    $$event.preventDefault();
    Curry._2(submitHandler, text, amount);
    Curry._1(setText, (function (param) {
            return "";
          }));
    Curry._1(setAmount, (function (param) {
            return "";
          }));
  };
  return React.createElement("div", {
              className: "new-txn-container"
            }, React.createElement("p", {
                  className: "new-txn-title"
                }, "Add New Transactions"), React.createElement("hr", {
                  className: "horizontal-line"
                }), React.createElement("form", {
                  className: "new-txn-form",
                  onSubmit: handleSubmit
                }, React.createElement("label", {
                      className: "label"
                    }, "Text"), React.createElement("input", {
                      className: "input-field",
                      placeholder: "Enter text",
                      type: "text",
                      value: text,
                      onChange: handleTextChange
                    }), React.createElement("label", {
                      className: "label"
                    }, React.createElement("div", {
                          className: "amount"
                        }, React.createElement("p", {
                              className: "amount-subheading"
                            }, "Amount"), React.createElement("p", {
                              className: "amount-subheading"
                            }, "(negative-expense, positive-income)"))), React.createElement("input", {
                      className: "input-field",
                      placeholder: "Enter Amount",
                      type: "number",
                      value: amount,
                      onChange: handleAmountChange
                    }), React.createElement("button", {
                      className: "add-txn-button",
                      type: "submit",
                      onClick: handleSubmit
                    }, "Add Transaction")));
}

var make = AddTransactionCmp;

export {
  make ,
}
/*  Not a pure module */

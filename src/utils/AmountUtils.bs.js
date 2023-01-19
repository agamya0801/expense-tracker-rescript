// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Caml_obj from "rescript/lib/es6/caml_obj.js";
import * as Js_string from "rescript/lib/es6/js_string.js";
import * as Belt_Array from "rescript/lib/es6/belt_Array.js";
import * as Belt_Float from "rescript/lib/es6/belt_Float.js";

function calculateBalance(transactions) {
  return Belt_Array.reduce(transactions, 0.0, (function (acc, value) {
                var v = Belt_Float.fromString(value.amount);
                return acc + (
                        v !== undefined ? v : 0
                      );
              }));
}

function calculateIncome(transactions) {
  return Belt_Array.reduce(transactions, 0.0, (function (acc, value) {
                if (!Caml_obj.greaterequal(Belt_Float.fromString(value.amount), 0.0)) {
                  return acc + 0.0;
                }
                var v = Belt_Float.fromString(value.amount);
                return acc + (
                        v !== undefined ? v : 0
                      );
              }));
}

function calculateExpense(transactions) {
  return Belt_Array.reduce(transactions, 0.0, (function (acc, value) {
                if (!Caml_obj.lessthan(Belt_Float.fromString(value.amount), 0.0)) {
                  return acc + 0.0;
                }
                var v = Belt_Float.fromString(value.amount);
                return acc + (
                        v !== undefined ? v : 0
                      );
              }));
}

function check(amount) {
  if (amount >= 0) {
    return "";
  } else {
    return "-";
  }
}

function isRounded(amount) {
  if (amount <= -10000000.0) {
    return true;
  } else {
    return amount >= 10000000.0;
  }
}

function round(amount, isRoundedAmount) {
  if (isRoundedAmount) {
    return Js_string.concat("K", (amount / 10000000.0).toFixed(2));
  } else {
    return amount.toFixed(2);
  }
}

function refactor(amount) {
  if (Caml_obj.lessthan(Belt_Float.fromString(amount), 0.0)) {
    return Js_string.sliceToEnd(1, amount);
  } else {
    return amount;
  }
}

export {
  calculateBalance ,
  calculateIncome ,
  calculateExpense ,
  check ,
  isRounded ,
  round ,
  refactor ,
}
/* No side effect */
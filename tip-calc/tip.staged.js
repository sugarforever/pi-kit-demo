#!/usr/bin/env node
// 用法：tip <账单金额> <小费百分比> <人数>
const [bill, percent, people] = process.argv.slice(2).map(Number);

const tip = bill * (percent / 100);
const total = bill + tip;
const each = total / people;

console.log(`小费：${tip.toFixed(2)}`);
console.log(`合计：${total.toFixed(2)}`);
console.log(`每人：${each.toFixed(2)}`);

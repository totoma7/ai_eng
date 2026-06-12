// 게이트(Gate): 이 테스트 전부 통과 = 루프의 유일한 종료 조건.
const { test } = require('node:test');
const assert = require('node:assert');
const { add, multiply, divide } = require('./calc.js');

test('add: 두 수의 합을 반환한다', () => {
  assert.strictEqual(add(2, 3), 5);
});

test('multiply: 두 수의 곱을 반환한다', () => {
  assert.strictEqual(multiply(4, 5), 20);
});

test('divide: 몫을 반환한다', () => {
  assert.strictEqual(divide(10, 2), 5);
});

test('divide: 0으로 나누면 예외를 던진다', () => {
  assert.throws(() => divide(1, 0), /division by zero/);
});

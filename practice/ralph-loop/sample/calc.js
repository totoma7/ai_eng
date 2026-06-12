// 의도된 결함이 있는 미니 모듈 — ralph 루프가 고칠 대상.
// BUG①: add가 a - b를 반환한다.
// BUG②: divide가 0 나누기를 검사하지 않는다.

function add(a, b) {
  return a - b;
}

function multiply(a, b) {
  return a * b;
}

function divide(a, b) {
  return a / b;
}

module.exports = { add, multiply, divide };

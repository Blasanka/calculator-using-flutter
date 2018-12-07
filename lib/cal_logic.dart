class Logic {
  double add(int a, int b) {
    return a + b.toDouble();
  }

  double substract(int a, int b) {
    return a - b.toDouble();
  }

  double devide(int a, int b) {
    return a / b.toDouble();
  }

  double multiply(int a, int b) {
    return a * b.toDouble();
  }

//   double operation(List<String> list) {
//     switch (list.removeAt(1)) {
//       case '+':
//         return add(list);
//       case '-':
//         return substract(list);
//       case '*':
//         return multiply(list);
//       case '/':
//         return devide(list);
//       default:
//         return 0.0;
//     }
//   }
}

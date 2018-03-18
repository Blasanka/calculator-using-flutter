import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Calculator",
      // theme: new ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Calculator'),
        ),
        body: new Center(
          child: new Calculator(),
        ),
      ),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => new _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String displayExpression = "0";
  String displayButtonValue = "0";
  List<String> exp = new List();
  void _displayPressedNumber(String num) {
    setState(() {
      displayExpression += num;
      displayButtonValue = (displayButtonValue == '0') ? displayButtonValue = num : displayButtonValue += num;
    });
  }

  @override
  Widget build(BuildContext context) {
      final ThemeData themeData = new ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
        platform: Theme.of(context).platform,
    );
    return new Theme(
      data: themeData,
      child: new Material(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new Expanded(
              flex: 2,
              child: _displayExpression(),
            ),
            new Expanded(
              flex: 3,
              child: _displayTappedValue(),
            ),
            new Expanded(
              flex: 4,
              child: _numColumn(),
            ),
            new Expanded(
                flex: 1,
                child: _clearButtons('C'),
            ),
            new Expanded(
                flex: 1,
                child: _clearButtons('CE'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _displayTappedValue() {
    return new Container(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: new Row(
        children: <Widget>[
          new Text(
            displayButtonValue,
            style: new TextStyle(
              fontSize: 45.0,
              fontWeight: FontWeight.w400,
              color: Colors.blueGrey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _displayExpression() {
    return new Container(
      color: new Color(0x11E1F5FE),
      padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: new Row(
        children: <Widget>[
          new Text(
            displayExpression,
            style: new TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _clearButtons(String clear) {
    return new RaisedButton(
      key: new Key(clear),
      child: new Text(clear),
      onPressed: () {
        setState(() {
          if (clear.contains('CE')) {
            displayExpression = "";
            //print(displayButtonValue);
          } else {
            displayButtonValue = "";
          }
        });
      },
    );
    //   padding: const EdgeInsets.only(
    //       //top: 30.0, bottom: 30.0, left: 83.5, right: 83.5),
    // );
  }

  Widget _numColumn(){
      return new Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:
      [new Expanded(
          flex: 2,
          child: new Column(
              children:[_numButton('1'),
              _numButton('2'),
              _numButton('3'),
              _numButton('4'),],
          ),
      ),
      new Expanded(
          flex: 2,
          child: new Column(
              children:[_numButton('5'),
              _numButton('6'),
              _numButton('7'),
              _numButton('8'),],
          ),
      ),
      new Expanded(
          flex: 2,
          child: new Column(
              children:[_numButton('9'),
              _numButton('0'),
              _numButton('.'),
              _equalButton(),],
          ),
      ),
      new Expanded(
          flex: 2,
          child: new Column(
              children:[
              _plusOperatorButton(),
              _subOperatorButton(),
              _multiplyOperatorButton(),
              _devideOperatorButton(),],
          ),
      ),
      ],
      );
  }
String operator="";
  Widget _plusOperatorButton() {
      return new RaisedButton(
            child:  new Text("+"),
          onPressed: () {
            setState(() {
              operator = '+';
              current = int.parse(displayButtonValue);
              displayExpression += '+';
              displayButtonValue = "";
            });
          },
      //   padding: const EdgeInsets.only(
      //       //top: 30.0, bottom: 30.0, left: 83.5, right: 83.5),
      // );
    );
  }

  Widget _subOperatorButton() {
      return new RaisedButton(
            child:  new Text("-"),
          onPressed: () {
            setState(() {
              operator = '-';
              current = int.parse(displayButtonValue);
              displayExpression += '-';
              displayButtonValue = "";
            });
          },
      //   padding: const EdgeInsets.only(
      //       //top: 30.0, bottom: 30.0, left: 83.5, right: 83.5),
      // );
    );
  }

  Widget _devideOperatorButton() {
      return new RaisedButton(
            child:  new Text("/"),
          onPressed: () {
            setState(() {
              operator = '/';
              current = int.parse(displayButtonValue);
              displayExpression += '/';
              displayButtonValue = "";
            });
          },
      //   padding: const EdgeInsets.only(
      //       //top: 30.0, bottom: 30.0, left: 83.5, right: 83.5),
      // );
    );
  }

  Widget _multiplyOperatorButton() {
      return new RaisedButton(
            child:  new Text("*"),
          onPressed: () {
            setState(() {
              operator = '*';
              current = int.parse(displayButtonValue);
              displayExpression += '*';
              displayButtonValue = "";
            });
          },
      //   padding: const EdgeInsets.only(
      //       //top: 30.0, bottom: 30.0, left: 83.5, right: 83.5),
      // );
    );
  }
int current=0, previous=0;
Widget _equalButton() {
    return new RaisedButton(
          child: new Text('='),
          onPressed: () {
              previous = int.parse(displayButtonValue);
              displayExpression += '=';
              displayButtonValue = "";
            setState(() {
              switch(operator) {
                  case '+':
                    _displayPressedNumber(new Logic().add(current, previous).toString());
                    print("$current, $previous");
                    break;
                case '-':
                    _displayPressedNumber(new Logic().substract(current, previous).toString());
                    print("$current, $previous");
                    break;
                case '/':
                    _displayPressedNumber(new Logic().devide(current, previous).toString());
                    print("$current, $previous");
                    break;
                case '*':
                    _displayPressedNumber(new Logic().multiply(current, previous).toString());
                    print("$current, $previous");
                    break;
                  default:
                  break;
              }
            });
          },
      //   padding: const EdgeInsets.only(
      //       //top: 30.0, bottom: 30.0, left: 83.5, right: 83.5),
      // );
    );
  }

  Widget _numButton(String txt) {
    return new Flexible(
        flex: 2,
        child:
        new RaisedButton(
          key: new Key(txt),
          child: new Text(txt),
          onPressed: () {
            setState(() {
                if(displayButtonValue != null) {
                    displayButtonValue = "";
                }
                if(displayExpression.contains('=')) {
                    displayExpression ="";
                }
              _displayPressedNumber(txt);
            });
          },
        ),
        
      //   padding: const EdgeInsets.only(
      //       //top: 30.0, bottom: 30.0, left: 83.5, right: 83.5),
      // );
    );
  }
}

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

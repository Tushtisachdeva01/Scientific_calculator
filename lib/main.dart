import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Main(),
    ));

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  double num1 = 0;
  double num2 = 0;
  String output = '0';
  String _output = '0';
  String operand;

  void btnclicked(String btntext) {
    if (btntext == 'Clear') {
      num1 = 0;
      num2 = 0;
      _output = '0';
      operand = '0';
    } else if (btntext == '+' ||
        btntext == '-' ||
        btntext == 'x' ||
        btntext == '/' ||
        btntext == '%' ||
        btntext == 'sin' ||
        btntext == 'cos' ||
        btntext == 'tan' ||
        btntext == 'sin inv' ||
        btntext == 'cos inv' ||
        btntext == 'tan inv' ||
        btntext == 'log' ||
        btntext == 'exp' ||
        btntext == 'x^2' ||
        btntext == 'x^1/2') {
      num1 = double.parse(output);
      operand = btntext;
      _output = '0';
    } else if (btntext == '.') {
      if (_output.contains('.'))
        return;
      else
        _output = _output + btntext;
    } else if (btntext == 'e') {
      _output = (2.71).toString();
    } else if (btntext == 'pi') {
      _output = (3.14).toString();
    } else if (btntext == '=') {
      num2 = double.parse(output);
      if (operand == '+') {
        _output = (num1 + num2).toString();
      }
      if (operand == '-') {
        _output = (num1 - num2).toString();
      }
      if (operand == 'x') {
        _output = (num1 * num2).toString();
      }
      if (operand == '/') {
        _output = (num1 / num2).toString();
      }
      if (operand == '%') {
        _output = (num1 / 100).toString();
      }
      if (operand == 'sin') {
        _output = sin(num2).toString();
      }
      if (operand == 'cos') {
        _output = cos(num2).toString();
      }
      if (operand == 'tan') {
        _output = tan(num2).toString();
      }
      if (operand == 'sin inv') {
        _output = asin(num2).toString();
      }
      if (operand == 'cos inv') {
        _output = acos(num2).toString();
      }
      if (operand == 'tan inv') {
        _output = atan(num2).toString();
      }
      if (operand == 'log') {
        _output = log(num2).toString();
      }
      if (operand == 'exp') {
        _output = exp(num2).toString();
      }
      if (operand == 'x^1/2') {
        _output = sqrt(num2).toString();
      }
      if (operand == 'x^2') {
        _output = (num2*num2).toString();
      }
      if (operand == 'exp') {
        _output = exp(num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      operand = '0';
    } else {
      _output = _output + btntext;
    }
    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget custbutton(String btnvalue, Color textcolor) {
    return Expanded(
        child: RaisedButton(
      padding: EdgeInsets.all(16.0),
      splashColor: Colors.red,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.black54),
      ),
      color: Colors.black87,
      onPressed: () => btnclicked(btnvalue),
      child: Text(
        '$btnvalue',
        style: TextStyle(
            color: textcolor, fontWeight: FontWeight.w400, fontSize: 22),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
        centerTitle: true,
        backgroundColor: Colors.black54,
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
        Expanded(
            child: Container(
          color: Colors.black,
          padding: EdgeInsets.all(15.0),
          alignment: Alignment.bottomRight,
          child: Text(
            output,
            style: TextStyle(color: Colors.blue[700], fontSize: 50.0),
          ),
        )),
        Row(
          children: <Widget>[
            custbutton('sin', Colors.blue[700]),
            custbutton('cos', Colors.blue[700]),
            custbutton('tan', Colors.blue[700]),
            custbutton('log', Colors.blue[700]),
          ],
        ),
        Row(
          children: <Widget>[
            custbutton('sin inv', Colors.blue[700]),
            custbutton('cos inv', Colors.blue[700]),
            custbutton('tan inv', Colors.blue[700]),
            custbutton('exp', Colors.blue[700]),
          ],
        ),
        Row(
          children: <Widget>[
            custbutton('x^2', Colors.blue[700]),
            custbutton('x^1/2', Colors.blue[700]),
            custbutton('e', Colors.blue[700]),
            custbutton('pi', Colors.blue[700]),
          ],
        ),
        Row(children: <Widget>[
          custbutton('9', Colors.white),
          custbutton('8', Colors.white),
          custbutton('7', Colors.white),
          custbutton('+', Colors.blue[700]),
        ]),
        Row(
          children: <Widget>[
            custbutton('6', Colors.white),
            custbutton('5', Colors.white),
            custbutton('4', Colors.white),
            custbutton('-', Colors.blue[700]),
          ],
        ),
        Row(
          children: <Widget>[
            custbutton('3', Colors.white),
            custbutton('2', Colors.white),
            custbutton('1', Colors.white),
            custbutton('x', Colors.blue[700]),
          ],
        ),
        Row(
          children: <Widget>[
            custbutton('.', Colors.white),
            custbutton('0', Colors.white),
            custbutton('%', Colors.blue[700]),
            custbutton('/', Colors.blue[700]),
          ],
        ),
        Row(
          children: <Widget>[
            custbutton('Clear', Colors.yellow[900]),
            custbutton('=', Colors.blue[700]),
          ],
        )
      ]),
    );
  }
}

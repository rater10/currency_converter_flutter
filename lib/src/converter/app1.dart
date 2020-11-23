import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super (key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(
        title: 'Currency convertor',
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key key, this.title}) : super (key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final GlobalKey<FormState> _form = GlobalKey();
  String message;
  String error;
  double amount;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _form,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Image.network(
                'https://images.unsplash.com/photo-1593047385982-6779953820b0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1047&q=80',
              fit: BoxFit.fitWidth,
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'enter the amount in EUR',
                  errorText: error,
                ),
                onChanged: (String value) {
                    setState(() {
                      message = value;
                    });
                },
                validator: (String value) {
                  if (!RegExp(r"^[\d]*\.?[\d]{0,5}$").hasMatch(value)) {
                    return 'enter a number';
                  }
                  return null;
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (_form.currentState.validate()) {
                  setState(() {
                    amount = double.parse(message);
                  });
                }
              },
              child: Text('CONVERT!'),
            ),
            if (amount != null)
              Text(
                '${(amount * 4.8)} RON',
                textScaleFactor: 5/2,
                style: TextStyle(
                  color: Colors.grey[700],
                ),
              ),
          ],
        ),
      ),
    );
  }
}


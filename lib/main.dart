import 'dart:math';
import 'ImcDomain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MaterialApp(
      home: Home(),
    ));

class Home extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Home> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _infoText = "Informe seus dados";

  void _resetFields(){
    weightController.text = "";
    heightController.text = "";
    setState(() {
      _infoText = "Informe seus dados";
    });

  }
  void _Calculate(){

    setState(() {
        _infoText = IMC.Calculate(double.parse(weightController.text), double.parse(heightController.text));
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Calculadora IMC"),
          centerTitle: true,
          backgroundColor: Colors.blue,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.refresh), onPressed: _resetFields)
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          child: Form(
            key: _formKey,
            child : Column(
              children: <Widget>[
                Icon(Icons.person_outline, size: 120.0, color: Colors.blue),
                new TextFormField(
                  decoration: new InputDecoration(
                      labelText: "Peso (KG)",
                      labelStyle: TextStyle(color: Colors.black)),

                  keyboardType: TextInputType.numberWithOptions(decimal: true) ,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25.0),
                  controller: weightController,
                  validator: (value) {
                    if(value.isEmpty){
                      return "Insira seu peso";
                    }
                  },
                ),
                new TextFormField(
                    decoration: new InputDecoration(
                        labelText: "Altura (m)",
                        labelStyle: TextStyle(color: Colors.black)),

                    keyboardType: TextInputType.numberWithOptions(decimal: true) ,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25.0),
                    controller: heightController,
                    validator: (value) {
                      if(value.isEmpty){
                        return "Insira sua Altura";
                      }
                    }),

                Container(
                    height: MediaQuery.of(context).size.width * 0.19,
                    width: MediaQuery.of(context).size.width * 0.65,
                    padding: EdgeInsets.all(10.0),
                    child: RaisedButton(
                      onPressed: (){
                        if(_formKey.currentState.validate()){
                          _Calculate();
                        }
                      },
                      child: Text(
                        "Calcular",
                        style: TextStyle(color: Colors.white, fontSize: 25.0),
                      ),
                      color: Colors.blue,
                    )),
                Text(
                  _infoText,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 25.0),
                )
              ],
            ),
          )
        ));
  }
}

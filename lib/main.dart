import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController pesoControlador = TextEditingController();
  TextEditingController alturaControlador = TextEditingController();
  String _info = "Informe seus Dados!";

  void _limparCampos() {
    pesoControlador.text = "";
    alturaControlador.text = "";
    _info = "Informe seus Dados!";
  }

  void _setarMensagem(double imc) {
    if (imc < 18.6) {
      _info = "Abaixo do Peso (${imc.toStringAsPrecision(3)})";
    } else if (imc >= 18.6 && imc < 24.9) {
      _info = "Peso Ideal (${imc.toStringAsPrecision(3)})";
    } else if (imc >= 24.9 && imc < 29.9) {
      _info = "Levemente Acima do Peso (${imc.toStringAsPrecision(3)})";
    } else if (imc >= 29.9 && imc < 34.9) {
      _info = "Obseidade Grau I (${imc.toStringAsPrecision(3)})";
    } else if (imc >= 34.9 && imc < 39.9) {
      _info = "Obesidade Grau II (${imc.toStringAsPrecision(3)})";
    } else if (imc >= 40) {
      _info = "Obesidade Grau III (${imc.toStringAsPrecision(3)})";
    }
  }

  void _calcularIMC() {
    setState(() {
      double peso = double.parse(pesoControlador.text);
      double altura = double.parse(alturaControlador.text) / 100;
      double imc = (peso / (altura * altura));
      _setarMensagem(imc);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text("Calculadora de IMC"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _limparCampos,
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(Icons.person_outline, size: 120.0, color: Colors.black),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Peso (KG)",
                  labelStyle: TextStyle(color: Colors.black)),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 25.0),
              controller: pesoControlador,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Altura (CM)",
                  labelStyle: TextStyle(color: Colors.black)),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 25.0),
              controller: alturaControlador,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Container(
                height: 50.0,
                child: RaisedButton(
                  onPressed: _calcularIMC,
                  child: Text(
                    "Calcular",
                    style: TextStyle(color: Colors.white, fontSize: 25.0),
                  ),
                  color: Colors.black,
                ),
              ),
            ),
            Text(
              _info,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 25.0),
            ),
          ],
        ),
      ),
    );
  }
}

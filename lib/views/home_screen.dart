import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _form = GlobalKey<FormState>();

  double height;

  double weight;

  String result = "";

  _calcIMC() {
    bool isValid = _form.currentState.validate();

    if (!isValid) {
      return;
    }

    _form.currentState.save();
    final imc = weight / (height * height);
    if (imc < 18.5) {
      setState(() {
        result = "Abaixo do peso";
      });
    } else if (imc >= 18.6 && imc <= 24.9) {
      setState(() {
        result = "Peso Ideal";
      });
    } else if (imc >= 25.0 && imc <= 29.9) {
      setState(() {
        result = "Levemente acima do peso";
      });
    } else if (imc >= 30.0 && imc <= 34.9) {
      setState(() {
        result = "Obesidade grau 1";
      });
    } else if (imc >= 35.0 && imc <= 39.9) {
      setState(() {
        result = "Obesidade grau 2";
      });
    } else if (imc > 40) {
      setState(() {
        result = "Obesidade grau 3";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(
          "Cálculo de IMC",
          style: TextStyle(
            color: Theme.of(context).textTheme.headline1.color,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _form,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset("assets/header.png"),
              if (result != "")
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      "Resultado: $result",
                      style: TextStyle(
                        color: Theme.of(context).textTheme.headline1.color,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Altura (em metros)",
                    prefixIcon: Icon(
                      Icons.emoji_people_rounded,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  validator: (value) {
                    bool isEmpty = value.trim().isEmpty;
                    var newValue = value.replaceAll(',', '.');
                    var newHeight = double.tryParse(newValue);
                    bool isInvalid = newHeight == null || newHeight <= 0;
                    if (isEmpty || isInvalid) {
                      return 'Informe uma altura válida';
                    }

                    return null;
                  },
                  onSaved: (value) {
                    setState(() {
                      height = double.parse(value.replaceAll(',', '.'));
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Peso (em Kg)",
                    prefixIcon: Icon(
                      Icons.person,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  validator: (value) {
                    bool isEmpty = value.trim().isEmpty;
                    var newValue = value.replaceAll(',', '.');
                    var newWeight = double.tryParse(newValue);
                    bool isInvalid = newWeight == null || newWeight <= 0;
                    if (isEmpty || isInvalid) {
                      return 'Informe um peso válido';
                    }

                    return null;
                  },
                  onSaved: (value) {
                    setState(() {
                      weight = double.parse(value.replaceAll(',', '.'));
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: RaisedButton(
                  color: Theme.of(context).accentColor,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Text("Calcular"),
                  onPressed: () => _calcIMC(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

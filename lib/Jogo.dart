import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _imageComp = const AssetImage("images/padrao.png");
  var _winner = " ";

  void _selectOption(String userChoose){
    var option = ["pedra", "papel", "tesoura"];
    var number = Random().nextInt(3);
    var compChoose = option[number];

    switch(compChoose){
      case "pedra":
        setState(() {
          _imageComp = const AssetImage("images/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          _imageComp = const AssetImage("images/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          _imageComp = const AssetImage("images/tesoura.png");
        });
        break;
    }

    if(
        userChoose == "tesoura" && compChoose == "papel" ||
        userChoose == "papel" && compChoose == "pedra" ||
        userChoose == "pedra" && compChoose == "tesoura"
    ){
      setState(() {
        _winner = "Você ganhou";
      });
    }else if(userChoose == compChoose){
      setState(() {
        _winner = "Empate";
      });
    }else{
      setState(() {
        _winner = "O computador ganhou";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Joken Po"),
        titleTextStyle: const TextStyle(
          fontStyle: FontStyle.italic,
          fontSize: 20,
          color: Colors.black
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 35, bottom: 15),
              child: Text(
                "Computador",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Image(image: _imageComp),
            const Padding(
              padding: EdgeInsets.only(top: 35, bottom: 15),
              child: Text(
                "Sua escolha",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => _selectOption("papel"),
                  child: Image.asset("images/papel.png", height: 100),
                ),
                GestureDetector(
                  onTap: () => _selectOption("pedra"),
                  child: Image.asset("images/pedra.png", height: 100),
                ),
                GestureDetector(
                  onTap: () => _selectOption("tesoura"),
                  child: Image.asset("images/tesoura.png", height: 100),
                )
              ],
            ),
             Padding(
              padding: EdgeInsets.only(top: 35, bottom: 15),
              child: Text(
                _winner,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}

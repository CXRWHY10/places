import 'package:flutter/material.dart';

class RoundedButtom extends StatelessWidget{

  String textoBoton;
  RoundedButtom(this.textoBoton);

  @override
  Widget build(BuildContext context) {
    final roundedButtom = InkWell(
      child: Container(
        height: 50,
        width: 160,
        margin: EdgeInsets.only(
          top: 20
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
            colors: [
              Color(0xFF4268D3),
              Color(0xFF574ACE)
            ],
            begin: FractionalOffset(0.0,0.5),
            end: FractionalOffset(1.0, 0.5),
            stops: [0.0,0.5],
            tileMode: TileMode.clamp
          )
        ),
        child: Center(
          child: Text(
            textoBoton,
            style: TextStyle(
              fontFamily: "Lato",
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.white
            ),
          ),
        ),
      ),
      onTap: (){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Navegando..."),
          )
        );
      },
    );

    return roundedButtom;
  }
}
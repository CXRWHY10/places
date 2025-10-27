import 'package:flutter/material.dart';
import 'package:places/card_image.dart';

class CardImageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cardImageList = Container(
      height: 330,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          CardImage("assets/images/uyuni.jpg"),
          CardImage("assets/images/copacabana.jpg"),
          CardImage("assets/images/incachaca.jpg"),
          CardImage("assets/images/samahipata.jpg"),
          CardImage("assets/images/coroico.jpg"),
          CardImage("assets/images/LagunaColorada.jpg"),
        ],
      ),
    );
    return cardImageList;
  }
}
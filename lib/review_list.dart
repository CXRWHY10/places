import 'package:flutter/material.dart';
import 'package:places/review.dart';
class ReviewList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final reviewList = Column(
      children: <Widget>[
        Review("assets/images/mujer.jpg","Laura Leon", "1 review - 5 photos", 4, "Muy buen lugar para visitar."),
        Review("assets/images/mujer2.jpg","Maria Eugenia", "4 review - 2 photos", 3, "Nunca visite el lugar."),
        Review("assets/images/mujer3.jpg","Lorena", "3 review - 2 photos", 5, "Lo recomiendo bastante."),
        Review("assets/images/hombre.jpg","Luis", "8 review - 4 photos", 2, "Me gustaria conocerlo."),
        Review("assets/images/hombre1.jpg","Carlos", "3 review - 4 photos", 3, "Hermoso lugar para visitar."),
      ],
    );
    return reviewList;
  }
}
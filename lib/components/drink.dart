import 'package:esperesso/data/drinkModel.dart';
import 'package:flutter/material.dart';

class Drink extends StatelessWidget {
  drinkModel drink;
   Drink({super.key,required this.drink});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(10),
            ),
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3, vertical: 70),
              child: Row(),
            ),
          ),
        ),
        Positioned(
          top: -10,
          bottom: 55,
          left: MediaQuery.of(context).size.width * .09,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                width: 70,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black87,
                      blurRadius: 30,
                      spreadRadius: 2,
                    ),
                  ],
                ),
              ),
              Image.asset(drink.image, fit: BoxFit.contain),
            ],
          ),
        ),
        Positioned(
          top: 60,
          left: MediaQuery.of(context).size.width * .4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                drink.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              Text(drink.description, style: TextStyle(fontSize: 12)),
            ],
          ),
        ),
        Positioned(
          top: 130,
          right: 40,
          child: Container(
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black45),
            ),
            child: Icon(Icons.arrow_forward, size: 20, color: Colors.black54),
          ),
        ),
      ],
    );
  }
}

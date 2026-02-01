import 'package:esperesso/components/drink.dart';
import 'package:esperesso/data/drinkModel.dart';
import 'package:esperesso/drink_details.dart';
import 'package:flutter/material.dart';

class Home_view extends StatefulWidget {
  const Home_view({super.key});

  @override
  State<Home_view> createState() => _Home_viewState();
}

class _Home_viewState extends State<Home_view> {
  ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            //drinks
            Expanded(
              child: ListView.builder(
                controller: controller,
                  itemCount: drinkModel.drinks.length,
                  itemBuilder: (context,index){
                    return AnimatedBuilder(
                        animation: controller,
                        builder: (BuildContext context, Widget? child) {
                          double offset=0 ;
                          if(controller.hasClients){
                            offset= controller.offset /100-index;
                          }
                          offset=offset.clamp(0, 1);
                          return Transform.scale(
                              scale:1-(offset * .2),
                              child: GestureDetector(
                                  onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (p)=>DrinkDetails())),
                                  child: Drink(drink: drinkModel.drinks[index])));
                        });

                  }),
            )
          ],
        ),
      ),
    );
  }
}

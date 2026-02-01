import 'package:esperesso/components/qty_widget.dart';
import 'package:esperesso/components/toggle_widget.dart';
import 'package:esperesso/data/drinkModel.dart';
import 'package:flutter/material.dart';

class DrinkDetails extends StatefulWidget {
  const DrinkDetails({super.key});

  @override
  State<DrinkDetails> createState() => _DrinkDetailsState();
}

class _DrinkDetailsState extends State<DrinkDetails> {
  final PageController _controller = PageController(viewportFraction: 1);
  double _currentPage = 0;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page ?? 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            left: MediaQuery.of(context).size.width * .05,
            right: MediaQuery.of(context).size.width * .05,
            top: MediaQuery.of(context).size.height * .05,

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      drinkModel.drinks[_currentPage.round()].name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * .05,
                      ),
                    ),
                    Text(
                      drinkModel.drinks[_currentPage.round()].description,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * .02,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Text(
                  "\$${drinkModel.drinks[_currentPage.round()].price.toString()}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.height * .03,
                  ),
                ),
              ],
            ),
          ),
          PageView.builder(
            controller: _controller,
            itemCount: drinkModel.drinks.length,
            itemBuilder: (context, index) {
              final scale = 1 - (_currentPage - index).abs() * 1;
              final translate = 1 - (_currentPage - index) * 50;
              return Transform.translate(
                offset: Offset(translate, 0),
                child: Transform.scale(
                  scale: scale.clamp(.5, 1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Image.asset(
                            drinkModel.drinks[index].image,
                            fit: BoxFit.contain,
                            height: MediaQuery.of(context).size.height * .45,
                          ),

                          // الشادو
                          Positioned(
                            bottom: -17, // 🔥 اتحكمي في المسافة هنا
                            left: 0,
                            right: 0,
                            child: Center(
                              child: Image.asset(
                                "assets/shadow.png",
                                width: MediaQuery.of(context).size.width * .5,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),

          Positioned(
            bottom: MediaQuery.of(context).size.height * .02,
            right: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(4, (index) {
                      List sizeArr = ["Large", "Medium", "Small", "More"];
                      bool isSelected = selectedIndex == index;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Column(
                          children: [
                            AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              padding: EdgeInsets.all(isSelected ? 10 : 8),
                              decoration: BoxDecoration(
                                color: isSelected ? Colors.orange : Colors.white,
                                border: Border.all(
                                  color: isSelected ? Colors.black : Colors.black45,
                                  width: 1.5,
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: sizeArr[index]=="More"?Icon(Icons.arrow_forward,color: isSelected ? Colors.black : Colors.black45,):Image.asset("assets/paper-cup.png",height: isSelected?30:25,),
                            ),
                            SizedBox(height: 5),
                            Text(
                              sizeArr[index],
                              style: TextStyle(
                                fontSize: isSelected ? 12 : 10,
                                color: isSelected ? Colors.black : Colors.black45,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 30,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     ToggleWidget(),
                     SizedBox(width: 15,),
                     Expanded(child: QtyWidget()),
                   ],
                 )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class QtyWidget extends StatefulWidget {
  const QtyWidget({super.key});

  @override
  State<QtyWidget> createState() => _QtyWidgetState();
}

class _QtyWidgetState extends State<QtyWidget> {
  int num=1;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100 )),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: (){
                setState(() {
                  if(num>1){
                  num--;}
                });
              },
              child: Text("-",style: TextStyle(fontSize:20 ),)),          Text(num.toString(),style: TextStyle(fontSize:20 ),),
          GestureDetector(
              onTap: (){
                setState(() {
                  num++;
                });
              },
              child: Text("+",style: TextStyle(fontSize:20 ),)),
        ],
      ),
    ),
    );
  }
}

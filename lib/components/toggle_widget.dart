import 'package:flutter/material.dart';

class ToggleWidget extends StatefulWidget {
  const ToggleWidget({super.key});

  @override
  State<ToggleWidget> createState() => _ToggleWidgetState();
}

class _ToggleWidgetState extends State<ToggleWidget> {
  bool isIced = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          _toggleOption("Hot", !isIced),
          _toggleOption("Iced", isIced)
        ],
      ),
    );
  }

  Widget _toggleOption(String label, bool selected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isIced = label == "Iced";
        });
      },
      child: AnimatedContainer(
        alignment: Alignment.bottomCenter,
        duration: Duration(milliseconds: 300),
        width: selected ? 100 : 70,
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: selected ? Colors.white : Colors.grey[400],
          borderRadius: BorderRadius.circular(70),
        ),
        child: Padding(
         padding: EdgeInsets.symmetric(vertical: 7),
          child: Text(
            label,style: TextStyle(fontSize:15 ,fontWeight: FontWeight.w400),),
        ),
      ),
    );
  }
}

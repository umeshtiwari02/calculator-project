import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final int fillColor;
  final int textColor;
  final double textSize;
  final Function callback;

    const CalculatorButton({
    required this.text,
    required this.fillColor,
    required this.textColor,
    required this.textSize,
    required this.callback,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: SizedBox(
        width: 70,
        height: 60,
        child: FlatButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          child: Text(
            text,
            style: GoogleFonts.lato(
              textStyle: TextStyle(fontSize: textSize),
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          onPressed: () => callback(text),
          color: Color(fillColor),
          textColor: Color(textColor),
        ),
      ),
    );
  }
}

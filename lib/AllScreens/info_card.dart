import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


@immutable
class InfoCard extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function onPressed;

  InfoCard({
    @required this.text,
    @required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
        child: ListTile(
          leading: Icon(
            icon,
            color: Colors.black,
          ),
          title: Text(
            text,
            style: GoogleFonts.sourceSansPro(fontSize: 20, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
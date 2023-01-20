import 'package:flutter/material.dart';

class CapsuleButton extends StatelessWidget {
  const CapsuleButton({
    required this.text,
    required this.color,
    required this.onTap,
    Key? key
  }) : super(key: key);

  final String text;
  final Color color;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        height: 35.0,
        width: 100.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(100.0),
          boxShadow: [
            BoxShadow(
              color: color,
              spreadRadius: 0.0,
              blurRadius: 6.0,
              offset: const Offset(0, 2),
            )
          ],
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomIconBtn extends StatelessWidget {
  final IconData iconData;
  final Function()? onPressed;
  final Color backgroundColor;

  CustomIconBtn({
    required this.iconData,
    this.onPressed,
    this.backgroundColor = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(100),
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black),
              color: backgroundColor,
            ),
            child: Icon(iconData),
          ),
        ),
      ),
    );
  }
}

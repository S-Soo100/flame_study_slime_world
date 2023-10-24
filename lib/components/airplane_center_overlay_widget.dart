import 'package:flutter/material.dart';

class AirplaneCenterOverlayWidget extends StatefulWidget {
  Function leftTap;
  Function rightTap;

  AirplaneCenterOverlayWidget(
      {super.key, required this.leftTap, required this.rightTap});

  @override
  State<AirplaneCenterOverlayWidget> createState() =>
      _AirplaneCenterOverlayWidgetState();
}

class _AirplaneCenterOverlayWidgetState
    extends State<AirplaneCenterOverlayWidget> {
  Color _left = Colors.white;
  Color _right = Colors.white;

  void changeLeftColor() {
    setState(() {
      _left = Colors.amberAccent;
      Future.delayed(const Duration(milliseconds: 200), () {
        _left = Colors.white;
        setState(() {});
      });
    });
  }

  void changeRightColor() {
    setState(() {
      _right = Colors.amberAccent;
      Future.delayed(const Duration(milliseconds: 200), () {
        _right = Colors.white;
        setState(() {});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            widget.leftTap();
            changeLeftColor();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: AnimatedContainer(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: _left,
                ),
                padding: const EdgeInsets.all(30),
                duration: const Duration(milliseconds: 200),
                child: const Text("<-")),
          ),
        ),
        GestureDetector(
          onTap: () {
            widget.rightTap();
            changeRightColor();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: AnimatedContainer(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: _right,
                ),
                padding: const EdgeInsets.all(30),
                duration: const Duration(milliseconds: 300),
                child: const Text("->")),
          ),
        ),
      ],
    );
  }
}

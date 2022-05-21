import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final Function()? onPressed;
  final Widget child;
  final bool isPrimary;

   const MainButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.isPrimary = true
  }) : super(
          key: key,
      );
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
        child: child,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shadowColor: Colors.transparent,
          primary: isPrimary ? const Color(0xff135085) : const Color(0x11ffffff),
          fixedSize: const Size(200, 35),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero
          )
        )
    );
  }

  
}

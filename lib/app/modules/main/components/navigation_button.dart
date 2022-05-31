import 'package:flutter/material.dart';

class NavigationButton extends StatelessWidget {
  final Function()? onPressed;
  final Widget child;
  final bool isPrimary;

   const NavigationButton({
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
          primary: Colors.transparent,
          fixedSize: const Size(250, 50),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero
          )
        )
    );
  }

  
}

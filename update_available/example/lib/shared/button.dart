import 'package:flutter/widgets.dart';

import 'colors.dart';

final class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.child,
    this.onTap,
  });

  final VoidCallback? onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: red,
          borderRadius: BorderRadius.circular(100.0),
        ),
        alignment: Alignment.center,
        child: child,
      ),
    );
  }
}

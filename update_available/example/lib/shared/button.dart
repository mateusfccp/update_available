import 'package:flutter/widgets.dart';

import 'colors.dart';

class Button extends StatelessWidget {
  const Button({
    Key key,
    @required this.child,
    this.onTap,
  }) : super(key: key);

  final VoidCallback onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Red,
          borderRadius: BorderRadius.circular(100),
        ),
        alignment: Alignment.center,
        child: child,
      ),
    );
  }
}

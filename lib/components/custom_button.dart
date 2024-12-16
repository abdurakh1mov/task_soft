import 'package:flutter/material.dart';
import 'package:task_soft/style/color_set.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    required this.height,
    required this.width,
    required this.iconColor,
    this.backgroundColor = ColorSet.recitationContainerColor,
  });
  final double height;
  final double width;
  final IconData? icon;
  final String title;
  final Color backgroundColor;
  final Color iconColor;
  final Function() onTap;
  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton>
    with SingleTickerProviderStateMixin {
  AnimationController? _controllerA;
  var squareScaleA = 0.95;
  @override
  void initState() {
    _controllerA = AnimationController(
      vsync: this,
      lowerBound: 0.95,
      upperBound: 1.0,
      duration: const Duration(milliseconds: 80),
    );
    _controllerA!.addListener(() {
      setState(() {
        squareScaleA = _controllerA!.value;
      });
    });

    _controllerA!.forward(from: 0.0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
        widget.onTap();
      },
      child: Listener(
        behavior: HitTestBehavior.opaque,
        onPointerDown: (_) {
          _controllerA!.reverse();
        },
        onPointerUp: (_) {
          _controllerA!.forward(from: 1.0);
        },
        child: Transform.scale(
          scale: squareScaleA,
          child: Container(
            height: widget.height,
            width: widget.width,
            decoration: BoxDecoration(
              color: widget.backgroundColor,
              shape: BoxShape.circle,
            ),
            child: (widget.icon != null)
                ? Icon(
                    widget.icon,
                    color: widget.iconColor,
                  )
                : Text(
                    widget.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

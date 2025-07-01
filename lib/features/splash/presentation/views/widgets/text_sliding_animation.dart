import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TextSlidingAnimation extends StatelessWidget {
  const TextSlidingAnimation({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAnimation,
      builder: (context, _) {
        return SlideTransition(
          position: slidingAnimation,
          child: Padding(
            padding: EdgeInsets.only(left: 35.0.sp),
            child: Text(
              "Read free Books",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.sp,
              ),
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';

class AnimatedCircularProgressAnimator extends StatelessWidget {
  const AnimatedCircularProgressAnimator({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
        strokeWidth: 3,
        valueColor: AlwaysStoppedAnimation<Color>(AppColors.whiteColor),
        backgroundColor: Theme.of(context).colorScheme.shadow
    );
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traly/gen/assets.gen.dart';
import 'package:traly/src/features/settings/widgets/inbox_zero_pop_up.dart';
import 'package:traly/src/shared/utils/app_texts.dart';
import 'package:traly/src/theme/color/color_scheme.dart';
import 'package:traly/src/theme/typography/fontweight_ext.dart';
import 'package:traly/src/theme/typography/typography_extension_on_context.dart';

class AchievementCircle extends StatelessWidget {
  final double progress; // e.g. 0.4 means 2/5 days
  final String? subtitle;
  final double? width;
  final double? height;
  final bool? isAchievement;

  const AchievementCircle({
    super.key,
    required this.progress,
 this.subtitle,
    this.width,
    this.height,
    this.isAchievement = true,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          log('Inbox Zero Circle tapped');
          showInboxZeroPopUp(context);
        },
        child: SizedBox(
          width: width ?? 160.w,
          height: height ?? 160.h,
          child: CustomPaint(
            size: Size(160.w, 160.h),
            painter: CircleProgressPainter(progress),
            child: isAchievement == true
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Assets.vectors.mark.svg(
                        width: 25.w,
                      ),
                      Text(
                        '${AppTexts.inboxZero} Streak',
                        style: context.labelLarge?.medium,
                      ),
                      Text(
                        subtitle ?? '',
                        style: context.bodyLarge?.semiBold,
                      ),
                    ],
                  )
                : const SizedBox.shrink(),
          ),
        ));
  }
}

class CircleProgressPainter extends CustomPainter {
  final double progress;

  CircleProgressPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final gradient = SweepGradient(
      colors: [
        AppColors.secondary.shade500.withValues(alpha: 0.4),
        AppColors.secondary.shade500.withValues(alpha: 0.4),
      ],
      startAngle: 0.0,
      endAngle: 3.14 * 2,
    );

    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6.w
      ..strokeCap = StrokeCap.round;

    final backgroundPaint = Paint()
      ..color = Colors.white24
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6.w;

    final center = size.center(Offset.zero);
    final radius = size.width / 2;

    // Draw background circle
    canvas.drawCircle(center, radius, backgroundPaint);

    // Draw progress arc
    final sweepAngle = 2 * 3.1416 * progress;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -3.1416 / 2,
      sweepAngle,
      false,
      paint,
    ); // start at top
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

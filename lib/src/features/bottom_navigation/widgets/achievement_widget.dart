import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traly/gen/assets.gen.dart';
import 'package:traly/src/shared/constants.dart';
import 'package:traly/src/shared/extensions/spacing_ext.dart';
import 'package:traly/src/shared/utils/app_texts.dart';
import 'package:traly/src/theme/color/color_scheme.dart';
import 'package:traly/src/theme/typography/fontweight_ext.dart';
import 'package:traly/src/theme/typography/typography_extension_on_context.dart';

class AchievementWidget extends ConsumerWidget {
  const AchievementWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            padding: EdgeInsets.all(16.w),
          
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: .15),
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(
                color: Colors.white.withValues(alpha: .2),
                //width: 1.5,
              ),
            ),
            child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AchievementItem(
                  icon: Assets.vectors.inboxZero,
                  text: AppTexts.inboxZero,
                  numerator: 2,
                  denominator: 3,
                 // width: 64.w,
                ),
               
                AchievementItem(
                  icon: Assets.vectors.spam,
                  text: AppTexts.spamSlayer,
                  numerator: 5,
                  denominator: 10,
                 
                ),
                
                AchievementItem(
                  icon: Assets.vectors.organizer,
                  text: AppTexts.organizerPro,
                  numerator: 1,
                  denominator: 5,
                 // width: 74.5.w,
                ),
                
                AchievementItem(
                  icon: Assets.vectors.mark,
                  text: AppTexts.quickReply,
                  numerator: 7,
                  denominator: 10,
                 // width: 65.w,
                ),
              ],
            ),
          ),
        ));
  }
}

class AchievementItem extends StatefulWidget {
  final SvgGenImage icon;
  final String text;
  final double numerator;
  final double denominator;
  final double? width;
  const AchievementItem(
      {super.key,
      required this.icon,
      required this.text,
      required this.numerator,
      required this.denominator,
      this.width});

  @override
  State<AchievementItem> createState() => _AchievementItemState();
}

class _AchievementItemState extends State<AchievementItem> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ClipRRect(
         
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
              padding: EdgeInsets.all(16.w),
             
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: .15),
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white.withValues(alpha: .2),
                ),
              ),
              child: Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(colors: [
                    AppColors.primary.shade400,
                    AppColors.secondary.shade500,
                  ]),
                ),
                child: widget.icon.svg(fit: BoxFit.scaleDown),
              )),
        ),
      ),
      TralyConstants.smallSpace.h.vSpace,
      Text(widget.text,
          style: context.labelLarge?.regular.copyWith(
            color: AppColors.whites.withValues(alpha: 0.9),
          )),
      TralyConstants.smallSpace.h.vSpace,
      Text(
          '${widget.numerator.toStringAsFixed(0)}/${widget.denominator.toStringAsFixed(0)}',
          style: context.labelMedium?.regular
              .copyWith(color: AppColors.whites.withValues(alpha: 0.6))),
    ]);
  }
}

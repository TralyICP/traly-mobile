import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traly/gen/assets.gen.dart';
import 'package:traly/src/shared/constants.dart';
import 'package:traly/src/shared/extensions/spacing_ext.dart';
import 'package:traly/src/shared/utils/app_texts.dart';
import 'package:traly/src/theme/color/color_scheme.dart';
import 'package:traly/src/theme/typography/fontweight_ext.dart';
import 'package:traly/src/theme/typography/typography_extension_on_context.dart';

class RedemptionWidget extends StatelessWidget {
  const RedemptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            width: 1.sw,
            height: 190.h,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.whites.withValues(alpha: .2),
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.shade300.withValues(alpha: 0.3),
                  spreadRadius: 4,
                  blurRadius: 3,
                  offset: const Offset(3, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Assets.vectors.stars.svg(
                  width: 30.w,
                ),
                TralyConstants.mediumSpace.h.vSpace,
                Text(
                  'No ${AppTexts.recentRedemptions.toLowerCase()}.',
                  style: context.bodyMedium?.regular.copyWith(
                    color: AppColors.whites.withValues(alpha: .6),
                  ),
                ),
                TralyConstants.tinySpace.h.vSpace,
                Text(
                  AppTexts.rewardsWillAppear,
                  style: context.bodySmall?.regular,
                ),
              ],
            ),
          ),
        ));
  }
}
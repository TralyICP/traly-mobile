import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traly/gen/assets.gen.dart';
import 'package:traly/src/shared/constants.dart';
import 'package:traly/src/shared/extensions/spacing_ext.dart';
import 'package:traly/src/theme/typography/typography_extension_on_context.dart';
import 'package:traly/src/theme/color/color_scheme.dart';
import 'package:traly/src/theme/typography/fontweight_ext.dart';

class RewardWidget extends StatefulWidget {
  final SvgGenImage icon;
  final String title;
  final String points;
  final bool? isLower;
  const RewardWidget(
      {super.key,
      required this.icon,
      required this.title,
      required this.points,
      this.isLower = false});

  @override
  State<RewardWidget> createState() => _RewardWidgetState();
}

class _RewardWidgetState extends State<RewardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 173.w,
      height: 138.h,
      padding: EdgeInsets.all(17.w),
      decoration: BoxDecoration(
        color: AppColors.primary.shade700,
        border: Border.all(color: AppColors.whites.withValues(alpha: .3)),
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.shade300.withValues(alpha: 0.3),
            spreadRadius: 4,
            blurRadius: 3,
            offset: const Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 35.w,
            height: 35.h,
            decoration: BoxDecoration(
              color: AppColors.primary.shade600,
              shape: BoxShape.circle,
            ),
            child: widget.icon.svg(fit: BoxFit.scaleDown),
          ),
          TralyConstants.smallSpaceX.h.vSpace,
          Text(
            widget.title,
            style: context.bodyMedium?.medium,
          ),
          TralyConstants.tinySpace.h.vSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${widget.points} pts',
                style: context.bodySmall?.regular
                    .copyWith(color: AppColors.whites.withValues(alpha: .7)),
              ),
              Container(
                width: 62.w,
                height: 24.h,
                decoration: BoxDecoration(
                    gradient: widget.isLower == false
                        ? LinearGradient(colors: [
                            AppColors.primary.shade200,
                            AppColors.primary.shade200
                          ])
                        : LinearGradient(colors: [
                            AppColors.primary.shade400,
                            AppColors.secondary.shade500,
                          ]),
                    borderRadius: BorderRadius.circular(14.r)),
                padding: TralyConstants.smallSpace.w.hEdgeInsets,
                child: Center(
                  child: Text(
                    'Redeem',
                    style: context.labelLarge?.medium,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

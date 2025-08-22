import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traly/gen/assets.gen.dart';
import 'package:traly/src/shared/constants.dart';
import 'package:traly/src/shared/extensions/spacing_ext.dart';
import 'package:traly/src/theme/color/color_scheme.dart';
import 'package:traly/src/theme/typography/fontweight_ext.dart';
import 'package:traly/src/theme/typography/typography_extension_on_context.dart';

class SettingsWidget extends StatefulWidget {
  final SvgGenImage icon;
  final String text;
  final Function()? onTap;
  const SettingsWidget(
      {super.key, required this.icon, required this.text, this.onTap});

  @override
  State<SettingsWidget> createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Apply blur
            child: InkWell(
              onTap: widget.onTap,
              child: Container(
                padding: EdgeInsets.all(16.w),
                width: 362.w,
                height: 70.h,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: .15),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: .2),
                    //width: 1.5,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 35.w,
                          height: 35.h,
                          decoration: BoxDecoration(
                            color: AppColors.primary.shade600,
                            shape: BoxShape.circle,
                          ),
                          child: widget.icon.svg(
                            width: 20.w,
                            fit: BoxFit.scaleDown),
                        ),
                        TralyConstants.smallSpaceX.w.hSpace,
                        Text(
                          widget.text,
                          style: context.bodyMedium?.regular,
                        ),
                      ],
                    ),
                    const Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
            )));
  }
}

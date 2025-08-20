import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traly/gen/assets.gen.dart';
import 'package:traly/src/features/clean/models/clean_emails_response.dart';
import 'package:traly/src/shared/constants.dart';
import 'package:traly/src/shared/extensions/spacing_ext.dart';
import 'package:traly/src/theme/color/color_scheme.dart';
import 'package:traly/src/theme/typography/fontweight_ext.dart';
import 'package:traly/src/theme/typography/typography_extension_on_context.dart';

class EmailContainer extends StatefulWidget {
  final EmailModel emailModel;
  const EmailContainer({super.key, required this.emailModel});

  @override
  State<EmailContainer> createState() => _EmailContainerState();
}

class _EmailContainerState extends State<EmailContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      padding: EdgeInsets.only(
        left: 12.w,
        top: 12.w,
        bottom: 12.w,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white.withValues(alpha: .2),
        ),
        //  color: Colors.black.withValues(alpha: .2),
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Row(
        children: [
          Container(
            width: 38.w,
            height: 38.h,
            decoration: BoxDecoration(
                   gradient: LinearGradient(colors: [
                              AppColors.primary.shade400,
                              AppColors.secondary.shade500,
                            ], stops: const [
                              .4,
                              1.0,
                            ]),
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(
                  widget.emailModel.imageUrl,
                ),
              ),
             
            ),
          ),
          TralyConstants.mediumSpace.w.hSpace,
          Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.emailModel.title,
                    style: context.bodyMedium?.medium,
                  ),
                  Text(
                    widget.emailModel.subtitle,
                    style: context.bodySmall?.regular,
                  )
                ],
              )),
          Expanded(
            flex: 1,
            child: ClipRRect(
              // borderRadius: BorderRadius.circular(24.r),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Assets.vectors.premiumStar.svg(height: 20.h),
                      TralyConstants.minuteSpace.h.vSpace,
                      Assets.vectors.markedBox.svg(height: 20.h),
                      TralyConstants.minuteSpace.h.vSpace,
                      Assets.vectors.clean.svg(height: 20.h),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

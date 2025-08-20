import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traly/gen/assets.gen.dart';
import 'package:traly/src/features/settings/pages/achievements.dart';
import 'package:traly/src/shared/constants.dart';
import 'package:traly/src/shared/extensions/spacing_ext.dart';
import 'package:traly/src/shared/utils/app_texts.dart';
import 'package:traly/src/theme/color/color_scheme.dart';
import 'package:traly/src/theme/typography/fontweight_ext.dart';
import 'package:traly/src/theme/typography/typography_extension_on_context.dart';

class InboxZeroPopUp extends StatefulWidget {
  const InboxZeroPopUp({super.key});

  @override
  State<InboxZeroPopUp> createState() => _InboxZeroPopUpState();
}

class _InboxZeroPopUpState extends State<InboxZeroPopUp> {
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
      child: Container(
          height: 200.h,
          //   width: 402.w,
          padding: EdgeInsets.only(
            left: 4.w,
            top: 16.h,
            right: 9.w,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.r),
            gradient: LinearGradient(
              colors: [
                AppColors.whites.withValues(alpha: .15),
                AppColors.whites.withValues(alpha: .15)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    YourBadge(
                        greaterThanTWo: false,
                        showText: false,
                        icon: Assets.vectors.mark,
                        text: AppTexts.inboxZero),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(AppTexts.inboxZero,
                              style: context.bodyLarge?.semiBold),
                          TralyConstants.tinySpace.h.vSpace,
                          Text(
                            AppTexts.maintainEmptyInbox,
                            style: context.bodySmall?.regular.copyWith(
                                color:
                                    AppColors.whites.withValues(alpha: .8)),
                          ),
                          TralyConstants.smallSpaceX.h.vSpace,
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.r),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
                                child: Container(
                                height: 44.h,
                                  decoration: BoxDecoration(
                                    color: AppColors.whites.withValues(alpha: .1),
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  child: Column(
                                    children: [
                                      Expanded(
                                          child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Progress',
                                            style: context.labelLarge?.regular
                                                .copyWith(
                                              color: AppColors.whites.withValues(),
                                            ),
                                          ),
                                          Text(
                                            ' 2/5 days completed',
                                            style: context.labelLarge?.regular,
                                          )
                                        ],
                                      )),
                                      TralyConstants.tinySpace.h.vSpace,
                                      LinearProgressIndicator(
                                        borderRadius:
                                            BorderRadius.circular(9999.r),
                                        value: 2 / 5,
                                        backgroundColor: AppColors.whites
                                            .withValues(alpha: .1),
                                        minHeight: 6,
                                      ),
                                    //  TralyConstants.smallSpaceX.h.vSpace,
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          TralyConstants.mediumSpace.h.vSpace,
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 16.w),
                      child: Assets.vectors.stars.svg(
                        color: AppColors.yellow.shade500,
                      ),
                    ),
                    TralyConstants.smallSpaceX.w.hSpace,
                    Text(
                      AppTexts.pointsUponCompletion,
                      style: context.bodySmall?.regular.copyWith(
                          color: AppColors.whites.withValues(alpha: .8)),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}

/// Display dialog when the user has an empty inbox for 5 consecutive days.

Future<bool> showInboxZeroPopUp(BuildContext context) async {
  return await showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(horizontal: 0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: const InboxZeroPopUp(),
        ),
      );
    },
  );
}

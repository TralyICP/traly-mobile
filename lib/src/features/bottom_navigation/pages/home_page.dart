import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traly/gen/assets.gen.dart';
import 'package:traly/src/features/bottom_navigation/widgets/achievement_widget.dart';
import 'package:traly/src/features/bottom_navigation/widgets/home_page_widget.dart';
import 'package:traly/src/shared/constants.dart';
import 'package:traly/src/shared/extensions/spacing_ext.dart';
import 'package:traly/src/shared/utils/app_texts.dart';
import 'package:traly/src/theme/typography/typography_extension_on_context.dart';
import 'package:traly/src/theme/color/color_scheme.dart';
import 'package:traly/src/theme/typography/fontweight_ext.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                // AppColors.secondary.shade100,
                AppColors.primary.shade800,
                AppColors.primary.shade700,
                AppColors.primary.shade800,
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              //     stops: const [.1, .8, 1.0]
            ),
          ),
          child: SafeArea(
              //   maintainBottomViewPadding: true,
              child: Padding(
            padding: TralyConstants.mediumSpaceM.w.hEdgeInsets,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              TralyConstants.mediumSpaceM.h.vSpace,

              ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      padding: EdgeInsets.all(16.w),
                      width: 362.w,
                      height: 70.h,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          AppColors.primary.shade600,
                          AppColors.secondary.shade500,
                        ], stops: const [
                          .3,
                          1
                        ]),
                        // color: Colors.white.withValues(alpha: .15),
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(
                          color: Colors.white.withValues(alpha: .2),
                          //width: 1.5,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${AppTexts.goodMorning}'
                            '${AppTexts.userName}',
                            style: context.bodyLarge?.regular,
                          ),
                          Container(
                            width: 40.w,
                            height: 40.h,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 2.w,
                                  color: AppColors.secondary.shade400,
                                )),
                            child: Assets.images.myAvatar.image(),
                          ),
                        ],
                      ),
                    ),
                  )),

              TralyConstants.smallSpaceX.h.vSpace, 

       //       TralyConstants.smallSpace.h.verticalSpace,

              Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 16.w,
                                                vertical: 4.h,
                                              ),
                                              width: 140.w,
                                              decoration: BoxDecoration(
                                                  color: AppColors.whites.withValues(alpha: .2),
                                                  borderRadius: BorderRadius.circular(20.r)),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  Assets.images.stars.image(),
                                                  Text(
                                                    '${AppTexts.pointsNum} pts •',
                                                    style: context.labelLarge?.medium,
                                                  ),
                                                  InkWell(
                                                    child: Text(
                                                      AppTexts.claim,
                                                      style: context.labelLarge?.semiBold
                              .copyWith(color: AppColors.primary.shade400),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                            ),
                    TralyConstants.bigSpace.h.verticalSpace,

                    Center(
                      
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Container(
                            width: 260.w,
                            height: 260.w,
                            decoration: BoxDecoration(
                                color: const Color(0xFF8A2BE2)
                                    .withValues(alpha: .2),
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFF8A2BE2)
                                        .withValues(alpha: 0.3),
                                    spreadRadius: 5,
                                    blurRadius: 3,
                                    // offset: const Offset(
                                    //     3,3),
                                  ),
                                ],
                                border: Border.all(
                                  color: AppColors.whites.withValues(alpha: .2),
                                )),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '78%',
                                    style: context.displayLarge?.extraBold
                                        .copyWith(),
                                  ),
                                  TralyConstants.smallSpaceX.h.vSpace,
                                  SizedBox(
                                      width: 116.w,
                                      height: 50.h,
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        AppTexts.cleanlinessStore.toUpperCase(),
                                        style: context.bodySmall?.medium,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    TralyConstants.mediumSpaceX.h.verticalSpace, //24
                    TralyConstants.minuteSpace.h.verticalSpace,

                    Text(
                      textAlign: TextAlign.center,
                      AppTexts.inboxHealth,
                      style: context.titleSmall?.medium.copyWith(),
                    ),

                    TralyConstants.mediumSpaceM.h.verticalSpace,
                    Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 81.w, vertical: 14.h),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              AppColors.primary.shade400,
                              AppColors.secondary.shade500,
                            ], stops: const [
                              .4,
                              1.0,
                            ]),
                            borderRadius: BorderRadius.circular(24.r)),
                        child: Text(
                          AppTexts.cleanNow,
                          style: context.bodyLarge?.semiBold.copyWith(),
                        )),

                    TralyConstants.mediumSpaceX.h.verticalSpace,
                    Row(
                      children: [
                        Expanded(
                          child: HomePageWidget(
                              icon: Assets.images.openMail.image(),
                              number: 24,
                              text: AppTexts.emailsOpened),
                        ),
                        TralyConstants.mediumSpace.w.hSpace,
                        Expanded(
                          child: HomePageWidget(
                              icon: Assets.images.junk.image(),
                              number: 8,
                              text: AppTexts.junkUnsubscribed),
                        ),
                      ],
                    ),
                    TralyConstants.mediumSpaceX.w.vSpace,
                    HomePageWidget(
                        width: 1.sw,
                        textWidth: 122.w,
                        icon: Assets.images.folder.image(),
                        number: 5,
                        text: AppTexts.foldersOrganized),
                    TralyConstants.mediumSpaceX.h.verticalSpace,
                    Text(
                      AppTexts.suggestedActions,
                      style: context.bodyLarge?.medium.copyWith(
                        color: AppColors.whites.withValues(alpha: .9),
                      ),
                    ),
                    TralyConstants.mediumSpace.h.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Actions(
                            width: 181.w,
                            icon: Assets.vectors.spam,
                            text: AppTexts.unsubscribeSpam),
                        TralyConstants.mediumSpace.w.hSpace,
                        Actions(
                            width: 147.w,
                            icon: Assets.vectors.mark,
                            text: AppTexts.markAsDone),
                      ],
                    ),

                    TralyConstants.mediumSpaceX.h.verticalSpace,

                    /// Achievements Section
                    Text(
                      AppTexts.achievements,
                      style: context.bodyLarge?.medium,
                    ),
                    TralyConstants.mediumSpace.vSpace,
                    const AchievementWidget(),
                    TralyConstants.ctaIconSize.h.vSpace,
                    TralyConstants.appBarHeight.h.vSpace,
                  ])))
              /////
            ]),
          ))),
    );
  }
}

class Actions extends StatelessWidget {
  final SvgGenImage icon;
  final String text;
  final double? width;
  final double? height;
  const Actions(
      {super.key,
      required this.icon,
      required this.text,
      this.width,
      this.height});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
        child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              width: width,
              height: 46.h,
              //   padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 17.h),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: .15),
                borderRadius: BorderRadius.circular(24.r),
                border: Border.all(
                  color: Colors.white.withValues(alpha: .2),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon.svg(),
                  TralyConstants.smallSpace.w.hSpace,
                  Text(
                    text,
                    style: context.bodySmall?.regular.copyWith(
                      color: AppColors.whites.withValues(alpha: .9),
                    ),
                  ),
                ],
              ),
            )));
  }
}

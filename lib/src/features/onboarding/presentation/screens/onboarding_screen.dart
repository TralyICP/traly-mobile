import 'dart:async';
import 'dart:math';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traly/gen/assets.gen.dart';
import 'package:traly/src/features/bottom_navigation/screens/bottom_nav_bar_screen.dart';
import 'package:traly/src/features/onboarding/presentation/widgets/bezier_curve_container.dart';
import 'package:traly/src/routing/routing.dart';
import 'package:traly/src/shared/constants.dart';
import 'package:traly/src/shared/extensions/spacing_ext.dart';
import 'package:traly/src/shared/utils/app_texts.dart';
import 'package:traly/src/shared/utils/widgets/traly_logo.dart';
import 'package:traly/src/theme/color/color_scheme.dart';
import 'package:traly/src/theme/typography/fontweight_ext.dart';
import 'package:traly/src/theme/typography/typography_extension_on_context.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _controller;
  int _current0 = 0;
  Timer? _timer;

  final List<String> titles = [
    AppTexts.powerUp,
    AppTexts.clearClutter,
    AppTexts.earnRewards,
  ];

  final List<String> subTitles = [
    AppTexts.gamifyNotifs,
    AppTexts.inboxControl,
    AppTexts.turnInbbox,
  ];

  @override
  void initState() {
    super.initState();
    _controller = PageController();

    _startAutoSlide();
  }

  void _startAutoSlide() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 3), (_) {
      if (_current0 < subTitles.length - 1) {
        _controller.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
        setState(() {
          _current0++;
        });
      } else {
        setState(() {
          _current0 = 0;
        });
        _controller.jumpToPage(0); // Reset to first page
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Assets.images.futuristicPupleImage.image(
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        SafeArea(
          child: Stack(children: [
            Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              TralyConstants.mediumSpaceX.h.vSpace,
              const TopTralyLogo(),
              TralyConstants.bigSpaceX.h.vSpace,
              Expanded(
                child: PageView.builder(
                    controller: _controller,
                    itemCount: titles.length,
                    onPageChanged: (index) {
                      setState(() {
                        _current0 = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RichText(
                                  text: TextSpan(
                                      text: '${titles[index].split(" ")[0]} ',
                                      style: context.titleLarge?.copyWith(
                                        fontFamily: AppTexts.abnesFontFamily,
                                      ),
                                      children: [
                                    TextSpan(
                                      text: titles[index].split(" ")[1],
                                      style: TextStyle(
                                          color: AppColors.secondary.shade400),
                                    ),
                                  ])),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RichText(
                                  text: TextSpan(
                                      text: '${titles[index].split(" ")[2]} ',
                                      style: context.titleLarge?.copyWith(
                                          fontFamily: AppTexts.abnesFontFamily,
                                          color: AppColors.primary.shade400),
                                      children: [
                                    TextSpan(
                                        text: titles[0].split(" ")[3],
                                        style: const TextStyle(
                                            color: AppColors.whites)),
                                  ])),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                titles[index].split(" ")[4],
                                style: context.titleLarge?.copyWith(
                                    fontFamily: AppTexts.abnesFontFamily,
                                    color: AppColors.whites),
                              ),
                            ],
                          ),
                          TralyConstants.mediumSpaceX.vSpace,
                          Text(
                            textAlign: TextAlign.center,
                            subTitles[index],
                            style: context.titleLarge?.regular.copyWith(
                              fontFamily: AppTexts.prontoMonoFontFamily,
                              color: AppColors.secondary.shade400,
                            ),
                          ),
                        ],
                      );
                    }),
              ),
            ]),
          ]),
        ),
        Positioned(
            top: 450.h,
            left: 1.sw / 2 - 5.w,
            child: Container(
                width: 10.h,
                height: 10.h,
                decoration: BoxDecoration(
                  color: AppColors.whites.shade100.withValues(alpha: .5),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.whites.withValues(alpha: .85),
                        blurRadius: 120,
                        spreadRadius: 110.r)
                  ],
                  gradient: RadialGradient(
                    colors: [
                      AppColors.whites.withValues(alpha: .5),
                      AppColors.whites.withValues(alpha: .4),
                    ],
                    center: Alignment.center,
                    radius: 0.5,
                  ),
                ))),
        Positioned(
            top: 318.h,
            right: 0,
            left: 0,
            child: Assets.vectors.onboardingSend.svg(height: 100.sp)),
        Positioned(
            top: 220.h,
            right: -20,
            child: Assets.vectors.onboardingInbox.svg(height: 48.sp)),
        Positioned(
            top: 399.h,
            right: 133.2.w,
            child: Assets.vectors.onboardingInbox.svg()),
        Positioned(
            top: 399.h, left: 133.2.w, child: Assets.vectors.shield.svg()),
        Positioned(
            top: 340.h,
            left: -20,
            child: Transform.rotate(
                angle: -pi * 0.198944,
                child: Assets.vectors.shield.svg(height: 48.sp))),
        Positioned(
          top: 458.h,
          child: SizedBox(
            width: 1.sw,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  3,
                  (i) => Container(
                        width: _current0 == i ? 12.w : 8.w,
                        height: _current0 == i ? 12.w : 8.w,
                        margin: EdgeInsets.symmetric(horizontal: 4.w),
                        decoration: BoxDecoration(
                          color: _current0 == i
                              ? AppColors.gray.shade900
                              : AppColors.gray.shade600,
                          shape: BoxShape.circle,
                        ),
                      )),
            ),
          ),
        ),
        const Positioned(
          bottom: 0,
          child: BottomContent(),
        )
      ],
    ));
  }
}

class BottomContent extends StatelessWidget {
  const BottomContent({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCurvedCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TralyConstants.iconSize.vSpace,
          TralyConstants.tinySpace.vSpace,
          Text(AppTexts.dontHaveAnAccount, style: context.bodyMedium?.regular),
          TralyConstants.mediumSpaceX.vSpace,
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                side: BorderSide(color: AppColors.whites.withValues(alpha: .5)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Assets.vectors.google.svg(),
                  TralyConstants.smallSpace.hSpace,
                  Text(
                    AppTexts.continueWGoogle,
                    style: context.bodyMedium?.medium,
                  )
                ],
              )),
          TralyConstants.mediumSpace.vSpace,
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                side: BorderSide(color: AppColors.whites.withValues(alpha: .5)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Assets.vectors.inbox.svg(),
                  TralyConstants.smallSpace.hSpace,
                  Text(
                    ' sammyaa@gmail.com',
                    style: context.bodyMedium?.regular,
                  ),
                ],
              )),
          TralyConstants.mediumSpace.vSpace,
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(56.r),
              gradient: LinearGradient(colors: [
                AppColors.primary.shade400,
                AppColors.secondary.shade500,
              ], stops: const [
                .4,
                1.0,
              ]),
            ),
            child: ElevatedButton(
                onPressed: () {},
                // ADD GRADIENT
                style: ElevatedButton.styleFrom(
                  side:
                      BorderSide(color: AppColors.whites.withValues(alpha: .5)),
                ),
                child:
                    Text(AppTexts.signUp, style: context.bodyMedium?.medium)),
          ),
          TralyConstants.mediumSpaceM.vSpace,
          RichText(
            text: TextSpan(text: AppTexts.alreadyHaveAnAccount, children: [
              TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      context.goNamed(AppRoute.bottomNavigation.name,
                          pathParameters: {
                            "page": BottomNavigationPage.homePage.name,
                          });
                    },
                  text: AppTexts.logIn,
                  style: context.bodySmall?.regular
                      .copyWith(color: AppColors.secondary.shade400))
            ]),
          )
        ],
      ),
    );
  }
}

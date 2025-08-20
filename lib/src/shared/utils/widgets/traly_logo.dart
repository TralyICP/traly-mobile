import 'package:flutter/material.dart';
import 'package:traly/gen/assets.gen.dart';
import 'package:traly/src/shared/utils/app_texts.dart';
import 'package:traly/src/theme/color/color_scheme.dart';
import 'package:traly/src/theme/typography/typography_extension_on_context.dart';

class TopTralyLogo extends StatelessWidget {
  const TopTralyLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Assets.vectors.tralyMail.svg(),
          RichText(
              text: TextSpan(
                  text: 'Tr',
                  style: context.titleLarge?.copyWith(
                      fontFamily: AppTexts.nicoMojiFontFamily,
                      color: AppColors.primary.shade400),
                  children: [
                TextSpan(
                  text: 'aly',
                  style: context.titleLarge?.copyWith(
                      fontFamily: AppTexts.nicoMojiFontFamily,
                      color: AppColors.secondary.shade400),
                ),
              ])),
        ],
      ),
    );
  }
}

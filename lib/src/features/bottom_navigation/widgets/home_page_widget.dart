import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traly/src/theme/color/color_scheme.dart';
import 'package:traly/src/theme/typography/fontweight_ext.dart';
import 'package:traly/src/theme/typography/typography_extension_on_context.dart';

class HomePageWidget extends StatefulWidget {
  final double? width;
  final Image icon;
  final double number;
  final String text;
  final double? textWidth;
  const HomePageWidget(
      {super.key,
      required this.icon,
      required this.number,
      required this.text,
      this.width, this.textWidth});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 17.w,
        right: 17.w,
        top: 17.h,
        bottom: 17.h,
      ),
      decoration: BoxDecoration(
          color: AppColors.whites.withValues(alpha: 0.1),
          border: Border.all(
            color: AppColors.whites.withValues(alpha: 0.1),
          ),
          borderRadius: BorderRadius.circular(16.r)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.icon,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  widget.number.toStringAsFixed(0),
                  style: context.headlineMedium?.semiBold,
                ),
                Text(
                  textAlign: TextAlign.end,
                  widget.text.toUpperCase(),
                  style: context.labelLarge?.medium
                      .copyWith(color: AppColors.primary.shade100),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traly/gen/assets.gen.dart';
import 'package:traly/src/features/clean/application/clean_emails_view_model.dart';
import 'package:traly/src/features/clean/models/clean_emails_response.dart';
import 'package:traly/src/features/clean/widgets/email_widget.dart';
import 'package:traly/src/shared/constants.dart';
import 'package:traly/src/shared/extensions/spacing_ext.dart';
import 'package:traly/src/shared/utils/app_texts.dart';
import 'package:traly/src/theme/color/color_scheme.dart';
import 'package:traly/src/theme/typography/fontweight_ext.dart';
import 'package:traly/src/theme/typography/typography_extension_on_context.dart';

class Clean extends ConsumerStatefulWidget {
  const Clean({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CleanState();
}

class _CleanState extends ConsumerState<Clean> {
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((_) {
      ref.read(emailsViewModelProvider.notifier).fetchEmails();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final emailsVmProv = ref.watch(emailsViewModelProvider).filteredEmails;
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          AppColors.primary.shade800,
          AppColors.primary.shade700,
          AppColors.primary.shade800,
        ],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
      )),
      child: SafeArea(
          child: Padding(
              padding: TralyConstants.mediumSpaceM.w.hEdgeInsets,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TralyConstants.mediumSpaceM.h.vSpace,
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppTexts.cleanEmails,
                            style: context.titleSmall?.semiBold,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16.r),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: Container(
                                width: 75.w,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 13.w,
                                  vertical: 8.h,
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.white.withValues(alpha: .15),
                                    borderRadius: BorderRadius.circular(16.r),
                                    border: Border.all(
                                        color: AppColors.whites
                                            .withValues(alpha: 0.5))),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Assets.images.stars.image(),
                                    Text(
                                      AppTexts.pointsNum,
                                      style: context.labelLarge?.medium
                                          .copyWith(
                                              color: AppColors.whites
                                                  .withValues(alpha: 0.5)),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ]),

                    TralyConstants.mediumSpaceM.h.vSpace,

                    //////// Filter Widget here
                    FilterTab(
                      onCategorySelected: (category) {
                        ref
                            .read(emailsViewModelProvider.notifier)
                            .filterEmails(category);
                      },
                    ),

                    TralyConstants.smallSpaceX.h.vSpace,

                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          final email = emailsVmProv[index];
                          return EmailContainer(emailModel: email);
                        },
                        itemCount: emailsVmProv.length,
                      ),
                    ),

                    TralyConstants.bigSpace.h.vSpace,
                    TralyConstants.ctaIconSize.h.vSpace,
                  ]))),
    ));
  }
}

class FilterTab extends StatefulWidget {
  const FilterTab({
    super.key,
    required this.onCategorySelected,
  });

  final ValueChanged<Category> onCategorySelected;

  @override
  State<FilterTab> createState() => _FilterTabState();
}

class _FilterTabState extends State<FilterTab> {
  Category selectedCategory = Category.all;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      decoration: BoxDecoration(
          color: AppColors.whites.withValues(alpha: .2),
          border: Border.all(
            color: AppColors.whites.withValues(alpha: .2),
          ),
          borderRadius: BorderRadius.circular(
            12.r,
          )),
      padding: EdgeInsets.symmetric(
        vertical: 8.h,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final itemWidth = constraints.maxWidth/ (Category.values.length);
     
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: Category.values.length,
          itemBuilder: (context, index) {
            final category = Category.values.elementAt(index);
            return GestureDetector(
              onTap: () => setState(() {
                selectedCategory = category;
                widget.onCategorySelected(category);
              }),
              child: SizedBox(
                   width: itemWidth,
                child: Container(
               
                  margin: EdgeInsets.symmetric(horizontal: 1.5.w),
                  // padding:
                  //     EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    color: selectedCategory == category
                        ? AppColors.whites.withValues(alpha: .1)
                        : AppColors.whites.withValues(
                            alpha: .05,
                          ),
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                      color: selectedCategory == category
                          ? AppColors.whites.withValues(alpha: .6)
                          : Colors.transparent,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '${category.name[0].toUpperCase()}${category.name.substring(1)}',
                      style: context.bodySmall?.medium
                          .copyWith(color: AppColors.whites),
                    ),
                  ),
                ),
              ),
            );
          },
        );
        }
      ),
    );
  }
}

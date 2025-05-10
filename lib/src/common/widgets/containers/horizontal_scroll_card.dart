import 'package:flutter/material.dart';
import '../../layouts/listview_layout/listview_layout.dart';
import 'vertical_course_card.dart';


class AppHorizontalScrollCard extends StatelessWidget {
  const AppHorizontalScrollCard({required this.onTap, super.key});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: AppListViewLayout(
          isScrollVertically: false,
          itemCount: 5,
          builderFunction: (context, index) => AppVerticalCourseCard(
            onTap: onTap,
          )),
    );
  }
}


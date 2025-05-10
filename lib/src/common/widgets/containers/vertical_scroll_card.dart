import 'package:flutter/material.dart';
import '../../layouts/listview_layout/listview_layout.dart';
import 'horizontal_course_card.dart';


class AppVerticalScrollCard extends StatelessWidget {
  const AppVerticalScrollCard({required this.onTap, super.key});

  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: 200,
      child: AppListViewLayout(
          isScrollVertically: true,
          itemCount: 5,
          builderFunction: (BuildContext context, int index) => AppHorizontalCourseCard(
              onTap: onTap,
            ),
           ),
    );
  }
}
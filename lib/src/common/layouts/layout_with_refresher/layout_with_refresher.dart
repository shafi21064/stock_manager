import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';


class AppLayoutWithRefresher extends StatelessWidget {
  const AppLayoutWithRefresher({super.key, required this.onRefresh,this.scrollController, required this.children, });


  final dynamic onRefresh;
  final List<Widget> children;
  final ScrollController? scrollController;


  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          RefreshIndicator(
              color: AppColors.primary,
              onRefresh: onRefresh,
              child: CustomScrollView(
                  controller: scrollController,
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  slivers: [
                    SliverList(
                        delegate: SliverChildListDelegate(
                            children
                        ))]))]
    );
  }
}

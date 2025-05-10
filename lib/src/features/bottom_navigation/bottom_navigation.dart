import 'package:flutter/cupertino.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import '../../utils/constants/colors.dart';
import '../../utils/helpers/helper_functions.dart';
import '../cart/view/cart.dart';
import '../graph_chart/view/graph_screen.dart';
import '../home/views/home_three.dart';
import '../personalization/view/profile.dart';

PersistentTabController _controller = PersistentTabController(initialIndex: 0);

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = AppHelperFunctions.isDarkMode(context);
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      backgroundColor:
          isDark ? AppColors.dark : AppColors.light, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: isDark ? AppColors.dark : AppColors.light,
      ),

      navBarStyle:
          NavBarStyle.style1, // Choose the nav bar style with this property.
    );
  }
}

List<Widget> _buildScreens() {
  return [
    const HomeThree(),
    const Cart(),
    const GraphScreen(),
    //const Profile()
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.home),
      title: ("Home"),
      activeColorPrimary: CupertinoColors.activeBlue,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.bag),
      title: ("Cart"),
      activeColorPrimary: CupertinoColors.activeBlue,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.graph_square),
      title: ("Graph"),
      activeColorPrimary: CupertinoColors.activeBlue,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    // PersistentBottomNavBarItem(
    //   icon: const Icon(CupertinoIcons.profile_circled),
    //   title: ("Profile"),
    //   activeColorPrimary: CupertinoColors.activeBlue,
    //   inactiveColorPrimary: CupertinoColors.systemGrey,
    // ),
  ];
}

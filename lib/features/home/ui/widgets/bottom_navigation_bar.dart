import 'package:bottom_navbar_with_indicator/bottom_navbar_with_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key, required this.currentIndex, required this.onTap});
  final int currentIndex;
  final dynamic Function(int) onTap;
  @override
  Widget build(BuildContext context) {
    return CustomLineIndicatorBottomNavbar(
      unselectedIconSize: 20.sp,
      selectedIconSize: 20.sp,
      selectedColor: Colors.red,
      unSelectedColor: Colors.black54,
      backgroundColor: Colors.white,
      enableLineIndicator: true,
      lineIndicatorWidth: 5.w,
      indicatorType: IndicatorType.top,
      customBottomBarItems: [
        CustomBottomBarItems(
          label: 'Home',
          icon: Icons.home,
        ),
        CustomBottomBarItems(
          label: 'Explore',
          icon: Icons.explore_outlined,
        ),
        CustomBottomBarItems(label: 'Trips', icon: Icons.badge),
        CustomBottomBarItems(
          label: 'Share',
          icon: Icons.ios_share_outlined,
        ),
        CustomBottomBarItems(
          label: 'Account',
          icon: Icons.face,
        ),
      ],
      currentIndex: currentIndex,
      onTap: onTap,
    );
  }
}

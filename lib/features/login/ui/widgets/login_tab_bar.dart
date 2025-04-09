import 'package:flutter/material.dart';

class LoginTabBar extends StatelessWidget {
  final List<String> tabTitles;
  final TabController tabController;
  final Color selectedTabColor;
  final Color unselectedTabColor;
  final Color indicatorColor;
  final double tabHeight;
  final double fontSize;
  final FontWeight fontWeight;

  const LoginTabBar({
    super.key,
    this.tabTitles = const ['مشجع', 'منظم'],
    required this.tabController,
    this.selectedTabColor = Colors.green,
    this.unselectedTabColor = Colors.grey,
    this.indicatorColor = Colors.green,
    this.tabHeight = 50.0,
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.bold,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: tabHeight,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            spreadRadius: 1,
          ),
        ],
      ),
      child: TabBar(
        controller: tabController,
        tabs: tabTitles
            .map((title) => Tab(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: fontWeight,
                    ),
                  ),
                ))
            .toList(),
        labelColor: selectedTabColor,
        unselectedLabelColor: unselectedTabColor,
        indicator: BoxDecoration(
          color: indicatorColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(25.0),
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: Colors.transparent,
        labelPadding: const EdgeInsets.symmetric(horizontal: 10.0),
        overlayColor: const WidgetStatePropertyAll(Colors.transparent),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:spotify_futter/core/configs/theme/palette.dart';
import 'package:spotify_futter/utils/is_dark.dart';

class Tabs extends StatelessWidget {
  TabController? tabController;
   Tabs({super.key, this.tabController});

  @override
  Widget build(BuildContext context) {
    return TabBar(
        controller: tabController,
        isScrollable: true,
        dividerColor: Colors.transparent,
        labelColor: context.isDarkMode ? Colors.white : Colors.black,
        indicatorSize: TabBarIndicatorSize.label,
        indicator: const UnderlineTabIndicator(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(5), bottomLeft: Radius.circular(5)),
          borderSide: BorderSide(
            width: 3,
            color: Palette.primary,
          ),
          insets: EdgeInsets.symmetric(horizontal: 8), // 👈 magic happens here
        ),
        padding: const EdgeInsets.only(
            top: 30,
            right: 16
        ),
        labelPadding: const EdgeInsets.only(left: 20, right: 20),
        unselectedLabelColor: context.isDarkMode ? Palette.darkGrey : Color(0xffbebebe) ,
        tabs: [
          Text(
            'News',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20
            ),
          ),
          Text(
            'Videos',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20
            ),
          ),
          Text(
            'Artists',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20
            ),
          ),
          Text(
            'Canvas',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20
            ),
          ),
    ]);
  }
}

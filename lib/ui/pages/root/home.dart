import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_futter/ui/components/home_artist_card.dart';
import 'package:spotify_futter/ui/components/tabs.dart';
import 'package:spotify_futter/utils/is_dark.dart';

import '../../../core/configs/assets/vectors.dart';
import '../../../core/configs/theme/palette.dart';
import '../../components/back_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: CustomAppBar(
              hideBack: true,
              leading: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    size: 35,
                    color: context.isDarkMode ? Palette.grey : Colors.black,
                  )),
              title: SvgPicture.asset(
                Vectors.logo,
                height: 40,
              ),
              action: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_vert,
                    size: 35,
                    color: context.isDarkMode ? Palette.grey : Colors.black,
                  )),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: HomeArtistCard(),
                ),

                Tabs(
                  tabController: _tabController,
                )

              ],
            ),
          )
        ],
      )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_futter/ui/components/home_artist_card.dart';
import 'package:spotify_futter/utils/is_dark.dart';

import '../../../core/configs/assets/vectors.dart';
import '../../../core/configs/theme/palette.dart';
import '../../components/back_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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

                

              ],
            ),
          )
        ],
      )),
    );
  }
}

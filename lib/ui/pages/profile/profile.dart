import 'package:flutter/material.dart';
import 'package:spotify_futter/ui/pages/profile/components/favorite_song.dart';
import 'package:spotify_futter/ui/pages/profile/components/profile_info.dart';

import '../../../utils/is_dark.dart';
import '../../components/back_button.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          CustomAppBar(
            title: Text('Profile'),
            backgroundColor:
                context.isDarkMode ? Color(0xff2C2B2B) : Color(0xffFAFAFA),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 3.5,
            width: double.infinity,
            decoration: BoxDecoration(
                color:
                    context.isDarkMode ? Color(0xff2C2B2B) : Color(0xffFAFAFA),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50))),
            child: ProfileInfo(),
          ),

          const SizedBox(height: 30),

          FavoriteSong()
        ],
      )),
    );
  }
}

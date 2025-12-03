import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_futter/core/configs/assets/images.dart';
import 'package:spotify_futter/core/configs/theme/palette.dart';
import 'package:spotify_futter/ui/components/button.dart';

import '../../../core/configs/assets/vectors.dart';

class Introduction extends StatelessWidget {
  const Introduction({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Images.introBG),
                fit: BoxFit.fill,
              ),
            ),
          ),

          Container(color: Colors.black.withValues(alpha: 0.25)),

          Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SvgPicture.asset(Vectors.logo),
                ),

                Spacer(),

                Text(
                  'Enjoy Listening To Music',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xffDADADA),
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 21),

                Text(
                  'Listen to songs, play podcasts, create playlists and discover music you\'ll love.',
                  style: TextStyle(fontSize: 16, color: Color(0xff797979)),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: 20),

                CustomButton(
                  onPressed: () => {},
                  title: 'Get Started',
                  height: 80,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

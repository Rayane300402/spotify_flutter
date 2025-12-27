import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_futter/core/configs/assets/images.dart';
import 'package:spotify_futter/core/configs/assets/vectors.dart';

class HomeArtistCard extends StatelessWidget {
  const HomeArtistCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 140,
        child: Stack(
          clipBehavior: Clip.none,
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: SvgPicture.asset(
                    Vectors.homeTopCard
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(
                      right: 50
                  ),
                  child: Image.asset(
                      Images.homeArtist,
                    height: 200,
                  ),
                ),
              )
            ]
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:spotify_futter/utils/is_dark.dart';

import '../../../../../core/configs/theme/palette.dart';

class PlaylistHeader extends StatelessWidget {
  final bool isEmpty;
  const PlaylistHeader({super.key, required this.isEmpty});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Playlist',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: context.isDarkMode ? Palette.textDark : Colors.black),
          ),
          // if (!isEmpty)
          //   Text(
          //     'See More',
          //     style: TextStyle(
          //         fontSize: 13,
          //         color:
          //             context.isDarkMode ? Color(0xffC6C6C6) : Color(0xff131313)),
          //   )
        ],
      ),
    );
  }
}

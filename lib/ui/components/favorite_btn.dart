import 'package:flutter/material.dart';

import '../../core/configs/theme/palette.dart';

class FavoriteBtn extends StatelessWidget {
  const FavoriteBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {},
        icon: Icon(
           Icons.favorite,
          size: 25,
          color: Palette.darkGrey,
        ),
    );
  }
}

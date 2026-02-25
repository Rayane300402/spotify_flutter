import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_futter/ui/components/bloc/favorite_cubit.dart';
import 'package:spotify_futter/ui/pages/profile/profile.dart';
import 'package:spotify_futter/ui/pages/root/components/home_artist_card.dart';
import 'package:spotify_futter/ui/pages/root/components/news_section.dart';
import 'package:spotify_futter/ui/pages/root/components/playlist/playlist_section.dart';
import 'package:spotify_futter/ui/pages/root/components/tabs.dart';
import 'package:spotify_futter/utils/is_dark.dart';

import '../../../core/configs/assets/vectors.dart';
import '../../../core/configs/theme/palette.dart';
import '../../components/back_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      return const SizedBox.shrink();
    }

    return BlocProvider(
        create: (_) => FavoritesCubit()..startListening(user.uid),
      child: Builder(builder: (context) {
        return Scaffold(
          body: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: CustomAppBar(
                      hideBack: true,
                      leading: IconButton(
                          onPressed: () {
                            final favCubit = context.read<FavoritesCubit>();

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => BlocProvider.value(
                                  value: favCubit,
                                  child: const Profile(),
                                ),
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.person,
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
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: HomeArtistCard(),
                          ),
                          Tabs(
                            tabController: _tabController,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                              height: 260,
                              child: TabBarView(controller: _tabController, children: [
                                NewsSection(),
                                Container(),
                                Container(),
                                Container(),
                              ])),
                          SizedBox(
                            height: 20,
                          ),

                          PlaylistSection()

                        ],
                      ),
                    ),
                  )
                ],
              )),
        );
      }),
    );
  }
}

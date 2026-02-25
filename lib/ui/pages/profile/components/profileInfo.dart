import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../utils/is_dark.dart';
import '../bloc/profile_info_cubit.dart';
import '../bloc/profile_info_state.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileInfoCubit()..getUser(),
      child: Container(
        height: MediaQuery.of(context).size.height / 3.5 ,
        width: double.infinity,
        decoration: BoxDecoration(
            color: context.isDarkMode ? const Color(0xff2C2B2B) : Colors.white,
            borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(50),
                bottomLeft: Radius.circular(50)
            )
        ),
        child: BlocBuilder<ProfileInfoCubit,ProfileInfoState>(
          builder: (context, state) {
            if(state is ProfileInfoLoading) {
              return Container(
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator()
              );
            }
            if(state is ProfileInfoLoaded) {
              final cubit = context.read<ProfileInfoCubit>();
              final user = state.userEntity;

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: 90,
                        width: 90,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              user.profileImg ?? 'https://placehold.co/300x300.png',
                            ),
                          ),
                        ),
                      ),

                      Positioned(
                        right: -4,
                        bottom: -4,
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () async {
                              final picker = ImagePicker();
                              final picked = await picker.pickImage(
                                source: ImageSource.gallery,
                                imageQuality: 80,
                              );
                              if (picked == null) return;

                              cubit.updateProfileImage(File(picked.path));
                            },
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: context.isDarkMode ? Colors.white : Colors.black,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.edit,
                                size: 16,
                                color: context.isDarkMode ? Colors.black : Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Container(
                  //   height: 90,
                  //   width: 90,
                  //   decoration: BoxDecoration(
                  //       shape: BoxShape.circle,
                  //       image: DecorationImage(
                  //           image: NetworkImage(
                  //               state.userEntity.profileImg ?? 'https://placehold.co/300x300.png'
                  //           )
                  //       )
                  //   ),
                  // ),
                  const SizedBox(height: 15,),
                  Text(
                      state.userEntity.email!
                  ),
                  const SizedBox(height: 10,),
                  Text(
                    state.userEntity.fullName!,
                    style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold
                    ),
                  )
                ],
              );
            }

            if(state is ProfileInfoFailure) {
              return const Text(
                  'Please try again'
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}

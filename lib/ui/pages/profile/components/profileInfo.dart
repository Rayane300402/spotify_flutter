import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(
                                state.userEntity.profileImg ?? 'https://placehold.co/300x300.png'
                            )
                        )
                    ),
                  ),
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

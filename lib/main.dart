import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:spotify_futter/core/configs/theme/theme.dart';
import 'package:spotify_futter/service_locator.dart';
import 'package:spotify_futter/ui/pages/choose_mode/bloc.dart';
import 'package:spotify_futter/ui/pages/splash/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> connectToFirebaseEmulators() async {
  // Don't do this on web with this setup (web uses different emulator host rules)
  if (kIsWeb) return;

  const useEmulators = true; // set to false when you want real Firebase cloud

  if (!useEmulators) return;

  // Android emulator uses 10.0.2.2 to reach your computer.
  final host = Platform.isAndroid ? '10.0.2.2' : 'localhost';

  FirebaseAuth.instance.useAuthEmulator(host, 9099);
  FirebaseFirestore.instance.useFirestoreEmulator(host, 8080);
  FirebaseStorage.instance.useStorageEmulator(host, 9199);

  // Optional: makes debugging nicer (no cached local persistence surprises)
  // FirebaseFirestore.instance.settings =
  //     const Settings(persistenceEnabled: false);
}



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory:
        kIsWeb
            ? HydratedStorageDirectory.web
            : HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await connectToFirebaseEmulators(); // run firebase emulators:start --import=./emulator_data --export-on-exit  to work and restore old data
  await initDep();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => ModeCubit())],
      child: BlocBuilder<ModeCubit, ThemeMode>(
        builder:
            (context, mode) => MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: mode,
              home: SplashPage(),
            ),
      ),
    );
  }
}

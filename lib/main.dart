import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'logic/entries_cubit.dart';
import 'pres/pages/start.dart';
import 'style.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());

  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EntriesCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: SCol.createMaterialColor(SCol.primary),
          textTheme: TextTheme(
            headlineMedium: TextStyle(color: SCol.onBackground),
            titleLarge: TextStyle(color: SCol.onBackground),
            displayMedium: TextStyle(color: SCol.onBackground),
          ),
        ),
        home: const StartPage(),
      ),
    );
  }
}

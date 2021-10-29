import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/shared/cache/cache_helper.dart';
import 'package:new_app/shared/cubit/cubit.dart';
import 'package:new_app/shared/cubit/states.dart';
import 'package:new_app/shared/dio/dio_helper.dart';
import 'package:new_app/shared/style/styles.dart';

import 'layout/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.initial();
  await CacheHelper.init();
  var isDark = CacheHelper.getData(key: 'darkMode');
  runApp(MyApp(
    isDark: isDark,
  ));
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  const MyApp({Key? key, required this.isDark}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => AppCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => AppCubit()
            ..getData(category: 'business')
            ..getData()
            ..getData(category: 'sport')
            ..getData(category: 'science')
            ..changeThemeMode(fromShared: isDark),
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, Object? state) {
          var appCubit = AppCubit.object(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: appCubit.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            theme: lightMode,
            darkTheme: darkMode,
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/modules/all_news_screen.dart';
import 'package:new_app/modules/business_screen.dart';
import 'package:new_app/modules/science_screen.dart';
import 'package:new_app/modules/search_screen.dart';
import 'package:new_app/modules/sport_screen.dart';
import 'package:new_app/shared/cubit/cubit.dart';
import 'package:new_app/shared/cubit/states.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'News',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * 0.036,
            ),
          ),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SearchScreen()));
                },
                icon: const Icon(Icons.search)),
            BlocConsumer<AppCubit, AppStates>(
              listener: (BuildContext context, state) {},
              builder: (BuildContext context, state) {
                AppCubit appCubit = AppCubit.object(context);
                return IconButton(
                  onPressed: () {
                    appCubit.changeThemeMode();
                  },
                  icon: const Icon(Icons.brightness_4_outlined),
                );
              },
            ),
          ],
        ),
        body: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.036,
              child: const TabBar(physics: BouncingScrollPhysics(), tabs: [
                Text('All news'),
                Text('Business'),
                Text('Science'),
                Text('Sports'),
              ]),
            ),
            const Expanded(
              child: TabBarView(
                physics: BouncingScrollPhysics(),
                children: [
                  AllNewsScreen(),
                  BusinessScreen(),
                  ScienceScreen(),
                  SportsScreen()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

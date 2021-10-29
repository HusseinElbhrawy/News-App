import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/shared/components/components.dart';
import 'package:new_app/shared/cubit/cubit.dart';
import 'package:new_app/shared/cubit/states.dart';

class SearchScreen extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();
  final Widget actionIcon = const Icon(Icons.search);

  SearchScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = AppCubit.object(context).search;
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios_new),
            ),
            titleSpacing: 0,
            title: TextFormField(
              onEditingComplete: () {
                if (searchController.text.isEmpty) {
                  return;
                } else {
                  AppCubit.object(context).getSearch(
                    value: searchController.text,
                  );
                }
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Search must not be empty';
                }
                return null;
              },
              style: Theme.of(context).textTheme.bodyText1,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.search,
              controller: searchController,
              decoration: const InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  if (searchController.text.isEmpty) {
                    return;
                  } else {
                    AppCubit.object(context)
                        .getSearch(value: searchController.text);
                  }
                },
                icon: actionIcon,
              )
            ],
          ),
          body: Column(
            children: [
              Expanded(child: NewsWidget(list: list)),
            ],
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/shared/components/components.dart';
import 'package:new_app/shared/cubit/cubit.dart';
import 'package:new_app/shared/cubit/states.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        AppCubit appCubit = AppCubit.object(context);
        return NewsWidget(
          list: appCubit.business,
        );
      },
    );
  }
}

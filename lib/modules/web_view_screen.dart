import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/shared/cubit/cubit.dart';
import 'package:new_app/shared/cubit/states.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  const WebViewScreen({Key? key, required this.url}) : super(key: key);
  final String url;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        var appCubit = AppCubit.object(context);
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios_new),
            ),
          ),
          body: WebView(
            initialUrl: url,
          ),
        );
      },
    );
  }
}

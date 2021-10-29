/*
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/shared/components/components.dart';
import 'package:new_app/shared/cubit/cubit.dart';
import 'package:new_app/shared/cubit/states.dart';

class AllNewsScreen extends StatelessWidget {
  const AllNewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        AppCubit appCubit = AppCubit.object(context);
        return NewsWidget(
          list: appCubit.allNews,
        );
      },
    );
  }
}
*/
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/modules/web_view_screen.dart';
import 'package:new_app/shared/cubit/cubit.dart';
import 'package:new_app/shared/cubit/states.dart';

class AllNewsScreen extends StatelessWidget {
  const AllNewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        List list = AppCubit.object(context).allNews;
        if (list.isNotEmpty) {
          return Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: CarouselSlider.builder(
                      itemCount: list.length,
                      itemBuilder: (context, index, s) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return WebViewScreen(url: list[index]['url']);
                            }));
                          },
                          child: Container(
                            child: Stack(
                              children: [
                                CachedNetworkImage(
                                  width: 1000,
                                  imageUrl: list[index]['urlToImage'] ??
                                      'https://st.depositphotos.com/1987177/3470/v/950/depositphotos_34700099-stock-illustration-no-photo-available-or-missing.jpg1',
                                  fit: BoxFit.cover,
                                  progressIndicatorBuilder:
                                      (context, url, downloadProgress) =>
                                          Center(
                                    child: CircularProgressIndicator(
                                      value: downloadProgress.progress,
                                      strokeWidth: 3,
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(
                                    Icons.error,
                                    color: Colors.deepOrange,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Container(
                                    padding: const EdgeInsets.all(8.6),
                                    color: Colors.black.withOpacity(0.5),
                                    width: double.infinity,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          list[index]['title'],
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 14),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          //textBaseline: TextBaseline.ideographic,
                                          //crossAxisAlignment: CrossAxisAlignment.baseline,
                                          children: [
                                            const Icon(
                                              Icons.watch_later_outlined,
                                              size: 16,
                                              color: Colors.deepOrange,
                                            ),
                                            const SizedBox(
                                              width: 4,
                                            ),
                                            Text(
                                              list[index]['publishedAt'],
                                              style: TextStyle(
                                                color: Colors.grey[400],
                                                fontSize: 11,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        );
                      },
                      options: CarouselOptions(
                        autoPlay: true,
                        aspectRatio: 2.0,
                        enlargeCenterPage: true,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                        top: 20.0, right: 15.0, left: 15.0, bottom: 15.0),
                    child: Text(
                      'Recent News',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.deepOrange),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: list.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, bottom: 20.0),
                      child: Container(
                        width: double.infinity,
                        height: 105,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Theme.of(context).backgroundColor,
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return WebViewScreen(
                                url: list[index]['url'],
                              );
                            }));
                          },
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: SizedBox(
                                  width: double.infinity,
                                  height: double.infinity,
                                  child: CachedNetworkImage(
                                    imageUrl: list[index]['urlToImage'] ??
                                        'https://st.depositphotos.com/1987177/3470/v/950/depositphotos_34700099-stock-illustration-no-photo-available-or-missing.jpg1',
                                    fit: BoxFit.cover,
                                    progressIndicatorBuilder:
                                        (context, url, downloadProgress) =>
                                            Center(
                                      child: CircularProgressIndicator(
                                        value: downloadProgress.progress,
                                        strokeWidth: 3,
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const Icon(
                                      Icons.error,
                                      color: Colors.deepOrange,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        list[index]['title'],
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                      Row(
                                        //textBaseline: TextBaseline.ideographic,
                                        //crossAxisAlignment: CrossAxisAlignment.baseline,
                                        children: [
                                          const Icon(
                                            Icons.watch_later_outlined,
                                            size: 16,
                                            color: Colors.deepOrange,
                                          ),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          Text(
                                            list[index]['publishedAt'],
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 3,
            ),
          );
        }
      },
    );
  }
}

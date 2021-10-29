import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:new_app/modules/web_view_screen.dart';

class NewsItemWidget extends StatelessWidget {
  dynamic article;
  int index;
  NewsItemWidget({
    Key? key,
    required this.article,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        width: double.infinity,
        height: 105,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Theme.of(context).backgroundColor,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: CachedNetworkImage(
                  imageUrl: article[index]['urlToImage'] ??
                      'https://st.depositphotos.com/1987177/3470/v/950/depositphotos_34700099-stock-illustration-no-photo-available-or-missing.jpg1',
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                    child: CircularProgressIndicator(
                      value: downloadProgress.progress,
                      strokeWidth: 3,
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article[index]['title'],
                      style: Theme.of(context).textTheme.bodyText1,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    Row(
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
                          article[index]['publishedAt'],
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
    );
  }
}

class NewsWidget extends StatelessWidget {
  const NewsWidget({Key? key, required this.list}) : super(key: key);
  final List list;
  @override
  Widget build(BuildContext context) {
    return list.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => WebViewScreen(
                            url: list[index]['url'],
                          )));
                },
                child: NewsItemWidget(
                  index: index,
                  article: list,
                ),
              );
            },
            separatorBuilder: (context, index) => const Divider(),
            itemCount: list.length,
          );
  }
}

class SearchArticleBuilder extends StatelessWidget {
  final List list;

  const SearchArticleBuilder({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) => NewsItemWidget(
        index: index,
        article: list,
      ),
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      itemCount: list.length,
    );
  }
}

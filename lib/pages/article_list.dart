import 'package:flutter/material.dart';
import 'package:tech_news_feed/classes/feed.dart';
import 'package:tech_news_feed/widgets/app_bar_sliver.dart';
import 'package:http/http.dart' as http;
import 'package:tech_news_feed/widgets/article_tile.dart';
import 'package:webfeed/webfeed.dart';

class ArticleList extends StatefulWidget {

  String feedUrl;

  ArticleList({Key? key,required this.feedUrl}) : super(key: key);

  @override
  _ArticleListState createState() => _ArticleListState();
}

class _ArticleListState extends State<ArticleList> {

  List<RssItem> _articlesList = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getRssData();
  }

  Future<void> getRssData() async {
    var client = http.Client();
    var response = await client.get(Uri.parse(widget.feedUrl));
    var channel = RssFeed.parse(response.body);
    setState(() {
      _articlesList = channel.items!.toList();
      _loading = false;
    });
    client.close();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[const AppBarSliver()];
          },
          body: RefreshIndicator(
            onRefresh: getRssData,
            color: Theme.of(context).colorScheme.primary,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 600),
              child: _loading
                  ? Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.primary,
                ),
              )
                  : ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: [
                    ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 0,
                        ),
                        shrinkWrap: true,
                        itemCount: _articlesList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 7),
                            child: ArticleTile(
                              feed: Feed(
                                link: _articlesList[index].link,
                                  title: _articlesList[index].title!,
                                  data: _articlesList[index].pubDate.toString(),
                              ),
                            ),
                          );
                        }
                        ),
                    const SizedBox(
                      height: 50,
                    )
                  ]),
            ),
          ),
        ));
  }
}
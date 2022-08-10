import 'dart:async';
import 'package:flutter/material.dart';
import 'package:web_scraper/web_scraper.dart';
import '../classes/feed.dart';
import '../widgets/app_bar_sliver.dart';
import '../widgets/article_tile.dart';

class XdaNewPostsScraper extends StatefulWidget {
  const XdaNewPostsScraper({Key? key}) : super(key: key);

  @override
  _XdaNewPostsScraperState createState() => _XdaNewPostsScraperState();
}

class _XdaNewPostsScraperState extends State<XdaNewPostsScraper> {
  String mainUrl = 'https://forum.xda-developers.com';
  String sectionUrl = '/whats-new/';
  bool _loading = true;
  List<Map<String, dynamic>> _titleList = [];
  List<Map<String, dynamic>> _linkList = [];
  List<Map<String, dynamic>> _forumNameList = [];

  @override
  void initState() {
    parseData();
    super.initState();
  }

  Future<void> parseData() async {
    final webScraper = WebScraper(mainUrl);
    if (await webScraper.loadWebPage(sectionUrl)) {
      _titleList = webScraper.getElement(
          '#top > div.p-body > div.p-body-inner > div > div.p-body-main > div > div.p-body-pageContent >'
          ' div > div > div.block-body > div > div.structItem.structItem'
          ' > div.structItem-cell.structItem-cell--main > div.structItem-title > a',
          ['title']);

      _linkList = webScraper.getElement(
          '#top > div.p-body > div.p-body-inner > div > div.p-body-main > div > div.p-body-pageContent >'
              ' div > div > div.block-body > div > div.structItem.structItem'
              ' > div.structItem-cell.structItem-cell--main > div.structItem-title > a',
          ['href']);

      _forumNameList = webScraper.getElement(
          '#top > div.p-body > div.p-body-inner > div > div.p-body-main > div > div.p-body-pageContent '
           '> div > div > div.block-body > div > div.structItem.structItem > div.structItem-cell.structItem-cell--main '
              '> div.structItem-minor > ul > li:nth-child(5) > a',
          ['title']);

      setState(() {
        _loading = false;
      });
    } else {
      throw ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        content: const Text('Error'),
        duration: const Duration(seconds: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        action: SnackBarAction(
          label: 'RETRY',
          onPressed: parseData,
        ),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[const AppBarSliver()];
        },
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 600),
          child: _loading
              ? Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                )
              : RefreshIndicator(
                  onRefresh: parseData,
                  color: Theme.of(context).colorScheme.primary,
                  child: ListView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      children: [
                        ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          separatorBuilder: (context, index) => const Divider(),
                          shrinkWrap: true,
                          itemCount: _titleList.length,
                          itemBuilder: (context, index) {
                            return ArticleTile(
                              key: UniqueKey(),
                              feed: Feed(
                                  data: '',
                                  title: _titleList[index]['title'],
                                  link: mainUrl +
                                      _linkList[index]['attributes']['href'],
                                  forumNameXda: _forumNameList[index]['title']
                              ),//
                            );
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        )
                      ]),
                ),
        ),
      ),
    );
  }
}

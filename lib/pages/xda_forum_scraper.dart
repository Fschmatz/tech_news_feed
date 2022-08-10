import 'dart:async';
import 'package:flutter/material.dart';
import 'package:web_scraper/web_scraper.dart';
import '../classes/feed.dart';
import '../widgets/app_bar_sliver.dart';
import '../widgets/article_tile.dart';

class XdaForumScraper extends StatefulWidget {
  const XdaForumScraper({Key? key}) : super(key: key);

  @override
  _XdaForumScraperState createState() => _XdaForumScraperState();
}

class _XdaForumScraperState extends State<XdaForumScraper> {
  String mainUrl = 'https://forum.xda-developers.com';
  String sectionUrl = '/f/xiaomi-poco-f3-xiaomi-mi-11x-redmi-k40.12161/';
  bool _loading = true;
  List<Map<String, dynamic>> _titleList = [];
  List<Map<String, dynamic>> _linkList = [];
  List<Map<String, dynamic>> _postTypeList = [];

  @override
  void initState() {
    parseData();
    super.initState();
  }

  Future<void> parseData() async {
    final webScraper = WebScraper(mainUrl);
    if (await webScraper.loadWebPage(sectionUrl)) {
      _titleList = webScraper.getElement(
          'div.p-body > div.p-body-inner > div > div.p-body-main > div > div.p-body-pageContent >'
          ' div > div.block-container > div.block-body > div.structItemContainer > div.structItemContainer-group > div.structItem.structItem'
          ' > div.structItem-cell.structItem-cell--main > div.structItem-title > a:nth-child(3)',
          ['title']);

      _linkList = webScraper.getElement(
          'div.p-body > div.p-body-inner > div > div.p-body-main > div > div.p-body-pageContent >'
              ' div > div.block-container > div.block-body > div.structItemContainer > div.structItemContainer-group > div.structItem.structItem'
              ' > div.structItem-cell.structItem-cell--main > div.structItem-title > a:nth-child(3)',
          ['href']);

      _postTypeList = webScraper.getElement(
          'div.p-body > div.p-body-inner > div > div.p-body-main > div > div.p-body-pageContent >'
              ' div > div.block-container > div.block-body > div.structItemContainer > div.structItemContainer-group > div.structItem.structItem'
              ' > div.structItem-cell.structItem-cell--main > div.structItem-title > a:nth-child(1)',
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
                                  forumNameXda: _postTypeList[index]['title']
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

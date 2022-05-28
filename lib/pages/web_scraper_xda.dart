import 'dart:async';
import 'package:flutter/material.dart';
import 'package:web_scraper/web_scraper.dart';
import '../classes/feed.dart';
import '../widgets/app_bar_sliver.dart';
import '../widgets/article_tile.dart';
import '../widgets/promo_tile_hm.dart';

class XdaScraper extends StatefulWidget {
  const XdaScraper({Key? key}) : super(key: key);

  @override
  _XdaScraperState createState() => _XdaScraperState();
}

class _XdaScraperState extends State<XdaScraper> {
  String mainUrl = 'https://forum.xda-developers.com';
  String sectionUrl = '/whats-new/';
  bool _loading = true;
  String linkUrl = 'https://forum.xda-developers.com/';
  List<Map<String, dynamic>> _titleList = [];
  List<Map<String, dynamic>> _linkList = [];

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

      print(_linkList);
      print(_linkList[0]['href'].toString().trim());

      setState(() {
        _titleList;
        _linkList;
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
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: _titleList.length,
                          itemBuilder: (context, index) {
                            return ArticleTile(
                              key: UniqueKey(),
                              feed: Feed(
                                  data: '',
                                  title: _titleList[index]['title'],
                                  link: linkUrl +
                                      _linkList[index]['attributes']['href'],
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

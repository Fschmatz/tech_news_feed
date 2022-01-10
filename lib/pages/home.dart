import 'package:flutter/material.dart';
import 'package:tech_news_feed/pages/article_list_atom.dart';
import 'package:tech_news_feed/pages/article_list_rss.dart';
import 'package:tech_news_feed/util/feeds_icons.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _articleList = [
    ArticleListRss(
      key: UniqueKey(),
      feedUrl: "http://feeds.arstechnica.com/arstechnica/index",
    ),
    ArticleListAtom(
      key: UniqueKey(),
      feedUrl: "https://www.theverge.com/rss/index.xml",
    ),
    ArticleListRss(
      key: UniqueKey(),
      feedUrl: "http://feeds.feedburner.com/meiobit",
    ),
    ArticleListRss(
      key: UniqueKey(),
      feedUrl: "https://www.androidpolice.com/feed/",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _articleList[_currentIndex],
      bottomNavigationBar: Container(
        color: Theme.of(context).navigationBarTheme.backgroundColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: NavigationBar(
            selectedIndex: _currentIndex,
            onDestinationSelected: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            destinations: const [
              NavigationDestination(
                icon: Icon(FeedsIcons.ars, size: 35,),
                selectedIcon: Icon(
                  FeedsIcons.ars,
                  size: 35,
                  color: Colors.black87,
                ),
                label: 'Ars Technica',
              ),
              NavigationDestination(
                icon: Icon(FeedsIcons.verge,size: 15,),
                selectedIcon: Icon(
                  FeedsIcons.verge,
                  size: 15,
                  color: Colors.black87,
                ),
                label: 'The Verge',
              ),
              NavigationDestination(
                icon: Icon(Icons.rss_feed_outlined),
                selectedIcon: Icon(
                  Icons.rss_feed,
                  color: Colors.black87,
                ),
                label: 'Meio Bit',
              ),
              NavigationDestination(
                icon: Icon(Icons.android_outlined),
                selectedIcon: Icon(
                  Icons.android,
                  color: Colors.black87,
                ),
                label: 'Android Police',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
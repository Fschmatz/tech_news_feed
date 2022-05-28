import 'package:flutter/material.dart';
import 'package:tech_news_feed/pages/article_list_atom.dart';
import 'package:tech_news_feed/pages/article_list_rss.dart';
import 'package:tech_news_feed/pages/xda_scraper.dart';
import 'package:tech_news_feed/util/feeds_icons.dart';
import 'package:tech_news_feed/util/reddit_icons.dart';

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
    XdaScraper(
      key: UniqueKey(),
    ),
    ArticleListAtom(
      key: UniqueKey(),
      feedUrl: "https://www.reddit.com/r/technology/.rss?sort=new",
    ),
    ArticleListRss(
      key: UniqueKey(),
      feedUrl: "http://feeds.feedburner.com/meiobit",
    ),

    /*ArticleListAtom(
      key: UniqueKey(),
      feedUrl: "https://www.theverge.com/rss/index.xml",
    ),
    ArticleListAtom(
      key: UniqueKey(),
      feedUrl: "https://daringfireball.net/feeds/main",
    ),
    ArticleListRss(
      key: UniqueKey(),
      feedUrl: "https://www.androidpolice.com/feed/",
    ),*/
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
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            selectedIndex: _currentIndex,
            onDestinationSelected: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            destinations: const [
              NavigationDestination(
                icon: Icon(FeedsIcons.ars, size: 38,),
                selectedIcon: Icon(
                  FeedsIcons.ars,
                  size: 38,
                ),
                label: 'Ars Technica',
              ),
              NavigationDestination(
                icon: Icon(Icons.forum_outlined),
                selectedIcon: Icon(
                  Icons.forum,
                ),
                label: 'XDA Forums',
              ),
              NavigationDestination(
                icon: Icon(
                  RedditIcons.reddit_alien,
                  size: 22,
                ),
                selectedIcon: Icon(
                  RedditIcons.reddit_alien,
                  size: 22,
                ),
                label: 'r/technology',
              ),
              NavigationDestination(
                icon: Icon(Icons.memory_outlined),
                selectedIcon: Icon(
                  Icons.memory,
                ),
                label: 'Meio Bit',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
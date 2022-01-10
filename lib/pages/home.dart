import 'package:flutter/material.dart';
import 'package:tech_news_feed/pages/article_list.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _articleList = [
    ArticleList(
      key: UniqueKey(),
      feedUrl: "http://feeds.arstechnica.com/arstechnica/index",
    ),
    ArticleList(
      key: UniqueKey(),
      feedUrl: "https://www.theverge.com/rss/index.xml",
    ),
    ArticleList(
      key: UniqueKey(),
      feedUrl: "http://feeds.feedburner.com/meiobit",
    ),
    ArticleList(
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
                icon: Icon(Icons.rss_feed_outlined),
                selectedIcon: Icon(
                  Icons.rss_feed,
                  color: Colors.black87,
                ),
                label: 'Ars Technica',
              ),
              NavigationDestination(
                icon: Icon(Icons.rss_feed_outlined),
                selectedIcon: Icon(
                  Icons.rss_feed,
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
                icon: Icon(Icons.rss_feed_outlined),
                selectedIcon: Icon(
                  Icons.rss_feed,
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
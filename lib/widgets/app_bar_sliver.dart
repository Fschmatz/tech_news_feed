import 'package:flutter/material.dart';
import 'package:tech_news_feed/configs/settings_page.dart';

class AppBarSliver extends StatefulWidget {
  const AppBarSliver({Key? key}) : super(key: key);

  @override
  _AppBarSliverState createState() => _AppBarSliverState();
}

class _AppBarSliverState extends State<AppBarSliver> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        title: const Text('Tech News Feed'),
        pinned: false,
        floating: true,
        snap: true,
        actions: [
          IconButton(
              icon: const Icon(
                Icons.settings_outlined,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => const SettingsPage(),
                    ));
              }),
        ]);
  }
}

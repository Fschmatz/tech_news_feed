import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:tech_news_feed/classes/feed.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleTile extends StatefulWidget {
  @override
  _ArticleTileState createState() => _ArticleTileState();

  Feed feed;
  int index;

  ArticleTile({Key? key, required this.feed, required this.index}) : super(key: key);
}

class _ArticleTileState extends State<ArticleTile> {


  _launchBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Error';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.fromLTRB(16, widget.index == 0 ? 0 : 8, 16, 8),
      onTap: () {
        _launchBrowser(widget.feed.link!);
      },
      onLongPress:() {
        Share.share(widget.feed.link!);
      },
      title: Text(
        widget.feed.title!,
        style: const TextStyle(fontSize: 16),
      ),
      subtitle: Text(
        widget.feed.formattedDate,
        textAlign: TextAlign.end,
        style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color:
            Theme.of(context).colorScheme.secondary),
      ),
    );
  }
}
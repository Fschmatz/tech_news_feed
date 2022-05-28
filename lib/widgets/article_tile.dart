import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:tech_news_feed/classes/feed.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleTile extends StatefulWidget {
  @override
  _ArticleTileState createState() => _ArticleTileState();

  Feed feed;

  ArticleTile({Key? key, required this.feed}) : super(key: key);
}

class _ArticleTileState extends State<ArticleTile> {

  _launchBrowser(String url) {
    launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: 5,
      onTap: () {
        _launchBrowser(widget.feed.link!);
      },
      onLongPress: () {
        Share.share(widget.feed.link!);
      },
      title: Text(
        widget.feed.title!,
      ),
     /* subtitle: widget.feed.data!.isNotEmpty
          ? Text(
              widget.feed.formattedDate,
              textAlign: TextAlign.end,
              style: TextStyle(
                fontSize: 12,
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.w500,
              ),
            )
          : null,*/
    );
  }
}

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


  _launchBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Error';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _launchBrowser(widget.feed.link!);
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 6),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    widget.feed.title!,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                    child: Text(
                      widget.feed.formattedDate,
                      style: TextStyle(
                          fontSize: 12.5,
                          fontWeight: FontWeight.w600,
                          color:
                          Theme.of(context).colorScheme.secondaryVariant),
                    ),
                  ),
                  SizedBox(
                    width: 55,
                    child: TextButton(
                      onPressed: () {
                        Share.share(widget.feed.link!);
                      },
                      child: Icon(
                        Icons.share_outlined,
                        size: 18.0,
                        color: Theme.of(context)
                            .textTheme
                            .headline6!
                            .color!
                            .withOpacity(0.7),
                      ),
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: Theme.of(context).cardTheme.color,
                        onPrimary: Theme.of(context).colorScheme.secondaryVariant,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
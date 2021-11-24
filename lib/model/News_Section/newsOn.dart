import 'package:flutter/material.dart';
import 'news.dart';
// import 'package:intl/intl.dart';

import 'news_repository.dart';
// Replace this entire method

class NewsSection extends StatelessWidget {
// Replace this entire method

  List<Card> _buildGridCards(BuildContext context) {
    List<News> news = NewsRepository.loadNews(Target.all);

    if (news.isEmpty) {
      return const <Card>[];
    }

    final ThemeData theme = Theme.of(context);

    return news.map((newV) {
      return Card(
        clipBehavior: Clip.antiAlias,
        // TODO: Adjust card heights (103)
        child: Column(
          // TODO: Center items on the card (103)
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  // TODO: Align labels to the bottom and center (103)
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // TODO: Change innermost Column (103)
                  children: <Widget>[
                    // TODO: Handle overflowing labels (103)
                    Text(
                      newV.title,
                      style: theme.textTheme.headline6,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 7.0),
                    Text(
                      newV.description,
                      style: theme.textTheme.subtitle2,
                    ),
                    ButtonBar(
                      children: [
                        OutlinedButton(
                            style: TextButton.styleFrom(
                              primary: Colors.blue,
                            ),
                            onPressed: (null),
                            child: Text('Leer'))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 1,
      padding: const EdgeInsets.all(20.0),
      childAspectRatio: 9 / 4.7,
      children: _buildGridCards(context),
    );
  }
}

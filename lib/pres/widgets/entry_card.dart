import 'package:flutter/material.dart';

import '../../data/models/entry_model.dart';
import '../dialogs.dart';

class EntryCard extends StatelessWidget {
  final EntryModel entry;

  const EntryCard({Key? key, required this.entry}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Dialogs.buildHighlightSheet(context: context, entry: entry),
      child: Card(
        child: Row(
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Image.network(entry.imgPath)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    entry.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8.0),
                  Text(entry.category),
                  // TagWrap(tags: Serv.getTagListFromIds(entry.tagsIds)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

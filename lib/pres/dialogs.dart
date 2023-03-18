import 'package:flutter/material.dart';
import 'package:romanshorn/data/models/tag_model.dart';

import '../data/models/entry_model.dart';
import '../data/services.dart';

class Dialogs {
  static Future<dynamic> buildHighlightSheet({
    required BuildContext context,
    required EntryModel entry,
  }) {
    DateTime selectedDate = DateTime.now();

    Future<void> selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime(2015, 8),
          lastDate: DateTime(2101));
      if (picked != null && picked != selectedDate) {
        //setState(() {
        selectedDate = picked;
        //});
      }
    }

    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (_) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.85,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(entry.imgPath),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      entry.title,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const Expanded(child: SizedBox()),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Icon(
                        Icons.light_mode_rounded,
                      ),
                    ),
                    Text("14°C",
                        style: Theme.of(context).textTheme.titleMedium),
                  ],
                ),
              ),
              // Display the tags in a horizontal chip list
              TagWrap(tags: Serv.getTagListFromIds(entry.tagsIds)),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(entry.description),
              ),

              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {
                          selectDate(context);
                        },
                        icon: const Icon(Icons.event_rounded)),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text("Book it now!"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class TagWrap extends StatelessWidget {
  final List<TagModel> tags;

  const TagWrap({
    Key? key,
    required this.tags,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: tags
          .map(
            (tag) => Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: Chip(label: Text(tag.name)),
            ),
          )
          .toList(),
    );
  }
}

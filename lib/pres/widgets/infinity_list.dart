import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:romanshorn/logic/entries_cubit.dart';

import '../dialogs.dart';
import 'like_btn.dart';

class InfinityList extends StatefulWidget {
  const InfinityList({Key? key}) : super(key: key);

  @override
  State<InfinityList> createState() => _InfinityListState();
}

class _InfinityListState extends State<InfinityList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EntriesCubit, EntriesState>(
      builder: (context, state) {
        return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: state.entries.length,
          itemBuilder: (context, index) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: GestureDetector(
                onTap: () => Dialogs.buildHighlightSheet(
                    context: context, entry: state.entries[index]),
                child: Card(
                  margin: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      // Image
                      Stack(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.40,
                            child: Image.network(
                              state.entries[index].imgPath,
                              fit: BoxFit.cover,
                            ),
                          ),
                          LikeBtn(entry: state.entries[index]),
                        ],
                      ),
                      const SizedBox(width: 12.0),
                      // Text
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Category
                            Text(state.entries[index].category,
                                style: Theme.of(context).textTheme.titleMedium),
                            SizedBox(height: 8.0),
                            // Title
                            Text(state.entries[index].title,
                                style: Theme.of(context).textTheme.titleLarge),

                            Expanded(child: Container()),

                            Text(state.entries[index].short)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

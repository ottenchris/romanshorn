import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:romanshorn/data/models/entry_model.dart';

import '../../logic/entries_cubit.dart';

class LikeBtn extends StatelessWidget {
  final EntryModel entry;
  final StateSetter? setState;

  const LikeBtn({
    Key? key,
    required this.entry,
    this.setState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6),
      padding: const EdgeInsets.all(0),
      decoration:
          const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
      child: IconButton(
          onPressed: () {
            BlocProvider.of<EntriesCubit>(context).toggleLikes(entry.id);

            if (setState != null) {
              setState!(() {});
            }
          },
          icon: entry.liked
              ? Icon(Icons.favorite, color: Colors.red)
              : Icon(Icons.favorite_border)),
    );
  }
}

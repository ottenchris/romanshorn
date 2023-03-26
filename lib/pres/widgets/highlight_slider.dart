import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/entries_cubit.dart';
import '../dialogs.dart';
import 'like_btn.dart';

class HighlightSlider extends StatefulWidget {
  const HighlightSlider({Key? key}) : super(key: key);

  @override
  State<HighlightSlider> createState() => _HighlightSliderState();
}

class _HighlightSliderState extends State<HighlightSlider> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EntriesCubit, EntriesState>(
      builder: (context, state) {
        return SizedBox(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.entries.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => Dialogs.buildHighlightSheet(
                    context: context, entry: state.entries[index]),
                child: Card(
                  elevation: 8,
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      AspectRatio(
                          aspectRatio: 5 / 4,
                          child: Image.asset(state.entries[index].imgPath,
                              fit: BoxFit.cover)),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Text(state.entries[index].title,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                                textAlign: TextAlign.center),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: LikeBtn(entry: state.entries[index]),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

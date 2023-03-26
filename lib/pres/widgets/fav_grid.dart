import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/entry_model.dart';
import '../../logic/entries_cubit.dart';
import '../dialogs.dart';

class FavouritesGrid extends StatefulWidget {
  const FavouritesGrid({Key? key}) : super(key: key);

  @override
  State<FavouritesGrid> createState() => _FavouritesGridState();
}

class _FavouritesGridState extends State<FavouritesGrid> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EntriesCubit, EntriesState>(
      builder: (context, state) {
        List<EntryModel> favs =
        state.entries.where((element) => element.liked).toList();

        return GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 8,
          crossAxisCount: 2,
          shrinkWrap: true,
          children: List.generate(
            favs.length,
                (index) {
              return GestureDetector(
                onTap: () => Dialogs.buildHighlightSheet(
                    context: context, entry: favs[index]),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    AspectRatio(
                      aspectRatio: 3 / 2,
                      child: Image.asset(favs[index].imgPath,
                          fit: BoxFit.fitWidth),
                    ),
                    Card(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: SizedBox(
                            width: double.maxFinite,
                            child: Text(favs[index].title,
                                textAlign: TextAlign.center),
                          ),
                        )),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        margin: const EdgeInsets.all(4),
                        padding: const EdgeInsets.all(0),
                        decoration: const BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: IconButton(
                            onPressed: () {
                              BlocProvider.of<EntriesCubit>(context)
                                  .toggleLikes(favs[index].id);
                            },
                            icon: favs[index].liked
                                ? const Icon(Icons.favorite, color: Colors.red)
                                : const Icon(Icons.favorite_border)),
                      ),
                    ),
                    if (favs[index].id == "5")
                      Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                TapGestureRecognizer tapGestureRecognizer =
                                    TapGestureRecognizer();

                                return AlertDialog(
                                  icon: const Icon(Icons.thunderstorm_rounded),
                                  title: const Text("Wetter Warnung"),
                                  content: RichText(
                                    text: TextSpan(
                                      style:
                                          const TextStyle(color: Colors.black),
                                      children: <TextSpan>[
                                        const TextSpan(
                                            text:
                                                "Für Morgen ist schlechtes Wetter vorhergesagt. \n\nWir schlagen Dir alternativ einen Besuch im \""),
                                        TextSpan(
                                          text: "Kino Roxy",
                                          style: const TextStyle(
                                              color: Colors.blue),
                                          recognizer: tapGestureRecognizer
                                            ..onTap = () async {
                                              Dialogs.buildHighlightSheet(
                                                  context: context,
                                                  entry: state.entries
                                                      .firstWhere((element) =>
                                                          element.id == "3"));
                                            },
                                        ),
                                        const TextSpan(text: '" vor.'),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                        style: TextButton.styleFrom(
                                            foregroundColor: Colors.black),
                                        onPressed: () => Navigator.pop(context),
                                        child: const Text("OK"))
                                  ],
                                );
                              },
                            );
                          },
                          icon: const Icon(
                            Icons.warning_rounded,
                            color: Colors.orange,
                            size: 35,
                          ),
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}

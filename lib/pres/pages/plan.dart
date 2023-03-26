import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/entries_cubit.dart';
import '../widgets/fav_grid.dart';
import '../widgets/header.dart';

class PlanPage extends StatelessWidget {
  const PlanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BlocBuilder<EntriesCubit, EntriesState>(
        builder: (context, state) {
          return ListView(
            padding:
                const EdgeInsets.only(left: 8, top: 16, right: 8, bottom: 0),
            children: [
              const HeaderLogo(),
              const SizedBox(width: double.maxFinite),
              Text(
                "Favoriten",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              state.entries.any((element) => element.liked)
                  ? const FavouritesGrid()
                  : const Card(
                margin: EdgeInsets.symmetric(horizontal: 0, vertical: 16),
                      elevation: 2,
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                            "Du hast noch keine Favoriten. Sammle deine Favoriten mit dem Herz-Symbol.",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16)),
                      ),
                    ),
            ],
          );
        },
      ),
    );
  }
}

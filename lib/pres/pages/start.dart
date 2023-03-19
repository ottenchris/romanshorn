import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:romanshorn/logic/entries_cubit.dart';

import '../../data/data.dart';
import '../widgets/header.dart';
import 'home.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  late List<bool> isSelected;

  @override
  void initState() {
    super.initState();
    isSelected = List<bool>.filled(Data.tags.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const HeaderLogo(),
              const SizedBox(height: 96),
              //  Image.asset("assets/images/logo.png", height: 200),
              Text(
                "Deine Interessen",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: 64,
                width: double.maxFinite,
              ),
              Expanded(
                child: Wrap(
                  spacing: 16.0,
                  runSpacing: 8.0,
                  alignment: WrapAlignment.center,
                  children: List.generate(
                    Data.tags.length,
                    (index) {
                      return FilterChip(
                        elevation: 4,
                        padding: const EdgeInsets.all(8.0),
                        label: Text(Data.tags[index].name),
                        selected: isSelected[index],
                        onSelected: (bool selected) {
                          setState(() {
                            isSelected[index] = selected;
                          });
                        },
                      );
                    },
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: isSelected.any((element) => element == true)
                    ? () {
                        List<Tag> selectedChips = [];
                        for (int i = 0; i < isSelected.length; i++) {
                          if (isSelected[i]) {
                            selectedChips.add(Data.tags[i].id);
                          }
                        }
                        BlocProvider.of<EntriesCubit>(context)
                            .setCategoryEntries(selectedChips);

                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const HomePage()));
                      }
                    : null,
                child: const Text('Weiter'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

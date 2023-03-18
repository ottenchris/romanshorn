import 'package:flutter/material.dart';

import '../../data/models/tag_model.dart';

class TagSlider extends StatelessWidget {
  const TagSlider({
    Key? key,
    required this.tags,
  }) : super(key: key);

  final List<TagModel> tags;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: GridView.count(
        mainAxisSpacing: 8,
        scrollDirection: Axis.horizontal,
        crossAxisCount: 2,
        shrinkWrap: true,
        children: List.generate(
          tags.length,
          (index) {
            return GestureDetector(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  AspectRatio(
                    aspectRatio: 3 / 2,
                    child: Image.asset(
                      tags[index].imgPath,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: SizedBox(
                          width: double.maxFinite,
                          child: Text(tags[index].name,
                              textAlign: TextAlign.center),
                        ),
                      )),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

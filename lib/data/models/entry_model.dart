import '../data.dart';

class EntryModel {
  final String id;
  final String title;
  final String description;
  final String category;
  final String short;
  final List<Tag> tagsIds;
  final String imgPath;
  final bool liked;

  EntryModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.short,
    required this.tagsIds,
    required this.imgPath,
    required this.liked,
  });

  updateLike({
    required bool liked,
  }) {
    return EntryModel(
      id: id,
      title: title,
      description: description,
      category: category,
      short: short,
      tagsIds: tagsIds,
      imgPath: imgPath,
      liked: liked,
    );
  }
}

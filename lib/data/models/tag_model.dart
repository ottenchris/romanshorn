import '../data.dart';

class TagModel {
  final Tag id;
  final String name;
  final String imgPath;
  final bool selected;

  TagModel(
    this.id, {
    required this.name,
    required this.imgPath,
    required this.selected,
  });

  // Get tag by id
  static TagModel getById(Tag id) {
    return Data.tags.firstWhere((tag) => tag.id == id);
  }
}

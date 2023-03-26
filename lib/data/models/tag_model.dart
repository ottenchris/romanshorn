import '../data.dart';

class TagModel {
  final Tag id;
  final String name;
  final bool selected;

  TagModel(
    this.id, {
    required this.name,
    required this.selected,
  });

  // Get tag by id
  static TagModel getById(Tag id) {
    return Data.tags.firstWhere((tag) => tag.id == id);
  }
}

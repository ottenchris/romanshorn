import 'data.dart';
import 'models/tag_model.dart';

class Serv {
  // get tagModel from entry.tagsIds
  static List<TagModel> getTagListFromIds(List<Tag> tagIds) {
    List<TagModel> tags = [];
    for (final tagId in tagIds) {
      tags.add(Data.tags.firstWhere((tag) => tag.id == tagId));
    }
    return tags;
  }
}

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:romanshorn/data/data.dart';

import '../data/models/entry_model.dart';

part 'entries_state.dart';

class EntriesCubit extends Cubit<EntriesState> {
  EntriesCubit() : super(AllEntries(Data.entryList));

  void setCategoryEntries(List<Tag> categories) {
    // Adds the shopping category because of the coupons
    categories.add(Tag.shopping);

    List<EntryModel> entries = Data.entryList;
    List<EntryModel> filteredEntries = [];

    for (EntryModel entry in entries) {
      for (Tag category in categories) {
        if (entry.tagsIds.contains(category) &&
            !filteredEntries.contains(entry)) {
          filteredEntries.add(entry);
        }
      }
    }

    emit(CustomCategoryEntries(filteredEntries));
  }

  void toggleLikes(String id) {
    List<EntryModel> entries = state.entries;

    EntryModel entry = entries.firstWhere((element) => element.id == id);
    EntryModel updatedEntry = entry.updateLike(liked: !entry.liked);
    updateEntry(updatedEntry);
  }

  void updateEntry(EntryModel updatedEntry) {
    List<EntryModel> entries = state.entries;

    int index = entries.indexWhere((element) => element.id == updatedEntry.id);
    entries.removeAt(index);
    entries.insert(index, updatedEntry);
    if (state is AllEntries) {
      emit(AllEntries(entries));
    } else if (state is CustomCategoryEntries) {
      emit(CustomCategoryEntries(entries));
    }
  }
}

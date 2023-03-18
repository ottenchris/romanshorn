part of 'entries_cubit.dart';

@immutable
abstract class EntriesState {
  final List<EntryModel> entries;

  EntriesState(this.entries);
}

class AllEntries extends EntriesState {
  AllEntries(List<EntryModel> entries) : super(entries);
}

class CustomCategoryEntries extends EntriesState {
  CustomCategoryEntries(List<EntryModel> entries) : super(entries);
}

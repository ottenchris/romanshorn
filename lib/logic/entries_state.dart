part of 'entries_cubit.dart';

@immutable
abstract class EntriesState {
  final List<EntryModel> entries;

  const EntriesState(this.entries);
}

class AllEntries extends EntriesState {
  const AllEntries(List<EntryModel> entries) : super(entries);
}

class CustomCategoryEntries extends EntriesState {
  const CustomCategoryEntries(List<EntryModel> entries) : super(entries);
}

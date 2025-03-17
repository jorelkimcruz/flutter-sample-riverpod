import 'package:flutter_hooks_riverpod_app/enums/filter_type_enum.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'list_filter_type_provider.g.dart';

@riverpod
class ListFilterType extends _$ListFilterType {
  @override
  FilterType build() {
    return FilterType.all;
  }

  void toggleFilterType(FilterType? type) {
    state = type!;
  }
}

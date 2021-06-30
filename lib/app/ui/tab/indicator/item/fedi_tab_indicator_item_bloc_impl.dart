import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/ui/tab/indicator/fedi_tab_indicator_bloc.dart';
import 'package:fedi/app/ui/tab/indicator/item/fedi_tab_indicator_item_bloc.dart';

class FediTabIndicatorItemBloc<T> extends DisposableOwner
    implements IFediTabIndicatorItemBloc<T> {
  final IFediTabIndicatorBloc<T> fediTabIndicatorBloc;
  @override
  final T item;
  @override
  final int index;

  @override
  bool get isSelected => fediTabIndicatorBloc.selectedItem == item;

  @override
  Stream<bool> get isSelectedStream => fediTabIndicatorBloc.selectedItemStream
      .map((selectedItem) => selectedItem == item);

  FediTabIndicatorItemBloc({
    required this.fediTabIndicatorBloc,
    required this.item,
    required this.index,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is FediTabIndicatorItemBloc &&
              runtimeType == other.runtimeType &&
              fediTabIndicatorBloc == other.fediTabIndicatorBloc &&
              item == other.item &&
              index == other.index;

  @override
  int get hashCode =>
      fediTabIndicatorBloc.hashCode ^ item.hashCode ^ index.hashCode;

  @override
  String toString() {
    return 'FediTabIndicatorItemBloc{'
        'fediTabIndicatorBloc: $fediTabIndicatorBloc,'
        ' item: $item, index: $index}';
  }

  @override
  void select() {
    fediTabIndicatorBloc.selectIndex(index);
  }
}

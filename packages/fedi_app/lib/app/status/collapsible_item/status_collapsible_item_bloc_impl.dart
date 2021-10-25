import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/html/html_text_helper.dart';
import 'package:fedi_app/app/status/collapsible_item/status_collapsible_item_bloc.dart';
import 'package:fedi_app/app/status/status_bloc.dart';
import 'package:fedi_app/app/status/status_model.dart';
import 'package:fedi_app/collapsible/owner/collapsible_owner_bloc.dart';
import 'package:rxdart/rxdart.dart';

class StatusCollapsibleItemBloc extends DisposableOwner
    implements IStatusCollapsibleItemBloc {
  final IStatusBloc statusBloc;
  final ICollapsibleOwnerBloc? collapsibleBloc;

  final int minimumCharactersLimitToCollapse;

  // ignore: close_sinks
  final BehaviorSubject<bool> _isCollapsedSubject;

  IStatus get status => statusBloc.status;

  Stream<IStatus> get statusStream => statusBloc.statusStream;

  StatusCollapsibleItemBloc({
    required bool collapsingEnabled,
    required this.statusBloc,
    required this.collapsibleBloc,
    bool initialCollapsed = true,
    // ignore: no-magic-number
    this.minimumCharactersLimitToCollapse = 400,
  }) : _isCollapsedSubject = BehaviorSubject.seeded(initialCollapsed) {
    _isCollapsedSubject.disposeWith(this);

    if (collapsingEnabled) {
      collapsibleBloc!.addVisibleItem(this);
      addCustomDisposable(
        () => collapsibleBloc!.removeVisibleItem(this),
      );
    }
  }

  @override
  bool get isPossibleToCollapse => _isContentTooBig(status.content);

  bool _isContentTooBig(String? content) =>
      (content?.extractRawStringFromHtmlString().length ?? 0) >
      minimumCharactersLimitToCollapse;

  @override
  Stream<bool> get isPossibleToCollapseStream => statusStream.map(
        (status) => _isContentTooBig(status.content),
      );

  @override
  bool? get isCollapsed => _isCollapsedSubject.value;

  @override
  Stream<bool> get isCollapsedStream => _isCollapsedSubject.stream;

  @override
  void toggleCollapseExpand() {
    _isCollapsedSubject.add(!isCollapsed!);
  }

  @override
  void collapse() {
    _isCollapsedSubject.add(true);
  }

  @override
  bool get isNeedShowFullContent => !(isPossibleToCollapse && isCollapsed!);

  @override
  Stream<bool> get isNeedShowFullContentStream => Rx.combineLatest2(
        isPossibleToCollapseStream,
        isCollapsedStream,
        (bool isPossibleToCollapse, bool isCollapsed) =>
            !(isPossibleToCollapse && isCollapsed),
      );
}

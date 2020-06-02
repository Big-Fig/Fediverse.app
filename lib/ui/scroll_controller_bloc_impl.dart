import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/ui/scroll_controller_bloc.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

class ScrollControllerBloc extends DisposableOwner
    implements IScrollControllerBloc {
  @override
  final ScrollController scrollController;

  ScrollControllerBloc({@required this.scrollController})
      : scrollDirectionSubject = BehaviorSubject.seeded(null) {
    addDisposable(subject: scrollDirectionSubject);
    var listener = () {
      scrollDirectionSubject.add(scrollController.position.userScrollDirection);
    };
    scrollController.addListener(listener);
    addDisposable(custom: () {
      try {

      scrollController.removeListener(listener);
      } catch(e) {

      }
    });
  }

  BehaviorSubject<ScrollDirection> scrollDirectionSubject;

  @override
  Stream<ScrollDirection> get scrollDirectionStream =>
      scrollDirectionSubject.stream;

  @override
  ScrollDirection get scrollDirection => scrollDirectionSubject.value;

  @override
  void scrollToTop() {
    scrollController.animateTo(
      0.0,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 300),
    );
  }
}

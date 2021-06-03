import 'package:fedi/app/ui/media/fedi_media_carousel_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:rxdart/rxdart.dart';

class FediMediaCarouselBloc<T> extends DisposableOwner
    implements IFediMediaCarouselBloc<T> {
  @override
  final List<T> items;
  BehaviorSubject<int> currentIndexSubject;

  FediMediaCarouselBloc({
    required this.items,
    int currentIndex = 0,
  }) : currentIndexSubject = BehaviorSubject.seeded(currentIndex) {
    addDisposable(subject: currentIndexSubject);
  }

  @override

  int? get currentIndex => currentIndexSubject.value;

  @override
  Stream<int> get currentIndexStream => currentIndexSubject.stream;

  @override
  void selectIndex(int index) {
    currentIndexSubject.add(index);
  }
}

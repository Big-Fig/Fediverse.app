import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IScrollControllerBloc extends Disposable {
  static IScrollControllerBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IScrollControllerBloc>(context, listen: listen);

  ScrollController get scrollController;

  Stream<ScrollDirection> get scrollDirectionStream;

  ScrollDirection get scrollDirection;

  void scrollToTop();
}

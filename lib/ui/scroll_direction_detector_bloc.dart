import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IScrollDirectionDetector extends Disposable {
  static IScrollDirectionDetector of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IScrollDirectionDetector>(context, listen: listen);

  ScrollController get scrollController;

  Stream<ScrollDirection> get scrollDirectionStream;

  ScrollDirection get scrollDirection;
}

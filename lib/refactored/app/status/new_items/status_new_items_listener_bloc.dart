import 'package:fedi/refactored/app/status/status_model.dart';

abstract class IStatusNewItemsListenerBloc  {
  Stream<List<IStatus>> get newItemsStream;
}

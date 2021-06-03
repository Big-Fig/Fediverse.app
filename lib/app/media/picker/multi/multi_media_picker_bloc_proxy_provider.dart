import 'package:fedi/app/media/picker/media_picker_bloc.dart';
import 'package:fedi/app/media/picker/multi/multi_media_picker_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class MultiMediaPickerBlocProxyProvider extends StatelessWidget {
  final Widget child;

  MultiMediaPickerBlocProxyProvider({required this.child});

  @override
  Widget build(BuildContext context) {
    return ProxyProvider<IMultiMediaPickerBloc, IMediaPickerBloc>(
      update: (context, value, previous) => value,
      child: child,
    );
  }
}

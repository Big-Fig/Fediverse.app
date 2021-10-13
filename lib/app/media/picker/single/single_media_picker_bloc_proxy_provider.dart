import 'package:fedi/app/media/picker/media_picker_bloc.dart';
import 'package:fedi/app/media/picker/single/single_media_picker_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class SingleMediaPickerBlocProxyProvider extends StatelessWidget {
  final Widget child;

  SingleMediaPickerBlocProxyProvider({required this.child});

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<ISingleMediaPickerBloc, IMediaPickerBloc>(
        update: (context, value, previous) => value,
        child: child,
      );
}

import 'package:fedi/form/field/file_picker_or_url/file_picker_or_url_form_field_bloc.dart';
import 'package:fedi/form/field/form_field_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class FilePickerOrUrlFormFieldBlocProxyProvider extends StatelessWidget {
  final Widget child;

  const FilePickerOrUrlFormFieldBlocProxyProvider({
    required this.child,
  });

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IFilePickerOrUrlFormFieldBloc, IFormFieldBloc>(
        update: (context, value, previous) => value,
        child: child,
      );
}

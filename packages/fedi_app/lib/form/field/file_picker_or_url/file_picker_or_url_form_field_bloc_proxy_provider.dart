import 'package:fedi_app/form/field/file_picker_or_url/file_picker_or_url_form_field_bloc.dart';
import 'package:fedi_app/form/field/form_field_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class FilePickerOrUrlFormFieldBlocProxyProvider extends StatelessWidget {
  final Widget child;

  const FilePickerOrUrlFormFieldBlocProxyProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IFilePickerOrUrlFormFieldBloc, IFormFieldBloc>(
        update: (context, value, previous) => value,
        child: child,
      );
}

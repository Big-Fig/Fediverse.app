import 'package:fedi/form/field/file_picker_or_url/file_picker_or_url_form_field_bloc.dart';
import 'package:fedi/form/field/file_picker_or_url/file_picker_or_url_form_field_bloc_proxy_provider.dart';
import 'package:fedi/form/field/file_picker_or_url/image/image_file_picker_or_url_form_field_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ImageFilePickerOrUrlFormFieldBlocProxyProvider extends StatelessWidget {
  final Widget child;

  const ImageFilePickerOrUrlFormFieldBlocProxyProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ProxyProvider<
          IImageFilePickerOrUrlFormFieldBloc, IFilePickerOrUrlFormFieldBloc>(
        update: (context, value, previous) => value,
        child: FilePickerOrUrlFormFieldBlocProxyProvider(
          child: child,
        ),
      );
}

// import 'package:fedi/form/field/value/int/int_value_form_field_bloc.dart';
// import 'package:fedi/form/field/value/value_form_field_bloc.dart';
// import 'package:fedi/form/field/value/value_form_field_bloc_proxy_provider.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:provider/provider.dart';
//
// class IntValueFormFieldBlocProxyProvider extends StatelessWidget {
//   final Widget child;
//
//   IntValueFormFieldBlocProxyProvider({
//     @required this.child,
//   });
//
//   @override
//   Widget build(BuildContext context) =>
//       ProxyProvider<IIntValueFormFieldBloc, IValueFormFieldBloc<int>>(
//         update: (context, value, previous) => value,
//         child: ValueFormFieldBlocProxyProvider<int>(
//           child: child,
//         ),
//       );
// }

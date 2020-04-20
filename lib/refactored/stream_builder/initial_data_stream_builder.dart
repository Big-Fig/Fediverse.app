import 'dart:async';

import 'package:flutter/widgets.dart';

// same behaviour like InitialDataStreamBuilder but with better performance
// don't rebuild twice with initial data on first build
class InitialDataStreamBuilder<T> extends StatefulWidget {
  final T initialData;
  final AsyncWidgetBuilder<T> builder;
  final Stream<T> stream;

  InitialDataStreamBuilder(
      {@required this.initialData,
      @required this.stream,
      @required this.builder});

  @override
  _InitialDataStreamBuilderState createState() =>
      _InitialDataStreamBuilderState<T>(initialData, builder);
}

class _InitialDataStreamBuilderState<T>
    extends State<InitialDataStreamBuilder<T>> {
  T currentData;
  final AsyncWidgetBuilder<T> builder;

  _InitialDataStreamBuilderState(this.currentData, this.builder);

  StreamSubscription subscription;

  @override
  void initState() {
    super.initState();
    subscription = widget.stream.listen((newData) {
      if (currentData != newData) {
        setState(() {
          currentData = newData;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    subscription?.cancel();
  }

  @override
  Widget build(BuildContext context) => builder(
      context, AsyncSnapshot<T>.withData(ConnectionState.done, currentData));
}

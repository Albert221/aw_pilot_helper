import 'package:flutter/widgets.dart';

mixin DidInitMixin<T extends StatefulWidget> on State<T> {
  bool _didInitState = false;

  @override
  @mustCallSuper
  void didChangeDependencies() {
    if (!_didInitState) {
      didInitState();
      _didInitState = true;
    }
    super.didChangeDependencies();
  }

  /// Called only once, after [initState], and before [didChangeDependencies].
  void didInitState();
}

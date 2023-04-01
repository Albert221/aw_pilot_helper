import 'package:flutter_bloc/flutter_bloc.dart';

class EditLockCubit extends Cubit<bool> {
  // ignore: avoid_positional_boolean_parameters
  EditLockCubit(super.initialState);

  void lock() => emit(true);
  void unlock() => emit(false);
}

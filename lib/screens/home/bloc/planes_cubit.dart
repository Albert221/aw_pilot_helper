import 'dart:async';

import 'package:aw_pilot_helper/data/plane_specification_repository.dart';
import 'package:aw_pilot_helper/models/plane_specification.dart';
import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'planes_cubit.freezed.dart';

class PlanesCubit extends Cubit<PlanesState> with BlocPresentationMixin {
  PlanesCubit(this._repository) : super(const PlanesState.loadInProgress()) {
    _subscription = _repository.getAll().listen(_listen);
  }

  final PlaneSpecificationRepository _repository;

  late final StreamSubscription<dynamic> _subscription;

  @override
  Future<void> close() async {
    await _subscription.cancel();
    await super.close();
  }

  void _listen(Either<Object, List<PlaneSpecification>> planes) {
    planes.fold(
      (error) {
        debugPrint(error.toString());

        final emitError = state.maybeWhen(
          loadSuccess: (planes) => planes.isEmpty,
          orElse: () => true,
        );

        if (emitError) {
          emit(
            PlanesState.loadFailure(
              error is DioError &&
                      error.error.runtimeType.toString() == 'SocketException'
                  ? PlanesStateFailure.noInternet
                  : PlanesStateFailure.other,
            ),
          );
        } else {
          // state no-op; keep already loaded stuff.
          emitPresentation(
            error is DioError &&
                    error.error.runtimeType.toString() == 'SocketException'
                ? const PlanesPresentationEvent.noInternet()
                : const PlanesPresentationEvent.other(),
          );
        }
      },
      (planes) => emit(PlanesState.loadSuccess(planes: planes)),
    );
  }

  Future<void> retry() async {
    await _repository.update();
  }
}

@freezed
class PlanesPresentationEvent
    with _$PlanesPresentationEvent
    implements BlocPresentationEvent {
  const factory PlanesPresentationEvent.noInternet() = _NoInternet;
  const factory PlanesPresentationEvent.other() = _Other;
}

enum PlanesStateFailure { noInternet, other }

@freezed
class PlanesState with _$PlanesState {
  const factory PlanesState.loadInProgress() = _LoadInProgress;

  const factory PlanesState.loadFailure(
    PlanesStateFailure kind,
  ) = _LoadFailure;

  const factory PlanesState.loadSuccess({
    required List<PlaneSpecification> planes,
  }) = _LoadSuccess;
}

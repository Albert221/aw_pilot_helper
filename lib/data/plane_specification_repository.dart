import 'dart:async';

import 'package:aw_pilot_helper/data/planes.dart';
import 'package:aw_pilot_helper/models/plane_specification.dart';
import 'package:either_dart/either.dart';
import 'package:rxdart/rxdart.dart';

class PlaneSpecificationRepository {
  PlaneSpecificationRepository() {
    _streamController.add(Right(List.unmodifiable(_planes)));
  }

  final _planes = [spTpe];

  final _streamController =
      BehaviorSubject<Either<Object, List<PlaneSpecification>>>();

  Future<void> dispose() async {
    await _streamController.close();
  }

  Stream<Either<Object, List<PlaneSpecification>>> getAll() {
    return _streamController.stream;
  }

  Future<void> update() async {}
}

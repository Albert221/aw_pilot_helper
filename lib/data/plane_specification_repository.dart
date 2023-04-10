import 'dart:async';

import 'package:aw_pilot_helper/data/api/api_client.dart';
import 'package:aw_pilot_helper/data/api/response_model.dart' as api;
import 'package:aw_pilot_helper/data/storage/plane_specification_storage.dart';
import 'package:aw_pilot_helper/models/plane_specification.dart';
import 'package:aw_pilot_helper/utils/list_read_only.dart';
import 'package:collection/collection.dart';
import 'package:either_dart/either.dart';
import 'package:rxdart/rxdart.dart';

class PlaneSpecificationRepository {
  PlaneSpecificationRepository(this._apiClient, this._storage);

  final ApiClient _apiClient;
  final PlaneSpecificationStorage _storage;

  final _streamController =
      BehaviorSubject<Either<Object, List<PlaneSpecification>>>();

  Future<void> dispose() async {
    await _streamController.close();
  }

  Stream<Either<Object, List<PlaneSpecification>>> getAll() {
    _storage.getAll().then((planes) {
      if (planes == null) return;
      _streamController.add(Right(planes.readOnly));
    });

    return _streamController.stream;
  }

  Future<void> update() async {
    final planeSpecs = <PlaneSpecification>[];

    try {
      var pageSize = 100; // Strapi config may have smaller page size limit
      var count = 0;
      do {
        final response = await _apiClient.getPlaneSpecifications(
          page: planeSpecs.length ~/ pageSize,
          pageSize: pageSize,
        );

        pageSize = response.meta.pagination.pageSize;
        count = response.meta.pagination.total;

        planeSpecs.addAll(_mapPlaneSpecificationsResponse(response));
      } while (planeSpecs.length < count);

      planeSpecs.sortBy((plane) => plane.name);

      await _storage.save(planeSpecs);

      _streamController.add(Right(List.unmodifiable(planeSpecs)));
    } catch (e) {
      _streamController.add(Left(e));
    }
  }

  static List<PlaneSpecification> _mapPlaneSpecificationsResponse(
    api.PaginatedDataPlaneSpecification response,
  ) {
    return List.unmodifiable(
      response.data.map<PlaneSpecification>((data) {
        final attrs = data.attributes;

        return PlaneSpecification(
          name: attrs.name,
          type: attrs.type,
          oilMin: attrs.oilMin,
          oilMax: attrs.oilMax,
          fuelTanks: attrs.fuelTanks.data.map((data) {
            return FuelTankSpecification(
              name: data.attributes.name,
              arm: data.attributes.arm,
              capacity: data.attributes.capacity,
            );
          }).toList(),
          planeWeight: attrs.planeWeight,
          planeMoment: attrs.planeMoment,
          drawbarWeight: attrs.drawbarWeight,
          drawbarArm: attrs.drawbarArm,
          weights: attrs.weights.data.map((data) {
            return WeightSpecification(
              name: data.attributes.name,
              arm: data.attributes.arm,
            );
          }).toList(),
        );
      }),
    );
  }
}

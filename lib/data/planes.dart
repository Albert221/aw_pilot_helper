import 'package:aw_pilot_helper/models/plane_specification.dart';

const spTpe = PlaneSpecification(
  name: 'SP-TPE',
  type: 'Aero AT-3 R100',
  oilMin: 3,
  oilMax: 3.5,
  fuelTanks: [
    FuelTankSpecification(name: 'lewy zbiornik', capacity: 50, arm: 0.192),
    FuelTankSpecification(name: 'prawy zbiornik', capacity: 50, arm: 0.192),
  ],
  planeWeight: 398.5,
  planeMoment: 104.8,
  drawbarWeight: 1.5,
  drawbarArm: 1.733,
  weights: [
    WeightSpecification(name: 'Załoga', arm: 0.6),
    WeightSpecification(name: 'Bagaż', arm: 1.125),
  ],
);

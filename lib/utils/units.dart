double kilogramsToPounds(double kilograms) {
  return kilograms * 2.20462262185;
}

double metersToInches(double meters) {
  return meters * 39.3700787402;
}

double kilogramMetersToPoundInches(double kilogramMeters) {
  return kilogramMeters * kilogramsToPounds(1) * metersToInches(1);
}

double litersToGallons(double liters) {
  return liters * 0.2641720;
}

double litersToQuarts(double liters) {
  return liters * 1.05668820943;
}

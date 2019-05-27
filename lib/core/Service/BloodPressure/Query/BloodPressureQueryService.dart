import 'package:flutter_vital/core/Service/BloodPressure/Model/BloodPressure.dart';
import 'package:flutter_vital/core/Service/BloodPressure/Repository/BloodPressureRepository.dart';
import 'package:flutter_vital/core/Service/BloodPressure/Repository/Filter/BloodPressureFilter.dart';

class BloodPressureQueryService {
  final BloodPressureRepository _repository = new BloodPressureRepository();

  Future<List<BloodPressure>> filter(BloodPressureFilter filter) async {
    return _repository.filter(filter);
  }
}
import 'package:flutter_vital/core/Service/BloodPressure/Model/BloodPressure.dart';
import 'package:flutter_vital/core/Service/BloodPressure/Repository/BloodPressureRepository.dart';
import 'package:flutter_vital/core/Service/BloodPressure/Repository/Filter/BloodPressureFilter.dart';

class BloodPressureCommandService {
  final BloodPressureRepository _repository = new BloodPressureRepository();

  Future<bool> save(BloodPressure bp) async {
    return await _repository.save(bp);
  }

  Future<bool> delete(BloodPressure bp) async {
    return await _repository.delete(bp);
  }

  Future<bool> deleteByFilter(BloodPressureFilter filter) async {
    List<BloodPressure> items = await _repository.filter(filter);

    for(final item in items) {
      if(!await _repository.delete(item)) {
        return false;
      }
    }

    return true;
  }
}
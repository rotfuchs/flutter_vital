
class BloodPressure {
  int id;
  DateTime created;
  double pulse;
  double diastolic;
  double systolic;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'created': created,
      'pulse': pulse,
      'diastolic': diastolic,
      'systolic': systolic,
    };
  }

}
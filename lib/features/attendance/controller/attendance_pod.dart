import 'package:college_buddy/data/model/atttendance_model.dart';
import 'package:college_buddy/data/repository/attendance/attendance_repository_pod.dart';
import 'package:college_buddy/shared/riverpod_ext/cancel_extensions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final attendanceProvider =
    FutureProvider.autoDispose.family<AttendanceModel, String>((ref, studentId) async {
  final result = await ref
      .watch(attendanceRepoProvider)
      .getAttendance(cancelToken: ref.cancelToken(), studentId: studentId);
  return result.when((attendanceModel) => attendanceModel, (error) => throw (error.errorMessage));
});

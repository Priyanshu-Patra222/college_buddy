import 'package:college_buddy/data/repository/attendance/attendance_repository.dart';
import 'package:college_buddy/data/repository/attendance/i_attendance_repository.dart';
import 'package:college_buddy/shared/api_client/dio/dio_client_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final attendanceRepoProvider = Provider.autoDispose<IAttendanceRepository>(
  (ref) {
    return AttendanceRepository(dio: ref.watch(dioProvider));
  },
);

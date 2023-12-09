import 'package:college_buddy/data/repository/student/i_student_repository.dart';
import 'package:college_buddy/data/repository/student/student_repository.dart';
import 'package:college_buddy/shared/api_client/dio/dio_client_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final studentDetailsRepoProvider = Provider.autoDispose<IStudentRepository>(
  (ref) {
    return StudentRepository(dio: ref.watch(dioProvider));
  },
);

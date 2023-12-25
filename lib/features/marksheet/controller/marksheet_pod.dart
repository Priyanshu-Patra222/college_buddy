import 'package:college_buddy/data/model/marksheet_model.dart';
import 'package:college_buddy/data/repository/marksheet/marksheet_repo_pod.dart';
import 'package:college_buddy/shared/riverpod_ext/cancel_extensions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final marksheetProvider =
    FutureProvider.autoDispose.family<MarksheetModel, String>((ref, studentId) async {
  final result = await ref
      .watch(marksheetRepoProvider)
      .getMarksheet(cancelToken: ref.cancelToken(), studentId: studentId);
  return result.when((marksheetModel) => marksheetModel, (error) => throw (error.errorMessage));
});

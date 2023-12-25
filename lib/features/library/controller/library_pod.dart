import 'package:college_buddy/data/model/library_model.dart';
import 'package:college_buddy/data/repository/library/library_repo_pod.dart';
import 'package:college_buddy/shared/riverpod_ext/cancel_extensions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final libraryProvider =
    FutureProvider.autoDispose.family<LibraryModel, String>((ref, studentId) async {
  final result = await ref
      .watch(libraryRepoProvider)
      .getLibrary(cancelToken: ref.cancelToken(), studentId: studentId);
  return result.when((libraryModel) => libraryModel, (error) => throw (error.errorMessage));
});

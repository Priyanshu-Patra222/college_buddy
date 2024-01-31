import 'package:college_buddy/data/model/bank_details_model.dart';
import 'package:college_buddy/data/repository/bank_details/bank_details_repo_pod.dart';
import 'package:college_buddy/shared/riverpod_ext/cancel_extensions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bankDetailsProvider =
    FutureProvider.autoDispose.family<BankDetailsModel, String>((ref, studentId) async {
  final result = await ref
      .watch(bankDetailsRepoProvider)
      .getBankDetails(cancelToken: ref.cancelToken(), studentId: studentId);
  return result.when((bankDetailsModel) => bankDetailsModel, (error) => throw (error.errorMessage));
});

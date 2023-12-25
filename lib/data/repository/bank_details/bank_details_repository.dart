import 'package:college_buddy/const/app_urls.dart';
import 'package:college_buddy/data/model/bank_details_model.dart';
import 'package:college_buddy/shared/exception/base_exception.dart';
import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';

import 'i_bank_details_repository.dart';

class BankDetailsRepository implements IBankDetailsRepository {
  final Dio dio;

  BankDetailsRepository({required this.dio});
  @override
  Future<Result<BankDetailsModel, APIException>> getBankDetails(
      {required CancelToken cancelToken, required String studentId}) async {
    final result =
        await dio.get(AppUrls.getBankDetails(studentId: studentId), cancelToken: cancelToken);
    if (result.statusCode == 200 || result.statusCode == 201) {
      return Success(BankDetailsModel.fromMap(result.data));
    } else {
      return Error(APIException.fromMap(result.data));
    }
  }
}

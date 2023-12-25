import 'package:college_buddy/data/model/bank_details_model.dart';
import 'package:college_buddy/shared/exception/base_exception.dart';
import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class IBankDetailsRepository {
  Future<Result<BankDetailsModel, APIException>> getBankDetails({
    required CancelToken cancelToken,
    required String studentId,
  });
}

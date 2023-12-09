import 'package:college_buddy/data/repository/bank_details/bank_details_repository.dart';
import 'package:college_buddy/data/repository/bank_details/i_bank_details_repository.dart';
import 'package:college_buddy/shared/api_client/dio/dio_client_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bankDetailsRepoProvider = Provider.autoDispose<IBankDetailsRepository>(
  (ref) {
    return BankDetailsRepository(dio: ref.watch(dioProvider));
  },
);

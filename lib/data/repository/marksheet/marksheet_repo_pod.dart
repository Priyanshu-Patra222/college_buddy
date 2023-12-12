import 'package:college_buddy/data/repository/marksheet/i_marksheet_repository.dart';
import 'package:college_buddy/data/repository/marksheet/marksheet_repository.dart';
import 'package:college_buddy/shared/api_client/dio/dio_client_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final marksheetRepoProvider = Provider.autoDispose<IMarksheetRepository>(
  (ref) {
    return MarksheetRepository(dio: ref.watch(dioProvider));
  },
);

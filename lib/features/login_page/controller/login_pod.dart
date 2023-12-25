import 'package:college_buddy/features/login_page/controller/notifier/login_notifier.dart';
import 'package:college_buddy/features/login_page/state/login_states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginProvider =
    AsyncNotifierProvider.autoDispose<LoginAsyncNotifier, LoginState>(LoginAsyncNotifier.new);

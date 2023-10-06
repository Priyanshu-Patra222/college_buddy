import 'package:college_buddy/app/app.dart';
import 'package:college_buddy/bootstrap.dart';

/// This entry point should be used for production only
void main() {
  ///You can override your environment variable in bootstrap method here for providers
  bootstrap(() => const App());
}

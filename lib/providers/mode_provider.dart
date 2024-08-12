import 'package:flutter_riverpod/flutter_riverpod.dart';

bool isDark = true;
final mode = Provider(
  (ref) {
    return isDark;
  },
);

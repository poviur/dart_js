import 'dart:io';

import 'package:flutter_js/flutter_js.dart';
import 'package:test/test.dart';

void main() {
  late JavascriptRuntime jsRuntime;

  // Need setup environment variable LIBQUICKJSC_PATH = './windows/shared/quickjs_c_bridge.dll'
  setUp(() {
    jsRuntime = getJavascriptRuntime();
  });

  tearDown(() {
    try {
      jsRuntime.dispose();
    } on Error catch (_) {}
  });

  test('evaluate javascript', () {
    print(Platform.environment);
    final result = jsRuntime.evaluate('Math.pow(5,3)');
    print('${result.rawResult}, ${result.stringResult}');
    print(
        '${result.rawResult.runtimeType}, ${result.stringResult.runtimeType}');
    expect(result.rawResult, equals(125));
    expect(result.stringResult, equals('125'));
  });
}

import 'package:shared_value/shared_value.dart';

final SharedValue<String> token = SharedValue(
  value: "",
  key: "token",
);
final SharedValue<String> bearerToken = SharedValue(
  value: "",
  key: "bearerToken",
);

final SharedValue<String> userName = SharedValue(
  value: "",
  key: "username",
  autosave: true,
);

clearUser() {
  token.$ = "";
  bearerToken.$ = "";
  token.save();
  bearerToken.save();
}

loadValue() {
  token.load();
  bearerToken.load();
}

saveValue() {
  token.save();
  bearerToken.save();
}

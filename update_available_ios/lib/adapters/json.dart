String? Function(String json) getStringByKey(String json) =>
    (String key) => RegExp('"$key":\\s*"([^"]*)"').firstMatch(json)?.group(1);

String? Function(String json) getStringByKey(String json) {
  return (String key) {
    return RegExp('"$key":\\s*"([^"]*)"').firstMatch(json)?.group(1);
  };
}

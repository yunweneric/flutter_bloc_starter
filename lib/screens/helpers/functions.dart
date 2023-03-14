String? capitaliser(String string) {
  String shortName = string.length > 15 ? string.split(' ')[0] : string;
  return shortName = shortName[0].toUpperCase() + shortName.substring(1);
}

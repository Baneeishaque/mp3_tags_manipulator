String replaceLastOccurence(
    String originalString, String searchKey, String replacement) {
  return originalString.replaceFirst(
      searchKey, replacement, originalString.lastIndexOf(searchKey));
}
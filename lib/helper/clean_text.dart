String cleanText(String input) {
  return input
      .replaceAll(RegExp(r'\*\*'), '')      // ** 제거
      .replaceAll(RegExp(r'\(.*?\)'), '')    // 괄호와 안의 내용 제거
      .replaceAll(RegExp(r'\s+'), ' ')       // 불필요한 공백 하나로 정리
      .trim();                               // 앞뒤 공백 제거
}
class Locale {
  String appname,
      optimize,
      product,
      all,
      home,
      reason,
      feedback,
      lowCost,
      fullEffective,
      noUse;
  final font = 'Arsenal';

  void load(String locale) {
    final texts = getTexts()[locale] ?? {};
    appname = texts['appname'] ?? '';
    optimize = texts['optimize'] ?? '';
    all = texts['all'] ?? '';
    product = texts['product'] ?? '';
    home = texts['home'] ?? '';
    reason = texts['reason'] ?? '';
    feedback = texts['feedback'] ?? '';
    lowCost = texts['lowCost'] ?? '';
    fullEffective = texts['fullEffective'] ?? '';
    noUse = texts['noUse'] ?? '';
  }

  Map<String, Map<String, String>> getTexts() => {
        'vn': {
          'appname': 'Tản Nhiệt Laptop',
          'optimize': 'Giải pháp tản nhiệt tối ưu',
          'all': 'Tất cả',
          'home': 'Trang chủ',
          'product': 'Sản Phẩm',
          'reason': 'Tại sao bạn cần đế tản nhiệt tùy biến (custom)?',
          'feedback': 'Khách hàng nói gì về sản phẩm của tannhietlaptop.com',
          'lowCost': 'Chi phí tối thiểu',
          'fullEffective': 'Hiệu quả tối đa',
          'noUse': 'Không Dùng thì thôi',
        },
        'us': {
          'appname': 'Tản Nhiệt Laptop',
          'optimize': 'Giải pháp tản nhiệt tối ưu',
          'all': 'Tất cả',
          'home': 'Trang chủ',
          'product': 'Sản Phẩm',
          'reason': 'Tại sao bạn cần đế tản nhiệt tùy biến (custom)?',
          'feedback': 'Khách hàng nói gì về sản phẩm của tannhietlaptop.com',
          'lowCost': 'Chi phí tối thiểu',
          'fullEffective': 'Hiệu quả tối đa',
          'noUse': 'Không Dùng thì thôi',
        }
      };
}

class Locale {
  var _locale = 'vn';

  get font => 'Arsenal';
  get website => 'tannhietlaptop.vn';
  get facebook => 'https://www.facebook.com/detannhiet/';
  get phone => '0342657040';

  set language(String value) => _locale = value;

  get appname => locales['appname'] ?? '';

  get optimize => locales['optimize'] ?? '';

  get product => locales['product'] ?? '';

  get all => locales['all'] ?? '';

  get home => locales['home'] ?? '';

  get reason => locales['reason'] ?? '';

  get feedback => locales['feedback'] ?? '';

  get lowCost => locales['lowCost'] ?? '';

  get fullEffective => locales['fullEffective'] ?? '';

  get noUse => locales['noUse'] ?? '';

  get noUse2 => locales['noUse2'] ?? '';

  get notSale => locales['notSale'] ?? '';

  get notSale2 => locales['notSale2'] ?? '';

  get cool => locales['cool'] ?? '';

  get cool2 => locales['cool2'] ?? '';

  get notFind => locales['notFind'] ?? '';

  get notFind2 => locales['notFind2'] ?? '';

  get openMenu => locales['openMenu'] ?? '';

  get explore => locales['explore'] ?? '';

  get shop => locales['shop'] ?? '';

  get shop1 => locales['shop1'] ?? '';

  get shop2 => locales['shop2'] ?? '';

  get shop3 => locales['shop3'] ?? '';

  get shop4 => locales['shop4'] ?? '';

  get shop5 => locales['shop5'] ?? '';
  get cooler => locales['cooler'] ?? '';
  get cooler1 => locales['cooler1'] ?? '';
  get cooler2 => locales['cooler2'] ?? '';
  get cooler3 => locales['cooler3'] ?? '';

  get locales => {
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
          'noUse2': 'Đã Dùng phải CHẤT',
          'openMenu': 'Mở menu',
          'explore': 'Khám phá ngay',
          'notSale': 'Chúng tôi không bán đế tản nhiệt',
          'notSale2': '...mà là giải pháp tản nhiệt toàn diện',
          'cool': 'Bạn cần một thiết bị trông thật cool',
          'cool2': '...bạn tìm đúng chỗ rồi đấy',
          'notFind': 'Đừng tìm kiếm nữa',
          'notFind2': 'Bạn đã có câu trả lời rồi',
          'shop': 'Shop',
          'cooler': 'đế tản nhiệt',
          'cooler1': ' chuyên dụng từ ',
          'cooler2': ' chính là thứ bạn tìm kiếm bấy lâu nay,',
          'cooler3': ' tuyệt vời này nhé',
          'shop1':
              'Bạn là GAME THỦ? Bạn thường dùng laptop để render? Bạn thường xuyên dùng chiếc laptop của mình cày cuốc các tác vụ nặng , '
                  'bạn cần một chiếc máy luôn mát lạnh để phục vụ công việc hiệu quả hơn, ',
          'shop2': 'Được trang bị 2, 3 hoặc thậm chí là 4 quạt chuyên dụng, '
              'vị trí đặt quạt được thiết kế tiếp xúc chính xác với khe hút khí của máy, điều mà KHÔNG một hãng nào có thể làm được cho bạn. '
              'Với độ ồn gần như bằng 0 sẽ nâng cao năng suất làm việc của bạn lên tối đa mà không sợ nhiệt độ sẽ ảnh hưởng đến tuổi thọ của laptop.',
          'shop3':
              'Với chế độ bảo hành 1 năm đối với quạt và thay thế linh kiện với giá gốc trong suốt vòng đời sản phẩm, '
                  'bạn chỉ cần mua một lần và có thể sử dụng đến 5 năm, 10 năm tuỳ thích. Thật tuyệt phải không nào ^^! '
                  'Liên hệ ngay với chúng tôi để sở hữu chiếc ',
          'shop4': 'Tư vấn trực tiếp tại trang facebook: ',
          'shop5': ' hoặc số điện thoại: '
        },
      }[_locale];
}

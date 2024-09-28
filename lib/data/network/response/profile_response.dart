import 'package:html/parser.dart';
import 'package:masiro/misc/url.dart';

class ProfileResponse {
  int id;
  String name;
  int level;
  String avatar;
  int coinCount;
  int fanCount;

  ProfileResponse({
    required this.id,
    required this.name,
    required this.level,
    required this.avatar,
    required this.coinCount,
    required this.fanCount,
  });

  factory ProfileResponse.fromHtml(String html) {
    final document = parse(html);
    final querySelector = document.querySelector;
    final numberPattern = RegExp(r'\d+');
    final id = querySelector('li.user-header small small')
            ?.text
            .split(':')[1]
            .trim() ??
        '0';
    final name =
        querySelector('li.user-header p')?.firstChild?.text?.trim() ?? '';
    final level = querySelector('.user-lev')?.text.substring(2) ?? '0';
    final avatar = querySelector('img.user-image')?.attributes['src'];
    final coinNodeText =
        querySelector('li.user-header small')?.firstChild?.text ?? '';
    final coinCount =
        numberPattern.allMatches(coinNodeText).firstOrNull?.group(0) ?? '0';
    final fanCount =
        querySelector('span.fans')?.firstChild?.text?.trim() ?? '0';

    return ProfileResponse(
      id: int.parse(id),
      name: name,
      level: int.parse(level),
      avatar: avatar ?? MasiroUrl.defaultAvatar,
      coinCount: int.parse(coinCount),
      fanCount: int.parse(fanCount),
    );
  }
}

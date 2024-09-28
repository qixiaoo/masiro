import 'package:masiro/data/network/response/profile_response.dart';
import 'package:masiro/data/repository/model/profile.dart';

Profile profileResponseToProfile(ProfileResponse r) {
  return Profile(
    id: r.id,
    name: r.name,
    level: r.level,
    avatar: r.avatar,
    coinCount: r.coinCount,
    fanCount: r.fanCount,
  );
}

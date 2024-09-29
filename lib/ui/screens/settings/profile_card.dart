import 'package:flutter/material.dart';
import 'package:masiro/data/repository/model/profile.dart';
import 'package:masiro/misc/context.dart';
import 'package:masiro/misc/url.dart';
import 'package:masiro/ui/widgets/cached_image.dart';

const _placeholder = '-';

class ProfileCard extends StatelessWidget {
  final Profile? profile;

  const ProfileCard({super.key, this.profile});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme();
    final localizations = context.localizations();

    const avatarSize = 150.0;
    final avatar = profile?.avatar ?? MasiroUrl.defaultAvatar;
    final name = profile?.name ?? _placeholder;
    final level = profile?.level == null ? _placeholder : 'Lv${profile!.level}';
    final coin = '${localizations.coin}: ${profile?.coinCount ?? _placeholder}';
    final fan = '${localizations.fan}: ${profile?.fanCount ?? _placeholder}';
    final id = '${localizations.id}: ${profile?.id ?? _placeholder}';

    return Card(
      elevation: 0.0,
      color: colorScheme.surfaceContainer,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            ClipOval(
              child: CachedImage(
                width: avatarSize,
                height: avatarSize,
                url: avatar.toUrl(),
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(name),
                const SizedBox(width: 10),
                Badge(label: Text(level)),
              ],
            ),
            Wrap(
              spacing: 10,
              children: [
                Text(coin),
                Text(fan),
              ],
            ),
            SelectableText(id),
          ],
        ),
      ),
    );
  }
}

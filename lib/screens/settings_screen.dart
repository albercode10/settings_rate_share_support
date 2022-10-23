import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:settings_rate_share_support/models/setting_tile.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

void launchURL(String url) async {
  if (!await launchUrl(Uri.parse(url))) {
    throw 'Could not launch $url';
  }
}

class SettingsScreen extends StatelessWidget {
  final List<SettingTile> settingTiles = [
    SettingTile('Rate this app', Icons.star, Colors.amberAccent,
        () => InAppReview.instance.openStoreListing()),
    SettingTile('Share this app with friends', Icons.share, Colors.green,
        () => Share.share('Check out this amazing app')),
    SettingTile('Support me', Icons.pages, const Color(0xFF05c4e6),
        () => launchURL('https://albercode.es/')),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: settingTiles.length,
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      itemBuilder: (BuildContext context, int index) {
        final settingTile = settingTiles[index];
        return ListTile(
          title: Text(settingTile.title),
          trailing: Icon(
            settingTile.icon,
            color: settingTile.iconColor,
          ),
          onTap: settingTile.onTap,
        );
      },
    );
  }
}

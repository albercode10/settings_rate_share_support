import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:store_redirect/store_redirect.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatelessWidget {
  void _launchURL() async {
    const url = 'https://albercode.es/';
    (await canLaunch(url)) ? await launch(url) : throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text('Rate this app'),
            trailing: Icon(
              Icons.star,
              color: Colors.amberAccent,
            ),
            onTap: () {
              StoreRedirect.redirect();
            },
          ),
          Divider(),
          ListTile(
            title: Text('Share this app with friends'),
            trailing: Icon(
              Icons.share,
              color: Colors.green,
            ),
            onTap: () {
              Share.share('Check out this amazing app');
            },
          ),
          Divider(),
          ListTile(
            title: Text('Support me'),
            trailing: Icon(
              Icons.pages,
              color: Theme.of(context).accentColor,
            ),
            onTap: _launchURL,
          ),
          Divider(),
        ],
      ),
    );
  }
}

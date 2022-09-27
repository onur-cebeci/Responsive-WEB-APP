import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

class SocialIconWidget extends StatelessWidget {
  const SocialIconWidget({
    Key? key,
    required this.urlNetwork,
    required this.imageNetwork,
  }) : super(key: key);
  final String urlNetwork;
  final String imageNetwork;
  @override
  Widget build(BuildContext context) {
    return Link(
        target: LinkTarget.blank,
        uri: Uri.parse(urlNetwork),
        builder: (context, followLink) => InkWell(
              onTap: followLink,
              child: Image.network(
                imageNetwork,
                height: 20,
                width: 20,
              ),
            ));
  }
}

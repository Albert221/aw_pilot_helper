import 'package:aw_pilot_helper/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class AboutScreenRoute extends MaterialPageRoute<void> {
  AboutScreenRoute() : super(builder: (context) => const AboutScren());
}

class AboutScren extends StatelessWidget {
  const AboutScren({super.key});

  @override
  Widget build(BuildContext context) {
    final about = rootBundle.loadString('assets/about.md');

    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.about_title),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          FutureBuilder<String>(
            future: about,
            builder: (context, about) => Markdown(
              data: about.data ?? '',
              padding: const EdgeInsets.all(24),
              shrinkWrap: true,
              styleSheet: MarkdownStyleSheet(
                p: const TextStyle(height: 1.5),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.article),
            title: Text(context.l10n.about_licenses),
            onTap: () => showLicensePage(context: context),
          ),
        ],
      ),
    );
  }
}

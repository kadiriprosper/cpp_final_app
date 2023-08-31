import 'package:cpp_final_app/colors/colors.dart';
import 'package:cpp_final_app/views/coming_soon_page.dart';
import 'package:cpp_final_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:markdown/markdown.dart' as md;

class TutorialDetailPage extends StatefulWidget {
  const TutorialDetailPage({
    super.key,
    required this.pageTitle,
    required this.mdString,
  });

  final String pageTitle;
  final String mdString;

  @override
  State<TutorialDetailPage> createState() => _TutorialDetailPageState();
}

class _TutorialDetailPageState extends State<TutorialDetailPage> {
  final contentScrollController = Get.put(ScrollController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        hasLeading: true,
        title: widget.pageTitle.capitalize,
      ).build(context),
      body: FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString(widget.mdString),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MarkdownBody(
                      // controller: contentScrollController,
                      shrinkWrap: true,
                      selectable: true,
                      styleSheet: MarkdownStyleSheet(
                        code: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.black,
                        ),
                        h2: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: CustomColor.buttonColor1,
                        ),
                        h2Padding: const EdgeInsets.symmetric(vertical: 10),
                        h3Padding: const EdgeInsets.symmetric(vertical: 10),
                        h3: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                        p: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                        ),
                      ),
                      //TODO: Add spaces for the top
                      data: snapshot.data?.replaceAll('- ', '\n\n- ') ??
                          '', //widget.dataList['code']?.replaceAll('```', '') ,
                      extensionSet: md.ExtensionSet(
                        md.ExtensionSet.gitHubFlavored.blockSyntaxes,
                        <md.InlineSyntax>[
                          md.EmojiSyntax(),
                          ...md.ExtensionSet.gitHubFlavored.inlineSyntaxes
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.active) {
            return const Center(
              child: CircularProgressIndicator(
                color: CustomColor.buttonColor1,
                backgroundColor: CustomColor.caroselColor1,
              ),
            );
          } else {
            //TODO: Change this to an error page
            return const ComingSoonPage();
          }
        },
      ),
    );
  }
}

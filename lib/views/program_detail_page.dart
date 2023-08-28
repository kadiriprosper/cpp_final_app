import 'package:cpp_final_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:markdown/markdown.dart' as md;

class ProgramDetailPage extends StatefulWidget {
  const ProgramDetailPage({
    super.key,
    required this.pageTitle,
    required this.dataList,
  });

  final String pageTitle;
  final Map<String, String> dataList;

  @override
  State<ProgramDetailPage> createState() => _ProgramDetailPageState();
}

class _ProgramDetailPageState extends State<ProgramDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        hasLeading: true,
        title: widget.pageTitle,
      ).build(context),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Code',
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall
                        ?.copyWith(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    splashRadius: 22,
                    onPressed: () async {
                      //Copy the code to the clipboard

                      await Clipboard.setData(
                        ClipboardData(
                          text:
                              widget.dataList['code']?.replaceAll('```', '') ??
                                  '',
                        ),
                      ).then(
                        (value) => Get.showSnackbar(
                          const GetSnackBar(
                            // title: 'Copied!',
                            message: 'copied',
                            snackStyle: SnackStyle.FLOATING,
                            duration: Duration(seconds: 2),
                          ),
                        ),
                      );
                    },
                    tooltip: 'copy code',
                    icon: const Icon(Icons.copy),
                  ),
                ],
              ),
              Markdown(
                // controller: controller,
                shrinkWrap: true,
                selectable: true,
                styleSheet: MarkdownStyleSheet(
                  code: const TextStyle(
                    fontWeight: FontWeight.bold,

                  ),
                ),
                data: widget.dataList['code']?.replaceAll('```', '') ?? '',
                extensionSet: md.ExtensionSet(
                  md.ExtensionSet.gitHubFlavored.blockSyntaxes,
                  <md.InlineSyntax>[
                    md.EmojiSyntax(),
                    ...md.ExtensionSet.gitHubFlavored.inlineSyntaxes
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Output',
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall
                        ?.copyWith(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  // IconButton(
                  //   splashRadius: 22,
                  //   tooltip: 'run code',
                  //   onPressed: () {
                  //     //TODO: Program to run code
                  //   },
                  //   icon: const Icon(Icons.fast_forward_rounded),
                  // ),
                ],
              ),
              Markdown(
                // controller: controller,
                shrinkWrap: true,
                selectable: true,
                data: widget.dataList['output'] ?? '',

                extensionSet: md.ExtensionSet(
                  md.ExtensionSet.gitHubFlavored.blockSyntaxes,
                  <md.InlineSyntax>[
                    md.EmojiSyntax(),
                    ...md.ExtensionSet.gitHubFlavored.inlineSyntaxes
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

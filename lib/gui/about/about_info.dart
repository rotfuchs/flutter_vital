import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vital/config.dart';
import 'package:flutter_vital/gui/localization.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

class AboutInfo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(GuiLocalizations.of(context).trans('about')),
          actions: <Widget>[
          ],
        ),
        body: ListView(
            padding: EdgeInsets.fromLTRB(20, 25, 20, 0),
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: new BorderRadius.circular(100),
                    child: Image.asset(
                      "assets/images/fox_image.png",
                      height: 200,
                      width: 200,
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 25, 0, 2),
                    child: Text(
                      GuiLocalizations.of(context).trans('developer'),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22
                      ),
                    ),
                  ),
                  Text(developerName),

                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 25, 0, 2),
                    child: Text(
                      GuiLocalizations.of(context).trans('contact'),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22
                      ),
                    ),
                  ),
                  Text(contactMail),

                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 25, 0, 2),
                    child: Text(
                      GuiLocalizations.of(context).trans('license'),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22
                      ),
                    ),
                  ),
                  Text(appLicenseText),

                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 25, 0, 2),
                    child: Text(
                      GuiLocalizations.of(context).trans('source_code'),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22
                      ),
                    ),
                  ),
                  InkWell(
                    child: Text(
                        "https://github.com/rotfuchs/flutter_vital",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.blue
                        ),
                    ),
                    onTap: () async {
                        await launcher.launch("https://github.com/rotfuchs/flutter_vital");
                    },
                  )





                ],
              )
            ]
        )
    );
  }
}

class LinkTextSpan extends TextSpan {
  LinkTextSpan({TextStyle style, String url, String text})
      : super(
      style: style,
      text: text ?? url,
      recognizer: new TapGestureRecognizer()
        ..onTap = () => launcher.launch(url));
}
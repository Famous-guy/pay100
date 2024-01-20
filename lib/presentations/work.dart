import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';
import 'api_call.dart';

class pay100 extends StatefulWidget {
  @override
  _pay100State createState() => _pay100State();
}

class _pay100State extends State<pay100> {
  String displayedExpression = "";

 
  void _showWebviewModal(String url) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext bc) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.9,
          child: WebView(
            initialUrl: url,
            javascriptMode: JavascriptMode.unrestricted,
            navigationDelegate: (NavigationRequest request) {
              if (request.url.startsWith(url)) {
                return NavigationDecision.navigate;
              } else {
                launchURL(request.url);
                return NavigationDecision.prevent;
              }
            },
            onWebResourceError: (WebResourceError error) {
              print("Webview error: ${error.description}");
            },
          ),
        );
      },
    );
  }

  void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }

  String formatNumber(String s) {
    if (s.isEmpty) return "";
    return NumberFormat("#,###").format(int.tryParse(s.replaceAll(",", "")) ?? 0);
  }

  Widget buildCalculatorButtons() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Table(
        children: [
          TableRow(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 17),
                child: buildButton('1'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 17),
                child: buildButton('2'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 17),
                child: buildButton('3'),
              ),
            ],
          ),
          TableRow(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 17),
                child: buildButton('4'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 17),
                child: buildButton('5'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 17),
                child: buildButton('6'),
              ),
            ],
          ),
          TableRow(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 17),
                child: buildButton('7'),
              ),
             Padding(
                padding: const EdgeInsets.symmetric(vertical: 17),
                child: buildButton('8'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 17),
                child: buildButton('9'),
              ),
            ],
          ),
          TableRow(
            children: [
              Text(''),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: buildButton('0'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: buildButton('Del'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildButton(String buttonText) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromRGBO(1, 4, 54, 0.8),
          shape: CircleBorder(),
          padding: EdgeInsets.all(24)
        ),
        onPressed: () => onButtonPressed(buttonText),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  void onButtonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        displayedExpression = "";
      } else if (buttonText == 'Del') {
        if (displayedExpression.isNotEmpty) {
          displayedExpression = formatNumber(displayedExpression.substring(0, displayedExpression.length - 1));
        }
      } else {
        displayedExpression = formatNumber(displayedExpression + buttonText);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.bottomRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/100pay.png", width: 100,),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '₦ ', // Naira symbol
                            style: TextStyle(fontSize: 40.0, color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: displayedExpression,
                            style: TextStyle(fontSize: 40.0, color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(),
          SizedBox(
            height: 40,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 70, right: 70),
                child: buildCalculatorButtons(),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(40),
            child: SizedBox(
              height: 40,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (){
                  AppiCall.makePayment().then((value){
                    _showWebviewModal('https://pay.100pay.co/pay/65ab782a25c0b2003e84d4fc'); 
                  });
                }, // Call the API when the button is pressed
                child: Text(
                  "Proceed",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Colors.red,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

  
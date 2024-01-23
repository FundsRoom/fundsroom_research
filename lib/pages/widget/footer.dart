import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  Future<void> launch(String url) async {
    // use url_launcher package to launch the url
    final Uri uri = Uri.parse(url);
    try {
      await launchUrl(uri);
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color.fromRGBO(234, 245, 241, 1),
        width: MediaQuery.of(context).size.width,
        // height: 200,
        child: Wrap(
          alignment: WrapAlignment.spaceEvenly,
          runAlignment: WrapAlignment.start,
          children: [
            SizedBox(
              height: 200,
              width: 300,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () => launch('https://www.fundsroom.com/'),
                          child: SvgPicture.asset(
                            'assets/logo/app_logo.svg',
                            color: Theme.of(context).primaryColor,
                            width: 25,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          "Fundsroom",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                            onTap: () =>
                                launch('https://www.instagram.com/fundsroom'),
                            child: SvgPicture.asset('assets/logo/insta.svg',
                                width: 45)),
                        const SizedBox(width: 20),
                        GestureDetector(
                            onTap: () => launch(
                                'https://www.linkedin.com/company/fundsroom'),
                            child: SvgPicture.asset('assets/logo/linkedin.svg',
                                width: 45)),
                        const SizedBox(width: 20),
                        GestureDetector(
                            onTap: () => launch(
                                'https://youtube.com/@fundsroom?si=ESr642U2Vy-B_H9k'),
                            child: SvgPicture.asset('assets/logo/youtube.svg',
                                width: 45)),
                      ],
                    ),
                    const SizedBox(height: 12)
                  ],
                ),
              ),
            ),
            SizedBox(
              // color: Colors.green[100],
              height: 200,
              width: 300,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Who are we",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    urlText("About Us", "https://www.fundsroom.com/about-us"),
                    urlText("Partners", "https://www.fundsroom.com/about-us"),
                    urlText("Help and Support", "https://www.fundsroom.com/about-us"),
                  ],
                ),
              ),
            ),
            SizedBox(
              // color: Colors.green[100],
              height: 200,
              width: 300,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Resources",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    urlText("Funds Explore", "https://www.fundsroom.com/mutual-funds/explorer"),
                    urlText("Funds AMc's", "https://www.fundsroom.com/amc"),
                    urlText("Calculators", "https://www.fundsroom.com/calculators"),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 200,
              width: 500,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Terms and conditions",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    urlText("Privacy Policy", "https://www.fundsroom.com/privacy-policy"),
                    urlText("Terms of Use", "https://www.fundsroom.com/terms-of-use"),
                    urlText("Redemption, Refund & Cancellation Policy", "https://www.fundsroom.com/refund"),

                  ],
                ),
              ),
            ),
          ],
        ));
  }

  GestureDetector urlText(String text, String url) {
    return GestureDetector(
                    onTap: () => launch(url),
                    child: Text(text,
                        style: GoogleFonts.inter(
                          fontSize: 20,
                        )),
                  );
  }
}

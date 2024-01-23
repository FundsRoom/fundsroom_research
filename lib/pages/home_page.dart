import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widget/contact_us_widget.dart';
import 'widget/footer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            header(context),
            Expanded(
              child: ListView(
                children: [
                  body(context),
                  SizedBox(
                      height: 500,
                      child: Image.asset(
                          'assets/images/landing_fundsresearch.png')),
                  const ContactUpForm(),
                  // footer(context),
                  const Footer(),
                ],
              ),
            ),
          ],
        ),
      );

  Widget body(BuildContext context) => SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Welcome to Funds Research",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.merriweatherSans(
                    fontSize: 64,
                    fontWeight: FontWeight.bold,
                  )),
              //
              Text("Your Gateway to Financial Insights",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.merriweatherSans(
                    fontSize: 36,
                  )),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "Contact Us",
                        style: GoogleFonts.openSans(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Theme.of(context).primaryColor,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: BorderSide(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "About Us",
                        style: GoogleFonts.openSans(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                '''
      Stay tuned as we prepare to bring you real-time updates,\nfinancial data, and insights in a sleek and user-friendly interface.''',
                textAlign: TextAlign.center,
                style: GoogleFonts.merriweatherSans(
                  fontSize: 18,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.w300,
                ),
              )
            ],
          ),
        ),
      );

  // Widget footer(BuildContext context) => 

  Widget header(BuildContext context) => SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 100,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(width: 20),
            SvgPicture.asset(
              'assets/logo/app_logo.svg',
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(width: 10),
            const Text(
              "Fundsroom Research",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Text(
              "Home",
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 20,
                // fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 20),
            Text(
              "Contact Us",
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(width: 20),
          ],
        ),
      );
}

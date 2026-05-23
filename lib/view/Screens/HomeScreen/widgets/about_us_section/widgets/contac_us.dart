import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_likndin_website/core/Utils/responsive.dart';
import 'package:my_likndin_website/core/resources/colors.dart';
import 'package:my_likndin_website/core/resources/helpers/helpers.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  Widget contactItem({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: color.withOpacity(0.15),
            child: Icon(icon, color: color, size: 22),
          ),

          const SizedBox(width: 18),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(color: Colors.white70, fontSize: 13),
                ),

                const SizedBox(height: 4),

                Text(
                  value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;
    final screenHeight = context.screenHeight;

    final bool isMobile = screenWidth < 700;

    return Scaffold(
      backgroundColor: AppColors.secondaryColor,

      body: Stack(
        children: [
          /// BACKGROUND IMAGE
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'assets/images/contact_us.jpg',
              fit: BoxFit.cover,
              opacity: const AlwaysStoppedAnimation(0.12),
            ),
          ),

          /// DARK OVERLAY
          Container(color: Colors.black.withOpacity(0.65)),

          /// MAIN CONTENT
          Center(
            child: Container(
              width: isMobile ? screenWidth * 0.92 : 700,
              padding: const EdgeInsets.all(35),

              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.06),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.white.withOpacity(0.1)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 30,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),

              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    /// TITLE
                    Text(
                      "Contact Us",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: isMobile ? 30 : 50,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),

                    const SizedBox(height: 16),

                    /// SUBTITLE
                    Text(
                      "Let’s build something amazing together.\nFeel free to reach out anytime.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: isMobile ? 14 : 17,
                        height: 1.6,
                      ),
                    ),

                    const SizedBox(height: 40),

                    /// WHATSAPP
                    InkWell(
                      onTap: () {
                        Helpers.openUrl('https://wa.me/+923097079630');
                      },
                      child: contactItem(
                        icon: FontAwesomeIcons.whatsapp,
                        title: "WhatsApp",
                        value: "+923097079630",
                        color: Colors.green,
                      ),
                    ),

                    /// LINKEDIN
                    InkWell(
                      onTap: () {
                        Helpers.openUrl(
                          'https://www.linkedin.com/in/muhammad-akbar8236/',
                        );
                      },
                      child: contactItem(
                        icon: FontAwesomeIcons.linkedin,
                        title: "LinkedIn",
                        value: "linkedin.com/in/yourprofile",
                        color: Colors.lightBlueAccent,
                      ),
                    ),

                    /// PHONE
                    contactItem(
                      icon: Icons.phone_rounded,
                      title: "Phone Number",
                      value: "+923097079630",
                      color: Colors.greenAccent,
                    ),

                    /// EMAIL
                    contactItem(
                      icon: Icons.email_rounded,
                      title: "Email Address",
                      value: "your@email.com",
                      color: Colors.orangeAccent,
                    ),

                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:earth_eye_web/common/widgets/layout/templates/login_template_mobile.dart';
import 'package:earth_eye_web/features/auth/screens/Login/widgets/login_header.dart';
import 'package:earth_eye_web/utils/constants/sizes.dart';
import 'package:earth_eye_web/utils/constants/text_string.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SignupMobileScreen extends StatelessWidget {
  const SignupMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LoginTemplateMobile(
      child: Padding(
        padding: const EdgeInsets.all(UniSizes.defaultSpace),
        child: Column(
          children: [
            //header
            const FormHeader(
              title: UniTexts.signupTitle,
              subTitle: UniTexts.signupSubTitle,
            ),
            const SizedBox(height: UniSizes.spaceBtwSections),

            //form
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: "First Name",
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                ),
                const SizedBox(width: UniSizes.spaceBtwItems),
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Last Name",
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: UniSizes.spaceBtwInputFields),
            //email
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Email",
                prefixIcon: Icon(Iconsax.personalcard),
              ),
            ),

            const SizedBox(height: UniSizes.spaceBtwInputFields),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Phone Number",
                prefixIcon: Icon(Iconsax.mobile),
              ),
            ),

            const SizedBox(height: UniSizes.spaceBtwInputFields),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Location",
                prefixIcon: Icon(Iconsax.location),
              ),
            ),

            const SizedBox(height: UniSizes.spaceBtwSections),
            SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Text("Create Account"),
                ))
          ],
        ),
      ),
    );
  }
}

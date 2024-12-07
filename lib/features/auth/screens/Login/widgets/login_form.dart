import 'package:earth_eye_web/routes/route.dart';
import 'package:earth_eye_web/utils/constants/sizes.dart';
import 'package:earth_eye_web/utils/constants/text_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(vertical: UniSizes.spaceBtwInputFields),
      child: Column(
        children: [
          //Email
          TextFormField(
            decoration: const InputDecoration(
                labelText: UniTexts.email,
                prefixIcon: Icon(Iconsax.personalcard)),
          ),

          const SizedBox(height: UniSizes.spaceBtwInputFields),
          //Pasword
          TextFormField(
            decoration: InputDecoration(
                labelText: UniTexts.password,
                suffixIcon: IconButton(
                    icon: const Icon(Iconsax.eye_slash), onPressed: () {}),
                prefixIcon: const Icon(Iconsax.password_check)),
          ),
          const SizedBox(height: UniSizes.spaceBtwInputFields / 2),

          //Remember Me and Forget Password
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Check box and remember me
              Row(
                children: [
                  Checkbox(value: true, onChanged: (value) => {}),
                  Text(UniTexts.rememberMe,
                      style: Theme.of(context).textTheme.labelMedium),
                ],
              ),

              //Forget Password
              TextButton(
                  onPressed: () {}, child: const Text("Forget Password?"))
            ],
          ),
          const SizedBox(height: UniSizes.spaceBtwSections),
          //Login Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {}, child: const Text(UniTexts.signin)),
          ),
          const SizedBox(height: UniSizes.spaceBtwItems),
          SizedBox(
            width: double.infinity,
            child: TextButton(
                onPressed: () => Get.toNamed(UniRoutes.signup),
                child: const Text("Don't have an account? Create one.")),
          )
        ],
      ),
    );
  }
}

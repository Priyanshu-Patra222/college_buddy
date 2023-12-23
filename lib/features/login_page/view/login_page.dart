import 'package:auto_route/auto_route.dart';
import 'package:college_buddy/core/router/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoginView();
  }
}

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            LoginForm(),
          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Container(
          child: Column(
            children: [
              //* PROFILE PICTURE */
              "something in png/svg".text.make(),

              //* FORMS */
              const TextField(
                autofocus: true,
                keyboardType: TextInputType.text,
                style: TextStyle(fontSize: 15.0, color: Color(0xFFbdc6cf)),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.grey,
                  ),
                  labelText: 'Enter Roll Number',
                ),
              ).p12(),
              const TextField(
                autofocus: true,
                keyboardType: TextInputType.text,
                style: TextStyle(fontSize: 15.0, color: Color(0xFFbdc6cf)),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.mail,
                    color: Colors.grey,
                  ),
                  labelText: 'Enter Mail',
                ),
              ).p12(),
              const TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.password,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(),
                  labelText: 'Enter Password',
                ),
              ).p12(),
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                    // fontFamily: GoogleFonts.poppins().fontFamily,
                    color: Color(0xff6C63FF),
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ).p(1),

              //** BUTTON */
              ElevatedButton(
                onPressed: () {
                  context.navigateTo(const HomeRoute());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff6C63FF),
                  // maximumSize: const Size(200, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text(
                  'Sign in',
                  style: TextStyle(
                    // fontFamily: GoogleFonts.poppins().fontFamily,
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ).p12(),
              RichText(
                text: const TextSpan(
                    text: "Already have an account? ",
                    style: TextStyle(
                      // fontFamily: GoogleFonts.poppins().fontFamily,
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      TextSpan(
                        text: 'Sign Up',
                        style: TextStyle(
                          // fontFamily: GoogleFonts.poppins().fontFamily,
                          color: Color(0xff6C63FF),
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ]),
              ),
            ],
          ).p(12),
        ),
      ),
    );
  }
}

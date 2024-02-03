import 'package:auto_route/auto_route.dart';
import 'package:college_buddy/bootstrap.dart';
import 'package:college_buddy/const/color/app_colors.dart';
import 'package:college_buddy/const/resource.dart';
import 'package:college_buddy/core/router/router.gr.dart';
import 'package:college_buddy/features/login_page/const/login_form_keys.dart';
import 'package:college_buddy/features/login_page/controller/login_pod.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

@RoutePage(deferredLoading: true)
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoginView();
  }
}

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final _loginFormKey = GlobalKey<FormBuilderState>();

  void onSignin() {
    HapticFeedback.lightImpact();
    Feedback.forTap(context);
    if (_loginFormKey.currentState!.saveAndValidate()) {
      ref.read(loginProvider.notifier).signin(
            rollNo: _loginFormKey
                .currentState!.fields[LoginFormKeys.rollNumber]!.value
                .toString(),
            email: _loginFormKey
                .currentState!.fields[LoginFormKeys.email]!.value
                .toString(),
            password: _loginFormKey
                .currentState!.fields[LoginFormKeys.password]!.value
                .toString(),
            onUserLoggedIn: (loginModelResponse) {
              if (loginModelResponse.student.id.isNotEmpty) {
                talker.debug("msg: ${loginModelResponse.student.id}");
                context.router.replaceAll([const NavBarRoute()]);
              } else {
                context.router.replaceAll([const LoginRoute()]);
              }
            },
          );
    }
  }

  void passwordMsg() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Forgot Password',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          content: Text(
            'Contact with the department and collect your password.',
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FormBuilder(
          key: _loginFormKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(R.ASSETS_ICONS_COLLEGE_LOGO_PNG).h(150).w(150),
                Text(
                  "Srinix College Of Engineering",
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ).pOnly(top: 20, bottom: 10),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(15),
                      border:
                          Border.all(width: 1, color: Colors.grey.shade500)),
                  child: Column(
                    children: [
                      Text(
                        "Sign in to your account",
                        style: GoogleFonts.poppins(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ).pOnly(bottom: 20),
                      //roll-number
                      FormBuilderTextField(
                        name: LoginFormKeys.rollNumber,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        style: const TextStyle(
                          fontSize: 15.0,
                          color: AppColors.grey700,
                        ),
                        decoration: InputDecoration(
                          fillColor: Colors.grey[300],
                          border: const OutlineInputBorder(),
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.grey[500],
                          ),
                          labelText: 'Enter Roll Number',
                          labelStyle: GoogleFonts.poppins(
                            fontSize: 15,
                            color: Colors.grey[700],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        validator: FormBuilderValidators.compose(
                          [
                            FormBuilderValidators.required(),
                            FormBuilderValidators.match(
                                r'^[0-9]?[0-9][A-Z]{2}[0-9]?[0-9]$'),
                          ],
                        ),
                      ),
                      //email
                      FormBuilderTextField(
                        name: LoginFormKeys.email,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        style: const TextStyle(
                          fontSize: 15.0,
                          color: AppColors.grey700,
                        ),
                        decoration: InputDecoration(
                            fillColor: Colors.grey[300],
                            border: const OutlineInputBorder(),
                            prefixIcon: Icon(
                              Icons.mail,
                              color: Colors.grey[500],
                            ),
                            labelText: 'Enter Your Email',
                            labelStyle: GoogleFonts.poppins(
                              fontSize: 15,
                              color: Colors.grey[700],
                              fontWeight: FontWeight.w500,
                            )),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.email(),
                        ]),
                      ).py20(),
                      //password
                      FormBuilderTextField(
                        name: LoginFormKeys.password,
                        textInputAction: TextInputAction.done,
                        obscureText: true,
                        style: const TextStyle(
                          fontSize: 15.0,
                          color: AppColors.grey700,
                        ),
                        decoration: InputDecoration(
                            fillColor: Colors.grey[300],
                            prefixIcon: Icon(
                              Icons.password,
                              color: Colors.grey[500],
                            ),
                            border: const OutlineInputBorder(),
                            labelText: 'Enter Password',
                            labelStyle: GoogleFonts.poppins(
                              fontSize: 15,
                              color: Colors.grey[700],
                              fontWeight: FontWeight.w500,
                            )),
                        validator: FormBuilderValidators.compose(
                          [
                            FormBuilderValidators.required(),
                            FormBuilderValidators.minLength(6),
                          ],
                        ),
                      ),
                      10.heightBox,
                      GestureDetector(
                        onTap: () {
                          passwordMsg();
                        },
                        child: Text(
                          'Forgot Password?',
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.blue[700],
                          ),
                        ).objectCenterRight(),
                      ),
                      //sign-in-button
                      // SignInButton(
                      //   onSignin: onSignin,
                      // ).py20().w(350).h(90),
                      ElevatedButton(
                        onPressed: () {
                          onSignin();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff6C63FF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Sign in',
                          style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ).w(300).p8(),
                      RichText(
                          text: TextSpan(
                              text: "Don't have an account ?",
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                              children: [
                            TextSpan(
                              text: " Contact with your Dept.",
                              style: GoogleFonts.poppins(
                                  color: Colors.blue[700],
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            )
                          ])),
                    ],
                  ).p20(),
                ).p20().centered(),
              ],
            ).p12(),
          ),
        ),
      ),
    );
  }
}

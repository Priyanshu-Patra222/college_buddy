import 'package:auto_route/auto_route.dart';
import 'package:college_buddy/bootstrap.dart';
import 'package:college_buddy/const/color/app_colors.dart';
import 'package:college_buddy/const/resource.dart';
import 'package:college_buddy/core/router/router.gr.dart';
import 'package:college_buddy/features/login_page/const/login_form_keys.dart';
import 'package:college_buddy/features/login_page/controller/login_pod.dart';
import 'package:college_buddy/features/login_page/widget/sign_in_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
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
            rollNo: _loginFormKey.currentState!.fields[LoginFormKeys.rollNumber]!.value.toString(),
            email: _loginFormKey.currentState!.fields[LoginFormKeys.email]!.value.toString(),
            password: _loginFormKey.currentState!.fields[LoginFormKeys.password]!.value.toString(),
            onUserLoggedIn: (loginModelResponse)  {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FormBuilder(
          key: _loginFormKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                //star-svg
                SvgPicture.asset(R.ASSETS_ICONS_STAR_SVG).h(50).w(50).pOnly(bottom: 50),
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
                  ),
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(),
                      FormBuilderValidators.match(r'^[0-9]?[0-9][A-Z]{2}[0-9]?[0-9]$'),
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
                  ),
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
                  ),
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(),
                      FormBuilderValidators.minLength(6),
                    ],
                  ),
                ),
                10.heightBox,
                const Text(
                  'Forgot Password?',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.grey700,
                  ),
                ).objectCenterRight(),
                //sign-in-button
                SignInButton(
                  onSignin: onSignin,
                ).py20(),

                RichText(
                  text: const TextSpan(
                    text: "Already have an account? ",
                    style: TextStyle(
                      color: AppColors.grey700,
                      fontSize: 15,
                    ),
                    children: [
                      TextSpan(
                        text: 'Sign Up',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: AppColors.grey700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ).px16(),
          ),
        ),
      ),
    );
  }
}

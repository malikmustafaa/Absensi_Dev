import 'package:b7c_clean_architecture/features/logins/login/view/widgets/button.dart';
import 'package:b7c_clean_architecture/features/registers/register/view/register_view.dart';
import 'package:flutter/material.dart';
import 'package:b7c_clean_architecture/contants/color_style.dart';
import 'package:provider/provider.dart';
import '../view_model/login_view_model.dart';

class LoginPage extends StatefulWidget {
  static const routeName = "/LoginPage";

  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => LoginViewModel(),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    final provider = context.read<LoginViewModel>();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Image.asset(
                'assets/images/header_login.png',
              ),
            ),
            const Align(
              alignment: Alignment.center,
              child: Image(
                height: 100,
                image: AssetImage(
                  'assets/images/logo.png',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 20,
              ),
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Login',
                      style: TextStyle(
                          fontFamily: 'Ubuntu',
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Silahkan diisi',
                      style: accountStyle,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Consumer<LoginViewModel>(
                    builder: (context, providerLogin, child) {
                      return TextField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: textFieldStyle,
                        ),
                        // controller: email,
                        controller: providerLogin.controllerEmail,
                      );
                    },
                  ),
                  Consumer<LoginViewModel>(
                    builder: (context, providerLogin, child) {
                      return TextField(
                        autocorrect: false,
                        obscureText: obscureText,
                        decoration: InputDecoration(
                          labelText: 'Passwowrd',
                          labelStyle: textFieldStyle,
                          suffixIcon: IconButton(
                            icon: Icon(
                              obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              if (obscureText == true) {
                                obscureText = false;
                              } else {
                                obscureText = true;
                              }
                              setState(() {});
                            },
                          ),
                        ),
                        controller: providerLogin.controllerPassword,
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: ButtonLogin(
                      text: 'Login',
                      color: default2Color,
                      ontap: () {
                        provider.loginVM(context);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Belum punya akun? ",
                        style: accountStyle,
                      ),
                      SizedBox(
                        width: 60,
                        height: 18,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamedAndRemoveUntil(
                                context,
                                RegisterPage.routeName,
                                ModalRoute.withName('/'));
                          },
                          child: Text(
                            "Register",
                            style: registerStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

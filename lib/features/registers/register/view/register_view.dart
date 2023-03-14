import 'package:b7c_clean_architecture/contants/color_style.dart';
import 'package:b7c_clean_architecture/features/registers/register/view/widgets/button.dart';
import 'package:b7c_clean_architecture/features/registers/register/view_model/register_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../logins/login/view/login_view.dart';

class RegisterView extends StatefulWidget {
  static const routeName = "/RegisterView";

  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool obscureText = true;
  bool obscureText1 = true;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => RegisterViewModel(),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    final provider = context.read<RegisterViewModel>();
    return Scaffold(
      body: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: SingleChildScrollView(
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
                        'Register',
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
                    Consumer<RegisterViewModel>(
                      builder: (context, providerRegister, child) {
                        return TextField(
                          decoration: InputDecoration(
                            labelText: 'Full Name',
                            labelStyle: textFieldStyle,
                          ),
                          controller: providerRegister.controllerFullname,
                        );
                      },
                    ),
                    Consumer<RegisterViewModel>(
                      builder: (context, providerRegister, child) {
                        return TextField(
                          decoration: InputDecoration(
                            hintText: 'contoh: 12345',
                            labelText: 'Nis',
                            labelStyle: textFieldStyle,
                          ),
                          controller: providerRegister.controllerNoNis,
                        );
                      },
                    ),
                    Consumer<RegisterViewModel>(
                      builder: (context, providerRegister, child) {
                        return TextField(
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: textFieldStyle,
                          ),
                          controller: providerRegister.controllerEmail,
                        );
                      },
                    ),
                    Consumer<RegisterViewModel>(
                      builder: (context, providerRegister, child) {
                        return TextField(
                          autocorrect: false,
                          obscureText: obscureText,
                          decoration: InputDecoration(
                            labelText: 'Password',
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
                          controller: providerRegister.controllerPassword,
                        );
                      },
                    ),
                    Consumer<RegisterViewModel>(
                      builder: (context, providerRegister, child) {
                        return TextField(
                          autocorrect: false,
                          obscureText: obscureText1,
                          decoration: InputDecoration(
                            labelText: 'Konfirmasi Password',
                            labelStyle: textFieldStyle,
                            suffixIcon: IconButton(
                              icon: Icon(
                                obscureText1
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: () {
                                if (obscureText1 == true) {
                                  obscureText1 = false;
                                } else {
                                  obscureText1 = true;
                                }
                                setState(() {});
                              },
                            ),
                          ),
                          controller:
                              providerRegister.controllerconfirmPassword,
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                      ),
                      child: ButtonRegister(
                        text: 'Register',
                        color: default2Color,
                        ontap: () {
                          provider.registerVM(context);
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
                          "Sudah punya akun? ",
                          style: accountStyle,
                        ),
                        SizedBox(
                          width: 50,
                          height: 18,
                          // color: Colors.black,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  LoginView.routeName,
                                  ModalRoute.withName('/'));
                            },
                            child: Text(
                              "Login",
                              style: loginStyle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

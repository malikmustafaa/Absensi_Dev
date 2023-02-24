import 'package:b7c_clean_architecture/features/logins/login/view/login_view.dart';
import 'package:b7c_clean_architecture/features/splashs/splash/view_model/splash_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../homes/beranda/view/home_view.dart';

class SplashPage extends StatefulWidget {
  static const routeName = "/SplashPage";

  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool isLogin = false;
  late SharedPreferences pref;
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        isLoading();
      },
    );
  }

  isLoading() async {
    pref = await SharedPreferences.getInstance();
    isLogin = pref.getBool("isLogin") ?? false;
    if (isLogin) {
      // ignore: use_build_context_synchronously
      // ignore: use_build_context_synchronously
      Navigator.pushNamedAndRemoveUntil(
          context, HomePage.routeName, ModalRoute.withName('/'));
    } else {
      // ignore: use_build_context_synchronously
      Navigator.pushNamedAndRemoveUntil(
          context, LoginPage.routeName, ModalRoute.withName('/'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => SplashViewModel(),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          const BackGround(),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/logo.png',
                      height: 140,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'SMKN 1 LHOKSEUMAWE',
                      style: TextStyle(
                          fontFamily: 'Ubuntu',
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class BackGround extends StatelessWidget {
  const BackGround({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        gambar1(),
        Expanded(
          child: Container(),
        ),
        gambar2(),
      ],
    );
  }

  Widget gambar1() {
    return Stack(
      children: const [
        Align(
          alignment: Alignment.topRight,
          child: Image(
              image: AssetImage(
            'assets/images/header_splash.png',
          )),
        ),
      ],
    );
  }

  Widget gambar2() {
    return Stack(
      children: const [
        Align(
          alignment: Alignment.bottomLeft,
          child: RotatedBox(
            quarterTurns: 2,
            child: Image(
                image: AssetImage(
              'assets/images/header_splash.png',
            )),
          ),
        ),
      ],
    );
  }
}

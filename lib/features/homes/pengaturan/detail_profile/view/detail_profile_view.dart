import 'package:b7c_clean_architecture/contants/color_style.dart';
import 'package:b7c_clean_architecture/features/homes/home_view.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailProfilePage extends StatefulWidget {
  static const routeName = "/DetailProfilePage";
  const DetailProfilePage({Key? key}) : super(key: key);

  @override
  State<DetailProfilePage> createState() => _DetailProfilePageState();
}

class _DetailProfilePageState extends State<DetailProfilePage> {
  late SharedPreferences pref;

  String fullname = '';

  String email = '';

  String noNis = '';

  String username = '';

  @override
  void initState() {
    getDataPref();
    super.initState();
  }

  getDataPref() async {
    pref = await SharedPreferences.getInstance();

    fullname = pref.getString('fullname') ?? "";
    email = pref.getString('email') ?? "";
    noNis = pref.getString('noNis') ?? "";
    username = pref.getString('username') ?? "";
    setState(() {
      fullname = fullname;
      email = email;
      noNis = noNis;
      username = username;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: default2Color,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
                onPressed: () {
                  int index = 2;

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => HomePage(
                        indexPengaturan: index,
                      ),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.arrow_back,
                )),
            const Text(
              'Detail Profile',
              style: TextStyle(
                  color: whiteColor,
                  fontFamily: 'Ubuntu',
                  fontSize: 22,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                backgroundColor: default2Color,
                radius: 30,
                backgroundImage: AssetImage('assets/images/orang.png'),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'FULLNAME  : $fullname\nEMAIL           : $email\nNIS                 : $noNis',
                      style: textEmailDetailProfileStyle,
                    ),
                    Text(
                      '',
                      style: textEmailDetailProfileStyle,
                    ),
                    Text(
                      '',
                      style: textEmailDetailProfileStyle,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

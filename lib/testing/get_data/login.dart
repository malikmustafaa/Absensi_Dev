// import 'package:b7c_clean_architecture/testing/get_data/get_data_siswa.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class Login extends StatefulWidget {
//   @override
//   _LoginState createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   // Create a text controller and use it to retrieve the current value
//   // of the TextField.
//   final username_controller = TextEditingController();
//   final password_controller = TextEditingController();
//   late SharedPreferences logindata;
//   bool newuser = false;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     check_if_already_login();
//   }

//   void check_if_already_login() async {
//     logindata = await SharedPreferences.getInstance();
//     newuser = (logindata.getBool('login') ?? true);
//     print(newuser);
//     if (newuser == false) {
//       Navigator.pushReplacement(
//           context, MaterialPageRoute(builder: (context) => GetDataSiswa()));
//     }
//   }

//   @override
//   void dispose() {
//     // Clean up the controller when the widget is disposed.
//     username_controller.dispose();
//     password_controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(" Shared Preferences"),
//       ),
//       body: Center(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               "Login Form",
//               style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//             ),
//             Text(
//               "To show Example of Shared Preferences",
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: TextField(
//                 controller: username_controller,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   labelText: 'username',
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: TextField(
//                 controller: password_controller,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   labelText: 'Password',
//                 ),
//               ),
//             ),
//             RaisedButton(
//               textColor: Colors.white,
//               color: Colors.blue,
//               onPressed: () {
//                 String username = username_controller.text;
//                 String password = password_controller.text;
//                 if (username != '' && password != '') {
//                   print('Successfull');
//                   logindata.setBool('login', false);
//                   logindata.setString('username', username);
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => const GetDataSiswa()));
//                 }
//               },
//               child: Text("Log-In"),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

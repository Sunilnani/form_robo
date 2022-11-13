import 'package:flutter/material.dart';
import 'package:form_robo/components/buttons.dart';
import 'package:form_robo/components/navigation_service.dart';
import 'package:form_robo/components/text_form_fields.dart';
import 'package:form_robo/screens/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool showPassword = false;

  // bool _loading = false;
  // Future<void> _checkLogin() async {
  //   final Map<String, dynamic> data = {
  //     "username": _usernameController.text.trim(),
  //     "password": _passwordController.text.trim(),
  //   };
  //
  //   print(data);
  //
  //   setState(() {
  //     _loading = true;
  //   });
  //
  //   final response = await authManager.performLogin(data);
  //
  //   if (response.status == ResponseStatus.SUCCESS) {
  //     // ToastUtils().showToast(response.message);
  //     Fluttertoast.showToast(msg: response.message);
  //
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     final isLoggedIn = prefs.setBool('isLoggedIn', true);
  //     final token = response.data["access"];
  //     final refresh = response.data["refresh"];
  //     final username = response.data["username"] ?? "";
  //     final firstName = response.data["first_name"] ?? "";
  //     final lastName = response.data["last_name"] ?? "";
  //     prefs.setString(StorageKeys.token, token);
  //     prefs.setString(StorageKeys.refreshToken, refresh);
  //     prefs.setString(StorageKeys.userName, username);
  //     prefs.setString(StorageKeys.firstName, firstName);
  //     prefs.setString(StorageKeys.lastName, lastName);
  //
  //     // NavigationService().navigateTo(MaterialPageRoute(builder: (context) => const HomePage()),replaceAll: true);
  //     NavigationService().navigateTo(MaterialPageRoute(builder: (context) => const HomeBasePage()),replaceAll: true);
  //   } else {
  //     Fluttertoast.showToast(msg: response.message);
  //
  //     print("---------------------00000000000000000${response.status}");
  //     print("---------------------****${response.message}");
  //   }
  //
  //   setState(() {
  //     _loading = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 100,
                    child: Image(
                      image: AssetImage(
                        'assets/images/Logo.png',
                      ),
                    ),
                  ),




                  Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          AppTextFormField(
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return "Please enter User Name";
                                }
                                return null;
                              },
                              controller: _usernameController,
                              title: "Drone ID",
                              suffixIcon: Icons.person),
                          AppTextFormField(
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return "Please enter Password";
                              }
                              return null;
                            },
                            title: "Password",
                            controller: _passwordController,
                            obscureText: !showPassword,
                            suffixIcon: showPassword ? Icons.visibility : Icons.visibility_off,
                            suffixIconOnTap: () {
                              setState(() {
                                showPassword = !showPassword;
                              });
                            },
                          ),
                         // const SizedBox(height: 20),
                          // InkWell(
                          //     onTap: () {
                          //      // NavigationService().navigatePage(const PassedOutRegistrationBasePage());
                          //     },
                          //     child:  Text(
                          //       "Finishing School Graduates Registration",
                          //       style: TextStyle(color: Theme.of(context).secondaryHeaderColor, fontWeight: FontWeight.w500),
                          //       textAlign: TextAlign.right,
                          //     )),
                          const SizedBox(height: 50),




                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 170),
                            child: AppElevatedButton(
                              title: "LOGIN",
                              onPress: () async {
                                if (_formKey.currentState!.validate()) {
                                 // _checkLogin();
                                  NavigationService().navigatePage(const HomePage());
                                  // performLogin(username: _usernameController.text.trim(), password:  _passwordController.text.trim());

                                }
                                // else {
                                //   showDialog(
                                //     context: context,
                                //     builder: (context) {
                                //       return AppAlertDialog(
                                //           image: "success.png",
                                //           description:
                                //           "You Ended Overall Production for the day & sent Batches to Inventory OUT",
                                //           buttonTitle: "Nice ✌️",
                                //           onPress: () => Navigator.pop(context));
                                //     },
                                //   );
                                // }
                              },
                            ),
                          ),

                        ],
                      )),
                  // AppElevatedButton(
                  //   title: "Bottom Nav",
                  //   onPress: () => openBottomSheet(context),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
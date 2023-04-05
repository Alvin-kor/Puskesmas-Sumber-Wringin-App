import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_pkm_sw/services/auth.dart';
import 'package:flutter_pkm_sw/widgets/rounded_input.dart';
import 'package:get/get.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});
  final _auth = Get.find<AuthServices>();

  @override
  Widget build(BuildContext context) {
    final isMobileWidth = MediaQuery.of(context).size.width < 500;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text(isMobileWidth
            ? 'PKMSW - Sign In'
            : 'Puskesmas Sumber Wringin - Sign In'),
      ),
      body: SafeArea(
        child: Container(
          alignment: Alignment.topCenter,
          margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Container(
            alignment: Alignment.center,
            height: isMobileWidth
                ? MediaQuery.of(context).size.height * 0.35
                : 300.0,
            width: isMobileWidth
                ? MediaQuery.of(context).size.width * 0.8
                : MediaQuery.of(context).size.width * 0.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              elevation: 4.0,
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                          vertical: isMobileWidth ? 2.0 : 10.0,
                          horizontal: isMobileWidth ? 2.0 : 5.0),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20.0))),
                      child: Text(
                        'Welcome to Sumber Wringin App',
                        style: TextStyle(
                            fontSize: isMobileWidth ? 14.0 : 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: isMobileWidth ? 20.0 : 35.0,
                            horizontal: isMobileWidth ? 25.0 : 40.0),
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 255, 255, 248)),
                        child: Obx(() => AnimatedCrossFade(
                            crossFadeState: _auth.switchField.value
                                ? CrossFadeState.showSecond
                                : CrossFadeState.showFirst,
                            duration: const Duration(milliseconds: 500),
                            firstChild: RoundedInput(
                              password: false,
                              autoFocus: false,
                              hintText: 'Username...',
                              controller: _auth.usernameEditController,
                              onChange: (value) {
                                _auth.updateValue('username', value);
                              },
                            ),
                            secondChild: RoundedInput(
                              password: true,
                              autoFocus: true,
                              hintText: 'Password...',
                              controller: _auth.passwordEditController,
                              onChange: (value) {
                                _auth.updateValue('password', value);
                              },
                            )))),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(20.0))),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.tertiary,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    bottom: Radius.circular(20.0))),
                            minimumSize: const Size.fromHeight(10)),
                        onPressed: () {
                          _auth.username.isEmpty
                              ? _auth.signIn('Anonymous')
                              : _auth.username.isNotEmpty &&
                                      _auth.password.isEmpty
                                  ? _auth.signIn("Next")
                                  : _auth.signIn('User');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.login,
                              color: Theme.of(context).colorScheme.background,
                            ),
                            const SizedBox(width: 10.0),
                            Obx(() => Flexible(
                                    child: Text(
                                  _auth.username.isEmpty
                                      ? isMobileWidth
                                          ? 'Login As Anonymous'
                                          : 'Login to App As Anonymous'
                                      : _auth.password.isEmpty &&
                                              _auth.switchField.value != true
                                          ? 'Next'
                                          : isMobileWidth
                                              ? 'Login As User'
                                              : 'Login to App As User',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background),
                                ))),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomSheet: Container(
        color: Theme.of(context).colorScheme.background,
        height: MediaQuery.of(context).size.height * 0.1,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Copyright @${DateTime.now().year} All Rights Reserved',
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 5.0),
            const Text('Powered by Nekopara',
                style: TextStyle(fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }
}

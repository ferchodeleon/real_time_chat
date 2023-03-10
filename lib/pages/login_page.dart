import 'package:flutter/material.dart';
import 'package:flutter_real_time_chat/widgets/Labels.dart';
import 'package:flutter_real_time_chat/widgets/Logo.dart';
import 'package:flutter_real_time_chat/widgets/custom_input.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f2f2),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Logo(),
              _Form(),
              Labels(),
              Text(
                'Terminos y condiciones de uso',
                style: TextStyle(fontWeight: FontWeight.w200),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Form extends StatefulWidget {
  const _Form();

  @override
  State<_Form> createState() => __FormState();
}

class __FormState extends State<_Form> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          CustomInput(
            icon: Icons.mail_outline,
            placeHolder: 'Correo',
            keyboardType: TextInputType.emailAddress,
            textController: emailCtrl,
          ),
          CustomInput(
            icon: Icons.lock_outline,
            placeHolder: 'Contraseña',
            isPassword: true,
            keyboardType: TextInputType.visiblePassword,
            textController: passCtrl,
          ),
          //TODO: Crear botón

          ElevatedButton(
            onPressed: () {
              print(emailCtrl.text);
              print(passCtrl.text);
            },
            child: const Text('Ingresar'),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pozitolk/core/extension/context_extension.dart';
import 'package:pozitolk/core/extension/num_extension.dart';
import 'package:pozitolk/pages/login/view_model/login_view_model.dart';
import 'package:provider/provider.dart';

class ConfirmPage extends StatefulWidget {
  const ConfirmPage({super.key});
  // final LoginType loginType;
  @override
  State<ConfirmPage> createState() => _ConfirmPageState();
}

class _ConfirmPageState extends State<ConfirmPage> {
  late LoginViewModel loginViewModel;
  final List<TextEditingController> _controllers =
      List.generate(6, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());
  List<bool> isFocus = List.generate(6, (index) => false);

  @override
  void initState() {
    loginViewModel = context.read<LoginViewModel>();
    _focusNodes[0].requestFocus();
    isFocus[0] = true;
    super.initState();
  }

  @override
  void dispose() {
    for (var controllers in _controllers) {
      controllers.dispose();
    }
    for (var focusNodes in _focusNodes) {
      focusNodes.dispose();
    }
    super.dispose();
  } // foydasini sezmadim

  void _onChanged(String value, int index) {
    bool hasEmpty = _controllers.any((controller) => controller.text.isEmpty);

    if (!hasEmpty) {
      String code = '';
      for (var i = 0; i < 6; i++) {
        code += _controllers[i].text;
        loginViewModel.confirmCode = code.toString();
      }
      loginViewModel.confirm(context);
    }

    setState(() {});
    String text = value;
    if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
      isFocus = List.generate(6, (index) => false);
      isFocus[index - 1] = true;
    } else if (value.length == 1 && index < _controllers.length - 1) {
      _focusNodes[index + 1].requestFocus();
      isFocus = List.generate(6, (index) => false);
      isFocus[index + 1] = true;
    }
    if (value.length != 1) {
      if (value.length == 7) _controllers[index].text = '';
      text.split('').forEach((element) {
        if (value.length == 6) {
          _controllers[0].text = value.split('')[0];
          _controllers[1].text = value.split('')[1];
          _controllers[2].text = value.split('')[2];
          _controllers[3].text = value.split('')[3];
          _controllers[4].text = value.split('')[4];
          _controllers[5].text = value.split('')[5];
          _focusNodes[5].requestFocus();
        }
        if (value.length == 7) {
          _controllers[0].text = value.split('')[1];
          _controllers[1].text = value.split('')[2];
          _controllers[2].text = value.split('')[3];
          _controllers[3].text = value.split('')[4];
          _controllers[4].text = value.split('')[6];
          _controllers[5].text = value.split('')[6];
          _focusNodes[5].requestFocus();
        }
        if (element == value.split('')[1]) {
          _controllers[index].text = value.split('')[1];
          if (index != 5) {
            _focusNodes[index + 1].requestFocus();
          }
        }
        // 1234567
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final watch = context.watch<LoginViewModel>();
    return Scaffold(
      backgroundColor: Colors.transparent,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   title: Text(
      //     'Регистрация',
      //     style: context.textStyle.s20w500inter,
      //   ),
      // ),
      body: Center(
        child: SizedBox(
          width: 0.91.wp(context),
          height: 50,
          child: KeyboardListener(
            onKeyEvent: (event) {
              if (event is KeyDownEvent &&
                  event.logicalKey == LogicalKeyboardKey.backspace) {
                for (int i = 0; i < _focusNodes.length; i++) {
                  if (_focusNodes[i].hasFocus) {
                    if (_controllers[i].text.isEmpty && i != 0) {
                      FocusScope.of(context).requestFocus(_focusNodes[i - 1]);
                    }
                  }
                }
              }
              // final currentFocusIndex = _focusNodes.indexOf(FocusNode());
              // Bu yerda biron narsa qilinmaydi
            },
            focusNode: FocusNode(),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 6,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                // this.index = index;
                return Row(
                  children: [
                    Container(
                      clipBehavior: Clip.hardEdge,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: context.color.containerBackgroundF4,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      width: 0.134.wp(context),
                      height: 50,
                      child: TextField(
                        textAlign: TextAlign.center,
                        onTap: () {
                          isFocus = List.generate(6, (index) => false);
                          isFocus[index] = true;
                          setState(() {});
                        },
                        onChanged: (value) {
                          _onChanged(value, index);
                          if (kDebugMode) {
                            print('kkk  $index');
                          }
                        },
                        style: context.textStyle.s20w500inter.copyWith(
                          color: context.color.textGrey2,
                        ),
                        focusNode: _focusNodes[index],
                        controller: _controllers[index],
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          fillColor: Colors.transparent,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: watch.isConfirmError ? context.color.error : Colors.transparent,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: watch.isConfirmError ? context.color.error : Colors.transparent,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: watch.isConfirmError ? context.color.error : Colors.transparent,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          hintText: isFocus[index] ? '' : '•',
                          hintStyle: const TextStyle(
                            color: Color(0xFFBABABA),
                            fontSize: 20,
                            height: 0.5,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 0.02.wp(context),
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

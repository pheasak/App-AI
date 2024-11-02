import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class ChatWidget {
  Widget textMessage(
      {required String text, required bool isUser, bool isLoading = false}) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10, top: 10),
        child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: isUser
                    ? const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15))
                    : const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15)),
                color: isUser
                    ? const Color.fromARGB(255, 74, 173, 255)
                    : const Color.fromARGB(255, 198, 198, 198)),
            child: isUser
                ? Text(
                    text,
                    style:
                        TextStyle(color: isUser ? Colors.white : Colors.black),
                  )
                : AnimatedTextKit(
                    isRepeatingAnimation: false,
                    // onFinished: () {
                    //   ChatController().scrollText();
                    //   print('Finished');
                    // },
                    displayFullTextOnTap: true,
                    repeatForever: false,
                    totalRepeatCount: 1,
                    animatedTexts: [
                        TyperAnimatedText(
                          text,
                          speed: const Duration(milliseconds: 10),
                        )
                      ])),
      ),
    );
  }
}

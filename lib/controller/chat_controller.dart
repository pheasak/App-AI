import 'package:chatai/model/message_model.dart';
import 'package:chatai/util/constance/constance.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class ChatController extends GetxController {
  late TextEditingController textMessageController;
  late List<MessageModel> message;
  ScrollController scrollController = ScrollController();
  bool isLoading = false;
  @override
  void onInit() {
    super.onInit();
    textMessageController = TextEditingController();
    // scrollController = ScrollController();
    message = [];
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  void scrollText() {
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 100), curve: Curves.easeOut);
  }

  Future responseText() async {
    try {
      isLoading = true;
      // message.add(MessageModel(isUser: false, text: 'Typing.....'));
      final model = GenerativeModel(model: 'gemini-1.5-flash', apiKey: apikey);
      final prompt = textMessageController.text.toString();
      final content = [Content.text(prompt)];
      final response = await model.generateContent(content);

      if (response.text!.isNotEmpty || response.text != null) {
        // message.removeLast();
        update();
        isLoading = false;
        message.add(MessageModel(isUser: false, text: response.text));
        update();
      } else {
        message.add(MessageModel(isUser: false, text: 'Sorry'));
      }
      print(response.text);
    } catch (e) {
      print(e);
    }
  }
}

import 'package:chatai/controller/chat_controller.dart';
import 'package:chatai/model/message_model.dart';
import 'package:chatai/view/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';

class HomePage extends GetView<ChatController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChatController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 7, 214, 255),
        title: const Text('Chat Bot'),
      ),
      body: GetBuilder<ChatController>(
        init: controller,
        builder: (controller) {
          return Column(
            // mainAxisAlignment: ,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  controller: controller.scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      for (MessageModel model in controller.message)
                        ChatWidget().textMessage(
                            isLoading: controller.isLoading,
                            isUser: model.isUser!,
                            text: model.text ?? '')
                    ],
                  ),
                ),
              ),
              if (controller.isLoading)
                Container(
                  margin: EdgeInsets.only(top: 5),
                  width: 25,
                  color: Colors.transparent,
                  child: const LoadingIndicator(
                    indicatorType: Indicator.ballPulse,

                    /// Required, The loading type of the widget
                    colors: [Color.fromARGB(255, 109, 109, 109)],
                  ),
                ),
              Container(
                margin: EdgeInsets.only(top: 10),
                color: Colors.amber,
                child: Row(
                  children: [
                    SizedBox(
                      width: 360,
                      child: TextFormField(
                        controller: controller.textMessageController,
                        minLines: 1,
                        maxLines: 3,
                        decoration: InputDecoration(
                            hintText: 'write a text',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                    width: 1, style: BorderStyle.solid))),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          if (controller
                              .textMessageController.text.isNotEmpty) {
                            controller.message.add(MessageModel(
                                isUser: true,
                                text: controller.textMessageController.text));
                            controller.update();
                            controller.responseText();
                          }
                          controller.scrollText();
                          controller.textMessageController.clear();
                        },
                        icon: Icon(Icons.send)),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

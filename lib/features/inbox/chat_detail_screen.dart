import 'package:flutter/material.dart';
import 'package:flutter_tiktok/constants/gaps.dart';
import 'package:flutter_tiktok/constants/sizes.dart';
import 'package:flutter_tiktok/utils.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChatDetailScreen extends StatefulWidget {
  static const String routeName = "chatDetail";
  static const String routeURL = ":chatId";

  final String chatId;

  const ChatDetailScreen({
    super.key,
    required this.chatId,
  });

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreen();
}

class _ChatDetailScreen extends State<ChatDetailScreen> {
  final TextEditingController _textEditingController = TextEditingController();

  String _submitchat = "";

  @override
  void initState() {
    super.initState();
    _textEditingController.addListener(() {
      setState(() {
        _submitchat = _textEditingController.text;
      });
    });
  }

  void _onChatSubmitted() {
    if (_submitchat != "") {
      print(_submitchat);
      _textEditingController.clear();
      _onStopChat();
    }
  }

  void _onStopChat() {
    FocusScope.of(context).unfocus();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*backgroundColor: Colors.grey.shade100,*/
      appBar: AppBar(
        /*backgroundColor: Colors.grey.shade100,*/
        title: ListTile(
          contentPadding: EdgeInsets.zero,
          horizontalTitleGap: Sizes.size8,
          leading: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              const CircleAvatar(
                radius: Sizes.size24,
                foregroundImage: AssetImage("assets/images/jamin.jpg"),
                /*child: Text("pengsoo"),*/
              ),
              SizedBox(
                height: Sizes.size16,
                child: Container(
                  width: Sizes.size16,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: const Center(
                    child: FaIcon(
                      FontAwesomeIcons.solidCircle,
                      color: Colors.green,
                      size: Sizes.size10,
                    ),
                  ),
                ),
              ),
            ],
          ),
          title: Text(
            "pengsoo (${widget.chatId})",
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: const Text("Active now"),
          trailing: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(
                FontAwesomeIcons.flag,
                color: Colors.black,
                size: Sizes.size20,
              ),
              Gaps.h32,
              FaIcon(
                FontAwesomeIcons.ellipsis,
                color: Colors.black,
                size: Sizes.size20,
              ),
            ],
          ),
        ),
      ),
      body: GestureDetector(
        onTap: _onStopChat,
        child: Stack(
          children: [
            ListView.separated(
                padding: const EdgeInsets.symmetric(
                  vertical: Sizes.size20,
                  horizontal: Sizes.size14,
                ),
                itemBuilder: (context, index) {
                  final isMine = index % 2 == 0;
                  return Row(
                    mainAxisAlignment: isMine
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(Sizes.size14),
                        decoration: BoxDecoration(
                          color: isMine
                              ? Colors.blue
                              : Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(Sizes.size20),
                            topRight: const Radius.circular(Sizes.size20),
                            bottomLeft: Radius.circular(
                                isMine ? Sizes.size20 : Sizes.size2),
                            bottomRight: Radius.circular(
                                !isMine ? Sizes.size20 : Sizes.size2),
                          ),
                        ),
                        child: const Text(
                          "this is a message!",
                          style: TextStyle(
                              color: Colors.white, fontSize: Sizes.size16),
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) => Gaps.v10,
                itemCount: 10),
            Positioned(
              bottom: 0,
              width: MediaQuery.of(context).size.width,
              child: Container(
                color:
                    isDarkMode(context) ? Colors.black : Colors.grey.shade100,
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(Sizes.size10),
                        child: SizedBox(
                          height: Sizes.size44,
                          child: TextField(
                            controller: _textEditingController,
                            expands: true,
                            minLines: null,
                            maxLines: null,
                            textInputAction: TextInputAction.newline,
                            decoration: const InputDecoration(
                              hintText: "Send a message...",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(Sizes.size24),
                                  topRight: Radius.circular(Sizes.size24),
                                  bottomLeft: Radius.circular(Sizes.size24),
                                ),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding:
                                  EdgeInsets.only(left: Sizes.size16),
                              suffixIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.faceSmile,
                                    color: Colors.black,
                                    size: Sizes.size24,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: _onChatSubmitted,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: Sizes.size10,
                              color: _submitchat.isNotEmpty
                                  ? Colors.blue
                                  : Colors.grey.shade300,
                            ),
                            shape: BoxShape.circle,
                            color: _submitchat.isNotEmpty
                                ? Colors.blue
                                : Colors.grey.shade300),
                        child: FaIcon(
                          _submitchat.isNotEmpty
                              ? FontAwesomeIcons.paperPlane
                              : FontAwesomeIcons.solidPaperPlane,
                          color: Colors.white,
                          size: Sizes.size20,
                        ),
                      ),
                    ),
                    Gaps.h10
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:io';

import 'package:chat_app/model/chat_model.dart';
import 'package:chat_app/screens/camera/camera_screen.dart';
import 'package:chat_app/screens/camera/view/camera_view.dart';
import 'package:chat_app/screens/custom_ui/ownfile_cart.dart';
import 'package:chat_app/widget/own_message.dart';
import 'package:chat_app/widget/reply_message.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../model/message_model.dart';
import '../../widget/icon_creation.dart';
import '../constents.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../custom_ui/replyfile_card.dart';

class IndividiualPage extends StatefulWidget {
  const IndividiualPage(
      {Key? key, required this.chatModel, required this.sourceChat})
      : super(key: key);
  final ChatModel chatModel;
  final ChatModel sourceChat;

  @override
  State<IndividiualPage> createState() => _IndividiualPageState();
}

class _IndividiualPageState extends State<IndividiualPage> {
  final TextEditingController _controller = TextEditingController();
  bool emojiShowing = false;
  FocusNode focusNode = FocusNode();
  late IO.Socket socket;
  List<MessageModel> messages = [];
  final ScrollController _scrollController = ScrollController();
  final ImagePicker _picker = ImagePicker();
  late XFile? file;

  _onEmojiSelected(Emoji emoji) {
    print('_onEmojiSelected: ${emoji.emoji}');
  }

  _onBackspacePressed() {
    print('_onBackspacePressed');
  }

  void connect() {
    late String url;
    url = 'http://192.168.1.10:5000';
    // url = 'http://13.235.43.4:5000';
    socket = IO.io(url, <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });
    socket.connect();
    socket.emit('signin', widget.sourceChat.id);
    socket.onConnect((data) {
      print("Connected");
      socket.on('message', (msg) {
        setMessage('destination', msg["message"], msg['path']);
        print("$msg");
      });
    });
    print(socket.connected);
  }

  void sendMessage(String message, int sourceId, int targetId, String path) {
    setMessage('source', message, path);
    socket.emit('message', {
      'message': message,
      'sourceId': sourceId,
      'targetId': targetId,
      'path': path
    });
  }

  setMessage(String _type, String _message, String path) {
    _scrollController.animateTo(_scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 100), curve: Curves.easeOut);
    MessageModel messageModel = MessageModel(
        message: _message,
        type: _type,
        path: path,
        time: DateTime.now().toString().substring(10, 16));
    setState(() => messages.add(messageModel));
  }

  void onImageSend(String path) {
    print('gggggg${path}');
  }

  @override
  void initState() {
    connect();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        emojiShowing = false;
      }
    });
    _controller.addListener(() {
      setState(() {});
      print(_controller.text);
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          chatbg,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
              titleSpacing: 0,
              centerTitle: false,
              leadingWidth: 70,
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Icon(
                    Icons.arrow_back,
                    size: 24,
                  ),
                  CircleAvatar(
                    radius: 20,
                    child: SvgPicture.asset(
                      widget.chatModel.isGroup!
                          ? 'assets/groups.svg'
                          : 'assets/person.svg',
                      height: 36,
                      color: Colors.white,
                    ),
                    backgroundColor: Colors.blueGrey,
                  )
                ]),
              ),
              title: InkWell(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.all(4),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.chatModel.name!,
                          style: const TextStyle(
                            fontSize: 18.4,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'last seen today at ${widget.chatModel.time}',
                          style: const TextStyle(fontSize: 13),
                        ),
                      ]),
                ),
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.videocam),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.call),
                  onPressed: () {},
                ),
                popupMenusIndividual
              ]),
          body: WillPopScope(
            onWillPop: () {
              if (emojiShowing) {
                setState(() {
                  emojiShowing = false;
                });
              } else {
                Navigator.pop(context);
              }
              return Future.value(false);
            },
            child: Column(children: [
              Expanded(
                child: ListView.builder(
                    controller: _scrollController,
                    shrinkWrap: true,
                    itemCount: messages.length + 1,
                    itemBuilder: (context, index) {
                      if (index == messages.length) {
                        return const SizedBox(height: 70);
                      }
                      if (messages[index].type == 'source') {
                        return OwnMessage(
                          message: messages[index],
                        );
                      } else {
                        return ReplyMessage(
                          message: messages[index],
                        );
                      }
                    }),
                // ListView(
                // children: [OweFileCart( ), ReplyFileCard()],
                // )
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  // height: 56,
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                  width: MediaQuery.of(context).size.width - 56,
                                  child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(26)),
                                      child: TextFormField(
                                        focusNode: focusNode,
                                        maxLines: 5,
                                        minLines: 1,
                                        controller: _controller,
                                        keyboardType: TextInputType.multiline,
                                        textAlignVertical:
                                            TextAlignVertical.center,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            prefixIcon: IconButton(
                                              icon: const Icon(
                                                  Icons.emoji_emotions),
                                              onPressed: () {
                                                focusNode.unfocus();
                                                focusNode.canRequestFocus =
                                                    false;
                                                setState(() {
                                                  emojiShowing = !emojiShowing;
                                                });
                                              },
                                            ),
                                            suffixIcon: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                IconButton(
                                                    onPressed: () {
                                                      showModalBottomSheet(
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          context: context,
                                                          builder: (context) =>
                                                              bottomSheet());
                                                    },
                                                    icon: const Icon(
                                                        Icons.attach_file)),
                                                IconButton(
                                                    onPressed: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (builder) =>
                                                                  CameraScreen(
                                                                    onImageSend:
                                                                        () =>
                                                                            onImageSend,
                                                                  )));
                                                    },
                                                    icon: const Icon(
                                                        Icons.camera_alt))
                                              ],
                                            ),
                                            hintText: 'Type a message here',
                                            contentPadding:
                                                const EdgeInsets.only(left: 4)),
                                      ))),
                              const SizedBox(width: 4),
                              CircleAvatar(
                                radius: 24,
                                backgroundColor: const Color(0xFF128C7E),
                                child: IconButton(
                                  icon: Icon(
                                      _controller.text.trim().isNotEmpty
                                          ? Icons.send
                                          : Icons.mic,
                                      color: Colors.white),
                                  onPressed: () {
                                    if (_controller.text.trim().isNotEmpty) {
                                      sendMessage(
                                          _controller.text,
                                          widget.sourceChat.id!,
                                          widget.chatModel.id!,
                                          '');
                                      _controller.clear();
                                    }
                                  },
                                ),
                              )
                            ]),
                        Offstage(
                          offstage: !emojiShowing,
                          child: SizedBox(
                            height: 250,
                            child: EmojiPicker(
                                textEditingController: _controller,
                                onEmojiSelected:
                                    (Category category, Emoji emoji) {
                                  _onEmojiSelected(emoji);
                                },
                                // onBackspacePressed: _onBackspacePressed,
                                config: Config(
                                    columns: 7,
                                    emojiSizeMax:
                                        32 * (Platform.isIOS ? 1.30 : 1.0),
                                    verticalSpacing: 0,
                                    horizontalSpacing: 0,
                                    gridPadding: EdgeInsets.zero,
                                    initCategory: Category.RECENT,
                                    bgColor: const Color(0xFFF2F2F2),
                                    indicatorColor: Colors.blue,
                                    iconColor: Colors.grey,
                                    iconColorSelected: Colors.blue,
                                    progressIndicatorColor: Colors.blue,
                                    backspaceColor: Colors.blue,
                                    skinToneDialogBgColor: Colors.white,
                                    skinToneIndicatorColor: Colors.grey,
                                    enableSkinTones: true,
                                    showRecentsTab: true,
                                    recentsLimit: 28,
                                    replaceEmojiOnLimitExceed: false,
                                    noRecents: const Text(
                                      'No Recents',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.black26),
                                      textAlign: TextAlign.center,
                                    ),
                                    tabIndicatorAnimDuration:
                                        kTabScrollDuration,
                                    categoryIcons: const CategoryIcons(),
                                    buttonMode: ButtonMode.MATERIAL)),
                          ),
                        )
                      ]),
                ),
              )
            ]),
          ),
        ),
      ],
    );
  }

  Widget bottomSheet() {
    return SizedBox(
      height: 278,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: const EdgeInsets.all(18),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              IconCreation(
                color: Colors.indigo,
                icon: Icons.insert_drive_file,
                title: 'Document',
                onTap: () {},
              ),
              const SizedBox(width: 40),
              IconCreation(
                color: Colors.pink,
                icon: Icons.camera_alt,
                title: 'Camera',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => CameraScreen(
                                onImageSend: () => onImageSend,
                              )));
                },
              ),
              const SizedBox(width: 40),
              IconCreation(
                color: Colors.purple,
                icon: Icons.insert_photo,
                title: 'Gallery',
                onTap: () async {
                  file = await _picker.pickImage(source: ImageSource.gallery);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => CameraViewPage(
                                path: file!.path,
                                onImageSend: onImageSend,
                              )));
                },
              )
            ]),
            const SizedBox(height: 30),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              IconCreation(
                color: Colors.orange,
                icon: Icons.headset,
                title: 'Audio',
                onTap: () {},
              ),
              const SizedBox(width: 40),
              IconCreation(
                color: Colors.pink,
                icon: Icons.location_pin,
                title: 'Location',
                onTap: () {},
              ),
              const SizedBox(width: 40),
              IconCreation(
                color: Colors.blue,
                icon: Icons.person,
                title: 'Contact',
                onTap: () async {},
              )
            ])
          ]),
        ),
      ),
    );
  }
}
//https://whispering-citadel-13714.herokuapp.com/ | https://git.heroku.com/whispering-citadel-13714.git
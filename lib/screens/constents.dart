import 'package:flutter/material.dart';

PopupMenuButton<String> popupMenusHome = PopupMenuButton<String>(
    icon: const Icon(Icons.more_vert),
    onSelected: (value) {
      print(value);
    },
    itemBuilder: (BuildContext context) {
      return [
        const PopupMenuItem(
          child: Text('New Group'),
          value: 'New Group',
        ),
        const PopupMenuItem(
          child: Text('New broadcast'),
          value: 'New broadcast',
        ),
        const PopupMenuItem(
          child: Text('Whatsapp web'),
          value: 'Whatsapp web',
        ),
        const PopupMenuItem(
          child: Text('Starred messages'),
          value: 'Starred messages',
        ),
        const PopupMenuItem(
          child: Text('Setting'),
          value: 'Setting',
        )
      ];
    });

// this will show popup menus in right side three dots
PopupMenuButton<String> popupMenusIndividual = PopupMenuButton<String>(
    icon: const Icon(Icons.more_vert),
    onSelected: (value) {
      print(value);
    },
    itemBuilder: (BuildContext context) {
      return [
        const PopupMenuItem(
          child: Text('View Contact'),
          value: 'View Contact',
        ),
        const PopupMenuItem(
          child: Text('Media, links and docs'),
          value: 'Media, links and docs',
        ),
        const PopupMenuItem(
          child: Text('Search'),
          value: 'Search',
        ),
        const PopupMenuItem(
          child: Text('Mute Notification'),
          value: 'Mute Notification',
        ),
        const PopupMenuItem(
          child: Text('Wallpaper'),
          value: 'Wallpaper',
        )
      ];
    });
PopupMenuButton<String> popupMenuContact = PopupMenuButton<String>(
    icon: const Icon(Icons.more_vert),
    onSelected: (value) {
      print(value);
    },
    itemBuilder: (BuildContext context) => [
          const PopupMenuItem(
            child: Text('Invite a friend'),
            value: 'Invite a friend',
          ),
          const PopupMenuItem(
            child: Text('Contacts'),
            value: 'Contacts',
          ),
          const PopupMenuItem(
            child: Text('Refresh'),
            value: 'Refresh',
          ),
          const PopupMenuItem(
            child: Text('Help'),
            value: 'Help',
          )
        ]);
const String person = 'assets/person.svg';
const String chatbg = 'assets/chatbg.png';
const String flutter1 = 'assets/flutter1.jpg';
const String flutter2 = 'assets/flutter2.jpg';
const String flutter3 = 'assets/flutter3.jpg';
const String flutter4 = 'assets/flutter4.jpg';
const String flutter5 = 'assets/flutter5.jpg';
const String bg = 'assets/bg.png';
const Color lightGreen = Color(0xFF25D366);

const String baseurl = 'http://192.168.1.10';
const String port = '5000';

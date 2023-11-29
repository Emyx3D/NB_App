import 'package:flutter/material.dart';
import 'package:naijabatternew/widgets/leftside_message.dart';
import 'package:naijabatternew/widgets/rightside_message.dart';

final List<String> locationList = [
  "Abia",
  "Adamawa",
  "Akwa Ibom",
  "Anambra",
  "Bauchi",
  "Bayelsa",
  "Benue",
  "Borno",
  "Cross River",
  "Delta",
  "Ebonyi",
  "Edo",
  "Ekiti",
  "Enugu",
  "FCT - Abuja",
  "Gombe",
  "Imo",
  "Jigawa",
  "Kaduna",
  "Kano",
  "Katsina",
  "Kebbi",
  "Kogi",
  "Kwara",
  "Lagos",
  "Nassarawa",
  "Niger",
  "Ogun",
  "Ondo",
  "Osun",
  "Oyo",
  "Plateau",
  "Rivers",
  "Sokoto",
  "Taraba",
  "Yobe",
  "Zamfara",
];

final List<String> categoryList = [
  "Art and Collectibles",
  "Automotive",
  "Baby Products",
  "Beauty and Personal Care",
  "Books",
  "Clothing",
  "Crafts and Hobbies",
  "Electronics",
  "Fitness and Exercise",
  "Furniture",
  "Grocery and Gourmet",
  "Health and Wellness",
  "Home and Kitchen",
  "Jewelry",
  "Outdoor and Garden",
  "Pet Supplies",
  "Tools and Home Improvement",
];

final List<String> producttypeList = [
  "Gift",
  "Barter",
  "Declutter",
];
// final List<SelectedListItem> dropdownList = [
//    SelectedListItem(value: '1', name:"Report"),
//    SelectedListItem(value: '2', name:"Delete Chat"),
// ];

const List<String> themeOptions = [
  'Light',
  'Dark',
];

const List<String> fontsizeOptions = [
  'Small',
  'Medium',
  'Large',
];

List<Widget> messages = [
  const SizedBox(
    height: 26.0,
  ),
  const LeftSideMessage(
    message: "Recieved",
  ),
  const RightSideMessage(
    message:
        "I have sent the dispatch rider, you can reach him on XXXXXXXX. Please notify me when you receive it",
  ),
  const LeftSideMessage(
    message: "My address is No. 4 bycort hut by airport road ",
  ),
  const LeftSideMessage(
    message: "I will take it",
  ),
  const RightSideMessage(
    message:
        "I recommend our latest model with an Intel i7 processor and 1TB SSD. It will meet your needs perfectly.",
  ),
  const LeftSideMessage(
    message: "So, you single bruh?",
  ),
  const LeftSideMessage(
    message: "Just curious",
  ),
  const RightSideMessage(
    message:
        "Uhh... this is a business setting, can you please refrain from asking such questions?",
  ),
  const RightSideMessage(
    message: "I'll appreciate that very much",
  ),
  const LeftSideMessage(
    message: "Look bro, i love you.           Wanna kiss?",
  ),
  const LeftSideMessage(
    message: "Bro?",
  ),
  const RightSideMessage(
    message: "You still buying the goods?",
  ),
];

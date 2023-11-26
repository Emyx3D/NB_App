import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../constants/add_product_field.dart';
import '../constants/drop_down_button.dart';
import '../constants/fields_content.dart';
import '../constants/lists.dart';
import '../constants/pages_header.dart';
import '../views/accesibility_page.dart';
import '../views/edit_and_upload_products_page.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class AddProductPage extends ConsumerStatefulWidget {
  const AddProductPage({super.key});

  @override
  ConsumerState<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends ConsumerState<AddProductPage> {
  String? selectedLocationValue;
  String? selectedCategoryValue;
  String? selectedProductTypeValue;

  String? productnameValue;
  String? descriptionValue;
  String? expectedexchangeValue;
  String? costValue;

  String? selectedValue;
  bool expisVisible = false;
  bool costisVisible = false;

  void displayNone() {
    setState(() {
      expisVisible = false;
      costisVisible = false;
    });
  }

  void toggleExpVisibility() {
    setState(() {
      expisVisible = !expisVisible;
      costisVisible = false;
    });
  }

  void toggleCostVisibility() {
    setState(() {
      expisVisible = false;
      costisVisible = !costisVisible;
    });
  }

  ImagePicker imagePicker = ImagePicker();
  XFile? imageFile;

  void pickFromGallery() {
    imagePicker.pickImage(source: ImageSource.gallery).then((value) {
      setState(() {
        imageFile = value;
      });
    });
  }

  void pickFromCamera() {
    imagePicker.pickImage(source: ImageSource.camera).then((value) {
      setState(() {
        imageFile = value;
      });
    });
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final themeIsLight = ref.watch(themeProvider.notifier).state;

    return Scaffold(
      appBar: const PagesHeader(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const SizedBox(
              height: 25.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      pickFromGallery();
                    },
                    child: Container(
                      height: 197.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: themeIsLight
                            ? const Color(0x5CD1D1D6)
                            : const Color(0x5C35353B),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: imageFile == null
                          ? Center(
                              child: Icon(
                                Icons.add,
                                size: 55.0,
                                color: themeIsLight
                                    ? const Color(0xFF6F7ECB)
                                    : const Color(0xFF6C7396),
                              ),
                            )
                          : Image.file(
                              File(imageFile!.path),
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                  const SizedBox19(),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        AddProductInputField(
                          pt: 20,
                          pb: 20,
                          pl: 25,
                          pr: 25,
                          enableSuggestions: true,
                          autocorrect: false,
                          keyboardType: TextInputType.text,
                          hintText: 'Product Name',
                          obscureText: false,
                          ifvalueisNull: 'Please fill all fields',
                          onChanged: (value) {},
                          onSaved: (value) {
                            productnameValue = value.toString();
                          },
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        DropdownFormButton(
                          pt: 16,
                          pb: 16,
                          pl: 8,
                          pr: 10,
                          disabledText: 'Select Your Location',
                          list: locationList,
                          ifvalueisNull: 'Please select a location',
                          onChanged: (value) {},
                          onSaved: (value) {
                            selectedLocationValue = value.toString();
                          },
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        DropdownFormButton(
                          pt: 16,
                          pb: 16,
                          pl: 8,
                          pr: 10,
                          disabledText: 'Select Category',
                          list: categoryList,
                          ifvalueisNull: 'Please select a category',
                          onChanged: (value) {},
                          onSaved: (value) {
                            selectedCategoryValue = value.toString();
                          },
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        AddProductInputField(
                          pt: 20,
                          pb: 118,
                          pl: 25,
                          pr: 25,
                          enableSuggestions: true,
                          autocorrect: false,
                          keyboardType: TextInputType.text,
                          hintText: 'Description',
                          obscureText: false,
                          ifvalueisNull: 'Please enter a product description',
                          onChanged: (value) {},
                          onSaved: (value) {
                            descriptionValue = value.toString();
                          },
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        DropdownFormButton(
                          pt: 14,
                          pb: 14,
                          pl: 8,
                          pr: 10,
                          dropdownValue: null,
                          disabledText: 'Gift',
                          list: producttypeList,
                          ifvalueisNull: 'Please select one',
                          onChanged: (String? newValue) {
                            // setState(() {
                            //   selectedValue = value;
                            // });
                            print(newValue);
                            if (newValue == "Gift") {
                              displayNone();
                            }
                            if (newValue == "Barter") {
                              toggleExpVisibility();
                            }
                            if (newValue == "Declutter") {
                              toggleCostVisibility();
                            }
                          },
                          onSaved: (value) {
                            setState(() {
                              selectedProductTypeValue = value.toString();
                            });
                          },
                        ),
                        Visibility(
                          visible: expisVisible,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 8.0,
                              ),
                              AddProductInputField(
                                pt: 20,
                                pb: 20,
                                pl: 25,
                                pr: 25,
                                enableSuggestions: true,
                                autocorrect: false,
                                keyboardType: TextInputType.text,
                                hintText: 'Expected Exchange',
                                obscureText: false,
                                ifvalueisNull: 'Please fill all fields',
                                onChanged: (value) {},
                                onSaved: (value) {
                                  expectedexchangeValue = value.toString();
                                },
                              ),
                            ],
                          ),
                        ),
                        Visibility(
                          visible: costisVisible,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 8.0,
                              ),
                              AddProductInputField(
                                pt: 20,
                                pb: 20,
                                pl: 25,
                                pr: 25,
                                enableSuggestions: true,
                                autocorrect: false,
                                keyboardType: TextInputType.text,
                                hintText: 'Cost',
                                obscureText: false,
                                ifvalueisNull: 'Please fill all fields',
                                onChanged: (value) {},
                                onSaved: (value) {
                                  costValue = value.toString();
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox19(),
                        SizedBox(
                          width: double.infinity,
                          height: 49,
                          child: TextButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                themeIsLight
                                    ? const Color(0xFF0F28A9)
                                    : const Color(0xFF29398C),
                              ),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                              }
                            },
                            child: Text(
                              'Preview',
                              style: TextStyle(
                                fontSize: 19.0,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w600,
                                color: themeIsLight
                                    ? const Color(0xFFFFFFFF)
                                    : const Color(0xFFD4D4D4),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const EditAndUploadProductsPage(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return child;
                    },
                  ),
                );
              },
              child: const Text(
                'MOVE TO UPLOAD PAGE',
                style: TextStyle(color: Colors.amber),
              ),
            )
          ],
        ),
      ),
    );
  }
}

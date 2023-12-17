import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:naijabatternew/utilities/colors.dart';
import 'package:naijabatternew/utilities/helper/helper.dart';
import 'package:naijabatternew/utilities/provider/category_and_location/category_and_location.dart';
import 'package:naijabatternew/utilities/provider/product/product.dart';
import 'package:naijabatternew/views/homepage_view.dart';
import 'package:naijabatternew/widgets/drop_down_button_category.dart';
import 'package:naijabatternew/widgets/drop_down_button_product_type.dart';
import 'package:naijabatternew/widgets/pfp_image_picker_bottom_sheet.dart';

import '../views/accesibility_page.dart';
import '../views/edit_and_upload_products_page.dart';
import '../widgets/add_product_field.dart';
import '../widgets/drop_down_button_location.dart';
import '../widgets/fields_content.dart';
import '../widgets/pages_header.dart';

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
  bool sending = false;

  Future sendData(WidgetRef ref) async {
    setState(() {
      sending = true;
    });
    Map<String, dynamic> data = {
      'name': productnameValue!,
      'category': selectedCategoryValue!,
      'location': selectedLocationValue!,
      'product_type': selectedProductTypeValue!,
    };

    if (costValue != null) {
      data['price'] = costValue;
    }

    if (expectedexchangeValue != null) {
      data['exchange'] = expectedexchangeValue;
    }

    if (descriptionValue != null) {
      data['description'] = descriptionValue;
    }

    bool status = await sendDataWithImage(
        '/product', data, [imageFile, imageFile2, imageFile3],
        imageName: 'images', successMsg: 'Product created');
    setState(() {
      sending = false;
    });

    if (status) {
      ref.read(userProduct);
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
      return;
    }
  }

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
  XFile? imageFile2;
  XFile? imageFile3;

  void pickFromGallery() {
    imagePicker.pickImage(source: ImageSource.gallery).then((value) {
      setState(() {
        imageFile = value;
      });
    });
  }

  void pickFromGallery2() {
    imagePicker.pickImage(source: ImageSource.gallery).then((value) {
      setState(() {
        imageFile2 = value;
      });
    });
  }

  void pickFromGallery3() {
    imagePicker.pickImage(source: ImageSource.gallery).then((value) {
      setState(() {
        imageFile3 = value;
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

  void pickFromCamera2() {
    imagePicker.pickImage(source: ImageSource.camera).then((value) {
      setState(() {
        imageFile2 = value;
      });
    });
  }

  void pickFromCamera3() {
    imagePicker.pickImage(source: ImageSource.camera).then((value) {
      setState(() {
        imageFile3 = value;
      });
    });
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final themeIsLight = ref.watch(themeProvider.notifier).state;
    final locationProvider = ref.watch(location);
    final categoryProvider = ref.watch(category);
    // var screenWidth = MediaQuery.of(context).size.width;
    // var screenHeight = MediaQuery.of(context).size.height;

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
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: GestureDetector(
                                onTap: () {
                                  // pickFromGallery();
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return PfpImagePickerBottomSheet(
                                        pickFromCamera: pickFromCamera,
                                        pickFromGallery: pickFromGallery,
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                  height: 120,
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
                                            // size: 55.0,
                                            size: 40,
                                            color: themeIsLight
                                                ? const Color(0xFF6F7ECB)
                                                : const Color(0xFF6C7396),
                                          ),
                                        )
                                      : ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          child: Image.file(
                                            File(imageFile!.path),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Flexible(
                              child: GestureDetector(
                                onTap: () {
                                  // pickFromGallery();
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return PfpImagePickerBottomSheet(
                                        pickFromCamera: pickFromCamera2,
                                        pickFromGallery: pickFromGallery2,
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                  height: 120,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: themeIsLight
                                        ? const Color(0x5CD1D1D6)
                                        : const Color(0x5C35353B),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: imageFile2 == null
                                      ? Center(
                                          child: Icon(
                                            Icons.add,
                                            // size: 55.0,
                                            size: 40,
                                            color: themeIsLight
                                                ? const Color(0xFF6F7ECB)
                                                : const Color(0xFF6C7396),
                                          ),
                                        )
                                      : ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          child: Image.file(
                                            File(imageFile2!.path),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            // pickFromGallery();
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return PfpImagePickerBottomSheet(
                                  pickFromCamera: pickFromCamera3,
                                  pickFromGallery: pickFromGallery3,
                                );
                              },
                            );
                          },
                          child: Container(
                            height: 250.0,
                            // width: double.maxFinite,
                            decoration: BoxDecoration(
                              color: themeIsLight
                                  ? const Color(0x5CD1D1D6)
                                  : const Color(0x5C35353B),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: imageFile3 == null
                                ? Center(
                                    child: Icon(
                                      Icons.add,
                                      size: 55.0,
                                      color: themeIsLight
                                          ? const Color(0xFF6F7ECB)
                                          : const Color(0xFF6C7396),
                                    ),
                                  )
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(5.0),
                                    child: Image.file(
                                      File(imageFile3!.path),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ],
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
                            setState(() {});
                          },
                        ),
                        // const SizedBox(
                        //   height: 8.0,
                        // ),
                        // AddProductInputField(
                        //   pt: 20,
                        //   pb: 20,
                        //   pl: 25,
                        //   pr: 25,
                        //   enableSuggestions: true,
                        //   autocorrect: false,
                        //   keyboardType: TextInputType.text,
                        //   hintText: 'Location',
                        //   obscureText: false,
                        //   ifvalueisNull: 'Please fill all fields',
                        //   onChanged: (value) {},
                        //   onSaved: (value) {
                        //     productnameValue = value.toString();
                        //     setState(() {});
                        //   },
                        // ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        locationProvider.when(
                          data: (data) => DropdownFormButtonLocation(
                            pt: 16,
                            pb: 16,
                            pl: 8,
                            pr: 10,
                            disabledText: 'Select Your State',
                            list: data,
                            ifvalueisNull: 'Please select a state',
                            onChanged: (value) {},
                            onSaved: (value) {
                              selectedLocationValue = value;
                              setState(() {});
                            },
                          ),
                          error: (error, stackTrace) =>
                              DropdownFormButtonLocation(
                            pt: 16,
                            pb: 16,
                            pl: 8,
                            pr: 10,
                            disabledText: 'An error occured',
                            list: const [],
                            ifvalueisNull: 'An error occured',
                            onChanged: null,
                            onSaved: (value) {},
                          ),
                          loading: () => DropdownFormButtonLocation(
                            pt: 16,
                            pb: 16,
                            pl: 8,
                            pr: 10,
                            disabledText: 'Loading...',
                            list: const [],
                            ifvalueisNull: 'Loading...',
                            onChanged: null,
                            onSaved: (value) {},
                          ),
                        ),

                        const SizedBox(
                          height: 8.0,
                        ),
                        categoryProvider.when(
                          data: (data) => DropdownFormButtonCategory(
                            pt: 16,
                            pb: 16,
                            pl: 8,
                            pr: 10,
                            disabledText: 'Select Category',
                            list: data,
                            ifvalueisNull: 'Please select a category',
                            onChanged: (value) {},
                            onSaved: (value) {
                              selectedCategoryValue = value;
                              setState(() {});
                            },
                          ),
                          error: (error, stackTrace) =>
                              DropdownFormButtonCategory(
                            pt: 16,
                            pb: 16,
                            pl: 8,
                            pr: 10,
                            disabledText: 'Select Category',
                            list: const [],
                            ifvalueisNull: 'An error occured',
                            onChanged: null,
                            onSaved: (value) {},
                          ),
                          loading: () => DropdownFormButtonCategory(
                            pt: 16,
                            pb: 16,
                            pl: 8,
                            pr: 10,
                            disabledText: 'Loading...',
                            list: const [],
                            ifvalueisNull: 'Loading...',
                            onChanged: null,
                            onSaved: (value) {},
                          ),
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
                            setState(() {});
                          },
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        DropdownFormButtonProductType(
                          pt: 14,
                          pb: 14,
                          pl: 8,
                          pr: 10,
                          dropdownValue: null,
                          disabledText: 'Gift',
                          list: const ['Gift', 'Barter', 'Declutter'],
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
                                  setState(() {});
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
                                  setState(() {});
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
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                await sendData(ref);
                              }
                            },
                            child: sending == true
                                ? CircularProgressIndicator(
                                    color: ProjectColors.whiteColor)
                                : Text(
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

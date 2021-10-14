import 'package:flutter/material.dart';
import 'package:webproject/res/custom_colors.dart';
import 'package:webproject/utils/database.dart';
import 'package:webproject/utils/validator.dart';


import 'custom_form_field.dart';

class AddItemForm extends StatefulWidget {
  final FocusNode titleFocusNode;
  final FocusNode subcategoryFocusNode;
  final FocusNode productnameFocusNode;
  final FocusNode productpriceFocusNode;

  const AddItemForm({
    this.titleFocusNode,
    this.productnameFocusNode,
    this.productpriceFocusNode,
    this.subcategoryFocusNode
  });

  @override
  _AddItemFormState createState() => _AddItemFormState();
}

class _AddItemFormState extends State<AddItemForm> {
  final _addItemFormKey = GlobalKey<FormState>();

  bool _isProcessing = false;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _subcategoryController = TextEditingController();
  final TextEditingController _productnameController = TextEditingController();
  final TextEditingController _productpriceController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _addItemFormKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                right: 8.0,
                bottom: 24.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 24.0),
                  Text(
                    'Category Title',
                    style: TextStyle(
                      color: CustomColors.firebaseGrey,
                      fontSize: 22.0,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  CustomFormField(
                    isLabelEnabled: false,
                    controller: _titleController,
                    focusNode: widget.titleFocusNode,
                    keyboardType: TextInputType.text,
                    inputAction: TextInputAction.next,
                    validator: (value) => Validator.validateField(
                      value: value,
                    ),
                    label: 'Title',
                    hint: 'Enter title',
                  ),
                  SizedBox(height: 24.0),
                  Text(
                    'SubCategory',
                    style: TextStyle(
                      color: CustomColors.firebaseGrey,
                      fontSize: 22.0,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  CustomFormField(
                    isLabelEnabled: false,
                    controller: _subcategoryController,
                    focusNode: widget.subcategoryFocusNode,
                    keyboardType: TextInputType.text,
                    inputAction: TextInputAction.next,
                    validator: (value) => Validator.validateField(
                      value: value,
                    ),
                    label: 'SubCategory',
                    hint: 'Enter SubCategory',
                  ),
                  SizedBox(height: 24.0),
                  Text(
                    'Product Name',
                    style: TextStyle(
                      color: CustomColors.firebaseGrey,
                      fontSize: 22.0,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  CustomFormField(
                    isLabelEnabled: false,
                    controller: _productnameController,
                    focusNode: widget.productnameFocusNode,
                    keyboardType: TextInputType.text,
                    inputAction: TextInputAction.done,
                    validator: (value) => Validator.validateField(
                      value: value,
                    ),
                    label: 'Product Name',
                    hint: 'Enter product name',
                  ),
                  SizedBox(height: 24.0),
                  Text(
                    'Product Price',
                    style: TextStyle(
                      color: CustomColors.firebaseGrey,
                      fontSize: 22.0,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  CustomFormField(
                    isLabelEnabled: false,
                    controller: _productpriceController,
                    focusNode: widget.productpriceFocusNode,
                    keyboardType: TextInputType.text,
                    inputAction: TextInputAction.done,
                    validator: (value) => Validator.validateField(
                      value: value,
                    ),
                    label: 'Product Price',
                    hint: 'Enter product price',
                  ),
                  SizedBox(height: 24.0),
                ],
              ),
            ),
            _isProcessing
                ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  CustomColors.firebaseOrange,
                ),
              ),
            )
                : Container(
              width: double.maxFinite,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    CustomColors.firebaseOrange,
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                onPressed: () async {
                  widget.titleFocusNode.unfocus();
                  widget.productnameFocusNode.unfocus();
                  widget.productpriceFocusNode.unfocus();
                  widget.subcategoryFocusNode.unfocus();


                  if (_addItemFormKey.currentState.validate()) {
                    setState(() {
                      _isProcessing = true;
                    });

                    await Database.addItem(
                      title: _titleController.text,
                      productname: _productnameController.text,
                      productprice: _productpriceController.text,
                      subcategory : _subcategoryController.text,
                    );
                    setState(() {
                      _isProcessing = false;
                    });

                    Navigator.of(context).pop();
                  }
                },
                child: Padding(
                  padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                  child: Text(
                    'ADD ITEM',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: CustomColors.firebaseGrey,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

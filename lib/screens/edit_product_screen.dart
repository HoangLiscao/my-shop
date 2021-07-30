import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_app/providers/productModel.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = "/edit_product_screen";

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageUrlFocusNote = FocusNode();
  final _imageUrlController = TextEditingController();
  final _form = GlobalKey<FormState>();
  var _edittedProduct = Product("", "", "", 0, "");

  @override
  void initState() {
    _imageUrlFocusNote.addListener(_updateImageUrl);
    super.initState();
  }

  void _updateImageUrl() {
    if(!_imageUrlFocusNote.hasFocus) {
      setState(() {

      });
    }
  }

  void _saveForm() {
    final isValid = _form.currentState!.validate();
    if (!isValid) {

    } else {
      _form.currentState!.save();
    }
    print(_edittedProduct.title);
    print(_edittedProduct.description);
    print(_edittedProduct.price);
    print(_edittedProduct.imageUrl);
  }

  @override
  void dispose() {
    _imageUrlFocusNote.removeListener(_updateImageUrl);
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imageUrlController.dispose();
    _imageUrlFocusNote.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Product"),
        actions: [IconButton(onPressed: _saveForm, icon: Icon(Icons.save))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _form,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: "Title"),
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_priceFocusNode);
                  },
                  onSaved: (value) {
                    _edittedProduct = Product(_edittedProduct.id, value.toString(), _edittedProduct.description, _edittedProduct.price, _edittedProduct.imageUrl);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please provide a value";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Price"),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  focusNode: _priceFocusNode,
                  onSaved: (value) {
                    _edittedProduct = Product(_edittedProduct.id, _edittedProduct.title, _edittedProduct.description, double.parse(value.toString()), _edittedProduct.imageUrl);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please provide a price";
                    } else if (double.tryParse(value)! <= 0) {
                      return "Please provide a value > 0";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Description"),
                  maxLines: 3,
                  keyboardType: TextInputType.multiline,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_descriptionFocusNode);
                  },
                  onSaved: (value) {
                    _edittedProduct = Product(_edittedProduct.id, _edittedProduct.title, value.toString(), _edittedProduct.price, _edittedProduct.imageUrl);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter a description";
                    }
                    if (value.length < 10) {
                      return "Please enter longer";
                    }
                    return null;
                  },
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      margin: EdgeInsets.only(top: 8, right: 10),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey)),
                      child: _imageUrlController.text.isEmpty ? Text("Enter a URL") : FittedBox(
                        child: Image.network(_imageUrlController.text),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(labelText: "Image URL"),
                        keyboardType: TextInputType.url,
                        textInputAction: TextInputAction.done,
                        controller: _imageUrlController,
                        focusNode: _imageUrlFocusNote,
                        onFieldSubmitted: (_) {
                          _saveForm();
                        },
                        onSaved: (value) {
                          _edittedProduct = Product(_edittedProduct.id, _edittedProduct.title, _edittedProduct.description, _edittedProduct.price, value.toString());
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

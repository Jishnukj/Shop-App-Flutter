import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName='/edit-product';

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _pricefocusnode=FocusNode();
  final _desfocusnode=FocusNode();
  final _imgurlController=TextEditingController();
  final _imgfocusnode=FocusNode();

  @override
  void initState(){
    _imgfocusnode.addListener(_updateimg);
  }
  @override
  void dispose(){
    _imgfocusnode.removeListener(_updateimg);
    _pricefocusnode.dispose();
    _desfocusnode.dispose();
    _imgurlController.dispose();
    _imgfocusnode.dispose();
    super.dispose();
  }
  void _updateimg(){
    if(!_imgfocusnode.hasFocus){
      setState(() {

      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Product'),),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(child: ListView(children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Title'),
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_){
                    FocusScope.of(context).requestFocus(_pricefocusnode);
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Price'),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  focusNode: _desfocusnode,
                ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Description'),
            maxLines: 3,
            keyboardType: TextInputType.multiline,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
            Container(
              width: 100,
              height: 100,
              margin: EdgeInsets.only(top: 8,right: 10),
              decoration: BoxDecoration(border: Border.all(width: 1,color: Colors.grey)),
              child: _imgurlController.text.isEmpty?Text('Enter URL'):
              FittedBox(child: Image.network(_imgurlController.text),
              fit: BoxFit.cover,),
            ),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(labelText: 'Image URL'),
                keyboardType: TextInputType.url,
                textInputAction: TextInputAction.done,
                controller: _imgurlController,
                focusNode: _imgfocusnode,
              ),
            ),

          ],)
        ],),),
      ),
    );
  }
}

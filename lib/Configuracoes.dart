import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Configuracoes extends StatefulWidget {
  @override
  _ConfiguracoesState createState() => _ConfiguracoesState();
}

class _ConfiguracoesState extends State<Configuracoes> {

  TextEditingController _controllerNome = TextEditingController();
  File _imagem;
  String _idUsuarioLogado;
  bool _subindoImagem = false;
  String _urlRecuperada;

  Future _recuperarImagem(String origem) async{
    File imagemSelecionada;
    switch(origem){
        case "camera":
          imagemSelecionada = await ImagePicker.pickImage(source: ImageSource.camera);
          break;
        case "galeria":
          imagemSelecionada = await ImagePicker.pickImage(source: ImageSource.gallery);
          break;
      }
      setState(() {
        _imagem = imagemSelecionada;
        if(_imagem != null){
          _subindoImagem = true;
          _uploadImagem();
        }
      });
  }

  Future _uploadImagem(){
      FirebaseStorage storage = FirebaseStorage.instance;
      StorageReference pastaRaiz = storage.ref();
      StorageReference arquivo = pastaRaiz.child("perfil").child(_idUsuarioLogado+".jpg");

      //Progresso da imagem sendo enviada ao servidor
      StorageUploadTask task = arquivo.putFile(_imagem);

      task.events.listen((StorageTaskEvent storageEvent){
        if(storageEvent.type == StorageTaskEventType.progress){
          setState(() {
            _subindoImagem = true;
          });
        }else if(storageEvent.type == StorageTaskEventType.success){
          setState(() {
            _subindoImagem = false;
          });
        }
      });

      //Recuperar imagem
    task.onComplete.then((StorageTaskSnapshot snapshot){
        _recuperarUrlImagem(snapshot);
    });
  }

  _recuperarUsuarioLogado() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseUser usuario = await auth.currentUser();
    _idUsuarioLogado = usuario.uid;

    Firestore db = Firestore.instance;
    DocumentSnapshot snapshot = await db.collection("usuarios")
      .document(_idUsuarioLogado)
      .get();

    Map<String, dynamic> dados = snapshot.data;
    _controllerNome.text = dados["nome"];

    if(dados["urlImagem"] != null){
      setState(() {
        _urlRecuperada = dados["urlImagem"];
      });
    }
  }

  _recuperarUrlImagem(StorageTaskSnapshot snapshot) async{
    String url = await snapshot.ref.getDownloadURL();
    _atualizarUrlImagemFirestore(url);
    setState(() {
      _urlRecuperada = url;
    });
  }

  _atualizarUrlImagemFirestore(String url){
     Firestore db = Firestore.instance;
     Map<String, dynamic> dadosAtualizar ={
       "urlImagem": url
     };
     db.collection("usuarios")
     .document(_idUsuarioLogado)
     .updateData(dadosAtualizar);
  }

  _atualizarNomeFirestore(){
    String nome = _controllerNome.text;
    Firestore db = Firestore.instance;
    Map<String, dynamic> dadosAtualizar ={
      "nome": nome
    };
    db.collection("usuarios")
        .document(_idUsuarioLogado)
        .updateData(dadosAtualizar);
  }

  @override
  void initState() {
    _recuperarUsuarioLogado();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Configuracoes"),),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(16),
                    child: _subindoImagem
                        ? CircularProgressIndicator()
                        : Container(),
                  ),
                  CircleAvatar(
                    radius: 100,
                    backgroundColor: Colors.grey,
                    backgroundImage:
                    _urlRecuperada != null ?
                    NetworkImage(_urlRecuperada) : null
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(
                      child: Text("Câmera"),
                      onPressed: () {
                        _recuperarImagem("camera");
                      },
                    ),
                    FlatButton(
                      child: Text("Galeria"),
                      onPressed: () {
                        _recuperarImagem("galeria");
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: TextField(
                    //autofocus: true,
                    controller: _controllerNome,
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 12),
                        hintText: "Nome",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32)
                        )
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 10),
                  child: RaisedButton(
                      child: Text(
                        "Salvar",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      color: Colors.green,
                      padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32)
                      ),
                      onPressed: (){
                        _atualizarNomeFirestore();
                      }
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

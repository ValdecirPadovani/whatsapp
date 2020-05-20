import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/model/Mensagem.dart';
import 'package:whatsapp/model/Usuario.dart';

class Mensagens extends StatefulWidget {

  Usuario contato;

  Mensagens(this.contato);

  @override
  _MensagensState createState() => _MensagensState();
}

class _MensagensState extends State<Mensagens> {

  List<String> mensagens = [
    "Olá! Sou a mensagem 1",
    "Olá! Sou a mensagem 2",
    "Olá! Sou a mensagem 3",
    "Olá! Sou a mensagem 4",
    "Olá! Sou a mensagem 5",
    "Olá! Sou a mensagem 6",
    "Olá! Sou a mensagem 7",
    "Olá! Sou a mensagem 8",
    "Olá! Sou a mensagem 9",
  ];

  //PRECISO ATUALIZAR O CÓDIGO - Aula 178 - Listando conversas (não fiz o código da aula)
  //PRECISO ATUALIZAR O CÓDIGO - Aula 178 - Listando conversas (não fiz o código da aula)
  //PRECISO ATUALIZAR O CÓDIGO - Aula 178 - Listando conversas (não fiz o código da aula)
  //PRECISO ATUALIZAR O CÓDIGO - Aula 178 - Listando conversas (não fiz o código da aula)
  //PRECISO ATUALIZAR O CÓDIGO - Aula 178 - Listando conversas (não fiz o código da aula)
  //PRECISO ATUALIZAR O CÓDIGO - Aula 178 - Listando conversas (não fiz o código da aula)
  //PRECISO ATUALIZAR O CÓDIGO - Aula 178 - Listando conversas (não fiz o código da aula)
  //PRECISO ATUALIZAR O CÓDIGO - Aula 178 - Listando conversas (não fiz o código da aula)
  //PRECISO ATUALIZAR O CÓDIGO - Aula 178 - Listando conversas (não fiz o código da aula)
  //PRECISO ATUALIZAR O CÓDIGO - Aula 178 - Listando conversas (não fiz o código da aula)
  //PRECISO ATUALIZAR O CÓDIGO - Aula 178 - Listando conversas (não fiz o código da aula)
  //PRECISO ATUALIZAR O CÓDIGO - Aula 178 - Listando conversas (não fiz o código da aula)
  //PRECISO ATUALIZAR O CÓDIGO - Aula 178 - Listando conversas (não fiz o código da aula)
  //PRECISO ATUALIZAR O CÓDIGO - Aula 178 - Listando conversas (não fiz o código da aula)
  //PRECISO ATUALIZAR O CÓDIGO - Aula 178 - Listando conversas (não fiz o código da aula)
  //PRECISO ATUALIZAR O CÓDIGO - Aula 178 - Listando conversas (não fiz o código da aula)
  //PRECISO ATUALIZAR O CÓDIGO - Aula 178 - Listando conversas (não fiz o código da aula)
  //PRECISO ATUALIZAR O CÓDIGO - Aula 178 - Listando conversas (não fiz o código da aula)
  //PRECISO ATUALIZAR O CÓDIGO - Aula 178 - Listando conversas (não fiz o código da aula)
  //PRECISO ATUALIZAR O CÓDIGO - Aula 178 - Listando conversas (não fiz o código da aula)
  //PRECISO ATUALIZAR O CÓDIGO - Aula 178 - Listando conversas (não fiz o código da aula)
  //PRECISO ATUALIZAR O CÓDIGO - Aula 178 - Listando conversas (não fiz o código da aula)
  //PRECISO ATUALIZAR O CÓDIGO - Aula 178 - Listando conversas (não fiz o código da aula)
  //PRECISO ATUALIZAR O CÓDIGO - Aula 178 - Listando conversas (não fiz o código da aula)
  //PRECISO ATUALIZAR O CÓDIGO - Aula 178 - Listando conversas (não fiz o código da aula)
  //PRECISO ATUALIZAR O CÓDIGO - Aula 178 - Listando conversas (não fiz o código da aula)
  //PRECISO ATUALIZAR O CÓDIGO - Aula 178 - Listando conversas (não fiz o código da aula)
  //PRECISO ATUALIZAR O CÓDIGO - Aula 178 - Listando conversas (não fiz o código da aula)
  //PRECISO ATUALIZAR O CÓDIGO - Aula 178 - Listando conversas (não fiz o código da aula)
  //PRECISO ATUALIZAR O CÓDIGO - Aula 178 - Listando conversas (não fiz o código da aula)
  //PRECISO ATUALIZAR O CÓDIGO - Aula 178 - Listando conversas (não fiz o código da aula)
  //PRECISO ATUALIZAR O CÓDIGO - Aula 178 - Listando conversas (não fiz o código da aula)
  //PRECISO ATUALIZAR O CÓDIGO - Aula 178 - Listando conversas (não fiz o código da aula)
  //PRECISO ATUALIZAR O CÓDIGO - Aula 178 - Listando conversas (não fiz o código da aula)
  //PRECISO ATUALIZAR O CÓDIGO - Aula 178 - Listando conversas (não fiz o código da aula)
  //PRECISO ATUALIZAR O CÓDIGO - Aula 178 - Listando conversas (não fiz o código da aula)
  //PRECISO ATUALIZAR O CÓDIGO - Aula 178 - Listando conversas (não fiz o código da aula)
  //PRECISO ATUALIZAR O CÓDIGO - Aula 178 - Listando conversas (não fiz o código da aula)
  //PRECISO ATUALIZAR O CÓDIGO - Aula 178 - Listando conversas (não fiz o código da aula)
  //PRECISO ATUALIZAR O CÓDIGO - Aula 178 - Listando conversas (não fiz o código da aula)
  //PRECISO ATUALIZAR O CÓDIGO - Aula 178 - Listando conversas (não fiz o código da aula)
  //PRECISO ATUALIZAR O CÓDIGO - Aula 178 - Listando conversas (não fiz o código da aula)
  //PRECISO ATUALIZAR O CÓDIGO - Aula 178 - Listando conversas (não fiz o código da aula)
  //PRECISO ATUALIZAR O CÓDIGO - Aula 178 - Listando conversas (não fiz o código da aula)
  //PRECISO ATUALIZAR O CÓDIGO - Aula 178 - Listando conversas (não fiz o código da aula)
  //PRECISO ATUALIZAR O CÓDIGO - Aula 178 - Listando conversas (não fiz o código da aula)

  TextEditingController _controllerMensagem = TextEditingController();
  String _idUsuarioLogado;
  String _idUsuarioDestinatario;
  Firestore db = Firestore.instance;

  _enviarMensagem(){
    String textoMensagem = _controllerMensagem.text;
    if(textoMensagem.isNotEmpty){

      Mensagem mensagem = Mensagem();
      mensagem.idUsuario = _idUsuarioLogado;
      mensagem.mensagem  = textoMensagem;
      mensagem.urlImagem = "";
      mensagem.tipo      = "texto";
      mensagem.time      = DateTime.now().toUtc();

      //Salvando mensagem do rementente
      _salvarMensatem(_idUsuarioLogado, _idUsuarioDestinatario, mensagem);

      //Salvando mentasagem do destinatário
      _salvarMensatem(_idUsuarioLogado, _idUsuarioDestinatario, mensagem);
    }
  }

  _salvarMensatem(String idRemetente, String idDestinatario, Mensagem msg) async {

    await db.collection("mensagem")
      .document(idRemetente)
    .collection(idDestinatario)
    .add(msg.toMap());
  }

  _recuperarUsuarioLogado() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseUser usuario = await auth.currentUser();
    _idUsuarioLogado = usuario.uid;
    _idUsuarioDestinatario = widget.contato.idUsuario;
  }

  _enviarFoto(){}

  @override
  void initState() {
    super.initState();
    _recuperarUsuarioLogado();
  }



  @override
  Widget build(BuildContext context) {

    var caixaDeMensagem = Container(
      padding: EdgeInsets.all(8),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 8),
              child: TextField(
                //autofocus: true,
                controller: _controllerMensagem,
                keyboardType: TextInputType.text,
                style: TextStyle(fontSize: 15),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(32, 8, 32, 8),
                    hintText: "Digite uma mensagem...",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32)
                    ),
                  prefixIcon: IconButton(
                    icon: Icon(Icons.camera_alt),
                    onPressed: (){
                      _enviarFoto();
                    },
                  )
                ),
              ),
            ),
          ),

          FloatingActionButton(
            backgroundColor: Color(0xff075E54),
            child: Icon(Icons.send, color: Colors.white,),
            mini: true,
            onPressed: (){
              _enviarMensagem();
            },
          )
        ],
      ),
    );

    var stream = StreamBuilder(
      stream: db.collection("mensagem")
          .document(_idUsuarioLogado)
          .collection(_idUsuarioDestinatario)
          .orderBy("time", descending: false)
          .snapshots(),
      // ignore: missing_return
      builder: (context,  snapshot){
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
              child: Column(
                children: <Widget>[
                  Text("Carregando mensagens"),
                  CircularProgressIndicator()
                ],
              ),
            );
            break;
          case ConnectionState.active:
          case ConnectionState.done:

            QuerySnapshot querySnapshot = snapshot.data;

            if (snapshot.hasError) {
              return Expanded(
                child: Text("Erro ao carregar os dados!"),
              );
            } else {
              return Expanded(
                child: ListView.builder(
                    itemCount: querySnapshot.documents.length,
                    itemBuilder: (context, indice) {

                      //recupera mensagem
                      List<DocumentSnapshot> mensagens = querySnapshot.documents.toList();
                      DocumentSnapshot item = mensagens[indice];

                      double larguraContainer =
                          MediaQuery.of(context).size.width * 0.8;

                      //Define cores e alinhamentos
                      Alignment alinhamento = Alignment.centerRight;
                      Color cor = Color(0xffd2ffa5);
                      if ( _idUsuarioLogado != item["idUsuario"] ) {
                        alinhamento = Alignment.centerLeft;
                        cor = Colors.white;
                      }

                      return Align(
                        alignment: alinhamento,
                        child: Padding(
                          padding: EdgeInsets.all(6),
                          child: Container(
                            width: larguraContainer,
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                color: cor,
                                borderRadius:
                                BorderRadius.all(Radius.circular(8))),
                            child: Text(
                              item["mensagem"],
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      );
                    }),
              );
            }
            break;
        }
      },

    );

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            CircleAvatar(
              maxRadius: 20,
              backgroundColor: Colors.grey,
              backgroundImage: widget.contato.urlImagem != null
              ? NetworkImage(widget.contato.urlImagem)
              : null ,
            ),
            Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text(widget.contato.nome),
            )

          ],
        )
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bg.png"),
            fit: BoxFit.cover
          ),

        ),
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.all(8),
            child: Column(
              children: <Widget>[
                stream,
                caixaDeMensagem,
              ],
            ),
           )
        ),
      ),
    );
  }
}

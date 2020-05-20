
class Usuario{

  String _idUsuario;
  String _nome;
  String _email;
  String _senha;
  String _urlImagem;

  Usuario();

  Map<String, dynamic> toMap(){
    Map<String, dynamic> map ={
      "nome": this.nome,
      "email" : this.email
    };
    return map;
  }

  String get urlImagem => _urlImagem;

  String get idUsuario => _idUsuario;

  set idUsuario(String value) {
    _idUsuario = value;
  }

  set urlImagem(String value) {
    _urlImagem = value;
  }

  String get nome => _nome;

  set nome(String value) {
    _nome = value;
  }

  String get email => _email;

  String get senha => _senha;

  set senha(String value) {
    _senha = value;
  }

  set email(String value) {
    _email = value;
  }


}
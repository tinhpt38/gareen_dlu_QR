
class LoginStore{
  static final LoginStore instance = LoginStore._internal();

  factory LoginStore(){
    return instance;
  }

  LoginStore._internal();


}
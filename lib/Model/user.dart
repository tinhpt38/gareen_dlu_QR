

class User{
  final String userId;
  final String password;
  final String userName;
  final String userEmail;

  User(this.userId, this.password, this.userName, this.userEmail);


 userToString(){
   return this.userId + this.userName + this.userEmail;
}

}
class SqlCommands {
  static final instance = SqlCommands();
  String get getAll => 'SELECT * FROM users';
  String get updateC => 'UPDATE users SET name = :name ,email = :email, age = :age WHERE id = :id';
  String get insert => 'INSERT INTO users (name, email, age) VALUES (:name, :email, :age)';
  String get delete => 'DELETE FROM users WHERE id = :id';
}

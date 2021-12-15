enum Goal {
  NONE,
  AUMENTAR_MASA,
  MANTENERSE,
  BAJAR_PESO,
}

enum PlanType {
  GRATUITO,
  PAGO,
}

class Usuario {
  Usuario({
    this.name,
    this.email,
    this.password,
    this.weight,
    this.height,
    this.planType = PlanType.GRATUITO,
    this.goal,
  });

  String? name;
  String? email;
  String? password;
  double? weight;
  double? height;
  PlanType? planType;
  Goal? goal;

  //Metodo get y set
  String get getName => name.toString();
  void setName(String value) => name = value;

  String get getEmail => email.toString();
  void setEmail(String value) => this.email = value;

  String get getPassword => password.toString();
  void setPssword(String value) => this.password = value;

  double? get getWeight => weight;
  void setWeight(String value) => weight = double.tryParse(value);

  double? get getHeight => height;
  void setHeight(String value) => this.height = double.tryParse(value);

  PlanType get getPlanType => this.planType!;
  void setPlanType(PlanType value) => this.planType = value;

  Goal get getGoal => this.goal!;
  void setGoal(Goal value) => this.goal = value;

  @override
  String toString() {
    return getName +
        '\n ' +
        getEmail +
        '\n  ' +
        getPassword +
        '\n  ' +
        getWeight.toString() +
        '\n  ' +
        getHeight.toString() +
        '\n  ' +
        getGoal.toString() +
        '\n';
  }
}

typedef mg = double;
typedef ml = double;

abstract class Drink {
  Drink(this.volume);

  final ml volume;
}

abstract class CoffeeDrink extends Drink {
  CoffeeDrink(this.caffeine, this.dose, super.volume);

  final mg caffeine;
  final mg dose;
}

sealed class EspressoShotCount {
  abstract final mg dose;
}

class Single implements EspressoShotCount {
  @override
  ml get dose => 17;
}

class Dopio implements EspressoShotCount {
  @override
  ml get dose => 16;
}

class Triple implements EspressoShotCount {
  @override
  ml get dose => 21;
}

/// https://www.home-barista.com/forums/userpix/2_extractionratios_sm_1.png
abstract class Espresso<T extends EspressoShotCount> extends CoffeeDrink {
  Espresso._(this.shot, mg caffeine, ml volume)
      : super(caffeine, shot.dose, volume);

  final EspressoShotCount shot;
}

class Normale extends Espresso {
  Normale._(EspressoShotCount shot)
      : super._(
    shot,
    switch (shot) {
      Single() => 75,
      Dopio() => 150,
      Triple() => 225,
    },
    switch (shot) {
      Single() => 33,
      Dopio() => 76,
      Triple() => 99,
    },
  );

  factory Normale.singleShot() {
    return Normale._(Single());
  }

  factory Normale.dopioShot() {
    return Normale._(Dopio());
  }

  factory Normale.tripleShot() {
    return Normale._(Triple());
  }
}

class Ristretto extends Espresso {
  Ristretto._(EspressoShotCount shot)
      : super._(
    shot,
    switch (shot) {
      Single() => 63,
      Dopio() => 126,
      Triple() => 189,
    },
    switch (shot) {
      Single() => 17,
      Dopio() => 38,
      Triple() => 50,
    },
  );

  factory Ristretto.singleShot() {
    return Ristretto._(Single());
  }

  factory Ristretto.dopioShot() {
    return Ristretto._(Dopio());
  }

  factory Ristretto.tripleShot() {
    return Ristretto._(Triple());
  }
}

class Lungo extends Espresso {
  Lungo._(EspressoShotCount shot)
      : super._(
    shot,
    switch (shot) {
      Single() => 80,
      Dopio() => 160,
      Triple() => 240,
    },
    switch (shot) {
      Single() => 89,
      Dopio() => 203,
      Triple() => 266,
    },
  );

  factory Lungo.singleShot() {
    return Lungo._(Single());
  }

  factory Lungo.dopioShot() {
    return Lungo._(Dopio());
  }

  factory Lungo.tripleShot() {
    return Lungo._(Triple());
  }
}

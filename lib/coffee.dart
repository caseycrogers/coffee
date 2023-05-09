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

class SingleShot implements EspressoShotCount {
  @override
  ml get dose => 17;
}

class Dopio implements EspressoShotCount {
  @override
  ml get dose => 16;
}

class TripleShot implements EspressoShotCount {
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
  Normale(EspressoShotCount shot)
      : super._(
    shot,
    switch (shot) {
      SingleShot() => 75,
      Dopio() => 150,
      TripleShot() => 225,
    },
    switch (shot) {
      SingleShot() => 33,
      Dopio() => 76,
      TripleShot() => 99,
    },
  );
}

class Ristretto extends Espresso {
  Ristretto(EspressoShotCount shot)
      : super._(
    shot,
    switch (shot) {
      SingleShot() => 63,
      Dopio() => 126,
      TripleShot() => 189,
    },
    switch (shot) {
      SingleShot() => 17,
      Dopio() => 38,
      TripleShot() => 50,
    },
  );
}

class Lungo extends Espresso {
  Lungo(EspressoShotCount shot)
      : super._(
    shot,
    switch (shot) {
      SingleShot() => 80,
      Dopio() => 160,
      TripleShot() => 240,
    },
    switch (shot) {
      SingleShot() => 89,
      Dopio() => 203,
      TripleShot() => 266,
    },
  );
}

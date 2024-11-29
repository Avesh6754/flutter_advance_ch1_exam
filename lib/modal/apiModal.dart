class Apimodal {
  late Name name;
  List capital = [];
  late bool independent, unMember;

  List altSpellings = [];
  late String region;
  late dynamic area, population;
  late Maps maps;
  late Flags flags;

  Apimodal(
      {required this.name,
      required this.capital,
      required this.independent,
      required this.unMember,

      required this.altSpellings,
      required this.region,
      required this.area,
      required this.population,
      required this.maps,
      required this.flags});

  factory Apimodal.fromJson(Map m1) {
    return Apimodal(
        name: Name.fromJson(m1['name']),
        capital: m1['capital']??[],
        independent: m1['independent']?? false,
        unMember: m1['unMember']?? false,
        altSpellings: m1['altSpellings']??[],
        region: m1['region']??'unknown',
        area: m1['area']??353,
        population: m1['population']??9898,
        maps: Maps.fromJson(m1['maps']),
        flags: Flags.fromJson(m1['flags']));
  }
}

class Name {
  late String common;

  Name({required this.common});

  factory Name.fromJson(Map m1) {
    return Name(common: m1['common']??'unknown');
  }
}

class Maps {
  late String googleMaps, openStreetMaps;

  Maps({required this.googleMaps, required this.openStreetMaps});

  factory Maps.fromJson(Map m1) {
    return Maps(
        googleMaps: m1['googleMaps']??'unknown', openStreetMaps: m1['openStreetMaps']??'unknown');
  }
}

class Flags {
  late String pn, svg;

  Flags({required this.pn, required this.svg});

  factory Flags.fromJson(Map m1) {
    return Flags(pn: m1['png']??'unknown', svg: m1['svg']??'unknown');
  }
}

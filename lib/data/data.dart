import 'models/entry_model.dart';
import 'models/tag_model.dart';

class Data {
  //TODO: Make sure to edit always the same list
  static List<TagModel> tags = [
    TagModel(Tag.highlight, name: "Highlight", selected: false),
    TagModel(Tag.sights, name: "Sehenswürdigkeit", selected: false),
    TagModel(Tag.trips, name: "Ausflug", selected: false),
    TagModel(Tag.museum, name: "Museum", selected: false),
    TagModel(Tag.culture, name: "Kunst & Kultur", selected: false),
    TagModel(Tag.family, name: "Familie", selected: false),
    TagModel(Tag.party, name: "Ausgehen", selected: false),
    TagModel(Tag.food, name: "Restaurant", selected: false),
    TagModel(Tag.shopping, name: "Shopping", selected: false),
    TagModel(Tag.hotels, name: "Hotel", selected: false),
  ];

  static List<EntryModel> entryList = [
    EntryModel(
      id: "1",
      title: "Schifffahrt",
      description:
          "Nutzen Sie unsere Fähre und unsere Kursschiffe für Ihre Ausflüge auf dem Bodensee. Genießen Sie die Bodenseeregion auf unserer Fähre oder einem unserer Kursschiffe. Ein Abenteuer, dass sich mit den unzähligen Ausflugszielen der Region kombinieren lässt. Unser Restaurant direkt am Hafen in Romanshorn rundet Ihren Ausflug kulinarisch ab.",
      category: "Fähre",
      short: "1 km",
      tagsIds: [Tag.trips, Tag.family, Tag.highlight, Tag.food],
      imgWeb:
          "https://thurgau-bodensee.ch/assets/images/f/Bodensee_SBS_MS_St.Gallen_32-65ba7ff5.webp",
      imgPath: "assets/images/entries/shipping.jpg",
      liked: false,
    ),
    EntryModel(
      id: "2",
      title: "Hafen-Museum",
      description:
          "Das Museum zeigt die Entwicklung von Romanshorn als wichtige Verkehrs-Drehscheibe am Bodensee. Es ist modern und interaktiv gestaltet und bietet einen spannenden Einblick in die Geschichte der Stadt und ihrer Bewohner.",
      category: "Museum",
      short: "1 km",
      tagsIds: [Tag.culture, Tag.museum, Tag.family],
      imgWeb:
          "https://thurgau-bodensee.ch/assets/images/c/4e2d086a-321b5e93.jpg",
      imgPath: "assets/images/entries/museum.jpg",
      liked: false,
    ),
    EntryModel(
      id: "3",
      title: "Kino",
      description:
          "Das Kino bietet ein unterhaltsames und abwechslungsreiches Programm für Jung und Alt. Hier treffen sich Freunde, Familien und Paare, um gemeinsam einen unterhaltsamen Film zu sehen.",
      category: "Kino",
      short: "650 m",
      tagsIds: [Tag.culture, Tag.family, Tag.party],
      imgWeb:
          "https://thurgau-bodensee.ch/assets/images/4/ae745019-e898f223.jpg",
      imgPath: "assets/images/entries/cinema.jpg",
      liked: false,
    ),
    EntryModel(
      id: "4",
      title: "Strand Bar",
      description:
          "Wir bieten leckeren Kaffee, frisch gebackene Kuchen, feine Sandwiches, frische Salate und vieles mehr. Geniessen Sie die Sonne auf unserer grossen Terrasse oder im Strandkorb.",
      category: "Restaurant",
      short: "1,1 km",
      tagsIds: [Tag.party, Tag.food, Tag.family],
      imgWeb:
          "https://images.squarespace-cdn.com/content/v1/62066c5bf86a9127ee2813fa/ff086739-9ba0-4f46-a8e5-320623f3dfd5/20220616_191224_Gustav75.jpg?format=750w",
      imgPath: "assets/images/entries/bar.jpg",
      liked: false,
    ),

    EntryModel(
      id: "5",
      title: "Seebad",
      description:
          "Nach einem erlebnisreichen Tag, einer schönen Wanderung oder einer Velotour können Sie bei uns ein erfrischendes Bad nehmen und einfach entspannen.",
      category: "Schwimmbad",
      short: "1 km",
      tagsIds: [Tag.family, Tag.trips],
      imgWeb:
          "https://thurgau-bodensee.ch/assets/images/e/Seebad_Romanshorn-a956da4f.webp",
      imgPath: "assets/images/entries/bath.jpg",
      liked: false,
    ),
    EntryModel(
      id: "6",
      title: "Hotel am See",
      description:
          "Das Hotel direkt am Bodensee beitete Ihnen einen unvergesslichen Aufenthalt. Geniessen Sie die herrliche Aussicht auf den Bodensee und die Berge. Das Hotel ist der ideale Ausgangspunkt für Ausflüge in die Bodenseeregion. Gleichzeitig kann auch direkt vor Ort entspannt und lecker gegessen werden.",
      category: "Hotels",
      short: "1 km",
      tagsIds: [Tag.hotels, Tag.family],
      imgWeb:
          "https://thurgau-bodensee.ch/assets/images/5/6ddc9d95-08d8a1ac.jpg",
      imgPath: "assets/images/entries/hotel.jpg",
      liked: false,
    ),

    // Coupons
    EntryModel(
      id: "c1",
      title: "Fähren",
      description: "10% auf alle Fahrten",
      category: "Coupon",
      short: "10% Coupon",
      tagsIds: [Tag.shopping],
      imgWeb:
          "https://bodensee-schiffe.ch/wp-content/uploads/sites/5/2021/09/Silvester-Schiff-MS-St.-Gallen_4.jpg",
      imgPath: "assets/images/entries/sbs.jpg",
      liked: false,
    ),
    EntryModel(
      id: "c2",
      title: "Hafen Restaurant",
      description: "15% auf Alles",
      category: "Coupon",
      short: "15% Coupon",
      tagsIds: [Tag.shopping, Tag.food],
      imgWeb:
          "https://thurgau-bodensee.ch/assets/images/6/06d03257-60b88462.jpg",
      imgPath: "assets/images/entries/restaurant.jpg",
      liked: false,
    ),
    EntryModel(
      id: "c3",
      title: "Lecker Pizza",
      description: "10% auf Pizzen",
      category: "Coupon",
      short: "10% Coupon",
      tagsIds: [Tag.shopping, Tag.food],
      imgWeb:
          "https://www.mios-pizza.ch/wp-content/uploads/2022/10/pizzeria_75-1.jpg",
      imgPath: "assets/images/entries/pizza.jpg",
      liked: false,
    ),
  ];
}

enum Tag {
  highlight,
  sights,
  trips,
  culture,
  museum,
  family,
  party,
  food,
  shopping,
  hotels
}
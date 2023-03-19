import 'package:romanshorn/data/models/tag_model.dart';

import 'models/entry_model.dart';

class Data {
  //TODO: Make sure to edit always the same list
  static List<TagModel> tags = [
    TagModel(
      Tag.highlight,
      name: "Highlight",
      imgPath: "assets/images/tags/highlight.jpg",
      selected: false,
    ),
    TagModel(
      Tag.sights,
      name: "Sehenswürdigkeit",
      imgPath: "assets/images/tags/sights.jpg",
      selected: false,
    ),
    TagModel(
      Tag.trips,
      name: "Ausflug",
      imgPath: "assets/images/tags/trips.jpg",
      selected: false,
    ),
    TagModel(
      Tag.museum,
      name: "Museum",
      imgPath: "assets/images/tags/museum.jpg",
      selected: false,
    ),
    TagModel(
      Tag.culture,
      name: "Kunst & Kultur",
      imgPath: "assets/images/tags/culture.jpg",
      selected: false,
    ),
    TagModel(
      Tag.family,
      name: "Familie",
      imgPath: "assets/images/tags/family.jpg",
      selected: false,
    ),
    TagModel(
      Tag.party,
      name: "Ausgehen",
      imgPath: "assets/images/tags/party.jpg",
      selected: false,
    ),
    TagModel(
      Tag.food,
      name: "Restaurant",
      imgPath: "assets/images/tags/food.jpg",
      selected: false,
    ),
    TagModel(
      Tag.shopping,
      name: "Shopping",
      imgPath: "assets/images/tags/shopping.jpg",
      selected: false,
    ),
    TagModel(
      Tag.hotels,
      name: "Hotel",
      imgPath: "assets/images/tags/hotels.jpg",
      selected: false,
    ),
  ];

  static List<EntryModel> entryList = [
    EntryModel(
        id: "1",
        title: "Schifffahrt",
        description:
            "Geniessen Sie die Bodenseeregion auf unserer Fähre oder einem unserer Kursschiffe. Ein Abenteuer, dass sich einfach mit den unzähligen Ausflugszielen der Region kombinieren lässt. Auch im Bereich Erlebnisfahrten werden über 100 Fahrten zu 20 unterschiedlichen Themen angeboten. Unser Restaurant direkt am Hafen in Romanshorn rundet Ihren Ausflug kulinarisch ab.",
        category: "Fähre",
        short: "1 km",
        tagsIds: [Tag.trips, Tag.family, Tag.highlight, Tag.food],
        imgPath:
            "https://thurgau-bodensee.ch/assets/images/f/Bodensee_SBS_MS_St.Gallen_32-65ba7ff5.webp",
        liked: false),
    EntryModel(
        id: "2",
        title: "Museum am Hafen",
        description:
            "Das Museum am Hafen befindet sich im Dachstock des alten Zollhauses in Romanshorn. Es zeigt die Entwicklung von Romanshorn als wichtige Verkehrs-Drehscheibe am Bodensee und ist nach modernen Museums-Grundsätzen eingerichtet.",
        category: "Museum",
        short: "1 km",
        tagsIds: [Tag.culture, Tag.museum, Tag.family],
        imgPath:
            "https://thurgau-bodensee.ch/assets/images/c/4e2d086a-321b5e93.jpg",
        liked: false),
    EntryModel(
        id: "3",
        title: "Kino Roxy",
        description:
            "Das heutige Kino ROXY in Romanshorn war einst ein Filmtheater der ersten Stunde. Heute ist es ein modern ausgestatteter Treffpunkt für Filmliebhaber aller Interessen und fester Bestandteil des Romanshorner Kulturlebens.",
        category: "Kino",
        short: "650 m",
        tagsIds: [Tag.culture, Tag.family, Tag.party],
        imgPath:
            "https://thurgau-bodensee.ch/assets/images/4/ae745019-e898f223.jpg",
        liked: false),
    EntryModel(
        id: "4",
        title: "Gustav Kahn",
        description:
            "Ein erlesenes Angebot an Grilladen, vegetarischen Spezialitäten und Salaten stillt den Hunger und frisches Bier von der Bar erfrischt den Gaumen. Unkompliziert, kreativ und schnell lädt das Speiseangebot aus unserer «Kombüse» zum Verweilen ein.",
        category: "Restaurant",
        short: "1,1 km",
        tagsIds: [Tag.party, Tag.food, Tag.family],
        imgPath:
            "https://images.squarespace-cdn.com/content/v1/62066c5bf86a9127ee2813fa/ff086739-9ba0-4f46-a8e5-320623f3dfd5/20220616_191224_Gustav75.jpg?format=750w",
        liked: false),

    EntryModel(
        id: "5",
        title: "Seebad",
        description:
            "Sich im herrlich gelegenen Seebad Romanshorn nach einem erlebnisreichen Tag, einer schönen Wanderung oder einer Velotour ein erfrischendes Bad gönnen oder auch nur «sünnele» - da jubeln Körper und Seele!",
        category: "Schwimmbad",
        short: "1 km",
        tagsIds: [Tag.family, Tag.trips],
        imgPath:
            "https://thurgau-bodensee.ch/assets/images/e/Seebad_Romanshorn-a956da4f.webp",
        liked: false),
    EntryModel(
        id: "6",
        title: "Hotel Inseli",
        description:
            "Eingebettet in eine blumige Parkanlage direkt am Bodensee liegt das Park-Hotel Inseli in Romanshorn. Hier übernachten, feiern oder tagen Gäste mit Blick auf den See oder lassen sich im Panoramarestaurant auf der Seeterrasse oder in der Porto-Bar verwöhnen",
        category: "Hotels",
        short: "1 km",
        tagsIds: [Tag.hotels, Tag.family],
        imgPath:
            "https://thurgau-bodensee.ch/assets/images/5/6ddc9d95-08d8a1ac.jpg",
        liked: false),

    // Coupons
    EntryModel(
      id: "c1",
      title: "SBS",
      description: "10% auf dem Bodensee",
      category: "Coupon",
      short: "10% Coupon",
      tagsIds: [Tag.shopping],
      imgPath:
          "https://bodensee-schiffe.ch/wp-content/uploads/sites/5/2021/09/Silvester-Schiff-MS-St.-Gallen_4.jpg",
      liked: false,
    ),
    EntryModel(
      id: "c2",
      title: "Restaurant HAFEN",
      description: "15% auf Alles",
      category: "Coupon",
      short: "15% Coupon",
      tagsIds: [Tag.shopping, Tag.food],
      imgPath:
          "https://thurgau-bodensee.ch/assets/images/6/06d03257-60b88462.jpg",
      liked: false,
    ),
    EntryModel(
      id: "c3",
      title: "Mio Pizza",
      description: "10% auf Pizzen",
      category: "Coupon",
      short: "10% Coupon",
      tagsIds: [Tag.shopping, Tag.food],
      imgPath:
          "https://www.mios-pizza.ch/wp-content/uploads/2022/10/pizzeria_75-1.jpg",
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

// get tagString from Tag

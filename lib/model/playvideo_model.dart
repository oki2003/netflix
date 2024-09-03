import 'dart:convert';
import 'package:netflix/Object/Movie.dart';
import 'package:netflix/Object/Review.dart';
import 'package:netflix/Object/Video.dart';
import 'package:http/http.dart' as http;

Future<List> fechtContentVideo(Movie movie) async {
  //reviews of movie
  final responseReviews = await http.Client().get(Uri.parse(
      "https://api.themoviedb.org/3/movie/${movie.id}/reviews?api_key=23f1e4dc64dcdfe853dd2aee44cf082d"));
  //videos of movie
  final responseVideos = await http.Client().get(Uri.parse(
      "https://api.themoviedb.org/3/movie/${movie.id}/videos?api_key=23f1e4dc64dcdfe853dd2aee44cf082d"));
  //movie details
  final responseDetailMovie = await http.Client().get(Uri.parse(
      "https://api.themoviedb.org/3/movie/${movie.id}?api_key=23f1e4dc64dcdfe853dd2aee44cf082d"));
  if (responseReviews.statusCode == 200 &&
      responseVideos.statusCode == 200 &&
      responseDetailMovie.statusCode == 200) {
    final jsonReviews = (jsonDecode(responseReviews.body)["results"] as List)
        .map((reivew) => Review.fromJson(reivew))
        .toList();
    final jsonVideos = (jsonDecode(responseVideos.body)["results"] as List)
        .map((video) => Video.fromJson(video))
        .toList();
    final jsonDetailMovie = jsonDecode(responseDetailMovie.body);
    return [jsonVideos, jsonReviews, jsonDetailMovie];
  } else {
    return [];
  }
}

// Future<List> fechtContentVideo(Movie movie) async {
//   return [
//     [
//       {
//         "iso_639_1": "en",
//         "iso_3166_1": "US",
//         "name": "Billion with a B",
//         "key": "PWdtBp5opqw",
//         "site": "YouTube",
//         "size": 1080,
//         "type": "Teaser",
//         "official": true,
//         "published_at": "2024-08-11T17:01:35.000Z",
//         "id": "66b9af137016621fb072d9a3"
//       },
//       {
//         "iso_639_1": "en",
//         "iso_3166_1": "US",
//         "name": "Flame On",
//         "key": "YyVAwYCzuDk",
//         "site": "YouTube",
//         "size": 1080,
//         "type": "Teaser",
//         "official": true,
//         "published_at": "2024-08-10T16:00:34.000Z",
//         "id": "66b8433586cd6c9ecba7d971"
//       },
//       {
//         "iso_639_1": "en",
//         "iso_3166_1": "US",
//         "name": "Portal",
//         "key": "YBYOuQJ5Wno",
//         "site": "YouTube",
//         "size": 1080,
//         "type": "Teaser",
//         "official": true,
//         "published_at": "2024-08-09T16:00:35.000Z",
//         "id": "66b84340664dbd1625aab629"
//       },
//       {
//         "iso_639_1": "en",
//         "iso_3166_1": "US",
//         "name": "Smashing",
//         "key": "qhAB4Y1VrO8",
//         "site": "YouTube",
//         "size": 1080,
//         "type": "Teaser",
//         "official": true,
//         "published_at": "2024-08-08T20:00:30.000Z",
//         "id": "66b57d92cf10bee8a8c5e71b"
//       },
//       {
//         "iso_639_1": "en",
//         "iso_3166_1": "US",
//         "name": "Crying",
//         "key": "BId1AMHzItQ",
//         "site": "YouTube",
//         "size": 1080,
//         "type": "Teaser",
//         "official": true,
//         "published_at": "2024-08-03T16:00:10.000Z",
//         "id": "66aeb0171b9fd9ffd700f0de"
//       },
//       {
//         "iso_639_1": "en",
//         "iso_3166_1": "US",
//         "name":
//             "Watch Deadpool & Wolverine again and again and again and again and again and again and again and aga",
//         "key": "XBLJ6XOCBdY",
//         "site": "YouTube",
//         "size": 1080,
//         "type": "Featurette",
//         "official": true,
//         "published_at": "2024-08-03T01:30:56.000Z",
//         "id": "66aeb0310fbfa33dc400f0ca"
//       },
//       {
//         "iso_639_1": "en",
//         "iso_3166_1": "US",
//         "name": "Smash",
//         "key": "QQ_jvHQM53o",
//         "site": "YouTube",
//         "size": 1080,
//         "type": "Teaser",
//         "official": true,
//         "published_at": "2024-08-02T17:00:29.000Z",
//         "id": "66aeaffeca4548c3b0b2caa3"
//       },
//       {
//         "iso_639_1": "en",
//         "iso_3166_1": "US",
//         "name": "Score",
//         "key": "G9BWRaXdA-M",
//         "site": "YouTube",
//         "size": 1080,
//         "type": "Behind the Scenes",
//         "official": true,
//         "published_at": "2024-08-01T16:00:13.000Z",
//         "id": "66abbc6431e9e123f0507b07"
//       },
//       {
//         "iso_639_1": "en",
//         "iso_3166_1": "US",
//         "name": "Dogpool Blooper",
//         "key": "45LohjMTJOM",
//         "site": "YouTube",
//         "size": 720,
//         "type": "Bloopers",
//         "official": true,
//         "published_at": "2024-07-30T22:16:28.000Z",
//         "id": "66abbdba264b247a70f8e1a7"
//       },
//       {
//         "iso_639_1": "en",
//         "iso_3166_1": "US",
//         "name": "Thank You, Ray Chan",
//         "key": "3yPfmJMzVVY",
//         "site": "YouTube",
//         "size": 1080,
//         "type": "Behind the Scenes",
//         "official": true,
//         "published_at": "2024-07-30T16:00:03.000Z",
//         "id": "66a9ca1a08dbe0dcbb02fd39"
//       },
//       {
//         "iso_639_1": "en",
//         "iso_3166_1": "US",
//         "name": "Ultimate Deadpool & Wolverine Celebration of Life",
//         "key": "9Bo_GQtD7vo",
//         "site": "YouTube",
//         "size": 1080,
//         "type": "Featurette",
//         "official": true,
//         "published_at": "2024-07-27T19:30:00.000Z",
//         "id": "66abbd0176c8d5d7bdf513a5"
//       },
//       {
//         "iso_639_1": "en",
//         "iso_3166_1": "US",
//         "name": "Deadpool & Wolverine & Walking4Hope",
//         "key": "XfD4F9E3yX0",
//         "site": "YouTube",
//         "size": 1080,
//         "type": "Featurette",
//         "official": true,
//         "published_at": "2024-07-26T18:59:58.000Z",
//         "id": "66abbda5b268a2bdb45c8452"
//       },
//       {
//         "iso_639_1": "en",
//         "iso_3166_1": "US",
//         "name": "Legendary",
//         "key": "dIpNpMfGxK8",
//         "site": "YouTube",
//         "size": 1080,
//         "type": "Teaser",
//         "official": true,
//         "published_at": "2024-07-25T19:01:59.000Z",
//         "id": "66a2a42585b44ccacd0a0ead"
//       },
//       {
//         "iso_639_1": "en",
//         "iso_3166_1": "US",
//         "name": "Go",
//         "key": "eoFCmgF8Cjs",
//         "site": "YouTube",
//         "size": 1080,
//         "type": "Teaser",
//         "official": true,
//         "published_at": "2024-07-25T15:00:42.000Z",
//         "id": "66a29d6043ee488ea1e7fda0"
//       },
//       {
//         "iso_639_1": "en",
//         "iso_3166_1": "US",
//         "name": "Official IMAX® Interview",
//         "key": "xdUc7qURlk4",
//         "site": "YouTube",
//         "size": 1080,
//         "type": "Featurette",
//         "official": true,
//         "published_at": "2024-07-25T04:50:34.000Z",
//         "id": "66a542ab4df5b07f2eb14759"
//       },
//       {
//         "iso_639_1": "en",
//         "iso_3166_1": "US",
//         "name": "Pray",
//         "key": "u06vqfLcBas",
//         "site": "YouTube",
//         "size": 1080,
//         "type": "Teaser",
//         "official": true,
//         "published_at": "2024-07-24T15:49:03.000Z",
//         "id": "66a17e8db27abfd91335fc19"
//       },
//       {
//         "iso_639_1": "en",
//         "iso_3166_1": "US",
//         "name": "Gear Up",
//         "key": "ETuda6ZGQkU",
//         "site": "YouTube",
//         "size": 1080,
//         "type": "Teaser",
//         "official": true,
//         "published_at": "2024-07-22T15:00:11.000Z",
//         "id": "66a192eab0908f4b03c812ac"
//       },
//       {
//         "iso_639_1": "en",
//         "iso_3166_1": "US",
//         "name": "This Friday",
//         "key": "UffWG-yFGgw",
//         "site": "YouTube",
//         "size": 1080,
//         "type": "Teaser",
//         "official": true,
//         "published_at": "2024-07-21T16:00:32.000Z",
//         "id": "669d9b6c428a1d9907779e39"
//       },
//       {
//         "iso_639_1": "en",
//         "iso_3166_1": "US",
//         "name": "Deadpool & Wolverine in the Studio",
//         "key": "8BjXzXq3O5A",
//         "site": "YouTube",
//         "size": 1080,
//         "type": "Featurette",
//         "official": false,
//         "published_at": "2024-07-19T19:24:38.000Z",
//         "id": "669d9b872bc6164f536c8ad7"
//       },
//       {
//         "iso_639_1": "en",
//         "iso_3166_1": "US",
//         "name": "Final Trailer",
//         "key": "Idh8n5XuYIA",
//         "site": "YouTube",
//         "size": 1080,
//         "type": "Trailer",
//         "official": true,
//         "published_at": "2024-07-19T14:00:23.000Z",
//         "id": "669a8ad15777920d534e6606"
//       },
//       {
//         "iso_639_1": "en",
//         "iso_3166_1": "US",
//         "name": "Everyone",
//         "key": "C2QCuBX_byg",
//         "site": "YouTube",
//         "size": 1080,
//         "type": "Teaser",
//         "official": true,
//         "published_at": "2024-07-16T15:00:11.000Z",
//         "id": "6696909663380e4993be74c6"
//       },
//       {
//         "iso_639_1": "en",
//         "iso_3166_1": "US",
//         "name": "Can’t Unsee It",
//         "key": "eN2rNIgy9JQ",
//         "site": "YouTube",
//         "size": 1080,
//         "type": "Teaser",
//         "official": true,
//         "published_at": "2024-07-15T11:00:01.000Z",
//         "id": "66953dd30c4c61e4f0168724"
//       },
//       {
//         "iso_639_1": "en",
//         "iso_3166_1": "US",
//         "name": "Pumped",
//         "key": "eS-MpmL6fPc",
//         "site": "YouTube",
//         "size": 1080,
//         "type": "Teaser",
//         "official": true,
//         "published_at": "2024-07-12T16:00:44.000Z",
//         "id": "669199858b0fa7f0d7f19d42"
//       },
//       {
//         "iso_639_1": "en",
//         "iso_3166_1": "US",
//         "name": "Deadpool & Wolverine & The Bachelorette",
//         "key": "S2sBNY9Wg8o",
//         "site": "YouTube",
//         "size": 1080,
//         "type": "Featurette",
//         "official": true,
//         "published_at": "2024-07-09T16:54:39.000Z",
//         "id": "6691f42d96716b2eee6e37ec"
//       },
//       {
//         "iso_639_1": "en",
//         "iso_3166_1": "US",
//         "name": "Purpose",
//         "key": "Up6hJCihbL8",
//         "site": "YouTube",
//         "size": 1080,
//         "type": "Teaser",
//         "official": true,
//         "published_at": "2024-07-09T16:00:32.000Z",
//         "id": "668d6b74c0ea0ce79071bb41"
//       },
//       {
//         "iso_639_1": "en",
//         "iso_3166_1": "US",
//         "name": "World Tour",
//         "key": "LYuc1wDC318",
//         "site": "YouTube",
//         "size": 1080,
//         "type": "Featurette",
//         "official": true,
//         "published_at": "2024-07-06T22:34:28.000Z",
//         "id": "668b842b9f3f305a639a0670"
//       },
//       {
//         "iso_639_1": "en",
//         "iso_3166_1": "US",
//         "name": "Shanghai Fan Event",
//         "key": "qoAYNhOWol8",
//         "site": "YouTube",
//         "size": 1080,
//         "type": "Featurette",
//         "official": true,
//         "published_at": "2024-07-03T02:38:06.000Z",
//         "id": "6684da33f6813e41938f1e20"
//       },
//       {
//         "iso_639_1": "en",
//         "iso_3166_1": "US",
//         "name": "LFG",
//         "key": "pABY-rpsfH4",
//         "site": "YouTube",
//         "size": 1080,
//         "type": "Teaser",
//         "official": true,
//         "published_at": "2024-07-01T16:00:49.000Z",
//         "id": "6684da156e16130ed075ee02"
//       },
//       {
//         "iso_639_1": "en",
//         "iso_3166_1": "US",
//         "name": "Nice",
//         "key": "r3LisZEIK34",
//         "site": "YouTube",
//         "size": 1080,
//         "type": "Teaser",
//         "official": true,
//         "published_at": "2024-06-28T13:12:08.000Z",
//         "id": "667ee0b24729acf6c9007431"
//       },
//       {
//         "iso_639_1": "en",
//         "iso_3166_1": "US",
//         "name": "Best Friends Day",
//         "key": "pn5fdK61o9c",
//         "site": "YouTube",
//         "size": 1080,
//         "type": "Teaser",
//         "official": true,
//         "published_at": "2024-06-08T16:00:40.000Z",
//         "id": "66669a7829661fd491dda78a"
//       },
//       {
//         "iso_639_1": "en",
//         "iso_3166_1": "US",
//         "name": "The Deadpool And Wolverine popcorn bucket has arrived",
//         "key": "ewkLcCQ1O-0",
//         "site": "YouTube",
//         "size": 1080,
//         "type": "Featurette",
//         "official": true,
//         "published_at": "2024-05-30T17:27:52.000Z",
//         "id": "665d8f00e6b575c8da81b176"
//       },
//       {
//         "iso_639_1": "en",
//         "iso_3166_1": "US",
//         "name": "Tickets On Sale",
//         "key": "Esc_qtkULBE",
//         "site": "YouTube",
//         "size": 1080,
//         "type": "Teaser",
//         "official": true,
//         "published_at": "2024-05-21T15:00:18.000Z",
//         "id": "664dba2682a2ffadf09ac25c"
//       },
//       {
//         "iso_639_1": "en",
//         "iso_3166_1": "US",
//         "name": "Heineken Silver - World-Class Light Beer for World-Class Bubs",
//         "key": "NebqFm0PoVw",
//         "site": "YouTube",
//         "size": 1080,
//         "type": "Featurette",
//         "official": false,
//         "published_at": "2024-05-20T20:26:36.000Z",
//         "id": "665bac89d42cd806d247e63e"
//       },
//       {
//         "iso_639_1": "en",
//         "iso_3166_1": "US",
//         "name": "Get Tickets Now",
//         "key": "YLswizPsdYk",
//         "site": "YouTube",
//         "size": 1080,
//         "type": "Featurette",
//         "official": true,
//         "published_at": "2024-05-20T15:00:05.000Z",
//         "id": "664dba3f0bbde63500fd129c"
//       },
//       {
//         "iso_639_1": "en",
//         "iso_3166_1": "US",
//         "name": "Tickets On Sale Now",
//         "key": "2I5aSPn_eYQ",
//         "site": "YouTube",
//         "size": 1080,
//         "type": "Teaser",
//         "official": true,
//         "published_at": "2024-05-20T13:00:00.000Z",
//         "id": "664dba4b28cc6d3f18f275c1"
//       },
//       {
//         "iso_639_1": "en",
//         "iso_3166_1": "US",
//         "name": "Disclaimers",
//         "key": "pCdR7mgWT4s",
//         "site": "YouTube",
//         "size": 1080,
//         "type": "Featurette",
//         "official": true,
//         "published_at": "2024-05-19T16:50:11.000Z",
//         "id": "664db928e9b4172c3413f88f"
//       },
//       {
//         "iso_639_1": "en",
//         "iso_3166_1": "US",
//         "name": "Official Trailer",
//         "key": "73_1biulkYk",
//         "site": "YouTube",
//         "size": 1080,
//         "type": "Trailer",
//         "official": true,
//         "published_at": "2024-04-22T13:00:09.000Z",
//         "id": "662668b62dda890149e08b9b"
//       },
//       {
//         "iso_639_1": "en",
//         "iso_3166_1": "US",
//         "name": "Trailer Tomorrow",
//         "key": "umxRwIKOPA4",
//         "site": "YouTube",
//         "size": 1080,
//         "type": "Teaser",
//         "official": true,
//         "published_at": "2024-04-21T18:55:37.000Z",
//         "id": "6625761707faa2018799f02a"
//       },
//       {
//         "iso_639_1": "en",
//         "iso_3166_1": "US",
//         "name": "Official Teaser",
//         "key": "uJMCNJP2ipI",
//         "site": "YouTube",
//         "size": 1080,
//         "type": "Teaser",
//         "official": true,
//         "published_at": "2024-02-11T23:36:49.000Z",
//         "id": "65c95bb74350110162e86f46"
//       },
//       {
//         "iso_639_1": "en",
//         "iso_3166_1": "US",
//         "name": "Deadpool Update, Part Hugh",
//         "key": "Szj1iqYanFM",
//         "site": "YouTube",
//         "size": 1080,
//         "type": "Featurette",
//         "official": true,
//         "published_at": "2022-09-28T12:41:05.000Z",
//         "id": "633552dcbbd0b0007a5756f3"
//       },
//       {
//         "iso_639_1": "en",
//         "iso_3166_1": "US",
//         "name": "Deadpool Update",
//         "key": "Yd47Z8HYf0Y",
//         "site": "YouTube",
//         "size": 1080,
//         "type": "Featurette",
//         "official": true,
//         "published_at": "2022-09-27T21:00:53.000Z",
//         "id": "633546de528b2e007c0a4021"
//       }
//     ].map((video) => Video.fromJson(video)).toList(),
//     [
//       {
//         "author": "Hotplix",
//         "author_details": {
//           "name": "Hotplix",
//           "username": "Hotplix",
//           "avatar_path": "/5LdGr01PGRmrg6Hh3LYPGlOOdUx.jpg",
//           "rating": 8
//         },
//         "content":
//             "\"Despicable Me 4\" is a delightful addition to the beloved animated franchise, bringing back the charm and humor that fans adore. Directed by Kyle Balda, the film sees the return of Gru, voiced by Steve Carell, and his mischievous Minions on another entertaining adventure. The movie balances heartwarming moments with laugh-out-loud comedy, introducing fresh characters and creative plot twists. The animation is vibrant and engaging, while the voice cast delivers standout performances. \"Despicable Me 4\" continues to capture the magic of the series, making it a fun and enjoyable watch for audiences of all ages.",
//         "created_at": "2024-06-06T10:44:55.424Z",
//         "id": "666193270936853b78cbb431",
//         "updated_at": "2024-06-06T21:27:03.171Z",
//         "url": "https://www.themoviedb.org/review/666193270936853b78cbb431"
//       },
//       {
//         "author": "Chris Sawin",
//         "author_details": {
//           "name": "Chris Sawin",
//           "username": "ChrisSawin",
//           "avatar_path": null,
//           "rating": null
//         },
//         "content":
//             "It's trash. Don't see it. \r\n\r\n**Full review:** https://bit.ly/Grupid",
//         "created_at": "2024-07-03T00:53:29.806Z",
//         "id": "6684a1092e1cdebdebc68865",
//         "updated_at": "2024-07-03T00:53:29.928Z",
//         "url": "https://www.themoviedb.org/review/6684a1092e1cdebdebc68865"
//       },
//       {
//         "author": "TheSceneSnobs",
//         "author_details": {
//           "name": "",
//           "username": "TheSceneSnobs",
//           "avatar_path": null,
//           "rating": 6
//         },
//         "content":
//             "There are so many movies within the Despicable Me franchise that I've lost count of all the storylines in each. While I've never been a big fan of these movies, they at least always felt exciting. However, this fourth installment in the Gru storyline is little more than a dud. The silliness and excitement are there for younger audiences, but the film lacks heart.\r\n\r\nOne of the main problems with the Despicable Me movies is the tendency to pile on more characters just to add celebrity voices to the cast. This fourth movie is no exception. While the addition of new characters can sometimes breathe fresh life into a franchise, here it feels like a missed opportunity to develop a more heartfelt story. For instance, the introduction of a new, younger female character named Poppy as a heist partner for Gru could have been a chance to add depth. However, it might have been more impactful to see Gru partnering with his oldest daughter, who is now a teenager. This would have added a layer of connection and growth between Gru and his daughter, showcasing his evolving role as a father.\r\n\r\nThe film also introduces a subplot where some Minions are turned into a superhero team, only to be used in the movie for less than 10 minutes. This subplot feels like a wasted narrative thread that could have added excitement and depth to the story. Additionally, one of the main Minions, Ralph, is stuck on a vending machine for the entirety of the movie, reducing his role to a mere gag. This sidelining of key characters in favor of introducing new ones dilutes the emotional core that could have made the story more engaging. \r\n\r\nWhile my son enjoyed the movie, which makes sense for his age range, it’s important for these films to also entertain the parents who are watching with their children. The earlier movies in the franchise managed to strike a balance between humor for kids and clever moments for adults. This installment, however, feels more like a series of gags strung together rather than a cohesive story with emotional weight.\r\n\r\nIf there are more films in the Despicable Me series, I believe it’s time to hang it up. However, if the franchise continues, I will wait for streaming to watch them because I am not interested in seeing them in theaters. The magic that made the original films entertaining for a broad audience seems to have faded, and without a significant shift in storytelling, future installments are likely to feel just as lackluster.",
//         "created_at": "2024-07-09T14:24:00.700Z",
//         "id": "668d480067947cfba5314de5",
//         "updated_at": "2024-07-12T18:44:29.593Z",
//         "url": "https://www.themoviedb.org/review/668d480067947cfba5314de5"
//       },
//       {
//         "author": "CinemaSerf",
//         "author_details": {
//           "name": "CinemaSerf",
//           "username": "Geronimo1967",
//           "avatar_path": "/1kks3YnVkpyQxzw36CObFPvhL5f.jpg",
//           "rating": 6
//         },
//         "content":
//             "If it's not sacrilegious to say, I think this franchise is starting to run out of steam - the plot here isn't very original. The family \"Gru\" have a new child who doesn't much take to his father which only makes matters worse when arch-nemesis \"Maxime Le Mal\" - who is intent on turning everyone into cockroaches - escapes from custody bent on revenge on the man who put him in jail in the first place. Better safe than sorry, \"Silas\" relocates the family to a safe house where they have to pretend to fit in with the vacuous tennis club set, but one of that number - the feisty \"Poppy\" knows the secret and blackmails \"Gru\" into helping her pinch \"Lenny\" the badger from under the eyes of the diminutive \"Principal Übelschlecht\" at his alma mater. This adventure narks the headmistress and when she sees some video of the perpetrators, she's straight on to the phone with \"Maxime\" who hatches a plan to steal the baby and give him wings! The minions - and the newly formed and enhanced \"Super Minions\" - still manage to have some fun here as they discover their new home has a vending machine and an endless supply of popcorn, and there is some wit in the dialogue but the story itself is all pretty derivative and the animation looks a little too tired now. What was ground-breaking looks so much less now and the writing and characterisations are nothing special anymore. It does liven up for the last ten minutes, but the previously innovative and enjoyable mix of menace and mayhem has largely gone.",
//         "created_at": "2024-07-16T07:48:57.825Z",
//         "id": "669625e9ab87253c1ff3b0fa",
//         "updated_at": "2024-07-16T07:48:58.379Z",
//         "url": "https://www.themoviedb.org/review/669625e9ab87253c1ff3b0fa"
//       },
//       {
//         "author": "Louisa Moore - Screen Zealots",
//         "author_details": {
//           "name": "Louisa Moore - Screen Zealots",
//           "username": "screenzealots",
//           "avatar_path": null,
//           "rating": 3
//         },
//         "content":
//             "The goofy Minions are on the loose again in “Despicable Me 4,” a lazy sequel that does little more to advance the franchise other than embodying the old adage of “style over substance” to a fault. There is very little here to recommend other than the first class technical achievements (the visuals are stunning, and the direction is better than expected for an animated film), making this installment feel more like a mindless baby sitter rather than a thoughtful exercise in creativity and storytelling.\r\n\r\nFormer supervillian Gru (voice of Steve Carell) is living the good life with his wife Lucy (voice of Kristen Wiig), his daughters Margo (voice of Miranda Cosgrove), Edith (voice of Dana Gaier), and Agnes (voice of Madison Skyy Polan), and new baby Gru Jr., who proves to be a handful for his daddy. Their peaceful routine is sent into chaos when the evil Maxime Le Mal (voice of Will Ferrell) and his girlfriend Valentina (voice of Sofía Vergara) escape from prison and set their sights on a new nemesis and potential target: Gru. This forces the family to go on the run and assume new identities in the suburbs.\r\n\r\nThe plot is basic and sounds like it could be a lot of fun with its fish out of water spin. Unfortunately, very little is done with the story. The film bounces back and forth with a lame narrative and cute Minions taking part in a variety of wacky, screwball antics, which may provide a good balance for adults and kids, but nothing about any of it works well. The far too simple and sparse story meanders between uninspired plot points and predictable characters arcs, never quite finding its footing. In other words, the movie is just plain dumb.\r\n\r\nThe introduction of the Mega Minions is mildly fun and entertaining, but it runs out of steam fast (I fear these characters are going to spin off into what will inevitably be another lackluster film). Everything else is a shallow gimmick as the movie struggles to maintain momentum. At least it’s true to the “Despicable Me” canon, but the film also shows that there’s only so much you can do with these characters and this universe. Move along: there’s nothing original to see here.\r\n\r\n“Despicable Me 4” is a lazy movie overall, which is a shame because the technical aspects are so excellent.\r\n\r\nBy: Louisa Moore / SCREEN ZEALOTS",
//         "created_at": "2024-07-17T00:28:34.245Z",
//         "id": "66971032e148afad96c108b9",
//         "updated_at": "2024-07-17T00:28:34.367Z",
//         "url": "https://www.themoviedb.org/review/66971032e148afad96c108b9"
//       },
//       {
//         "author": "Louisa Moore - Screen Zealots",
//         "author_details": {
//           "name": "Louisa Moore - Screen Zealots",
//           "username": "screenzealots",
//           "avatar_path": null,
//           "rating": 3
//         },
//         "content":
//             "The goofy Minions are on the loose again in “Despicable Me 4,” a lazy sequel that does little more to advance the franchise other than embodying the old adage of “style over substance” to a fault. There is very little here to recommend other than the first class technical achievements (the visuals are stunning, and the direction is better than expected for an animated film), making this installment feel more like a mindless baby sitter rather than a thoughtful exercise in creativity and storytelling.\r\n\r\nFormer supervillian Gru (voice of Steve Carell) is living the good life with his wife Lucy (voice of Kristen Wiig), his daughters Margo (voice of Miranda Cosgrove), Edith (voice of Dana Gaier), and Agnes (voice of Madison Skyy Polan), and new baby Gru Jr., who proves to be a handful for his daddy. Their peaceful routine is sent into chaos when the evil Maxime Le Mal (voice of Will Ferrell) and his girlfriend Valentina (voice of Sofía Vergara) escape from prison and set their sights on a new nemesis and potential target: Gru. This forces the family to go on the run and assume new identities in the suburbs.\r\n\r\nThe plot is basic and sounds like it could be a lot of fun with its fish out of water spin. Unfortunately, very little is done with the story. The film bounces back and forth with a lame narrative and cute Minions taking part in a variety of wacky, screwball antics, which may provide a good balance for adults and kids, but nothing about any of it works well. The far too simple and sparse story meanders between uninspired plot points and predictable characters arcs, never quite finding its footing. In other words, the movie is just plain dumb.\r\n\r\nThe introduction of the Mega Minions is mildly fun and entertaining, but it runs out of steam fast (I fear these characters are going to spin off into what will inevitably be another lackluster film). Everything else is a shallow gimmick as the movie struggles to maintain momentum. At least it’s true to the “Despicable Me” canon, but the film also shows that there’s only so much you can do with these characters and this universe. Move along: there’s nothing original to see here.\r\n\r\n“Despicable Me 4” is a lazy movie overall, which is a shame because the technical aspects are so excellent.\r\n\r\nBy: Louisa Moore / SCREEN ZEALOTS",
//         "created_at": "2024-07-17T17:05:46.946Z",
//         "id": "6697f9ea819e3e78f6c968ec",
//         "updated_at": "2024-07-17T17:05:47.022Z",
//         "url": "https://www.themoviedb.org/review/6697f9ea819e3e78f6c968ec"
//       },
//       {
//         "author": "UWotMatez",
//         "author_details": {
//           "name": "",
//           "username": "UWotMatez",
//           "avatar_path": null,
//           "rating": 3
//         },
//         "content":
//             "Felt like it wasn't sure what its own film was trying to accomplish at all. \r\nOne minute we're watching gru back in the AVL capturing another infamous villain thats known gru since high school. Only for him to escape and supposedly hunting gru back down in revenge.. which takes only the whole movie to find him.\r\n\r\nNo joke, its like waiting for Bart or Vector to go after gru but never finding any result till the last 10 minutes. Its a VERY BORING movie. Yes its for children but the first two films I felt like both adults and kids could enjoy it. \r\n\r\nEven the minions were meh in this, I usually have some chuckles if not with gru and his kids/family. They felt phoned in as well. Maybe its about time we stop making these yeah?\r\n\r\nOn a side note gru has a kid who can clearly understand english which tells me hes at least 2-3. Yet his adopted children are still the exact same age? This only works in television cartoon shows I feel like, especially when time has progressed since gru and lucy have been married. Either have the girls grow up too or don't have a baby in the film as if time skipped.",
//         "created_at": "2024-08-12T02:16:07.845Z",
//         "id": "66b970672ee265f3b8d5b4dd",
//         "updated_at": "2024-08-13T03:16:15.805Z",
//         "url": "https://www.themoviedb.org/review/66b970672ee265f3b8d5b4dd"
//       }
//     ].map((reivew) => Review.fromJson(reivew)).toList(),
//     {
//       "adult": false,
//       "backdrop_path": "/yDHYTfA3R0jFYba16jBB1ef8oIt.jpg",
//       "belongs_to_collection": {
//         "id": 448150,
//         "name": "Deadpool Collection",
//         "poster_path": "/30c5jO7YEXuF8KiWXLg9m28GWDA.jpg",
//         "backdrop_path": "/hBQOWY8qWXJVFAc8yLTh1teIu43.jpg"
//       },
//       "budget": 200000000,
//       "genres": [
//         {"id": 28, "name": "Action"},
//         {"id": 35, "name": "Comedy"},
//         {"id": 878, "name": "Science Fiction"}
//       ],
//       "homepage": "https://www.marvel.com/movies/deadpool-and-wolverine",
//       "id": 533535,
//       "imdb_id": "tt6263850",
//       "origin_country": ["US"],
//       "original_language": "en",
//       "original_title": "Deadpool & Wolverine",
//       "overview":
//           "A listless Wade Wilson toils away in civilian life with his days as the morally flexible mercenary, Deadpool, behind him. But when his homeworld faces an existential threat, Wade must reluctantly suit-up again with an even more reluctant Wolverine.",
//       "popularity": 9734.605,
//       "poster_path": "/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg",
//       "production_companies": [
//         {
//           "id": 420,
//           "logo_path": "/hUzeosd33nzE5MCNsZxCGEKTXaQ.png",
//           "name": "Marvel Studios",
//           "origin_country": "US"
//         },
//         {
//           "id": 104228,
//           "logo_path": "/hx0C1XcSxGgat8N62GpxoJGTkCk.png",
//           "name": "Maximum Effort",
//           "origin_country": "US"
//         },
//         {
//           "id": 2575,
//           "logo_path": "/9YJrHYlcfHtwtulkFMAies3aFEl.png",
//           "name": "21 Laps Entertainment",
//           "origin_country": "US"
//         },
//         {
//           "id": 127928,
//           "logo_path": "/h0rjX5vjW5r8yEnUBStFarjcLT4.png",
//           "name": "20th Century Studios",
//           "origin_country": "US"
//         },
//         {
//           "id": 176762,
//           "logo_path": null,
//           "name": "Kevin Feige Productions",
//           "origin_country": "US"
//         },
//         {
//           "id": 22213,
//           "logo_path": "/qx9K6bFWJupwde0xQDwOvXkOaL8.png",
//           "name": "TSG Entertainment",
//           "origin_country": "US"
//         }
//       ],
//       "production_countries": [
//         {"iso_3166_1": "US", "name": "United States of America"}
//       ],
//       "release_date": "2024-07-24",
//       "revenue": 1043180185,
//       "runtime": 128,
//       "spoken_languages": [
//         {"english_name": "English", "iso_639_1": "en", "name": "English"}
//       ],
//       "status": "Released",
//       "tagline": "Come together.",
//       "title": "Deadpool & Wolverine",
//       "video": false,
//       "vote_average": 7.839,
//       "vote_count": 1833
//     }
//   ];
// }

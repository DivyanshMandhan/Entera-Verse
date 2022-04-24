// ignore_for_file: prefer_const_constructors, prefer_const_declarations

import 'package:entve/assets.dart';
import 'package:entve/models/content_model.dart';
import 'package:flutter/material.dart';

final Content moonKnightContent = Content(
  name: 'Moon Knight',
  imageUrl: Assets.moonKnight,
  titleImageUrl: Assets.moonKnightTitle,
  videoUrl: Assets.moonKnightVideoUrl,
  categories: 'Action/Adventure/Fantasy/Psychological/Horror/Superhero',
  year: 2022,
  length: 50,
  episodes: 6,
  rating: '7.7',
  description:
      "Moon Knight follows Steven Grant, a mild-mannered gift-shop employee, who becomes\nplagued with blackouts and memories of another life. Steven discovers he has\ndissociative identity disorder and shares a body with mercenary Marc Spector.",
);

final List<Content> previews = [
  Content(
    name: 'Spider-Man: No Way Home',
    imageUrl: Assets.spiderman,
    color: Colors.orange,
    videoUrl: Assets.spidermanVideoUrl,
  ),
  Content(
    name: 'No Exit',
    imageUrl: Assets.noexit,
    color: Colors.red,
    videoUrl: Assets.noexitVideoUrl,
    categories: 'Drama/Mystery/Thriller',
    year: 2022,
    length: 95,
    episodes: 0,
    rating: '6.1',
    description:
        "A college student, on her way home from visiting her mother, gets stuck with a group of people at a mountain rest stop during a blizzard. Things take a turn for the worse when the young woman discovers a kidnapped child in a car belonging to one of the people inside, putting the group in a terrifying life-or-death situation as they struggle to escape while trying to discover who among them is the kidnapper.",
  ),
  Content(
    name: 'Choose or Die',
    imageUrl: Assets.chooseordie,
    color: Colors.yellow,
    videoUrl: Assets.chooseordieVideoUrl,
    categories: 'Horror/Drama',
    year: 2022,
    length: 84,
    episodes: 0,
    rating: '4.8',
    description:
        "A broke student who plays an obscure 1980s survival computer game in pursuit of an unclaimed 100,000 prize. After a series of unexpectedly terrifying moments, she soon realises she's no longer playing for the money, but for her own life.",
  ),
  Content(
    name: 'The In Between',
    imageUrl: Assets.inbetween,
    color: Colors.lightBlueAccent,
    videoUrl: Assets.inbetweenVideoUrl,
    categories: 'Romance/Drama/Sci-Fi',
    year: 2022,
    length: 116,
    episodes: 0,
    rating: '5.8',
    description:
        "Tessa doesn't believe she deserves her own love \n story until she meets Skylar, a true romantic. When a \n car accident kills Skylar, Tessa searches for answers \n and thinks that Skylar is trying to connect with her \n from the afterworld. Tessa tries to contact Skylar one \n last time so their love story can have the ending it \n deserves.",
  ),
  Content(
    name: 'The Turning Point',
    imageUrl: Assets.turningpoint,
    color: Colors.green,
    videoUrl: Assets.turningpointVideoUrl,
    categories: 'Drama/Crime',
    year: 2021,
    length: 95,
    episodes: 0,
    rating: '5.9',
    description:
        "A slacker who does his best to avoid confrontation \n strikes up an unlikely friendship with a dangerous \n thug who suddenly forces his way into his life.",
  ),
  Content(
    name: 'Spider-Man: No Way Home',
    imageUrl: Assets.spiderman,
    color: Colors.orange,
    videoUrl: Assets.spidermanVideoUrl,
  ),
  Content(
    name: 'No Exit',
    imageUrl: Assets.noexit,
    color: Colors.red,
    videoUrl: Assets.noexitVideoUrl,
  ),
  Content(
    name: 'Choose or Die',
    imageUrl: Assets.chooseordie,
    color: Colors.yellow,
    videoUrl: Assets.chooseordieVideoUrl,
  ),
  Content(
    name: 'The In Between',
    imageUrl: Assets.inbetween,
    color: Colors.lightBlueAccent,
    videoUrl: Assets.inbetweenVideoUrl,
  ),
  Content(
    name: 'The Turning Point',
    imageUrl: Assets.turningpoint,
    color: Colors.green,
    videoUrl: Assets.turningpointVideoUrl,
  ),
];

final List<Content> myList = [
  Content(
      name: 'Peaky Blinders',
      imageUrl: Assets.peakyBlinders,
      videoUrl: Assets.peakyBlindersVideoUrl),
  Content(
      name: 'Lucifer',
      imageUrl: Assets.lucifer,
      videoUrl: Assets.luciferVideoUrl),
  Content(
    name: 'The In Between',
    imageUrl: Assets.inbetween,
    color: Colors.lightBlueAccent,
    videoUrl: Assets.inbetweenVideoUrl,
  ),
  Content(
      name: 'Thor: Love and Thunder',
      imageUrl: Assets.thorLoveandThunder,
      videoUrl: Assets.thorLoveandThunderVideoUrl),
];

final List<Content> originals = [
  Content(
      name: 'Peaky Blinders',
      imageUrl: Assets.peakyBlinders,
      videoUrl: Assets.peakyBlindersVideoUrl),
  Content(
      name: 'All of Us are Dead',
      imageUrl: Assets.allofUsareDead,
      videoUrl: Assets.allofUsareDeadVideoUrl),
  Content(
      name: 'Money Heist',
      imageUrl: Assets.moneyheist,
      videoUrl: Assets.moneyheistVideoUrl),
  Content(
      name: 'Lucifer',
      imageUrl: Assets.lucifer,
      videoUrl: Assets.luciferVideoUrl),
  Content(
      name: 'Squid Game',
      imageUrl: Assets.squidGame,
      videoUrl: Assets.squidGameVideoUrl),
  Content(
      name: 'Peaky Blinders',
      imageUrl: Assets.peakyBlinders,
      videoUrl: Assets.peakyBlindersVideoUrl),
  Content(
      name: 'All of Us are Dead',
      imageUrl: Assets.allofUsareDead,
      videoUrl: Assets.allofUsareDeadVideoUrl),
  Content(
      name: 'Money Heist',
      imageUrl: Assets.moneyheist,
      videoUrl: Assets.moneyheistVideoUrl),
  Content(
      name: 'Lucifer',
      imageUrl: Assets.lucifer,
      videoUrl: Assets.luciferVideoUrl),
  Content(
      name: 'Squid Game',
      imageUrl: Assets.squidGame,
      videoUrl: Assets.squidGameVideoUrl),
];

final List<Content> trending = [
  Content(
      name: 'Bad Guys',
      imageUrl: Assets.badguys,
      videoUrl: Assets.badguysVideoUrl),
  Content(
      name: 'Doctor Strange in the Multiverse of Madness',
      imageUrl: Assets.doctorStrange),
  Content(
      name: 'Jurassic World Dominion',
      imageUrl: Assets.jurassicWorld,
      videoUrl: Assets.jurassicWorldVideoUrl),
  Content(
      name: 'The Unbearable Weight of Massive Talent',
      imageUrl: Assets.theUnbearable,
      videoUrl: Assets.theUnbearableVideoUrl),
  Content(
      name: 'Thor: Love and Thunder',
      imageUrl: Assets.thorLoveandThunder,
      videoUrl: Assets.thorLoveandThunderVideoUrl),
  Content(
      name: 'Bad Guys',
      imageUrl: Assets.badguys,
      videoUrl: Assets.badguysVideoUrl),
  Content(
      name: 'Doctor Strange in the Multiverse of Madness',
      imageUrl: Assets.doctorStrange),
  Content(
      name: 'Jurassic World Dominion',
      imageUrl: Assets.jurassicWorld,
      videoUrl: Assets.jurassicWorldVideoUrl),
  Content(
      name: 'The Unbearable Weight of Massive Talent',
      imageUrl: Assets.theUnbearable,
      videoUrl: Assets.theUnbearableVideoUrl),
  Content(
      name: 'Thor: Love and Thunder',
      imageUrl: Assets.thorLoveandThunder,
      videoUrl: Assets.thorLoveandThunderVideoUrl),
];

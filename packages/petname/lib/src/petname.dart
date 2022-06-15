/*
  https://github.com/dustinkirkland/golang-petname

  petname: library for generating human-readable, random names
           for objects (e.g. hostnames, containers, blobs)
  Copyright 2014 Dustin Kirkland <dustin.kirkland@gmail.com>
  Licensed under the Apache License, Version 2.0 (the 'License');
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at
     http://www.apache.org/licenses/LICENSE-2.0
  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an 'AS IS' BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
*/

import 'dart:math';

import 'package:meta/meta.dart';

part 'petname.g.dart';

Random? __rand;
Random get _rand => __rand ??= Random(DateTime.now().microsecondsSinceEpoch);

/// @internal
@visibleForTesting
void setRandom(Random random) => __rand = random;

/// Adverb returns a random adverb from a list of petname adverbs.
String adverb() => _adverbs[_rand.nextInt(_adverbs.length)];

/// Adjective returns a random adjective from a list of petname adjectives.
String adjective() => _adjectives[_rand.nextInt(_adjectives.length)];

/// Name returns a random name from a list of petname names.
String name() => _names[_rand.nextInt(_names.length)];

/// Generate generates and returns a random pet name.
/// It takes two parameters: the number of words in the name, and a separator token.
/// If a single word is requested, simply a name() is returned.
/// If two words are requested, an adjective() and a name() are returned.
/// If three or more words are requested, a variable number of adverb() and an adjective() and a name() is returned.
/// The separator can be any charater, string, or an empty string.
String generate(int words, {String separator = ''}) {
  return [
    for (var i = 0; i < words - 2; ++i) adverb(),
    if (words > 1) adjective(),
    if (words > 0) name(),
  ].join(separator);
}

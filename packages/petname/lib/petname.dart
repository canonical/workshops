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

/// An RFC1178 implementation to generate pronounceable, sometimes even
/// memorable, "pet names", consisting of a random combination of adverbs, an
/// adjective, and an animal name.
library petname;

export 'src/petname.dart';

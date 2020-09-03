// Copyright (c) 2020 Apfel
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software.
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import "dart:convert";
import "dart:io";
import "package:http/http.dart" as http;
import "package:meta/meta.dart";

class GitHubRepository {
  final String name;
  final String url;
  final String description;
  final String language;

  GitHubRepository({
    @required
    this.name,

    @required
    this.url,

    @required
    this.description,

    @required
    this.language
  });

  factory GitHubRepository.fromJson(Map<String, dynamic> json) => GitHubRepository(
    name: json["name"] as String,
    url: json["html_url"] as String,
    description: json["description"] != null ? json["description"] as String : "No description.",
    language: json["language"] as String
  );
}

Future<List<GitHubRepository>> fetchRepositoriesForUser(String username) async {
  http.Response response = await http.get("https://api.github.com/users/" + username + "/repos",
    headers: {
      HttpHeaders.acceptHeader: "application/vnd.github.v3+json"
    }
  );

  if (response.statusCode != HttpStatus.ok) {
    return null;
  }

  return json.decode(response.body).cast<Map<String, dynamic>>().map<GitHubRepository>((json) => GitHubRepository.fromJson(json)).toList();
}

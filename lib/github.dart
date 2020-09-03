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

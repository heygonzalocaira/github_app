// ignore_for_file: sort_constructors_first, lines_longer_than_80_chars

class CommitEntity {
  CommitEntity({
    required this.sha,
    required this.nodeId,
    required this.commit,
    required this.url,
    required this.htmlUrl,
    required this.commentsUrl,
    required this.author,
    required this.committer,
    required this.parents,
  });

  final String sha;
  final String nodeId;
  final Commit commit;
  final String url;
  final String htmlUrl;
  final String commentsUrl;
  final CommitDatumAuthor author;
  final CommitDatumAuthor committer;
  final List<Parent> parents;

  factory CommitEntity.fromJson(Map<String, dynamic> json) {
    return CommitEntity(
      sha: json['sha'] as String,
      nodeId: json['node_id'] as String,
      commit: Commit.fromJson(json['commit'] as Map<String, dynamic>),
      url: json['url'] as String,
      htmlUrl: json['html_url'] as String,
      commentsUrl: json['comments_url'] as String,
      author:
          CommitDatumAuthor.fromJson(json['author'] as Map<String, dynamic>),
      committer:
          CommitDatumAuthor.fromJson(json['committer'] as Map<String, dynamic>),
      parents: List<Parent>.from(
        (json['parents'] as List)
            .map((x) => Parent.fromJson(x as Map<String, dynamic>)),
      ),
    );
  }

  Map<String, dynamic> toJson() => {
        'sha': sha,
        'node_id': nodeId,
        'commit': commit.toJson(),
        'url': url,
        'html_url': htmlUrl,
        'comments_url': commentsUrl,
        'author': author.toJson(),
        'committer': committer.toJson(),
        'parents': parents.map((x) => x.toJson()).toList(),
      };

  @override
  String toString() {
    return '$sha, $nodeId, $commit, $url, $htmlUrl, $commentsUrl, $author, $committer, $parents, ';
  }
}

class CommitDatumAuthor {
  CommitDatumAuthor({
    required this.login,
    required this.id,
    required this.nodeId,
    required this.avatarUrl,
    required this.gravatarId,
    required this.url,
    required this.htmlUrl,
    required this.followersUrl,
    required this.followingUrl,
    required this.gistsUrl,
    required this.starredUrl,
    required this.subscriptionsUrl,
    required this.organizationsUrl,
    required this.reposUrl,
    required this.eventsUrl,
    required this.receivedEventsUrl,
    required this.type,
    required this.siteAdmin,
  });

  final String login;
  final int id;
  final String nodeId;
  final String avatarUrl;
  final String gravatarId;
  final String url;
  final String htmlUrl;
  final String followersUrl;
  final String followingUrl;
  final String gistsUrl;
  final String starredUrl;
  final String subscriptionsUrl;
  final String organizationsUrl;
  final String reposUrl;
  final String eventsUrl;
  final String receivedEventsUrl;
  final String type;
  final bool siteAdmin;

  factory CommitDatumAuthor.fromJson(Map<String, dynamic> json) {
    return CommitDatumAuthor(
      login: json['login'] as String,
      id: json['id'] as int,
      nodeId: json['node_id'] as String,
      avatarUrl: json['avatar_url'] as String,
      gravatarId: json['gravatar_id'] as String,
      url: json['url'] as String,
      htmlUrl: json['html_url'] as String,
      followersUrl: json['followers_url'] as String,
      followingUrl: json['following_url'] as String,
      gistsUrl: json['gists_url'] as String,
      starredUrl: json['starred_url'] as String,
      subscriptionsUrl: json['subscriptions_url'] as String,
      organizationsUrl: json['organizations_url'] as String,
      reposUrl: json['repos_url'] as String,
      eventsUrl: json['events_url'] as String,
      receivedEventsUrl: json['received_events_url'] as String,
      type: json['type'] as String,
      siteAdmin: json['site_admin'] as bool,
    );
  }

  Map<String, dynamic> toJson() => {
        'login': login,
        'id': id,
        'node_id': nodeId,
        'avatar_url': avatarUrl,
        'gravatar_id': gravatarId,
        'url': url,
        'html_url': htmlUrl,
        'followers_url': followersUrl,
        'following_url': followingUrl,
        'gists_url': gistsUrl,
        'starred_url': starredUrl,
        'subscriptions_url': subscriptionsUrl,
        'organizations_url': organizationsUrl,
        'repos_url': reposUrl,
        'events_url': eventsUrl,
        'received_events_url': receivedEventsUrl,
        'type': type,
        'site_admin': siteAdmin,
      };

  @override
  String toString() {
    return '$login, $id, $nodeId, $avatarUrl, $gravatarId, $url, $htmlUrl, $followersUrl, $followingUrl, $gistsUrl, $starredUrl, $subscriptionsUrl, $organizationsUrl, $reposUrl, $eventsUrl, $receivedEventsUrl, $type, $siteAdmin, ';
  }
}

class Commit {
  Commit({
    required this.author,
    required this.committer,
    required this.message,
    required this.tree,
    required this.url,
    required this.commentCount,
    required this.verification,
  });

  final CommitAuthor author;
  final CommitAuthor committer;
  final String message;
  final Tree tree;
  final String url;
  final int commentCount;
  final Verification verification;

  factory Commit.fromJson(Map<String, dynamic> json) {
    return Commit(
      author: CommitAuthor.fromJson(json['author'] as Map<String, dynamic>),
      committer:
          CommitAuthor.fromJson(json['committer'] as Map<String, dynamic>),
      message: json['message'] as String,
      tree: Tree.fromJson(json['tree'] as Map<String, dynamic>),
      url: json['url'] as String,
      commentCount: json['comment_count'] as int,
      verification:
          Verification.fromJson(json['verification'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'author': author.toJson(),
        'committer': committer.toJson(),
        'message': message,
        'tree': tree.toJson(),
        'url': url,
        'comment_count': commentCount,
        'verification': verification.toJson(),
      };

  @override
  String toString() {
    return '$author, $committer, $message, $tree, $url, $commentCount, $verification, ';
  }
}

class CommitAuthor {
  CommitAuthor({
    required this.name,
    required this.email,
    required this.date,
  });

  final String name;
  final String email;
  final DateTime date;

  factory CommitAuthor.fromJson(Map<String, dynamic> json) {
    return CommitAuthor(
      name: json['name'] as String,
      email: json['email'] as String,
      date: DateTime.tryParse(json['date'] as String) ?? DateTime.now(), // TODO
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'date': date.toIso8601String(),
      };

  @override
  String toString() {
    return '$name, $email, $date, ';
  }
}

class Tree {
  Tree({
    required this.sha,
    required this.url,
  });

  final String sha;
  final String url;

  factory Tree.fromJson(Map<String, dynamic> json) {
    return Tree(
      sha: json['sha'] as String,
      url: json['url'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'sha': sha,
        'url': url,
      };

  @override
  String toString() {
    return '$sha, $url, ';
  }
}

class Verification {
  Verification({
    required this.verified,
    required this.reason,
    required this.signature,
    required this.payload,
  });

  final bool verified;
  final String reason;
  final String? signature;
  final String? payload;

  factory Verification.fromJson(Map<String, dynamic> json) {
    return Verification(
      verified: json['verified'] as bool,
      reason: json['reason'] as String,
      signature: json['signature'] as String?,
      payload: json['payload'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'verified': verified,
        'reason': reason,
        'signature': signature,
        'payload': payload,
      };

  @override
  String toString() {
    return '$verified, $reason, $signature, $payload, ';
  }
}

class Parent {
  Parent({
    required this.sha,
    required this.url,
    required this.htmlUrl,
  });

  final String sha;
  final String url;
  final String htmlUrl;

  factory Parent.fromJson(Map<String, dynamic> json) {
    return Parent(
      sha: json['sha'] as String,
      url: json['url'] as String,
      htmlUrl: json['html_url'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'sha': sha,
        'url': url,
        'html_url': htmlUrl,
      };

  @override
  String toString() {
    return '$sha, $url, $htmlUrl, ';
  }
}

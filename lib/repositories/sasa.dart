/// count : 20
/// totalCount : 1885
/// page : 1
/// totalPages : 95
/// lastItemIndex : 20
/// results : [{"tags":["famous-quotes","inspirational"],"_id":"2xpHvSOQMD","author":"Helmut Schmidt","content":"The biggest room in the world is room for improvement.","authorSlug":"helmut-schmidt","length":54,"dateAdded":"2021-06-18","dateModified":"2021-06-18"},{"tags":["famous-quotes","inspirational"],"_id":"HMBEfGB94i","author":"Henry Ford","content":"Whether you think you can or you think you can't, you are right.","authorSlug":"henry-ford","length":64,"dateAdded":"2021-06-18","dateModified":"2021-06-18"},{"tags":["famous-quotes","inspirational"],"_id":"lJ60rOYWci","author":"Neil Gaiman","content":"The one thing that you have that nobody else has is you. Your voice, your mind, your story, your vision. So write and draw and build and play and dance and live as only you can.","authorSlug":"neil-gaiman","length":177,"dateAdded":"2021-06-18","dateModified":"2021-06-18"},{"tags":["famous-quotes","inspirational"],"_id":"XNLGqepInX","author":"Amy Poehler","content":"There’s power in looking silly and not caring that you do.","authorSlug":"amy-poehler","length":58,"dateAdded":"2021-06-18","dateModified":"2021-06-18"},{"tags":["famous-quotes","inspirational"],"_id":"aEPNVog6sT","author":"Eric Hoffer","content":"In times of change, learners inherit the earth, while the learned find themselves beautifully equipped to deal with a world that no longer exists.","authorSlug":"eric-hoffer","length":146,"dateAdded":"2021-06-18","dateModified":"2021-06-18"},{"tags":["famous-quotes","inspirational"],"_id":"QdK00IhCNX","author":"Larry Page","content":"If you're changing the world, you're working on important things. You're excited to get up in the morning.","authorSlug":"larry-page","length":106,"dateAdded":"2021-06-18","dateModified":"2021-06-18"},{"tags":["wisdom"],"_id":"96eV21NlZKJ","content":"Make it your habit not to be critical about small things.","author":"Edward Everett Hale","authorSlug":"edward-everett-hale","length":57,"dateAdded":"2021-05-12","dateModified":"2021-05-12"},{"tags":["famous-quotes"],"_id":"2xx4dfKrYVRf","content":"Some people thrive on huge, dramatic change. Some people prefer the slow and steady route. Do what's right for you.","author":"Julie Morgenstern","authorSlug":"julie-morgenstern","length":115,"dateAdded":"2021-05-12","dateModified":"2021-05-12"},{"tags":["wisdom"],"_id":"wEfrviG0x9r","content":"With age comes wisdom and a high sex drive. And the wisdom to enjoy it.","author":"Amber Valletta","authorSlug":"amber-valletta","length":71,"dateAdded":"2021-05-12","dateModified":"2021-05-12"},{"tags":["famous-quotes"],"_id":"6c2h-AtqMj6d","content":"You can stand tall without standing on someone. You can be a victor without having victims.","author":"Harriet Woods","authorSlug":"harriet-woods","length":91,"dateAdded":"2021-05-12","dateModified":"2021-05-12"},{"tags":["famous-quotes"],"_id":"CdL1z3NLSDrN","content":"Don't talk about what you have done or what you are going to do.","author":"Thomas Jefferson","authorSlug":"thomas-jefferson","length":64,"dateAdded":"2021-05-12","dateModified":"2021-05-12"},{"tags":["wisdom"],"_id":"l7UNABW6dA2","content":"Silence is the sleep that nourishes wisdom.","author":"Francis Bacon","authorSlug":"francis-bacon","length":43,"dateAdded":"2021-05-12","dateModified":"2021-05-12"},{"tags":["friendship"],"_id":"sTma0kWPt2","content":"Friendship, like credit, is highest when it is not used.","author":"Elbert Hubbard","authorSlug":"elbert-hubbard","length":56,"dateAdded":"2021-05-12","dateModified":"2021-05-12"},{"tags":["friendship"],"_id":"ARKzsqVpFY","content":"Two persons cannot long be friends if they cannot forgive each other's little failings.","author":"Jean de La Bruyère","authorSlug":"jean-de-la-bruyere","length":87,"dateAdded":"2021-05-12","dateModified":"2021-05-12"},{"tags":["wisdom"],"_id":"5syS8jEn8m","content":"When a thing is done, it's done. Don't look back. Look forward to your next objective.","author":"George Marshall","authorSlug":"george-marshall","length":86,"dateAdded":"2021-05-12","dateModified":"2021-05-12"},{"tags":["famous-quotes"],"_id":"bfpxfIQlqZ_3","content":"He who controls others may be powerful, but he who has mastered himself is mightier still.","author":"Laozi","authorSlug":"laozi","length":90,"dateAdded":"2021-05-12","dateModified":"2021-05-12"},{"tags":["wisdom"],"_id":"6Kl3UT6ULk","content":"Wisdom, compassion, and courage are the three universally recognized moral qualities of men.","author":"Confucius","authorSlug":"confucius","length":92,"dateAdded":"2021-05-12","dateModified":"2021-05-12"},{"tags":["famous-quotes"],"_id":"Oh-e1-oygRPX","content":"To be wronged is nothing unless you continue to remember it.","author":"Confucius","authorSlug":"confucius","length":60,"dateAdded":"2021-05-12","dateModified":"2021-05-12"},{"tags":["famous-quotes"],"_id":"2wYjTZiTUSgQ","content":"The things that one most wants to do are the things that are probably most worth doing.","author":"Winifred Holtby","authorSlug":"winifred-holtby","length":87,"dateAdded":"2021-05-12","dateModified":"2021-05-12"},{"tags":["friendship"],"_id":"4mPxqSvuiN","content":"Friendship increases in visiting friends, but in visiting them seldom.","author":"Francis Bacon","authorSlug":"francis-bacon","length":70,"dateAdded":"2021-05-12","dateModified":"2021-05-12"}]

class Sasa {
  Sasa({
    int? count,
    int? totalCount,
    int? page,
    int? totalPages,
    int? lastItemIndex,
    List<Results>? results,
  }) {
    _count = count;
    _totalCount = totalCount;
    _page = page;
    _totalPages = totalPages;
    _lastItemIndex = lastItemIndex;
    _results = results;
  }

  Sasa.fromJson(dynamic json) {
    _count = json['count'];
    _totalCount = json['totalCount'];
    _page = json['page'];
    _totalPages = json['totalPages'];
    _lastItemIndex = json['lastItemIndex'];
    if (json['results'] != null) {
      _results = [];
      json['results'].forEach((v) {
        _results?.add(Results.fromJson(v));
      });
    }
  }
  int? _count;
  int? _totalCount;
  int? _page;
  int? _totalPages;
  int? _lastItemIndex;
  List<Results>? _results;

  int? get count => _count;
  int? get totalCount => _totalCount;
  int? get page => _page;
  int? get totalPages => _totalPages;
  int? get lastItemIndex => _lastItemIndex;
  List<Results>? get results => _results;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = _count;
    map['totalCount'] = _totalCount;
    map['page'] = _page;
    map['totalPages'] = _totalPages;
    map['lastItemIndex'] = _lastItemIndex;
    if (_results != null) {
      map['results'] = _results?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// tags : ["famous-quotes","inspirational"]
/// _id : "2xpHvSOQMD"
/// author : "Helmut Schmidt"
/// content : "The biggest room in the world is room for improvement."
/// authorSlug : "helmut-schmidt"
/// length : 54
/// dateAdded : "2021-06-18"
/// dateModified : "2021-06-18"

class Results {
  Results({
    List<String>? tags,
    String? id,
    String? author,
    String? content,
    String? authorSlug,
    int? length,
    String? dateAdded,
    String? dateModified,
  }) {
    _tags = tags;
    _id = id;
    _author = author;
    _content = content;
    _authorSlug = authorSlug;
    _length = length;
    _dateAdded = dateAdded;
    _dateModified = dateModified;
  }

  Results.fromJson(dynamic json) {
    _tags = json['tags'] != null ? json['tags'].cast<String>() : [];
    _id = json['_id'];
    _author = json['author'];
    _content = json['content'];
    _authorSlug = json['authorSlug'];
    _length = json['length'];
    _dateAdded = json['dateAdded'];
    _dateModified = json['dateModified'];
  }
  List<String>? _tags;
  String? _id;
  String? _author;
  String? _content;
  String? _authorSlug;
  int? _length;
  String? _dateAdded;
  String? _dateModified;

  List<String>? get tags => _tags;
  String? get id => _id;
  String? get author => _author;
  String? get content => _content;
  String? get authorSlug => _authorSlug;
  int? get length => _length;
  String? get dateAdded => _dateAdded;
  String? get dateModified => _dateModified;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['tags'] = _tags;
    map['_id'] = _id;
    map['author'] = _author;
    map['content'] = _content;
    map['authorSlug'] = _authorSlug;
    map['length'] = _length;
    map['dateAdded'] = _dateAdded;
    map['dateModified'] = _dateModified;
    return map;
  }
}

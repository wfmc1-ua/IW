-- Group [Group]
create table "public"."group" (
   "id"  int4  not null,
   "groupname"  varchar(255),
  primary key ("id")
);


-- Module [Module]
create table "public"."module" (
   "id"  int4  not null,
   "moduleid"  varchar(255),
   "modulename"  varchar(255),
  primary key ("id")
);


-- User [User]
create table "public"."user" (
   "id"  int4  not null,
   "username"  varchar(255),
   "password"  varchar(255),
   "email"  varchar(255),
   "status"  varchar(255),
   "createdat"  timestamp,
   "displayname"  varchar(255),
  primary key ("id")
);


-- Song [ent1]
create table "public"."song" (
   "id"  int4  not null,
   "track_number"  int4,
   "durationsec"  int4,
   "title"  varchar(255),
   "releasedate"  date,
   "cover"  varchar(255),
  primary key ("id")
);


-- Playlist [ent2]
create table "public"."playlist" (
   "id"  int4  not null,
   "createdat"  timestamp,
   "ispublic"  bool,
   "description"  text,
   "name"  varchar(255),
  primary key ("id")
);


-- Genre [ent3]
create table "public"."genre" (
   "id"  int4  not null,
   "description"  text,
   "name"  varchar(255),
  primary key ("id")
);


-- Artist [ent4]
create table "public"."artist" (
   "id"  int4  not null,
   "bio"  text,
   "country"  varchar(255),
   "name"  varchar(255),
  primary key ("id")
);


-- Review [ent5]
create table "public"."review" (
   "id"  int4  not null,
   "createdat"  timestamp,
   "comment"  text,
   "rating"  int4,
  primary key ("id")
);


-- Album [ent6]
create table "public"."album" (
   "id"  int4  not null,
   "cover"  varchar(255),
   "releasedate"  date,
   "title"  varchar(255),
  primary key ("id")
);


-- Group_DefaultModule [Group2DefaultModule_DefaultModule2Group]
alter table "public"."group"  add column  "module_id"  int4;
alter table "public"."group"   add constraint fk_group_module foreign key ("module_id") references "public"."module" ("id");


-- Group_Module [Group2Module_Module2Group]
create table "public"."group_module" (
   "group_id"  int4 not null,
   "module_id"  int4 not null,
  primary key ("group_id", "module_id")
);
alter table "public"."group_module"   add constraint fk_group_module_group foreign key ("group_id") references "public"."group" ("id");
alter table "public"."group_module"   add constraint fk_group_module_module foreign key ("module_id") references "public"."module" ("id");


-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table "public"."user"  add column  "group_id"  int4;
alter table "public"."user"   add constraint fk_user_group foreign key ("group_id") references "public"."group" ("id");


-- User_Group [User2Group_Group2User]
create table "public"."user_group" (
   "user_id"  int4 not null,
   "group_id"  int4 not null,
  primary key ("user_id", "group_id")
);
alter table "public"."user_group"   add constraint fk_user_group_user foreign key ("user_id") references "public"."user" ("id");
alter table "public"."user_group"   add constraint fk_user_group_group foreign key ("group_id") references "public"."group" ("id");


-- Song_Playlist [rel1]
create table "public"."song_playlist" (
   "song_id"  int4 not null,
   "playlist_id"  int4 not null,
  primary key ("song_id", "playlist_id")
);
alter table "public"."song_playlist"   add constraint fk_song_playlist_song foreign key ("song_id") references "public"."song" ("id");
alter table "public"."song_playlist"   add constraint fk_song_playlist_playlist foreign key ("playlist_id") references "public"."playlist" ("id");


-- Song_Genre [rel2]
alter table "public"."song"  add column  "genre_id"  int4;
alter table "public"."song"   add constraint fk_song_genre foreign key ("genre_id") references "public"."genre" ("id");


-- Artist_Album [rel3]
alter table "public"."album"  add column  "artist_id"  int4;
alter table "public"."album"   add constraint fk_album_artist foreign key ("artist_id") references "public"."artist" ("id");


-- Album_Song [rel4]
alter table "public"."song"  add column  "album_id"  int4;
alter table "public"."song"   add constraint fk_song_album foreign key ("album_id") references "public"."album" ("id");


-- Review_Song [rel5]
create table "public"."review_song" (
   "review_id"  int4 not null,
   "song_id"  int4 not null,
  primary key ("review_id", "song_id")
);
alter table "public"."review_song"   add constraint fk_review_song_review foreign key ("review_id") references "public"."review" ("id");
alter table "public"."review_song"   add constraint fk_review_song_song foreign key ("song_id") references "public"."song" ("id");


-- User_Review [rel6]
alter table "public"."review"  add column  "user_id"  int4;
alter table "public"."review"   add constraint fk_review_user foreign key ("user_id") references "public"."user" ("id");


-- User_Playlist [rel7]
create table "public"."user_playlist" (
   "user_id"  int4 not null,
   "playlist_id"  int4 not null,
  primary key ("user_id", "playlist_id")
);
alter table "public"."user_playlist"   add constraint fk_user_playlist_user foreign key ("user_id") references "public"."user" ("id");
alter table "public"."user_playlist"   add constraint fk_user_playlist_playlist foreign key ("playlist_id") references "public"."playlist" ("id");


-- Song_Artist [rel8]
create table "public"."song_artist" (
   "song_id"  int4 not null,
   "artist_id"  int4 not null,
  primary key ("song_id", "artist_id")
);
alter table "public"."song_artist"   add constraint fk_song_artist_song foreign key ("song_id") references "public"."song" ("id");
alter table "public"."song_artist"   add constraint fk_song_artist_artist foreign key ("artist_id") references "public"."artist" ("id");



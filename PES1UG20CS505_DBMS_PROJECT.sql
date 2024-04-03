CREATE TABLE `dbt_project`.`artist` (
  `Artist_name` CHAR NOT NULL,
  `Genre` VARCHAR(45) NULL,
  PRIMARY KEY (`Artist_name`))
ALTER TABLE `dbt_project`.`artist` 
ADD COLUMN `label_name` VARCHAR(45) NULL AFTER `Genre`;

CREATE TABLE `dbt_project`.`record_label` (
  `Label_name` CHAR NULL,
  `license_no` INT NOT NULL,
  `President` VARCHAR(45) NULL,
  `Headquarters/location` VARCHAR(45) NULL,
  PRIMARY KEY (`Label_name`, `license_no`));
ALTER TABLE `dbt_project`.`record_label` 
CHANGE COLUMN `Label_name` `Label_name` VARCHAR(45) NOT NULL ;
CREATE TABLE `dbt_project`.`producer` (
  `prod_name` VARCHAR(45) NULL,
  `label_name` VARCHAR(45) NULL,
  PRIMARY KEY (`prod_name`));

CREATE TABLE `dbt_project`.`song` (
  `song_name` VARCHAR(45) NULL,
  `feature` VARCHAR(45) NULL,
  `song_length` INT NULL,
  `artist_name` VARCHAR(45) NULL,
  `prod_name` VARCHAR(45) NULL,
  PRIMARY KEY (`song_name`));
ALTER TABLE `dbt_project`.`song` 
ADD COLUMN `album_name` VARCHAR(45) NULL AFTER `prod_name`;
CREATE TABLE `dbt_project`.`album` (
  `album_name` VARCHAR(45) NULL,
  `no_of_songs` INT NULL,
  `running_length` INT NULL,
  `album_genre` VARCHAR(45) NULL,
  `m&m_artist_name` VARCHAR(45) NULL,
  PRIMARY KEY (`album_name`));
CREATE TABLE `dbt_project`.`distributor` (
  `distributor_name` VARCHAR(45) NOT NULL,
  `format` VARCHAR(45) NULL,
  `website` VARCHAR(45) NULL,
  `label_name` VARCHAR(45) NULL,
  PRIMARY KEY (`distributor_name`));

CREATE TABLE `dbt_project`.`mixing&mastering_artist` (
  `m&m_artist_name` VARCHAR(45) NOT NULL,
  `softwares` VARCHAR(45) NULL,
  `label_name` VARCHAR(45) NULL,
  PRIMARY KEY (`m&m_artist_name`));

CREATE TABLE `dbt_project`.`streaming_service` (
  `str_srv_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`str_srv_name`));

CREATE TABLE `dbt_project`.`distributes` (
  `distributor_name` VARCHAR(45) NOT NULL,
  `album_name` VARCHAR(45) NULL);

CREATE TABLE `dbt_project`.`streams` (
  `album_name` VARCHAR(45) NOT NULL,
  `str_srv_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`album_name`, `str_srv_name`));

INSERT INTO `dbt_project`.`album` (`album_name`, `no_of_songs`, `running_length`, `album_genre`, `m&m_artist_name`) VALUES ('malibu', '12', '56', 'r&b', 'sam');
INSERT INTO `dbt_project`.`album` (`album_name`, `no_of_songs`, `running_length`, `album_genre`, `m&m_artist_name`) VALUES ('freenats', '13', '106', 'r&b', 'bill');
INSERT INTO `dbt_project`.`album` (`album_name`, `no_of_songs`, `running_length`, `album_genre`, `m&m_artist_name`) VALUES ('innebloom', '7', '34', 'electronic', 'nick');
INSERT INTO `dbt_project`.`album` (`album_name`, `no_of_songs`, `running_length`, `album_genre`, `m&m_artist_name`) VALUES ('oasis', '32', '143', 'rock', 'gur');
INSERT INTO `dbt_project`.`album` (`album_name`, `no_of_songs`, `running_length`, `album_genre`, `m&m_artist_name`) VALUES ('ventura ', '10', '45', 'r&b', 'sam');
INSERT INTO `dbt_project`.`album` (`album_name`, `no_of_songs`, `running_length`, `album_genre`, `m&m_artist_name`) VALUES ('compton', '20', '67', 'hip-hop', 'dre');
INSERT INTO `dbt_project`.`album` (`album_name`, `no_of_songs`, `running_length`, `album_genre`, `m&m_artist_name`) VALUES ('detox', '11', '55', 'hip-hop', 'dre');

INSERT INTO `dbt_project`.`song` (`song_name`, `feature`, `song_length`, `artist_name`) VALUES ('bam', 'gunn', '346', 'paak');
INSERT INTO `dbt_project`.`song` (`song_name`, `feature`, `song_length`, `artist_name`, `prod_name`, `album_name`) VALUES ('shiiii', 'roc', '311', 'gibbs', 'alchemist', 'oasis');
INSERT INTO `dbt_project`.`song` (`song_name`, `feature`, `song_length`, `artist_name`, `prod_name`, `album_name`) VALUES ('cool', 'jay', '241', 'gibbs', 'hb', 'oasis');
INSERT INTO `dbt_project`.`song` (`song_name`, `song_length`, `artist_name`, `prod_name`, `album_name`) VALUES ('hugo', '256', 'paak', 'doc', 'innebloom');
INSERT INTO `dbt_project`.`song` (`song_name`, `feature`, `song_length`, `artist_name`, `prod_name`, `album_name`) VALUES ('ny', 'fredd', '275', 'west', 'doc', 'innebloom');
INSERT INTO `dbt_project`.`song` (`song_name`, `feature`, `song_length`, `artist_name`, `prod_name`, `album_name`) VALUES ('louis', 'butch', '211', 'kdot', 'mb', 'detox');
INSERT INTO `dbt_project`.`song` (`song_name`, `feature`, `song_length`, `artist_name`, `prod_name`, `album_name`) VALUES ('polo', 'kim', '123', 'kdot', 'hb', 'ye');
INSERT INTO `dbt_project`.`song` (`song_name`, `feature`, `song_length`, `artist_name`, `prod_name`, `album_name`) VALUES ('taste', 'krs', '234', 'sir', 'alchemist', 'ye');
INSERT INTO `dbt_project`.`song` (`song_name`, `feature`, `song_length`, `artist_name`, `prod_name`, `album_name`) VALUES ('gold', 'vinesh', '121', 'paak', 'mb', 'mailbu');
INSERT INTO `dbt_project`.`song` (`song_name`, `feature`, `song_length`, `artist_name`, `prod_name`, `album_name`) VALUES ('hope', '', '345', 'sir', 'doc', 'malibu');
INSERT INTO `dbt_project`.`song` (`song_name`, `feature`, `song_length`, `artist_name`, `prod_name`, `album_name`) VALUES ('flashy', 'masterp', '322', 'west', 'doc', 'ye');
INSERT INTO `dbt_project`.`song` (`song_name`, `feature`, `song_length`, `artist_name`, `prod_name`, `album_name`) VALUES ('mac', '', '420', 'west', 'alchemist', 'innebloom');
UPDATE `dbt_project`.`song` SET `prod_name` = 'alchemist', `album_name` = 'ye' WHERE (`song_name` = 'bam');


INSERT INTO `dbt_project`.`producer` (`prod_name`, `label_name`) VALUES ('alchemist', 'warner');
INSERT INTO `dbt_project`.`producer` (`prod_name`, `label_name`) VALUES ('hb', 'warner');
INSERT INTO `dbt_project`.`producer` (`prod_name`, `label_name`) VALUES ('mb', 'griselda');
INSERT INTO `dbt_project`.`producer` (`prod_name`, `label_name`) VALUES ('doc', 'aftermath');
INSERT INTO `dbt_project`.`producer` (`prod_name`, `label_name`) VALUES ('kanye', 'griselda');
INSERT INTO `dbt_project`.`producer` (`prod_name`, `label_name`) VALUES ('pharrell', 'ugm');

INSERT INTO `dbt_project`.`record_label` (`Label_name`, `license_no`, `President`, `Headquarters/location`) VALUES ('ugm', '34556', 'tony', 'new jersey');
INSERT INTO `dbt_project`.`record_label` (`Label_name`, `license_no`, `President`, `Headquarters/location`) VALUES ('griselda', '24886', 'paulie', 'new york');
INSERT INTO `dbt_project`.`record_label` (`Label_name`, `license_no`, `President`, `Headquarters/location`) VALUES ('aftermath', '34609', 'chrissy', 'berlin');
INSERT INTO `dbt_project`.`record_label` (`Label_name`, `license_no`, `President`, `Headquarters/location`) VALUES ('warner', '88923', 'junior', 'los angeles');
INSERT INTO `dbt_project`.`record_label` (`Label_name`, `license_no`, `President`, `Headquarters/location`) VALUES ('massappeal', '45629', 'bobby', 'bronx');

INSERT INTO `dbt_project`.`artist` (`Artist_name`, `Genre`, `label_name`) VALUES ('paak', 'r&b', 'warner');
INSERT INTO `dbt_project`.`artist` (`Artist_name`, `Genre`, `label_name`) VALUES ('gibbs', 'hip-hop', 'ugm');
INSERT INTO `dbt_project`.`artist` (`Artist_name`, `Genre`, `label_name`) VALUES ('kdot', 'hip-hop', 'ugm');
INSERT INTO `dbt_project`.`artist` (`Artist_name`, `Genre`, `label_name`) VALUES ('west', 'rock', 'aftermath');
INSERT INTO `dbt_project`.`artist` (`Artist_name`, `Genre`, `label_name`) VALUES ('sir', 'house', 'griselda');
INSERT INTO `dbt_project`.`artist` (`Artist_name`, `Genre`, `label_name`) VALUES ('nas', 'coke-rap', 'griselda');

INSERT INTO `dbt_project`.`streaming_service` (`str_srv_name`) VALUES ('spotify');
INSERT INTO `dbt_project`.`streaming_service` (`str_srv_name`) VALUES ('apple music');
INSERT INTO `dbt_project`.`streaming_service` (`str_srv_name`) VALUES ('pandora');
INSERT INTO `dbt_project`.`streaming_service` (`str_srv_name`) VALUES ('bandcamp');
INSERT INTO `dbt_project`.`streaming_service` (`str_srv_name`) VALUES ('soundcloud');

INSERT INTO `dbt_project`.`distributor` (`distributor_name`, `format`, `website`, `label_name`) VALUES ('complex', 'flac', 'complex.com', 'ugm');
INSERT INTO `dbt_project`.`distributor` (`distributor_name`, `format`, `website`, `label_name`) VALUES ('npr', 'alac', 'nprmusic.com', 'ugm');
INSERT INTO `dbt_project`.`distributor` (`distributor_name`, `format`, `website`, `label_name`) VALUES ('sopranos', 'alac', 'sopranos.to', 'griselda');
INSERT INTO `dbt_project`.`distributor` (`distributor_name`, `format`, `website`, `label_name`) VALUES ('dimeo', 'wav', 'dimeo.com', 'warner');
INSERT INTO `dbt_project`.`distributor` (`distributor_name`, `format`, `website`, `label_name`) VALUES ('shady', 'wav', 'shadyrecords.to', 'griselda');
INSERT INTO `dbt_project`.`distributor` (`distributor_name`, `format`, `website`, `label_name`) VALUES ('massappeal', 'wav', 'ma.com', 'griselda');
INSERT INTO `dbt_project`.`distributor` (`distributor_name`, `format`, `website`, `label_name`) VALUES ('stonesthrow', 'flac', 'stones.com', 'warner');

INSERT INTO `dbt_project`.`mixing&mastering_artist` (`m&m_artist_name`, `softwares`, `label_name`) VALUES ('sam', 'fruityloops', 'griselda');
INSERT INTO `dbt_project`.`mixing&mastering_artist` (`m&m_artist_name`, `softwares`, `label_name`) VALUES ('nick', 'cubase', 'griselda');
INSERT INTO `dbt_project`.`mixing&mastering_artist` (`m&m_artist_name`, `softwares`, `label_name`) VALUES ('gur', 'cubase', 'ugm');
INSERT INTO `dbt_project`.`mixing&mastering_artist` (`m&m_artist_name`, `softwares`, `label_name`) VALUES ('dre', 'yamaha', 'ugm');
INSERT INTO `dbt_project`.`mixing&mastering_artist` (`m&m_artist_name`, `softwares`, `label_name`) VALUES ('bill', 'steinberg', 'warner');
INSERT INTO `dbt_project`.`distributes` (`distributor_name`, `album_name`) VALUES ('complex', 'malibu');
INSERT INTO `dbt_project`.`distributes` (`distributor_name`, `album_name`) VALUES ('sopranos', 'detox');
INSERT INTO `dbt_project`.`distributes` (`distributor_name`, `album_name`) VALUES ('npr', 'ye');
INSERT INTO `dbt_project`.`distributes` (`distributor_name`, `album_name`) VALUES ('npr', 'ventura');
INSERT INTO `dbt_project`.`distributes` (`distributor_name`, `album_name`) VALUES ('complex', 'oasis');
ALTER TABLE `dbt_project`.`artist` 
CHANGE COLUMN `Artist_name` `Artist_name` CHAR(45) NOT NULL ,
ADD INDEX `label_name_idx` (`label_name` ASC) VISIBLE;
alter table producer add foreign key(label_name) references record_label(label_name);
alter table artist add foreign key(label_name) references record_label(label_name);
alter table song add constraint fk1 FOREIGN KEY(prod_name) REFERENCES producer(prod_name);
alter table album add foreign key(mnm_artist_name) references mixingnmastering_artist(mnm_artist_name);
alter table mixingnmastering_artist add foreign key(label_name) references record_label(label_name);
alter table distributor add foreign key(label_name) references record_label(label_name) ON DELETE CASCADE;
alter table distributes add foreign key(distributor_name) references distributor(distributor_name) ON DELETE CASCADE;
alter table distributes add foreign key(album_name) references album(album_name);
alter table streams add foreign key(str_srv_name) references streaming_service(str_srv_name);
alter table streams add foreign key(album_name) references album(album_name);




-- 1)Show the artist’s name, the album’s name and the mixing&mastering artist’s name where they have the same genre.
select artist.artist_name,album.album_name,album.mnm_artist_name from album inner join artist on album.album_genre=artist.genre;

-- 2)Show the distributor names of producers who are affiliated to the same music label and the format of music they exported in.
select distributor.distributor_name,distributor.format,producer.prod_name from distributor  left join producer on distributor.label_name=producer.label_name;


-- 3)Showcase the artist-producer collaborations of the same label and the genre of the music they have worked on.
select artist.artist_name,artist.genre,producer.prod_name from artist right join producer on artist.label_name=producer.label_name;

-- 4)Show the songs and the album it is from, of an artist and the number of songs in the respective album

select song.song_name ,song.artist_name ,album.no_of_songs from song left join album on song.album_name=album.album_name;

-- Show the number of songs with song length greater than 300 seconds  
select count(*) from song where song_length>300;


-- Show the total no_of_song’s length of the artist name west
select sum(song_length) from song where artist_name='west';

-- Show the average number of songs in an R&B genre album	
select avg(no_of_songs) from album where album_genre='r&b';

-- Show all the artist’s genres of the albums they have worked on 
SELECT ALBUM_GENRE,artist_name FROM ALBUM
    -> UNION
    -> SELECT GENRE,artist_name from artists;
-- 2) Show the common albums in Volume1(table name: album) and Volume2(Table name:album2)
select * from album
    -> intersect
    -> select * from album2;

-- 3)List out the albums that are in volume2 and volume1 with  the duplicates
MariaDB [dbt_project]> select * from album2
    -> union all
    -> select * from album;


-- Create a stored function for classifying a song as “short”,”medium” and “long”:

CREATE FUNCTION howlong(song_length int)
    -> returns varchar(20)
    -> DETERMINISTIC
    -> BEGIN
    -> DECLARE thislong VARCHAR(20);
    -> IF SONG_LENGTH>300 THEN
    -> SET thislong='long';
    -> ELSEIF (song_length<=300 AND song_length>=200) THEN
    -> SET thislong='medium';
    -> elseif song_length<200 THEN
    -> SET thislong='short';
    -> END IF;
    -> RETURN (thislong);
    -> END$$


-- Display the maximum number of songs in a volume of albums	

    DELIMITER &&
     CREATE PROCEDURE display_max_no_of_songs (OUT highsongs INT)
    -> BEGIN
    -> SELECT MAX(no_of_songs) INTO highsongs FROM album;
    -> END &&

-- Increment the number of songs field in album after a song has been added to the song table referencing to an album
DROP TRIGGER IF EXISTS `dbt_project`.`song_AFTER_INSERT`;

DELIMITER $$
USE `dbt_project`$$
CREATE DEFINER = CURRENT_USER TRIGGER `dbt_project`.`song_AFTER_INSERT` AFTER INSERT ON `song` FOR EACH ROW
BEGIN
   update album
   set no_of_songs=no_of_songs+1
   where album_name=NEW.album_name;
END$$
DELIMITER ;


-- Create a stored procedure for showing the number of distributors an album has from the distributes table.
CREATE DEFINER=`root`@`localhost` PROCEDURE `distribute_no`()
BEGIN
select album_name, count(*) as num_distributors from distributes group by album_name;
END

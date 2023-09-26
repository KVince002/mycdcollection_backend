--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4
-- Dumped by pg_dump version 15.4

-- Started on 2023-09-26 11:36:05

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 3344 (class 1262 OID 16398)
-- Name: mycdcollection; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE mycdcollection WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Hungarian_Hungary.1250';


ALTER DATABASE mycdcollection OWNER TO postgres;

\connect mycdcollection

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 3345 (class 0 OID 0)
-- Dependencies: 3344
-- Name: DATABASE mycdcollection; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE mycdcollection IS 'This database for the mycdcollection project';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 216 (class 1259 OID 16512)
-- Name: artist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.artist (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.artist OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16511)
-- Name: artist_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.artist_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.artist_id_seq OWNER TO postgres;

--
-- TOC entry 3346 (class 0 OID 0)
-- Dependencies: 215
-- Name: artist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.artist_id_seq OWNED BY public.artist.id;


--
-- TOC entry 214 (class 1259 OID 16399)
-- Name: cd; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cd (
    id integer NOT NULL,
    cover character varying(100),
    artist character varying(150),
    title character varying(100),
    releasedate smallint NOT NULL,
    genre character varying(15) NOT NULL,
    review text NOT NULL,
    sleeve character varying(20),
    acquired smallint,
    rating character varying(2)
);


ALTER TABLE public.cd OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16583)
-- Name: tracks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tracks (
    id integer NOT NULL,
    title character varying(150) NOT NULL,
    album integer NOT NULL,
    artist character varying(150) NOT NULL
);


ALTER TABLE public.tracks OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16581)
-- Name: tracks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tracks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tracks_id_seq OWNER TO postgres;

--
-- TOC entry 3347 (class 0 OID 0)
-- Dependencies: 217
-- Name: tracks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tracks_id_seq OWNED BY public.tracks.id;


--
-- TOC entry 3182 (class 2604 OID 16515)
-- Name: artist id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artist ALTER COLUMN id SET DEFAULT nextval('public.artist_id_seq'::regclass);


--
-- TOC entry 3183 (class 2604 OID 16586)
-- Name: tracks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracks ALTER COLUMN id SET DEFAULT nextval('public.tracks_id_seq'::regclass);


--
-- TOC entry 3336 (class 0 OID 16512)
-- Dependencies: 216
-- Data for Name: artist; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3334 (class 0 OID 16399)
-- Dependencies: 214
-- Data for Name: cd; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cd VALUES (2, 'http://localhost:3001/images/AlbumCovers/Donda2.jpg', 'Kanye West', 'Donda [Disc 2]', 2022, 'Rap', 'Honestly I only listened this CD like one time. it’s not my favorite becaused it feels like it recycled from the Disc 1. But still I’m not reget it!', 'Plastic Case', 2022, '3');
INSERT INTO public.cd VALUES (7, 'http://localhost:3001/images/AlbumCovers/30.jpg', 'Adele', '30', 2021, 'Pop', 'I’m not going to sugarcoat it, bought it because an Adele CD. I liked the album named „25” so I tought it will be good and yes I like it. I’ld reather listen this on CD player’s speaker insted of my headphones! Not to mention the booklet! It’s full of photos!', 'Plastic Case', 2022, '4');
INSERT INTO public.cd VALUES (1, 'http://localhost:3001/images/AlbumCovers/ÖSZTÖNLÉNY.jpg', 'Krúbi', 'ÖSZTÖNLÉNY', 2020, 'Rap', 'That’s my first ever Hungarian Music that purchaesd. Honestly it’s not a mainstream for me, but sometimes it’s good listen a few songs from the album such as „Lejtő”, „Csekk” and „Dinamit”.', 'Plastic Case', 2023, '3');
INSERT INTO public.cd VALUES (3, 'http://localhost:3001/images/AlbumCovers/EYEYE.jpg', 'Lykke Li', 'Eyeye', 2022, 'Electronica', 'Firstly I doubted it’s going to be a good purchase, but turned out to be decent! I pretty much like this album especially listening on CD player not on headphones.', 'Paper sleeve', 2023, '5');
INSERT INTO public.cd VALUES (4, 'http://localhost:3001/images/AlbumCovers/IneverLearn.jpg', 'Lykke Li', 'I Never Learn', 2014, 'Electronica', 'I partly like this CD and album. I prefer a few song on like „Sleeping Alone” or „Gunshot” etc. Only a few times I listened to the end. I dont reget it ’cause it has got a nice booklet!', 'Paper sleeve', 2023, '4');
INSERT INTO public.cd VALUES (5, 'http://localhost:3001/images/AlbumCovers/YouthNovels.jpg', 'Lykke Li', 'Youth Novels', 2008, 'Electronica', 'Now thats the album that I kinda reget it. It tought this album has the song name „Rich Kids Blues” but turns out to be not! Honestly It’s not my favorite but still it was only €4 so I won’t complain at all…', 'Plastic Case', 2023, '3');
INSERT INTO public.cd VALUES (6, 'http://localhost:3001/images/AlbumCovers/HappierThanEver.jpg', 'Billie Eilish', 'Happier Than Ever', 2021, 'Alternative', 'My first ever CD purchase! I was with my Grandmother when I purchased, and she said: „U sure it’s a good cd/album? She’s crying on the cover. This is not my type...”. Lucky me, I can listen this CD every time!', 'Paper sleeve', 2021, '5');
INSERT INTO public.cd VALUES (8, 'http://localhost:3001/images/AlbumCovers/808s.jpg', 'Kanye West', '808s & Heartbreak', 2008, 'Rap', 'I bought this CD without knowing any tracks of it. Lucky for me it turns out like them all (almost). I’ve got a poster and booklet too!', 'Paper sleeve', 2023, '4');
INSERT INTO public.cd VALUES (9, 'http://localhost:3001/images/AlbumCovers/CrackerIsland.jpg', 'Gorillaz', 'Cracker Island', 2023, 'Indie Rock', 'My first impression was „It’s not good enough to be Gorillaz album!”, then second time: „I like it! I defenetly, want that!”. A few days later one of the music shops on Facebook shered a post thats said we got in stock! Next day a rushed to the shop and get a copy for myself. One of my favorites and also a reall nice booklet too!', 'Paper sleeve', 2023, '4');
INSERT INTO public.cd VALUES (10, 'http://localhost:3001/images/AlbumCovers/DemonDays.jpg', 'Gorillaz', 'Demon Days', 2005, 'Indie Rock', 'I bought it, because it was a last on the self and I already got a DVD verision the „DARE” song so „What could go possibly wrong?”. I like it and reccomend it to listen at least one time! Not to mention, the booklet that’s every page is song themed picture!', 'Plastic Case', 2023, '4');
INSERT INTO public.cd VALUES (11, 'http://localhost:3001/images/AlbumCovers/Donda1.jpg', 'Kanye West', 'Donda [Disc 1]', 2021, 'Rap', 'This one has a special story. Few days before Chrismas Me and my Friend (who came back from a different country) then the mall to buy CD for his sibling. We check the CDs and he got in the long queue. A few minutes later a spotted the fully black plastic case. And the barcode stricker said „West Kanye - Donda”. I rushed to my friend to tell him what i found „I have to buy this because its a Kanye West album”, He said „No way!!! Would you like that?” I said „Yes I will payback the price eventually”. In a nutshell it’s my Chrismas present, and I like the songs on it (mostly, it’s too much gospel for me)', 'Plastic Case', 2022, '4');
INSERT INTO public.cd VALUES (12, 'http://localhost:3001/images/AlbumCovers/EndlessSummerVacation.jpg', 'Miley Cyrus', 'Endless Summer Vacation', 2023, 'Pop', 'I bought this with my firend, because I tought it’s overrated so I don’t need it. Turns out I like the song on it, so we went back a week later and we only found some cracked case ones but it’s all right the disc is probably fine.', 'Plastic Case', 2023, '4');
INSERT INTO public.cd VALUES (13, 'http://localhost:3001/images/AlbumCovers/Humanz.jpg', 'Gorillaz', 'Humanz', 2017, 'Indie Rock', 'My favorite Gorilazz Album! What can I say I like almost every song on it! Actually I purchased with the disc The Now Now.', 'Plastic Case', 2022, '5');
INSERT INTO public.cd VALUES (14, 'http://localhost:3001/images/AlbumCovers/MyBeautifulDarkTwistedFantasy.jpg', 'Kanye West', 'My Beautiful Dark Twisted Fantasy', 2010, 'Rap', 'The third Kanye West album that I didn’t know any track from the tracklist before. Truns out I already heard a lot before in TV advertisements! The booklet was Ok and the song is „just right”, but I cant listen it all the time.', 'Plastic Case', 2023, '4');
INSERT INTO public.cd VALUES (15, 'http://localhost:3001/images/AlbumCovers/PlasticBeach.jpg', 'Gorillaz', 'Plastic Beach', 2010, 'Indie Rock', 'Honestly I hoped a bit more from this. It isn’t really my type I like a few song from it!', 'Paper sleeve', 2023, '3');
INSERT INTO public.cd VALUES (16, 'http://localhost:3001/images/AlbumCovers/TheHighlists.jpg', 'The Weeknd', 'The Highlights', 2021, 'R&B', 'Not going to lie a few months ago I had a „The Weeknd phase”, when I mostly listened Weeknd for a while. That’s why a bought it.', 'Plastic Case', 2023, '4');
INSERT INTO public.cd VALUES (17, 'http://localhost:3001/images/AlbumCovers/TheNowNow.jpg', 'Gorillaz', 'The Now Now', 2018, 'Indie Rock', 'My first impression was „it’s ok”  CD. Later on I listened so many times and started to like it even more. Still not my favorite but it has a uniqe vibe.', 'Plastic Case', 2022, '4');
INSERT INTO public.cd VALUES (18, 'http://localhost:3001/images/AlbumCovers/BestofVol1.jpg', 'Depeche Mode', 'The Best Of, Vol. 1', 1989, 'Alternative', 'My father was a big Depeche Mode fan way back ago. He listened so much he stated to dislike it. When I was young and sitting a car when we traveled usually these songs played. I bought it because time to time I like to listen it.', 'Plastic Case', 2023, '4');


--
-- TOC entry 3338 (class 0 OID 16583)
-- Dependencies: 218
-- Data for Name: tracks; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tracks VALUES (1, 'JÉGHIDEG', 1, 'Krúbi');
INSERT INTO public.tracks VALUES (2, 'LEJTŐ', 1, 'Krúbi');
INSERT INTO public.tracks VALUES (3, 'FELEJTŐ', 1, 'Krúbi');
INSERT INTO public.tracks VALUES (4, 'CSEKK', 1, 'Krúbi');
INSERT INTO public.tracks VALUES (5, 'DINAMIT', 1, 'Krúbi');
INSERT INTO public.tracks VALUES (6, 'PETŐFI', 1, 'Krúbi');
INSERT INTO public.tracks VALUES (7, 'PUSZI', 1, 'Krúbi');
INSERT INTO public.tracks VALUES (8, 'SAPIENS', 1, 'Krúbi');
INSERT INTO public.tracks VALUES (9, 'KUTYA', 1, 'Krúbi');
INSERT INTO public.tracks VALUES (10, 'COPFOCSKA', 1, 'Krúbi');
INSERT INTO public.tracks VALUES (11, 'Keep My Spirit Alive', 2, 'Kanye West');
INSERT INTO public.tracks VALUES (12, 'Jesus Lord pt 2', 2, 'Kanye West');
INSERT INTO public.tracks VALUES (13, 'Heaven And Hell', 2, 'Kanye West');
INSERT INTO public.tracks VALUES (14, 'Remote Control', 2, 'Kanye West');
INSERT INTO public.tracks VALUES (15, 'Tell The Vision', 2, 'Kanye West');
INSERT INTO public.tracks VALUES (16, 'Jonah', 2, 'Kanye West');
INSERT INTO public.tracks VALUES (17, 'Pure Souls', 2, 'Kanye West');
INSERT INTO public.tracks VALUES (18, 'Ok Ok', 2, 'Kanye West');
INSERT INTO public.tracks VALUES (19, 'New Again', 2, 'Kanye West');
INSERT INTO public.tracks VALUES (20, 'Jesus Lord', 2, 'Kanye West');
INSERT INTO public.tracks VALUES (21, 'Ok Ok Pt 2', 2, 'Kanye West');
INSERT INTO public.tracks VALUES (22, 'Junya Pt 2', 2, 'Kanye West');
INSERT INTO public.tracks VALUES (23, 'Jail Pt 2', 2, 'Kanye West');
INSERT INTO public.tracks VALUES (24, 'Keep My Spirit Alive pt 2', 2, 'Kanye West');
INSERT INTO public.tracks VALUES (25, 'No Hotel', 3, 'Lykke Li');
INSERT INTO public.tracks VALUES (26, 'You Don''t Go Away', 3, 'Lykke Li');
INSERT INTO public.tracks VALUES (27, 'Highway To Your Heart', 3, 'Lykke Li');
INSERT INTO public.tracks VALUES (28, 'Happy Hurts', 3, 'Lykke Li');
INSERT INTO public.tracks VALUES (29, 'Carousel', 3, 'Lykke Li');
INSERT INTO public.tracks VALUES (30, '5D', 3, 'Lykke Li');
INSERT INTO public.tracks VALUES (31, 'Over', 3, 'Lykke Li');
INSERT INTO public.tracks VALUES (32, 'ü&i', 3, 'Lykke Li');
INSERT INTO public.tracks VALUES (33, 'I Never Learn', 4, 'Lykke Li');
INSERT INTO public.tracks VALUES (34, 'No Rest For The Wicked', 4, 'Lykke Li');
INSERT INTO public.tracks VALUES (35, 'Just Like A Dream', 4, 'Lykke Li');
INSERT INTO public.tracks VALUES (36, 'Silver Line', 4, 'Lykke Li');
INSERT INTO public.tracks VALUES (37, 'Gunshot', 4, 'Lykke Li');
INSERT INTO public.tracks VALUES (38, 'Love Me Like I''m Not Made Of Stone', 4, 'Lykke Li');
INSERT INTO public.tracks VALUES (39, 'Never Gonna Love Again', 4, 'Lykke Li');
INSERT INTO public.tracks VALUES (40, 'Heart Of Steel', 4, 'Lykke Li');
INSERT INTO public.tracks VALUES (41, 'Sleeping Alone', 4, 'Lykke Li');
INSERT INTO public.tracks VALUES (42, 'Melodies & Desires', 5, 'Lykke Li');
INSERT INTO public.tracks VALUES (43, 'Dance, Dance, Dance', 5, 'Lykke Li');
INSERT INTO public.tracks VALUES (44, 'I''m Good, I''m Gone', 5, 'Lykke Li');
INSERT INTO public.tracks VALUES (45, 'Let It Fall', 5, 'Lykke Li');
INSERT INTO public.tracks VALUES (46, 'My Love', 5, 'Lykke Li');
INSERT INTO public.tracks VALUES (47, 'Tonight', 5, 'Lykke Li');
INSERT INTO public.tracks VALUES (48, 'Little Bit', 5, 'Lykke Li');
INSERT INTO public.tracks VALUES (49, 'Hanging High', 5, 'Lykke Li');
INSERT INTO public.tracks VALUES (50, 'This Trumpet In My Head', 5, 'Lykke Li');
INSERT INTO public.tracks VALUES (51, 'Complaint Department', 5, 'Lykke Li');
INSERT INTO public.tracks VALUES (52, 'Breaking It Up', 5, 'Lykke Li');
INSERT INTO public.tracks VALUES (53, 'Everybody But Me', 5, 'Lykke Li');
INSERT INTO public.tracks VALUES (54, 'Time Flies', 5, 'Lykke Li');
INSERT INTO public.tracks VALUES (55, 'Window Blues', 5, 'Lykke Li');
INSERT INTO public.tracks VALUES (56, 'Getting Older', 6, 'Billie Eilish');
INSERT INTO public.tracks VALUES (57, 'I Didn''t Change My Number', 6, 'Billie Eilish');
INSERT INTO public.tracks VALUES (58, 'Billie Bossa Nova', 6, 'Billie Eilish');
INSERT INTO public.tracks VALUES (59, 'my future', 6, 'Billie Eilish');
INSERT INTO public.tracks VALUES (60, 'Oxytocin', 6, 'Billie Eilish');
INSERT INTO public.tracks VALUES (61, 'GOLDWING', 6, 'Billie Eilish');
INSERT INTO public.tracks VALUES (62, 'Lost Cause', 6, 'Billie Eilish');
INSERT INTO public.tracks VALUES (63, 'Halley''s Comet', 6, 'Billie Eilish');
INSERT INTO public.tracks VALUES (64, 'Not My Responsibility', 6, 'Billie Eilish');
INSERT INTO public.tracks VALUES (65, 'OverHeated', 6, 'Billie Eilish');
INSERT INTO public.tracks VALUES (66, 'Everybody Dies', 6, 'Billie Eilish');
INSERT INTO public.tracks VALUES (67, 'Your Power', 6, 'Billie Eilish');
INSERT INTO public.tracks VALUES (68, 'NDA', 6, 'Billie Eilish');
INSERT INTO public.tracks VALUES (69, 'Therefore I Am', 6, 'Billie Eilish');
INSERT INTO public.tracks VALUES (70, 'Happier Than Ever', 6, 'Billie Eilish');
INSERT INTO public.tracks VALUES (71, 'Male Fantasy', 6, 'Billie Eilish');
INSERT INTO public.tracks VALUES (72, 'Strangers By Nature', 7, 'Adele');
INSERT INTO public.tracks VALUES (73, 'Easy On Me', 7, 'Adele');
INSERT INTO public.tracks VALUES (74, 'My Little Love', 7, 'Adele');
INSERT INTO public.tracks VALUES (75, 'Cry Your Heart Out', 7, 'Adele');
INSERT INTO public.tracks VALUES (76, 'Oh My God', 7, 'Adele');
INSERT INTO public.tracks VALUES (77, 'Can I Get It', 7, 'Adele');
INSERT INTO public.tracks VALUES (78, 'I Drink Wine', 7, 'Adele');
INSERT INTO public.tracks VALUES (79, 'All Night Parking Interlude', 7, 'Adele & Erroll Garner');
INSERT INTO public.tracks VALUES (80, 'Woman Like Me', 7, 'Adele');
INSERT INTO public.tracks VALUES (81, 'Hold On', 7, 'Adele');
INSERT INTO public.tracks VALUES (82, 'To Be Loved', 7, 'Adele');
INSERT INTO public.tracks VALUES (83, 'Love Is A Game', 7, 'Adele');
INSERT INTO public.tracks VALUES (84, 'Say You Will', 8, 'Kanye West');
INSERT INTO public.tracks VALUES (85, 'Welcome To Heartbreak', 8, 'Kanye West Feat. Kid Cudi');
INSERT INTO public.tracks VALUES (86, 'Heartless', 8, 'Kanye West');
INSERT INTO public.tracks VALUES (87, 'Amazing', 8, 'Kanye West Feat. Young Jeezy');
INSERT INTO public.tracks VALUES (88, 'Love Lockdown', 8, 'Kanye West');
INSERT INTO public.tracks VALUES (89, 'Paranoid', 8, 'Kanye West Feat. Mr. Hudson');
INSERT INTO public.tracks VALUES (90, 'RoboCop', 8, 'Kanye West');
INSERT INTO public.tracks VALUES (91, 'Street Lights', 8, 'Kanye West');
INSERT INTO public.tracks VALUES (92, 'Bad News', 8, 'Kanye West');
INSERT INTO public.tracks VALUES (93, 'See You In My Nightmare', 8, 'Kanye West Feat. Lil Wayne');
INSERT INTO public.tracks VALUES (94, 'Coldest Winter', 8, 'Kanye West');
INSERT INTO public.tracks VALUES (95, 'Pinocchio Story [Live]', 8, 'Kanye West');
INSERT INTO public.tracks VALUES (96, 'Cracker Island', 9, 'Gorillaz Feat. Thundercat');
INSERT INTO public.tracks VALUES (97, 'Oil', 9, 'Gorillaz Feat. Stevie Nicks');
INSERT INTO public.tracks VALUES (98, 'The Tired Influencer', 9, 'Gorillaz');
INSERT INTO public.tracks VALUES (99, 'Silent Running', 9, 'Gorillaz Feat. Adeleye Omotayo');
INSERT INTO public.tracks VALUES (100, 'New Gold', 9, 'Gorillaz Feat. Tame Impala & Bootie Brown');
INSERT INTO public.tracks VALUES (101, 'Baby Queen', 9, 'Gorillaz');
INSERT INTO public.tracks VALUES (102, 'Tarantula', 9, 'Gorillaz');
INSERT INTO public.tracks VALUES (103, 'Tormenta', 9, 'Gorillaz Feat. Bad Bunny');
INSERT INTO public.tracks VALUES (104, 'Skinny Ape', 9, 'Gorillaz');
INSERT INTO public.tracks VALUES (105, 'Possession Island', 9, 'Gorillaz Feat. Beck');
INSERT INTO public.tracks VALUES (106, 'Intro', 10, 'Gorillaz');
INSERT INTO public.tracks VALUES (107, 'Last Living Souls', 10, 'Gorillaz');
INSERT INTO public.tracks VALUES (108, 'Kids With Guns', 10, 'Gorillaz Feat. Neneh Cherry');
INSERT INTO public.tracks VALUES (109, 'O Green World', 10, 'Gorillaz');
INSERT INTO public.tracks VALUES (110, 'Dirty Harry', 10, 'Gorillaz Feat. Bootie Brown');
INSERT INTO public.tracks VALUES (111, 'Feel Good Inc.', 10, 'Gorillaz Feat. De La Soul');
INSERT INTO public.tracks VALUES (112, 'El Manana', 10, 'Gorillaz');
INSERT INTO public.tracks VALUES (113, 'Every Planet We Reach Is Dead', 10, 'Gorillaz');
INSERT INTO public.tracks VALUES (114, 'November Has Come', 10, 'Gorillaz Feat. MF DOOM');
INSERT INTO public.tracks VALUES (115, 'All Alone', 10, 'Gorillaz Feat. Roots Manuva');
INSERT INTO public.tracks VALUES (116, 'White Light', 10, 'Gorillaz');
INSERT INTO public.tracks VALUES (117, 'Dare', 10, 'Gorillaz Feat. Shaun Ryder');
INSERT INTO public.tracks VALUES (118, 'Fire Coming Out Of The Monkey''s Head', 10, 'Gorillaz');
INSERT INTO public.tracks VALUES (119, 'Don''t Get Lost In Heaven', 10, 'Gorillaz');
INSERT INTO public.tracks VALUES (120, 'Demon Days', 10, 'Gorillaz');
INSERT INTO public.tracks VALUES (121, 'Donda Chant', 11, 'Kanye West');
INSERT INTO public.tracks VALUES (122, 'Hurricane - Version 2', 11, 'Kanye West');
INSERT INTO public.tracks VALUES (123, 'Moon', 11, 'Kanye West');
INSERT INTO public.tracks VALUES (124, 'Life Of The Party', 11, 'Kanye West');
INSERT INTO public.tracks VALUES (125, 'Off The Grid', 11, 'Kanye West');
INSERT INTO public.tracks VALUES (126, 'Jail', 11, 'Kanye West');
INSERT INTO public.tracks VALUES (127, 'Praise God', 11, 'Kanye West');
INSERT INTO public.tracks VALUES (128, 'Come to Life', 11, 'Kanye West');
INSERT INTO public.tracks VALUES (129, 'Believe What I Say', 11, 'Kanye West');
INSERT INTO public.tracks VALUES (130, 'No Child Left Behind', 11, 'Kanye West');
INSERT INTO public.tracks VALUES (131, 'Up From The Ashes', 11, 'Kanye West');
INSERT INTO public.tracks VALUES (132, 'Remote Control Pt 2', 11, 'Kanye West');
INSERT INTO public.tracks VALUES (133, 'God Breathed', 11, 'Kanye West');
INSERT INTO public.tracks VALUES (134, 'Lord I Need You', 11, 'Kanye West');
INSERT INTO public.tracks VALUES (135, '24', 11, 'Kanye West');
INSERT INTO public.tracks VALUES (136, 'Junya', 11, 'Kanye West');
INSERT INTO public.tracks VALUES (137, 'Never Abandon Your Family', 11, 'Kanye West');
INSERT INTO public.tracks VALUES (138, 'Donda', 11, 'Kanye West');
INSERT INTO public.tracks VALUES (139, 'Flowers', 12, 'Miley Cyrus');
INSERT INTO public.tracks VALUES (140, 'Jaded', 12, 'Miley Cyrus');
INSERT INTO public.tracks VALUES (141, 'Rose Colored Lenses', 12, 'Miley Cyrus');
INSERT INTO public.tracks VALUES (142, 'Thousand Miles', 12, 'Miley Cyrus Feat. Brandi Carlile');
INSERT INTO public.tracks VALUES (143, 'You', 12, 'Miley Cyrus');
INSERT INTO public.tracks VALUES (144, 'Handstand', 12, 'Miley Cyrus');
INSERT INTO public.tracks VALUES (145, 'River', 12, 'Miley Cyrus');
INSERT INTO public.tracks VALUES (146, 'Violet Chemistry', 12, 'Miley Cyrus');
INSERT INTO public.tracks VALUES (147, 'Muddy Feet', 12, 'Miley Cyrus Feat. Sia');
INSERT INTO public.tracks VALUES (148, 'Wildcard', 12, 'Miley Cyrus');
INSERT INTO public.tracks VALUES (149, 'Island', 12, 'Miley Cyrus');
INSERT INTO public.tracks VALUES (150, 'Wonder Woman', 12, 'Miley Cyrus');
INSERT INTO public.tracks VALUES (151, 'Intro: I Switched My Robot Off', 13, 'Gorillaz');
INSERT INTO public.tracks VALUES (152, 'Ascension', 13, 'Gorillaz');
INSERT INTO public.tracks VALUES (153, 'Strobelite', 13, 'Gorillaz');
INSERT INTO public.tracks VALUES (154, 'Saturnz Barz', 13, 'Gorillaz');
INSERT INTO public.tracks VALUES (155, 'Momentz', 13, 'Gorillaz');
INSERT INTO public.tracks VALUES (156, 'Interlude: The Non-Conformist Oath', 13, 'Gorillaz');
INSERT INTO public.tracks VALUES (157, 'Submission', 13, 'Gorillaz');
INSERT INTO public.tracks VALUES (158, 'Charger', 13, 'Gorillaz');
INSERT INTO public.tracks VALUES (159, 'Interlude: Elevator Going Up', 13, 'Gorillaz');
INSERT INTO public.tracks VALUES (160, 'Andromeda', 13, 'Gorillaz');
INSERT INTO public.tracks VALUES (161, 'Busted And Blue', 13, 'Gorillaz');
INSERT INTO public.tracks VALUES (162, 'Interlude: Talk Radio', 13, 'Gorillaz');
INSERT INTO public.tracks VALUES (163, 'Carnival', 13, 'Gorillaz');
INSERT INTO public.tracks VALUES (164, 'Let Me Out', 13, 'Gorillaz');
INSERT INTO public.tracks VALUES (165, 'Interlude: Penthouse', 13, 'Gorillaz');
INSERT INTO public.tracks VALUES (166, 'Sex Murder Party', 13, 'Gorillaz');
INSERT INTO public.tracks VALUES (167, 'She''s My Collar', 13, 'Gorillaz');
INSERT INTO public.tracks VALUES (168, 'Interlude: The Elephant', 13, 'Gorillaz');
INSERT INTO public.tracks VALUES (169, 'Hallelujah Money', 13, 'Gorillaz');
INSERT INTO public.tracks VALUES (170, 'We Got The Power', 13, 'Gorillaz');
INSERT INTO public.tracks VALUES (171, 'Dark Fantasy', 14, 'Kanye West');
INSERT INTO public.tracks VALUES (172, 'Gorgeous', 14, 'Kanye West Feat. Kid Cudi & Raekwon');
INSERT INTO public.tracks VALUES (173, 'POWER', 14, 'Kanye West');
INSERT INTO public.tracks VALUES (174, 'All Of The Lights (Interlude)', 14, 'Kanye West');
INSERT INTO public.tracks VALUES (175, 'All Of The Lights', 14, 'Kanye West');
INSERT INTO public.tracks VALUES (176, 'Monster', 14, 'Kanye West Feat. Jay-Z, Rick Ross, Nicki Minaj & Bon Iver');
INSERT INTO public.tracks VALUES (177, 'So Appalled', 14, 'Kanye West Feat. Jay-Z, Pusha T, Prynce Cy Hi, Swizz Beatz & The RZA');
INSERT INTO public.tracks VALUES (178, 'Devil In A New Dress', 14, 'Kanye West Feat. Rick Ross');
INSERT INTO public.tracks VALUES (179, 'Runaway', 14, 'Kanye West Feat. Pusha T');
INSERT INTO public.tracks VALUES (180, 'Hell Of A Life', 14, 'Kanye West');
INSERT INTO public.tracks VALUES (181, 'Blame Game', 14, 'Kanye West Feat. John Legend');
INSERT INTO public.tracks VALUES (182, 'Lost In The World', 14, 'Kanye West Feat. Bon Iver');
INSERT INTO public.tracks VALUES (183, 'Who Will Survive In America', 14, 'Kanye West');
INSERT INTO public.tracks VALUES (184, 'Orchestral Intro', 15, 'Gorillaz Feat. Sinfonia ViVA');
INSERT INTO public.tracks VALUES (185, 'Welcome To The World Of The Plastic Beach', 15, 'Gorillaz Feat. Snoop Dogg & Hypnotic Brass Ensemble');
INSERT INTO public.tracks VALUES (186, 'White Flag', 15, 'Gorillaz Feat. Bashy, Kano & The National Orchestra For Arabic Music');
INSERT INTO public.tracks VALUES (187, 'Rhinestone Eyes', 15, 'Gorillaz');
INSERT INTO public.tracks VALUES (188, 'Stylo', 15, 'Gorillaz Feat. Bobby Womack & Mos Def');
INSERT INTO public.tracks VALUES (189, 'Superfast Jellyfish', 15, 'Gorillaz Feat. Gruff Rhys & De La Soul');
INSERT INTO public.tracks VALUES (190, 'Empire Ants', 15, 'Gorillaz Feat. Little Dragon');
INSERT INTO public.tracks VALUES (191, 'Glitter Freeze', 15, 'Gorillaz Feat. Mark E. Smith');
INSERT INTO public.tracks VALUES (192, 'Some Kind Of Nature', 15, 'Gorillaz Feat. Lou Reed');
INSERT INTO public.tracks VALUES (193, 'On Melancholy Hill', 15, 'Gorillaz');
INSERT INTO public.tracks VALUES (194, 'Broken', 15, 'Gorillaz');
INSERT INTO public.tracks VALUES (195, 'Sweepstakes', 15, 'Gorillaz Feat. Mos Def & Hypnotic Brass Ensemble');
INSERT INTO public.tracks VALUES (196, 'Plastic Beach', 15, 'Gorillaz Feat. Mick Jones & Paul Simonon');
INSERT INTO public.tracks VALUES (197, 'To Binge', 15, 'Gorillaz Feat. Little Dragon');
INSERT INTO public.tracks VALUES (198, 'Cloud Of Unknowing', 15, 'Gorillaz Feat. Bobby Womack & Sinfonia ViVA');
INSERT INTO public.tracks VALUES (199, 'Pirate Jet', 15, 'Gorillaz');
INSERT INTO public.tracks VALUES (200, 'Save Your Tears', 16, 'The Weeknd');
INSERT INTO public.tracks VALUES (201, 'Blinding Lights', 16, 'The Weeknd');
INSERT INTO public.tracks VALUES (202, 'In Your Eyes', 16, 'The Weeknd');
INSERT INTO public.tracks VALUES (203, 'Can''t Feel My Face', 16, 'The Weeknd');
INSERT INTO public.tracks VALUES (204, 'I Feel It Coming', 16, 'The Weeknd Feat. Daft Punk');
INSERT INTO public.tracks VALUES (205, 'Starboy', 16, 'The Weeknd Feat. Daft Punk');
INSERT INTO public.tracks VALUES (206, 'Pray For Me', 16, 'The Weeknd & Kendrick Lamar');
INSERT INTO public.tracks VALUES (207, 'Heartless', 16, 'The Weeknd');
INSERT INTO public.tracks VALUES (208, 'Often', 16, 'The Weeknd');
INSERT INTO public.tracks VALUES (209, 'The Hills', 16, 'The Weeknd');
INSERT INTO public.tracks VALUES (210, 'Call Out My Name', 16, 'The Weeknd');
INSERT INTO public.tracks VALUES (211, 'Die For You', 16, 'The Weeknd');
INSERT INTO public.tracks VALUES (212, 'Earned It (Fifty Shades Of Grey)', 16, 'The Weeknd');
INSERT INTO public.tracks VALUES (213, 'Love Me Harder', 16, 'Ariana Grande Feat. The Weeknd');
INSERT INTO public.tracks VALUES (214, 'Acquainted', 16, 'The Weeknd');
INSERT INTO public.tracks VALUES (215, 'Wicked Games', 16, 'The Weeknd');
INSERT INTO public.tracks VALUES (216, 'The Morning', 16, 'The Weeknd');
INSERT INTO public.tracks VALUES (217, 'After Hours', 16, 'The Weeknd');
INSERT INTO public.tracks VALUES (218, 'Humility', 17, 'Gorillaz');
INSERT INTO public.tracks VALUES (219, 'Tranz', 17, 'Gorillaz');
INSERT INTO public.tracks VALUES (220, 'Hollywood', 17, 'Gorillaz');
INSERT INTO public.tracks VALUES (221, 'Kansas', 17, 'Gorillaz');
INSERT INTO public.tracks VALUES (222, 'Sorcererz', 17, 'Gorillaz');
INSERT INTO public.tracks VALUES (223, 'Idaho', 17, 'Gorillaz');
INSERT INTO public.tracks VALUES (224, 'Lake Zurich', 17, 'Gorillaz');
INSERT INTO public.tracks VALUES (225, 'Magic City', 17, 'Gorillaz');
INSERT INTO public.tracks VALUES (226, 'Fire Flies', 17, 'Gorillaz');
INSERT INTO public.tracks VALUES (227, 'One Percent', 17, 'Gorillaz');
INSERT INTO public.tracks VALUES (228, 'Souk Eye', 17, 'Gorillaz');
INSERT INTO public.tracks VALUES (229, 'Personal Jesus [7" Version]', 18, 'Depeche Mode');
INSERT INTO public.tracks VALUES (230, 'Just Can''t Get Enough', 18, 'Depeche Mode');
INSERT INTO public.tracks VALUES (231, 'Everything Counts [Edit]', 18, 'Depeche Mode');
INSERT INTO public.tracks VALUES (232, 'Enjoy The Silence [7" Version]', 18, 'Depeche Mode');
INSERT INTO public.tracks VALUES (233, 'Shake The Disease', 18, 'Depeche Mode');
INSERT INTO public.tracks VALUES (234, 'See You', 18, 'Depeche Mode');
INSERT INTO public.tracks VALUES (235, 'It''s No Good', 18, 'Depeche Mode');
INSERT INTO public.tracks VALUES (236, 'Strangelove [Single Version]', 18, 'Depeche Mode');
INSERT INTO public.tracks VALUES (237, 'Suffer Well', 18, 'Depeche Mode');
INSERT INTO public.tracks VALUES (238, 'Dream On [Single Version]', 18, 'Depeche Mode');
INSERT INTO public.tracks VALUES (239, 'People Are People', 18, 'Depeche Mode');
INSERT INTO public.tracks VALUES (240, 'Martyr', 18, 'Depeche Mode');
INSERT INTO public.tracks VALUES (241, 'Walking In My Shoes [7" Mix]', 18, 'Depeche Mode');
INSERT INTO public.tracks VALUES (242, 'I Feel You', 18, 'Depeche Mode');
INSERT INTO public.tracks VALUES (243, 'Precious', 18, 'Depeche Mode');
INSERT INTO public.tracks VALUES (244, 'Master And Servant [Edit]', 18, 'Depeche Mode');
INSERT INTO public.tracks VALUES (245, 'New Life', 18, 'Depeche Mode');
INSERT INTO public.tracks VALUES (246, 'Never Let Me Down Again [Single Version]', 18, 'Depeche Mode');


--
-- TOC entry 3348 (class 0 OID 0)
-- Dependencies: 215
-- Name: artist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.artist_id_seq', 1, false);


--
-- TOC entry 3349 (class 0 OID 0)
-- Dependencies: 217
-- Name: tracks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tracks_id_seq', 1, false);


--
-- TOC entry 3187 (class 2606 OID 16517)
-- Name: artist artist_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artist
    ADD CONSTRAINT artist_pkey PRIMARY KEY (id);


--
-- TOC entry 3185 (class 2606 OID 16403)
-- Name: cd cd_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cd
    ADD CONSTRAINT cd_pkey PRIMARY KEY (id);


--
-- TOC entry 3189 (class 2606 OID 16589)
-- Name: tracks tracks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracks
    ADD CONSTRAINT tracks_pkey PRIMARY KEY (id);


--
-- TOC entry 3190 (class 2606 OID 16518)
-- Name: artist fkey_cd_artist; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artist
    ADD CONSTRAINT fkey_cd_artist FOREIGN KEY (id) REFERENCES public.cd(id);


--
-- TOC entry 3191 (class 2606 OID 16595)
-- Name: tracks fkey_cd_tracks; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracks
    ADD CONSTRAINT fkey_cd_tracks FOREIGN KEY (album) REFERENCES public.cd(id);


-- Completed on 2023-09-26 11:36:05

--
-- PostgreSQL database dump complete
--


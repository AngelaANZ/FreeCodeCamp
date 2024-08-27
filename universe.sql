--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: discoverer; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.discoverer (
    discoverer_id integer NOT NULL,
    name character varying(30) NOT NULL,
    birth_date date,
    death_date date
);


ALTER TABLE public.discoverer OWNER TO freecodecamp;

--
-- Name: discoverer_discoverer_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.discoverer_discoverer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.discoverer_discoverer_id_seq OWNER TO freecodecamp;

--
-- Name: discoverer_discoverer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.discoverer_discoverer_id_seq OWNED BY public.discoverer.discoverer_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text NOT NULL,
    galaxy_type character varying(60),
    distance_in_millions_of_light_years numeric(6,3)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text NOT NULL,
    planet_id integer,
    discoverer_id integer,
    discovery_year integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text NOT NULL,
    orbit_period_in_earth_days numeric(12,6),
    has_rings boolean,
    number_of_moons integer,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text NOT NULL,
    is_binary boolean,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: discoverer discoverer_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.discoverer ALTER COLUMN discoverer_id SET DEFAULT nextval('public.discoverer_discoverer_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: discoverer; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.discoverer VALUES (1, 'Asaph Hall III', '1829-10-15', '1907-11-22');
INSERT INTO public.discoverer VALUES (2, 'Galileo Galilei', '1564-02-15', '1642-01-08');
INSERT INTO public.discoverer VALUES (3, 'William Herschel', '1738-11-15', '1822-08-25');
INSERT INTO public.discoverer VALUES (4, 'Giovanni Domenico Cassini', '1625-06-08', '1712-09-14');
INSERT INTO public.discoverer VALUES (5, 'Christiaan Huygens', '1629-04-14', '1695-07-08');
INSERT INTO public.discoverer VALUES (6, 'William Henry Pickering', '1858-02-15', '1938-01-16');
INSERT INTO public.discoverer VALUES (7, 'William Lassell', '1799-06-18', '1880-10-05');
INSERT INTO public.discoverer VALUES (8, 'Gerard Kuiper', '1905-12-07', '1973-12-23');
INSERT INTO public.discoverer VALUES (9, 'Stephen P. Synnott', NULL, NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'This is the galaxy containing the Sun and its Solar System, and therefore Earth.', 'Barred spiral galaxy', 0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'The Andromeda Galaxy is the nearest major galaxy to the Milky Way. It was originally named the Andromeda Nebula.', 'Barred spiral galaxy', 2.54);
INSERT INTO public.galaxy VALUES (3, 'Centaurus A', 'Centaurus A (also known as NGC 5128 or Caldwell 77) is a galaxy in the constellation of Centaurus.', 'Radio galaxy', 13.7);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'The Whirlpool Galaxy, also known as Messier 51a (M51a) or NGC 5194, lies in the constellation Canes Venatici, and was the first galaxy to be classified as a spiral galaxy.', 'Interacting grand-design spiral galaxy', 23.5);
INSERT INTO public.galaxy VALUES (5, 'Triangulum', 'The Triangulum Galaxy is catalogued as Messier 33 or NGC 598. It is the third-largest member of the Local Group of galaxies, behind the Andromeda Galaxy and the Milky Way.', 'Spiral galaxy', 3.2);
INSERT INTO public.galaxy VALUES (6, 'Sculptor', 'The Sculptor Galaxy (also known as the Silver Coin Galaxy, Silver Dollar Galaxy, NGC 253, or Caldwell 65) is a starburst galaxy, which means that it is currently undergoing a period of intense star formation.', 'Intermediate spiral galaxy', 11.4);
INSERT INTO public.galaxy VALUES (7, 'Messier 63', 'Messier 63 or M63, also known as NGC 5055 or the seldom-used Sunflower Galaxy, is in the northern constellation of Canes Venatici with approximately 400 billion stars.', 'Spiral galaxy', 29.3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The Sun is a G-type main-sequence star. It contains almost 99.9% of all the mass in the Solar System.', FALSE, 1);
INSERT INTO public.star VALUES (2, 'Alpha Centauri C', 'Alpha Centauri C, better known as Proxima Centauri, is a small main-sequence red dwarf of spectral class M6-Ve. It is the closest star to the Sun but is too faint to be visible to the naked eye.', FALSE, 1);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 'Alpha Centauri A, also known as Rigil Kentaurus, is the principal member, or primary, of the binary system.', TRUE, 1);
INSERT INTO public.star VALUES (4, 'Alpha Centauri B', 'Alpha Centauri B, also known as Toliman, is the secondary star of the binary system.', TRUE, 1);
INSERT INTO public.star VALUES (5, 'Barnard''s Star', 'Barnard''s Star is a small red dwarf star in the constellation of Ophiuchus. It is the fourth-nearest-known individual star to the Sun after the three components of the Alpha Centauri system, and is the closest star in the northern celestial hemisphere.', FALSE, 1);
INSERT INTO public.star VALUES (6, 'Canopus', 'Sirius is the brightest star in the night sky. Its name is derived from the Greek meaning ''glowing'' or ''scorching''.', FALSE, 1);
INSERT INTO public.star VALUES (7, 'Luyten''s Star', 'Luyten''s Star (GJ 273) is a red dwarf in the constellation Canis Minor. It is named after Willem Jacob Luyten, who, in collaboration with Edwin G. Ebbighausen, first determined its high proper motion in 1935.', FALSE, 1);
INSERT INTO public.star VALUES (8, '51 Eridani', '51 Eridani is a star in the constellation Eridanus.', FALSE, 1);
INSERT INTO public.star VALUES (9, 'Xi Aquilae', 'Xi Aquilae, officially named Libertas, is a red-clump giant star in the equatorial constellation of Aquila.', FALSE, 1);
INSERT INTO public.star VALUES (10, 'Ross 128 b', 'Ross 128 is a red dwarf in the equatorial zodiac constellation of Virgo.', FALSE, 1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Mercury is the first planet from the Sun and the smallest in the Solar System. In English, it is named after the ancient Roman god Mercurius (Mercury), god of commerce and communication, and the messenger of the gods.', 87.969, FALSE, 0, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Venus is the second planet from the Sun. It is named after the Roman goddess of love.', 224.701, FALSE, 0, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'Earth is the third planet from the Sun and the only astronomical object known to harbor life.', 365.256363, FALSE, 1, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Mars is the fourth planet from the Sun. The Romans named the planet Mars after their god of war.', 686.971, FALSE, 2, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Jupiter is the fifth planet from the Sun and the largest in the Solar System. Its name derives from that of Jupiter, the chief deity of ancient Roman religion.', 4332.59, TRUE, 95, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Saturn is the sixth planet from the Sun and the second largest in the Solar System, after Jupiter. Saturn is named after the Roman god of wealth and agriculture, who was the father of the god Jupiter.', 10759.22, TRUE, 146, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Uranus is the seventh planet from the Sun. It is named after the Greek god Uranus (Ouranos), one of the Greek primordial deities.', 30688.5, TRUE, 28, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Neptune is the eighth and farthest known planet from the Sun. It is named after the Roman god of the sea.', 60182, TRUE, 16, 1);
INSERT INTO public.planet VALUES (9, 'Luyten b', 'Luyten b (more commonly known as Gliese 273b) is a confirmed exoplanet, likely rocky, orbiting within the habitable zone of the nearby red dwarf Luyten''s Star.', 18.6498, NULL, NULL, 7);
INSERT INTO public.planet VALUES (10, '51 Eridani b', '51 Eridani b is a "Jupiter-like" planet.', 10260, NULL, NULL, 8);
INSERT INTO public.planet VALUES (11, 'Xi Aquilae b', 'Xi Aquilae b, formally named Fortitudo, is an extrasolar planet in the constellation of Aquila.', 136.75, NULL, NULL, 9);
INSERT INTO public.planet VALUES (12, 'Ross 128 b', 'Ross 128 b is a confirmed Earth-sized exoplanet, likely rocky, that is orbiting within the inner habitable zone of the red dwarf star Ross 128.', 9.8658, NULL, NULL, 10);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'The Moon is Earth''s only natural satellite.', 3, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Phobos is the innermost and larger of the two natural satellites of Mars, the other being Deimos. It is named after Phobos, the Greek god of fear and panic, who is the son of Ares (Mars) and twin brother of Deimos.', 4, 1, 1877);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Deimos is the smaller and outer of the two natural satellites of Mars, the other being Phobos. It is named after Deimos, the Ancient Greek god and personification of dread and terror.', 4, 1, 1877);
INSERT INTO public.moon VALUES (4, 'Io', 'Io, or Jupiter I, is the innermost and second-smallest of the four Galilean moons of the planet Jupiter. It was named after the mythological character Io, a priestess of Hera who became one of Zeus''s lovers.', 5, 2, 1610);
INSERT INTO public.moon VALUES (5, 'Europa', 'Europa, or Jupiter II, is the smallest of the four Galilean moons orbiting Jupiter. Europa was discovered independently by Simon Marius and Galileo Galilei and was named (by Marius) after Europa, the Phoenician mother of King Minos of Crete and lover of Zeus (the Greek equivalent of the Roman god Jupiter).', 5, 2, 1610);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'Ganymede, or Jupiter III, is the largest and most massive natural satellite of Jupiter and in the Solar System. Its name was suggested by astronomer Simon Marius, after the mythological Ganymede, a Trojan prince desired by Zeus (the Greek counterpart of Jupiter), who carried him off to be the cupbearer of the gods.', 5, 2, 1610);
INSERT INTO public.moon VALUES (7, 'Callisto', 'Callisto, or Jupiter IV, is the second-largest moon of Jupiter, after Ganymede. Callisto is named after one of Zeus''s many lovers or other sexual partners in Greek mythology. Callisto was a nymph (or, according to some sources, the daughter of Lycaon) who was associated with the goddess of the hunt, Artemis.', 5, 2, 1610);
INSERT INTO public.moon VALUES (8, 'Mimas', 'Mimas, also designated Saturn I, is the seventh-largest natural satellite of Saturn. Mimas is named after one of the Giants in Greek mythology,', 6, 3, 1789);
INSERT INTO public.moon VALUES (9, 'Dione', 'Dione, also designated Saturn IV, is the fourth-largest moon of Saturn.', 6, 4, 1684);
INSERT INTO public.moon VALUES (10, 'Rhea', 'Rhea is the second-largest moon of Saturn and the ninth-largest moon in the Solar System.', 6, 4, 1672);
INSERT INTO public.moon VALUES (11, 'Titan', 'Titan is the largest moon of Saturn and the second-largest in the Solar System.', 6, 5, 1655);
INSERT INTO public.moon VALUES (12, 'Iapetus', 'Iapetus is the outermost of Saturn''s large moons. Named after the Titan Iapetus.', 6, 4, 1673);
INSERT INTO public.moon VALUES (13, 'Phoebe', 'Phoebe is the second-largest retrograde satellite in the Solar System after Triton.', 6, 6, 1898);
INSERT INTO public.moon VALUES (14, 'Ariel', 'Ariel is the fourth-largest moon of Uranus. It is named for a sky spirit in Alexander Pope''s 1712 poem The Rape of the Lock and Shakespeare''s The Tempest.', 7, 7, 1851);
INSERT INTO public.moon VALUES (15, 'Umbriel', 'Umbriel is the third-largest moon of Uranus. Umbriel was named after the "dusky melancholy sprite" in Alexander Pope''s The Rape of the Lock.', 7, 7, 1851);
INSERT INTO public.moon VALUES (16, 'Titania', 'Titania, also designated Uranus III, is the largest of the moons of Uranus. The name Titania was taken from the Queen of the Fairies in A Midsummer Night''s Dream by William Shakespeare.', 7, 3, 1787);
INSERT INTO public.moon VALUES (17, 'Oberon', 'Oberon, also designated Uranus IV, is the outermost and second-largest major moon of the planet Uranus. The name Oberon was taken from the King of the Fairies in A Midsummer Night''s Dream by William Shakespeare.', 7, 3, 1787);
INSERT INTO public.moon VALUES (18, 'Miranda', 'Miranda, also designated Uranus V, is the smallest and innermost of Uranus''s five round satellites. It was named after the character in William Shakespeare''s The Tempest.', 7, 8, 1948);
INSERT INTO public.moon VALUES (19, 'Triton', 'Triton is the largest natural satellite of the planet Neptune. Triton is named after the Greek sea god Triton, the son of Poseidon (the Greek god corresponding to the Roman Neptune).', 8, 7, 1846);
INSERT INTO public.moon VALUES (20, 'Galatea', 'Galatea, also known as Neptune VI, is the fourth-closest inner moon of Neptune. It is named after Galatea, one of the fifty Nereids of Greek legend, with whom Cyclops Polyphemus was vainly in love.', 8, 9, 1989);
INSERT INTO public.moon VALUES (21, 'Proteus', 'Proteus, also known as Neptune VIII, is the second-largest Neptunian moon, and Neptune''s largest inner satellite. It is named after Proteus, the shape-changing sea god of Greek mythology.', 8, 9, 1989);


--
-- Name: discoverer_discoverer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.discoverer_discoverer_id_seq', 9, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: discoverer discoverer_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.discoverer
    ADD CONSTRAINT discoverer_name_key UNIQUE (name);


--
-- Name: discoverer discoverer_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.discoverer
    ADD CONSTRAINT discoverer_pkey PRIMARY KEY (discoverer_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_discoverer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_discoverer_id_fkey FOREIGN KEY (discoverer_id) REFERENCES public.discoverer(discoverer_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--


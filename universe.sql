--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text,
    age_in_millions_of_years numeric(6,1),
    galaxy_types_id integer
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
-- Name: galaxy_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_types (
    galaxy_types_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text
);


ALTER TABLE public.galaxy_types OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_types_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_types_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_types_galaxy_type_id_seq OWNED BY public.galaxy_types.galaxy_types_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text,
    age_in_millions_of_years numeric(6,1),
    is_spherical boolean,
    planet_id integer
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
    name character varying(20) NOT NULL,
    description text,
    age_in_millions_of_years numeric(6,1),
    has_life boolean,
    moon_count integer,
    planet_types_id integer,
    star_id integer,
    distance_from_star_in_au numeric(4,1)
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
-- Name: planet_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_types (
    planet_types_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text
);


ALTER TABLE public.planet_types OWNER TO freecodecamp;

--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_planet_type_id_seq OWNED BY public.planet_types.planet_types_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text,
    age_in_millions_of_years numeric(6,1),
    planet_count integer,
    galaxy_id integer,
    distance_from_earth_in_ly numeric(10,1)
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_types galaxy_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types ALTER COLUMN galaxy_types_id SET DEFAULT nextval('public.galaxy_types_galaxy_type_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_types planet_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types ALTER COLUMN planet_types_id SET DEFAULT nextval('public.planet_types_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'The nearest major galaxy to the Milky Way.', 7500.0, 4);
INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The galaxy that includes the Solar System, with the name describing the galaxy''s appearance from Earth.', 13600.0, 4);
INSERT INTO public.galaxy VALUES (3, 'Whirlpool', 'The first galaxy to be classified as a spiral galaxy. Easily observed by amateur astronomers, it may be seen with binoculars.', 400.0, 3);
INSERT INTO public.galaxy VALUES (4, 'M87', 'One of the brightest radio sources in the sky. Its supermassive black hole was the first black hole to be imaged by the Event Horizon Telescope.', 10000.0, 1);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'A galaxy of unclear classification, it has a bright nucleus, an unusually large central bulge, and a prominent dust lane in its outer disk, which from Earth is viewed almost edge-on. The dark dust lane and the bulge give it the appearance of a sombrero hat.', 11500.0, 5);
INSERT INTO public.galaxy VALUES (6, 'Cartwheel', 'The structure of the Cartwheel Galaxy is noted to be highly complicated and heavily disturbed. It consists of two rings: the outer ring, the site of massive ongoing star formation due to gas and dust compression; and the inner ring that surrounds the galactic center.', 300.0, 2);


--
-- Data for Name: galaxy_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_types VALUES (1, 'Elliptical', 'Elliptical galaxies have relatively smooth, featureless light distributions and appear as ellipses in photographic images.');
INSERT INTO public.galaxy_types VALUES (2, 'Lenticular', 'These galaxies consist of a bright central bulge, similar in appearance to an elliptical galaxy, surrounded by an extended, disk-like structure. Unlike spiral galaxies, the disks of lenticular galaxies have no visible spiral structure and are not actively forming stars in any significant quantity.');
INSERT INTO public.galaxy_types VALUES (3, 'Unbarred spiral', 'A spiral galaxy consists of a flattened disk, with stars forming a (usually two-armed) spiral structure, and a central concentration of stars known as the bulge.');
INSERT INTO public.galaxy_types VALUES (4, 'Barred spiral', 'A barred spiral galaxy is a spiral galaxy with a central bar-shaped structure composed of stars.');
INSERT INTO public.galaxy_types VALUES (5, 'Peculiar', 'A galaxy of unusual size, shape, or composition.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Earth''s only natural satellite.', 4460.0, true, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 'The larger of Mars'' two natural satellites.', NULL, false, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 'The smaller of Mars'' two natural satellites.', NULL, false, 2);
INSERT INTO public.moon VALUES (5, 'Callisto', NULL, NULL, true, 5);
INSERT INTO public.moon VALUES (6, 'Io', NULL, NULL, true, 5);
INSERT INTO public.moon VALUES (7, 'Europa', NULL, NULL, true, 5);
INSERT INTO public.moon VALUES (4, 'Ganymede', 'The largest moon in the Solar System.', NULL, true, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 'The only moon with a known atmosphere.', NULL, true, 6);
INSERT INTO public.moon VALUES (9, 'Mimas', NULL, NULL, true, 6);
INSERT INTO public.moon VALUES (10, 'Enceladus', NULL, NULL, true, 6);
INSERT INTO public.moon VALUES (11, 'Tethys', NULL, NULL, true, 6);
INSERT INTO public.moon VALUES (12, 'Dione', NULL, NULL, true, 6);
INSERT INTO public.moon VALUES (13, 'Rhea', NULL, NULL, true, 6);
INSERT INTO public.moon VALUES (15, 'Iapetus', NULL, NULL, true, 6);
INSERT INTO public.moon VALUES (14, 'Hyperion', 'The first non-spherical moon to be discovered.', NULL, false, 6);
INSERT INTO public.moon VALUES (16, 'Miranda', NULL, NULL, true, 7);
INSERT INTO public.moon VALUES (17, 'Ariel', NULL, NULL, true, 7);
INSERT INTO public.moon VALUES (18, 'Umbriel', NULL, NULL, true, 7);
INSERT INTO public.moon VALUES (19, 'Titania', NULL, NULL, true, 7);
INSERT INTO public.moon VALUES (20, 'Oberon', NULL, NULL, true, 7);
INSERT INTO public.moon VALUES (21, 'Triton', 'The only large moon in the Solar System that orbits in the opposite direction to its planet''s rotation.', NULL, true, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'The location of almost all known astronomical research.', 4540.0, true, 1, 1, 1, 1.0);
INSERT INTO public.planet VALUES (2, 'Mars', 'The fourth planet from the Sun. It is also known as the Red Planet, for its orange-red appearance.', 4500.0, false, 2, 1, 1, 1.5);
INSERT INTO public.planet VALUES (3, 'Mercury', 'The first planet from the Sun, and the smallest in the Solar System.', 4500.0, false, 0, 1, 1, 0.4);
INSERT INTO public.planet VALUES (4, 'Venus', 'The second planet from the Sun. It is the brighest celestial object in Earth''s sky.', 4500.0, false, 0, 1, 1, 0.7);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'The fifth planet from the Sun, and the largest in the Solar System.', 4500.0, false, 111, 2, 1, 5.2);
INSERT INTO public.planet VALUES (6, 'Saturn', 'The sixth planet from the Sun. It has rings!', 4500.0, false, 292, 2, 1, 9.6);
INSERT INTO public.planet VALUES (7, 'Uranus', 'The seventh planet from the Sun. It rotates on its side, so its poles directly face the Sun.', 4600.0, false, 29, 3, 1, 19.2);
INSERT INTO public.planet VALUES (8, 'Neptune', 'The eighth planet from the Sun, and the coldest in the Solar System.', 4600.0, false, 16, 3, 1, 30.1);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 'The closest known exoplanet to Earth.', NULL, false, NULL, NULL, 2, 0.0);
INSERT INTO public.planet VALUES (10, 'TRAPPIST-1e', 'Considered by the Habitable Exoplanets Catalog to be one of the best potentially habitable exoplanets discovered.', NULL, NULL, NULL, 1, 7, 0.0);
INSERT INTO public.planet VALUES (11, 'Bernard''s Star b', NULL, NULL, NULL, NULL, 1, 5, 0.0);
INSERT INTO public.planet VALUES (12, 'Kepler-90h', NULL, NULL, NULL, NULL, 2, 8, 1.0);


--
-- Data for Name: planet_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_types VALUES (1, 'Terrestrial planet', 'Also known as a telluric planet or rocky planet. A planet that is composed primarily of carbonaceous or silicate rocks or metals.');
INSERT INTO public.planet_types VALUES (2, 'Gas giant', 'A massive planet composed primarily of hydrogen and helium.');
INSERT INTO public.planet_types VALUES (3, 'Ice giant', 'A giant planet composed mainly of ice—volatile substances heavier than hydrogen and helium, such as water, methane, and ammonia—as opposed to gas (hydrogen and helium).');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 'The star located at the centre of the Solar System. It is the main source of energy for life on Earth.', 4600.0, 8, 1, 0.0);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'The nearest star to Earth after the Sun.', 4850.0, 3, 1, 4.2);
INSERT INTO public.star VALUES (3, 'Sirius', 'The brightest star in the night sky, located in the southern constellation of Canis Major.', 242.0, 0, 1, 8.6);
INSERT INTO public.star VALUES (4, 'AE And', 'One of the most luminous variables in the Andromeda Galaxy.', NULL, NULL, 2, 2500000.0);
INSERT INTO public.star VALUES (5, 'Barnard''s Star', 'The fourth-nearest-known individual star to the Sun, and the closest star in the northern celestial hemisphere.', 10000.0, 4, 1, 6.0);
INSERT INTO public.star VALUES (6, '61 Cygni A', 'Part of a binary star system, it was the first star besides Sol to have its distance measured.', 6.1, 0, 1, 11.4);
INSERT INTO public.star VALUES (7, 'TRAPPIST-1', NULL, 7600.0, 7, 1, 40.7);
INSERT INTO public.star VALUES (8, 'Kepler-90', 'The only known star with the same number of planets as the Sun.', 5800.0, 8, 1, 2790.0);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_types_galaxy_type_id_seq', 5, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_planet_type_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


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
-- Name: galaxy_types galaxy_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_name_key UNIQUE (name);


--
-- Name: galaxy_types galaxy_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_types_id);


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
-- Name: planet_types planet_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_name_key UNIQUE (name);


--
-- Name: planet_types planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_types_id);


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
-- Name: star galaxy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: galaxy galaxy_types_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_types_fkey FOREIGN KEY (galaxy_types_id) REFERENCES public.galaxy_types(galaxy_types_id);


--
-- Name: moon planet_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_types_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_types_fkey FOREIGN KEY (planet_types_id) REFERENCES public.planet_types(planet_types_id);


--
-- Name: planet star_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--


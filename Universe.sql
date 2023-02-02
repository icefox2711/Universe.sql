--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    name character varying(30) NOT NULL,
    constellation character varying(30),
    distance_mly numeric(5,1),
    origin text,
    year_discovered integer
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
-- Name: hubungan; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.hubungan (
    hubungan_id integer NOT NULL,
    galaxy_id integer,
    star_id integer,
    planet_id integer,
    name character varying(30) NOT NULL,
    moon_id integer
);


ALTER TABLE public.hubungan OWNER TO freecodecamp;

--
-- Name: hubungan_hub_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.hubungan_hub_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hubungan_hub_id_seq OWNER TO freecodecamp;

--
-- Name: hubungan_hub_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.hubungan_hub_id_seq OWNED BY public.hubungan.hubungan_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    diameter integer,
    year_discovered integer,
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
    name character varying(30) NOT NULL,
    age_in_m integer,
    year_discovered integer,
    star_id integer,
    has_life boolean,
    has_moon boolean
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
    age_in_m integer,
    year_discovered integer,
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: hubungan hubungan_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.hubungan ALTER COLUMN hubungan_id SET DEFAULT nextval('public.hubungan_hub_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda Galaxy', 'Andromeda', 2.5, 'Get its name from the area of the sky in which it appears, the constellation of Andromeda', 905);
INSERT INTO public.galaxy VALUES (2, 'Black Eye Galaxy', 'Coma Berenices', 17.0, 'It has a spectacular dark band of absorbing dust in front of the galaxys bright nucleus', 1779);
INSERT INTO public.galaxy VALUES (3, 'Milky Way', 'Sagittarius', NULL, 'The appearance from Earth of the galaxy', NULL);
INSERT INTO public.galaxy VALUES (4, 'Pinwheel Galaxy', 'Ursa Major', 12.0, 'Similar in appearance to a pinwheel', 1774);
INSERT INTO public.galaxy VALUES (5, 'Sombrero Galaxy', 'Virgo', 28.0, 'Similar in appearance to sombrero', 1781);
INSERT INTO public.galaxy VALUES (6, 'Triangulum Galaxy', 'Triangulum', 3.0, 'Named after its location within the Triangulum constellation', 1764);
INSERT INTO public.galaxy VALUES (7, 'Whirpool Galaxy', 'Canes Venatici', 23.0, 'From the whirpool appearance this gravitationally disturbed galaxy exhibits', 1773);


--
-- Data for Name: hubungan; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.hubungan VALUES (1, 3, 5, 1, 'Earth Luna', 1);
INSERT INTO public.hubungan VALUES (2, 3, 5, 2, 'Mars Deimos', 2);
INSERT INTO public.hubungan VALUES (3, 3, 5, 2, 'Mars Phobox', 3);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 3476, NULL, 1);
INSERT INTO public.moon VALUES (2, 'Deimos', 12, 1877, 2);
INSERT INTO public.moon VALUES (3, 'Phobos', 22, 1877, 2);
INSERT INTO public.moon VALUES (4, 'Io', 3630, 1610, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 3121, 1610, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5262, 1610, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 4820, 1610, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 5150, 1655, 6);
INSERT INTO public.moon VALUES (9, 'Tethys', 1066, 1684, 6);
INSERT INTO public.moon VALUES (10, 'Dione', 1121, 1684, 6);
INSERT INTO public.moon VALUES (11, 'Rhea', 1528, 1672, 6);
INSERT INTO public.moon VALUES (12, 'Iapetus', 1436, 1671, 6);
INSERT INTO public.moon VALUES (13, 'Hyperion', 270, 1848, 6);
INSERT INTO public.moon VALUES (14, 'Enceladus', 504, 1789, 6);
INSERT INTO public.moon VALUES (15, 'Mimas', 396, 1789, 6);
INSERT INTO public.moon VALUES (16, 'Oberon', 1522, 1787, 7);
INSERT INTO public.moon VALUES (17, 'Titania', 1580, 1787, 7);
INSERT INTO public.moon VALUES (18, 'Umbriel', 1169, 1851, 7);
INSERT INTO public.moon VALUES (19, 'Kepler-1625b i', NULL, 2018, 12);
INSERT INTO public.moon VALUES (20, 'Triton', 2707, 1846, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 4540, NULL, 5, true, true);
INSERT INTO public.planet VALUES (2, 'Mars', 4540, NULL, 5, false, true);
INSERT INTO public.planet VALUES (3, 'Venus', 4540, NULL, 5, false, false);
INSERT INTO public.planet VALUES (4, 'Mercury', 4540, 1631, 5, false, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 4540, 1610, 5, false, true);
INSERT INTO public.planet VALUES (6, 'Saturn', 4540, 1610, 5, false, true);
INSERT INTO public.planet VALUES (7, 'Uranus', 4540, 1781, 5, false, true);
INSERT INTO public.planet VALUES (8, 'Neptune', 4540, 1846, 5, false, true);
INSERT INTO public.planet VALUES (9, 'TRAPPIST-1e', 5000, 2016, 1, false, false);
INSERT INTO public.planet VALUES (10, 'TRAPPIST-1f', 5000, 2016, 1, false, false);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1g', 5000, 2016, 1, false, false);
INSERT INTO public.planet VALUES (12, 'Kelper-1625b', 4300, 2017, 7, false, true);
INSERT INTO public.planet VALUES (13, 'Proxima Centauri b', 5000, 2016, 6, false, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'TRAPPIST-1', 7500, 2016, 3);
INSERT INTO public.star VALUES (2, 'Alpha Centauri', 4850, 1915, 3);
INSERT INTO public.star VALUES (3, 'M3', 10000, 1920, 1);
INSERT INTO public.star VALUES (4, 'Pollux', 1000, 1920, 3);
INSERT INTO public.star VALUES (5, 'Solar', 4600, NULL, 3);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 5000, 1915, 3);
INSERT INTO public.star VALUES (7, 'Kepler-1625', 4300, 2017, 3);
INSERT INTO public.star VALUES (8, 'Vega', 455, 1920, 3);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: hubungan_hub_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.hubungan_hub_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


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
-- Name: hubungan hubungan_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.hubungan
    ADD CONSTRAINT hubungan_moon_id_key UNIQUE (moon_id);


--
-- Name: hubungan hubungan_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.hubungan
    ADD CONSTRAINT hubungan_pkey PRIMARY KEY (hubungan_id);


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
-- Name: hubungan hubungan_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.hubungan
    ADD CONSTRAINT hubungan_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: hubungan hubungan_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.hubungan
    ADD CONSTRAINT hubungan_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: hubungan hubungan_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.hubungan
    ADD CONSTRAINT hubungan_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: hubungan hubungan_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.hubungan
    ADD CONSTRAINT hubungan_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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


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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_type character varying(200),
    description text,
    age_in_millios_years numeric(10,2)
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
    planet_id integer,
    distance_from_planet numeric(10,1) NOT NULL,
    diameter numeric(9,1) NOT NULL,
    has_water boolean
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
    has_life boolean NOT NULL,
    planet_type character varying(25),
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
-- Name: planet_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_types (
    planet_types_id integer NOT NULL,
    min_diameter integer NOT NULL,
    max_diameter integer NOT NULL,
    name character varying(30)
);


ALTER TABLE public.planet_types OWNER TO freecodecamp;

--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_planet_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_planet_types_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_planet_types_id_seq OWNED BY public.planet_types.planet_types_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer,
    temperature numeric(9,1),
    distance_from_earth integer
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

ALTER TABLE ONLY public.planet_types ALTER COLUMN planet_types_id SET DEFAULT nextval('public.planet_types_planet_types_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 'The galaxy that contains our Solar System.', 13600.00);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 'The nearest spiral galaxy to the Milky Way.', 10000.00);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 'A member of the Local Group, also known as M33.', 12000.00);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 'Known for its interaction with a neighboring galaxy.', 8000.00);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Elliptical', 'Famous for its bright nucleus and large central bulge.', 9000.00);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'Spiral', 'One of the most well-known face-on spiral galaxies.', 11000.00);
INSERT INTO public.galaxy VALUES (7, 'Centaurus A', 'Elliptical', 'A peculiar galaxy with a large amount of radio emissions.', 13000.00);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (21, 'Luna', 1, 384400.0, 3474.8, true);
INSERT INTO public.moon VALUES (22, 'Phobos', 2, 9376.0, 22.4, false);
INSERT INTO public.moon VALUES (23, 'Deimos', 2, 23463.2, 12.4, false);
INSERT INTO public.moon VALUES (24, 'Europa', 3, 671100.0, 3121.6, true);
INSERT INTO public.moon VALUES (25, 'Ganymede', 3, 1070400.0, 5262.4, true);
INSERT INTO public.moon VALUES (26, 'Callisto', 3, 1882700.0, 4820.6, false);
INSERT INTO public.moon VALUES (27, 'Io', 3, 421700.0, 3642.6, false);
INSERT INTO public.moon VALUES (28, 'Titan', 4, 1221870.0, 5149.5, true);
INSERT INTO public.moon VALUES (29, 'Rhea', 4, 527040.0, 1528.0, false);
INSERT INTO public.moon VALUES (30, 'Iapetus', 4, 3561300.0, 1469.0, false);
INSERT INTO public.moon VALUES (31, 'Triton', 5, 354800.0, 2706.8, true);
INSERT INTO public.moon VALUES (32, 'Oberon', 6, 583520.0, 1522.8, false);
INSERT INTO public.moon VALUES (33, 'Titania', 6, 436300.0, 1577.8, false);
INSERT INTO public.moon VALUES (34, 'Umbriel', 6, 265970.0, 1169.4, false);
INSERT INTO public.moon VALUES (35, 'Ariel', 6, 191240.0, 1157.8, false);
INSERT INTO public.moon VALUES (36, 'Miranda', 6, 129900.0, 471.6, false);
INSERT INTO public.moon VALUES (37, 'Charon', 7, 19570.0, 1212.0, true);
INSERT INTO public.moon VALUES (38, 'Dysnomia', 8, 37000.0, 685.0, false);
INSERT INTO public.moon VALUES (39, 'Nix', 7, 48708.0, 49.8, false);
INSERT INTO public.moon VALUES (40, 'Hydra', 7, 64592.0, 50.0, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', true, 'Terrestrial', 1);
INSERT INTO public.planet VALUES (2, 'Mars', false, 'Terrestrial', 1);
INSERT INTO public.planet VALUES (3, 'Jupiter', false, 'Gas Giant', 1);
INSERT INTO public.planet VALUES (4, 'Saturn', false, 'Gas Giant', 1);
INSERT INTO public.planet VALUES (5, 'Neptune', false, 'Ice Giant', 1);
INSERT INTO public.planet VALUES (6, 'Uranus', false, 'Ice Giant', 1);
INSERT INTO public.planet VALUES (7, 'Pluto', false, 'Dwarf Planet', 1);
INSERT INTO public.planet VALUES (8, 'Eris', false, 'Dwarf Planet', 2);
INSERT INTO public.planet VALUES (9, 'Venus', false, 'Terrestrial', 1);
INSERT INTO public.planet VALUES (10, 'Mercury', false, 'Terrestrial', 1);
INSERT INTO public.planet VALUES (11, 'Ceres', false, 'Dwarf Planet', 3);
INSERT INTO public.planet VALUES (12, 'Haumea', false, 'Dwarf Planet', 4);
INSERT INTO public.planet VALUES (13, 'Makemake', false, 'Dwarf Planet', 5);
INSERT INTO public.planet VALUES (14, 'Sedna', false, 'Detached Object', 6);
INSERT INTO public.planet VALUES (15, 'Quaoar', false, 'Detached Object', 7);


--
-- Data for Name: planet_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_types VALUES (1, 1000, 13000, 'Terrestrial');
INSERT INTO public.planet_types VALUES (2, 14000, 50000, 'Gas Giant');
INSERT INTO public.planet_types VALUES (3, 5000, 25000, 'Ice Giant');
INSERT INTO public.planet_types VALUES (4, 1000, 3000, 'Dwarf Planet');
INSERT INTO public.planet_types VALUES (5, 1000, 2000, 'Detached Object');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 5778.0, 0);
INSERT INTO public.star VALUES (2, 'Alpha Centauri', 2, 5790.0, 4);
INSERT INTO public.star VALUES (3, 'Sirius', 1, 9940.0, 8);
INSERT INTO public.star VALUES (4, 'Procyon', 1, 6530.0, 11);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 1, 3500.0, 642);
INSERT INTO public.star VALUES (6, 'Rigel', 1, 12100.0, 860);
INSERT INTO public.star VALUES (7, 'Vega', 1, 9602.0, 25);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 40, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_planet_types_id_seq', 5, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


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
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_moon; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--


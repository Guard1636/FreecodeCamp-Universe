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
-- Name: faction; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.faction (
    faction_id integer NOT NULL,
    name character varying(100) NOT NULL,
    allegiance text NOT NULL,
    is_xenos boolean NOT NULL,
    founded_year integer NOT NULL
);


ALTER TABLE public.faction OWNER TO freecodecamp;

--
-- Name: faction_faction_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.faction_faction_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.faction_faction_id_seq OWNER TO freecodecamp;

--
-- Name: faction_faction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.faction_faction_id_seq OWNED BY public.faction.faction_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    sector_count integer NOT NULL,
    age_in_million_years numeric(10,2) NOT NULL,
    description text,
    is_known boolean NOT NULL
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
    name character varying(100) NOT NULL,
    planet_id integer,
    size_in_miles integer NOT NULL,
    weight_in_lbs numeric(15,2) NOT NULL,
    serves_chaos boolean NOT NULL
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
    name character varying(100) NOT NULL,
    star_id integer,
    population bigint NOT NULL,
    gravity numeric(5,2) NOT NULL,
    has_atmosphere boolean NOT NULL
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
    name character varying(100) NOT NULL,
    galaxy_id integer,
    temperature integer NOT NULL,
    luminosity numeric(10,2) NOT NULL,
    has_solar_flares boolean NOT NULL
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
-- Name: faction faction_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.faction ALTER COLUMN faction_id SET DEFAULT nextval('public.faction_faction_id_seq'::regclass);


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
-- Data for Name: faction; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.faction VALUES (1, 'Imperial Guard', 'Imperium of Man', false, -6000);
INSERT INTO public.faction VALUES (2, 'Adeptus Mechanicus', 'Imperium of Man', false, -3000);
INSERT INTO public.faction VALUES (3, 'Space Marines', 'Imperium of Man', false, -10000);
INSERT INTO public.faction VALUES (4, 'Ork Horde', 'Orks', true, -5000);
INSERT INTO public.faction VALUES (5, 'Eldar Craftworlds', 'Aeldari', true, -12000);
INSERT INTO public.faction VALUES (6, 'Tyranid Hive Fleets', 'Tyranids', true, -10000);
INSERT INTO public.faction VALUES (7, 'Chaos Space Marines', 'Chaos', false, -20000);
INSERT INTO public.faction VALUES (8, 'Necrons', 'Necrons', true, -500000);
INSERT INTO public.faction VALUES (9, 'Dark Eldar', 'Drukhari', true, -20000);
INSERT INTO public.faction VALUES (10, 'Tau Empire', 'Tau', true, -5000);
INSERT INTO public.faction VALUES (11, 'Genestealer Cults', 'Chaos', true, -2000);
INSERT INTO public.faction VALUES (12, 'Death Guard', 'Chaos', false, -20000);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000, 13600.50, 'Home galaxy of the Imperium.', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 120000, 14000.75, 'A distant galaxy rumored to hold xenos secrets.', true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 50000, 13000.20, 'A small galaxy under Tyranid threat.', true);
INSERT INTO public.galaxy VALUES (4, 'Halo Stars', 30000, 15000.00, 'A dangerous region with lost civilizations.', false);
INSERT INTO public.galaxy VALUES (5, 'Segmentum Obscurus', 90000, 14500.65, 'Home to the Eye of Terror.', true);
INSERT INTO public.galaxy VALUES (6, 'Segmentum Pacificus', 80000, 13800.80, 'Known for trade and commerce.', true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 1, 2159, 13200000000.00, false);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 137, 850000000.00, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 120, 100000000.00, false);
INSERT INTO public.moon VALUES (4, 'Krieg Minor', 10, 500, 200000000.00, true);
INSERT INTO public.moon VALUES (5, 'Ghalmek Secundus', 6, 1500, 7000000000.00, true);
INSERT INTO public.moon VALUES (6, 'Medrengard’s Bane', 5, 1800, 8000000000.00, true);
INSERT INTO public.moon VALUES (7, 'Sicarus Prime', 2, 1700, 6000000000.00, true);
INSERT INTO public.moon VALUES (8, 'Cadia’s Remnant', 9, 900, 4000000000.00, false);
INSERT INTO public.moon VALUES (9, 'Ulthwé’s Wrath', 3, 1200, 5000000000.00, false);
INSERT INTO public.moon VALUES (10, 'Nocturnian Moon', 4, 2000, 9000000000.00, false);
INSERT INTO public.moon VALUES (11, 'Commorragh’s Veil', 7, 2200, 10000000000.00, true);
INSERT INTO public.moon VALUES (12, 'Macragge’s Hope', 2, 1300, 6000000000.00, false);
INSERT INTO public.moon VALUES (13, 'Fenrisian Satellite', 3, 1000, 4500000000.00, false);
INSERT INTO public.moon VALUES (14, 'Baal’s Blood Moon', 5, 1100, 5000000000.00, false);
INSERT INTO public.moon VALUES (15, 'Medusa Prime Moon', 6, 1500, 7000000000.00, false);
INSERT INTO public.moon VALUES (16, 'Armageddon’s Shadow', 8, 1600, 8000000000.00, false);
INSERT INTO public.moon VALUES (17, 'Krieg’s Last Hope', 10, 1800, 8500000000.00, true);
INSERT INTO public.moon VALUES (18, 'Vigilus’ Wound', 11, 1900, 9000000000.00, false);
INSERT INTO public.moon VALUES (19, 'Tarsis Ultra', 1, 2000, 10000000000.00, false);
INSERT INTO public.moon VALUES (20, 'Mandragora’s Shade', 12, 2100, 9500000000.00, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Terra', 1, 10000000000, 1.00, true);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 500000000, 0.38, true);
INSERT INTO public.planet VALUES (3, 'Macragge', 2, 1200000000, 1.12, true);
INSERT INTO public.planet VALUES (4, 'Fenris', 3, 200000000, 0.85, true);
INSERT INTO public.planet VALUES (5, 'Nocturne', 4, 50000000, 1.30, true);
INSERT INTO public.planet VALUES (6, 'Baal', 5, 100000000, 0.72, true);
INSERT INTO public.planet VALUES (7, 'Medusa', 6, 300000000, 1.05, true);
INSERT INTO public.planet VALUES (8, 'Armageddon', 1, 2500000000, 0.98, true);
INSERT INTO public.planet VALUES (9, 'Cadia', 1, 300000000, 1.02, true);
INSERT INTO public.planet VALUES (10, 'Krieg', 1, 200000000, 1.00, true);
INSERT INTO public.planet VALUES (11, 'Vigilus', 1, 500000000, 0.99, true);
INSERT INTO public.planet VALUES (12, 'Chogoris', 1, 800000000, 1.10, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 1, 5778, 1.00, true);
INSERT INTO public.star VALUES (2, 'Macragge’s Star', 1, 6000, 1.20, false);
INSERT INTO public.star VALUES (3, 'Fenrisian Sun', 1, 6500, 1.50, true);
INSERT INTO public.star VALUES (4, 'Nocturnian Star', 1, 7200, 2.00, false);
INSERT INTO public.star VALUES (5, 'Baal’s Heart', 1, 5000, 0.90, true);
INSERT INTO public.star VALUES (6, 'Medusa Prime', 2, 6700, 1.40, false);


--
-- Name: faction_faction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.faction_faction_id_seq', 12, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: faction faction_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.faction
    ADD CONSTRAINT faction_name_key UNIQUE (name);


--
-- Name: faction faction_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.faction
    ADD CONSTRAINT faction_pkey PRIMARY KEY (faction_id);


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
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id) ON DELETE CASCADE;


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id) ON DELETE CASCADE;


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--


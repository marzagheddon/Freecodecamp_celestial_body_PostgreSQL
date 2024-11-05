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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(15) NOT NULL,
    is_visible boolean
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40),
    rev_time numeric,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_mln_years numeric(10,1) NOT NULL,
    galaxy_types character varying(20),
    distance_from_earth numeric(10,1) NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_item_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_item_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_item_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40),
    times_explored integer,
    moon_of text,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_mln_years numeric(10,1) NOT NULL,
    distance_from_earth numeric(10,1) NOT NULL,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_item_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_item_id_seq OWNER TO freecodecamp;

--
-- Name: moon_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_item_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(40),
    times_explored integer,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_mln_years numeric(10,1) NOT NULL,
    distance_from_earth numeric(10,1) NOT NULL,
    planet_type text,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_item_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_item_id_seq OWNER TO freecodecamp;

--
-- Name: planet_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_item_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40),
    rev_time numeric,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_mln_years numeric(10,1) NOT NULL,
    distance_from_earth numeric(10,1) NOT NULL,
    planet_type text,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_item_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_item_id_seq OWNER TO freecodecamp;

--
-- Name: star_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_item_id_seq OWNED BY public.star.star_id;


--
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_item_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_item_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_item_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_item_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'cometa1', false);
INSERT INTO public.comet VALUES (2, 'cometa2', false);
INSERT INTO public.comet VALUES (3, 'cometa3', true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (3, 'Andromeda', 1000, NULL, NULL, NULL, 10000.0, NULL, 9999.0);
INSERT INTO public.galaxy VALUES (4, 'Cassiopea', 1000, NULL, NULL, NULL, 10000.0, NULL, 9999.0);
INSERT INTO public.galaxy VALUES (5, 'Via Lattea', 22, NULL, NULL, NULL, 1.0, NULL, 9999.0);
INSERT INTO public.galaxy VALUES (6, 'Del cane', 22, NULL, NULL, NULL, 1.0, NULL, 99.0);
INSERT INTO public.galaxy VALUES (7, 'Orsa maggiore', 2, NULL, NULL, NULL, 11.0, NULL, 99.0);
INSERT INTO public.galaxy VALUES (8, 'Magellano', 82, NULL, NULL, NULL, 811.0, NULL, 99.0);
INSERT INTO public.galaxy VALUES (9, 'Boote', 82, NULL, NULL, NULL, 811.0, NULL, 99.0);
INSERT INTO public.galaxy VALUES (11, 'Sole', 0, NULL, NULL, false, 11.0, NULL, 44.0);
INSERT INTO public.galaxy VALUES (12, 'Sole2', 0, NULL, NULL, false, 11.0, NULL, 44.0);
INSERT INTO public.galaxy VALUES (13, 'Sole3', 0, NULL, NULL, true, 11.0, NULL, 44.0);
INSERT INTO public.galaxy VALUES (14, 'Sole4', 0, NULL, NULL, true, 11.0, NULL, 44.0);
INSERT INTO public.galaxy VALUES (15, 'Sole5', 0, NULL, NULL, true, 11.0, NULL, 44.0);
INSERT INTO public.galaxy VALUES (16, 'Sole6', 0, NULL, NULL, true, 11.0, NULL, 44.0);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'luna1', NULL, NULL, NULL, NULL, true, 1.0, 44.0, 1);
INSERT INTO public.moon VALUES (2, 'luna2', NULL, NULL, NULL, NULL, true, 1.0, 44.0, 1);
INSERT INTO public.moon VALUES (3, 'luna3', NULL, NULL, NULL, NULL, true, 1.0, 44.0, 1);
INSERT INTO public.moon VALUES (4, 'luna4', NULL, NULL, NULL, NULL, true, 1.0, 44.0, 1);
INSERT INTO public.moon VALUES (5, 'luna5', NULL, NULL, NULL, NULL, true, 1.0, 44.0, 1);
INSERT INTO public.moon VALUES (6, 'luna6', NULL, NULL, NULL, NULL, true, 1.0, 44.0, 1);
INSERT INTO public.moon VALUES (7, 'luna7', NULL, NULL, NULL, NULL, true, 1.0, 44.0, 1);
INSERT INTO public.moon VALUES (8, 'luna8', NULL, NULL, NULL, NULL, true, 1.0, 44.0, 1);
INSERT INTO public.moon VALUES (9, 'luna9', NULL, NULL, NULL, NULL, true, 1.0, 44.0, 1);
INSERT INTO public.moon VALUES (10, 'luna10', NULL, NULL, NULL, NULL, true, 1.0, 44.0, 1);
INSERT INTO public.moon VALUES (11, 'luna11', NULL, NULL, NULL, NULL, true, 1.0, 44.0, 1);
INSERT INTO public.moon VALUES (12, 'luna12', NULL, NULL, NULL, NULL, true, 1.0, 44.0, 1);
INSERT INTO public.moon VALUES (13, 'luna13', NULL, NULL, NULL, NULL, true, 1.0, 44.0, 1);
INSERT INTO public.moon VALUES (14, 'luna14', NULL, NULL, NULL, NULL, true, 1.0, 44.0, 1);
INSERT INTO public.moon VALUES (15, 'luna15', NULL, NULL, NULL, NULL, true, 1.0, 44.0, 1);
INSERT INTO public.moon VALUES (16, 'luna16', NULL, NULL, NULL, NULL, true, 1.0, 44.0, 1);
INSERT INTO public.moon VALUES (17, 'luna17', NULL, NULL, NULL, NULL, true, 1.0, 44.0, 1);
INSERT INTO public.moon VALUES (18, 'luna18', NULL, NULL, NULL, NULL, true, 1.0, 44.0, 1);
INSERT INTO public.moon VALUES (19, 'luna19', NULL, NULL, NULL, NULL, true, 1.0, 44.0, 1);
INSERT INTO public.moon VALUES (20, 'luna20', NULL, NULL, NULL, NULL, true, 1.0, 44.0, 1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'terra', NULL, NULL, NULL, true, 1.0, 44.0, NULL, 1);
INSERT INTO public.planet VALUES (2, 'giove', NULL, NULL, NULL, true, 1.0, 44.0, NULL, 1);
INSERT INTO public.planet VALUES (3, 'marte', NULL, NULL, NULL, true, 1.0, 44.0, NULL, 1);
INSERT INTO public.planet VALUES (4, 'venere', NULL, NULL, NULL, true, 1.0, 44.0, NULL, 1);
INSERT INTO public.planet VALUES (5, 'mercurio', NULL, NULL, NULL, true, 1.0, 44.0, NULL, 1);
INSERT INTO public.planet VALUES (6, 'saturno', NULL, NULL, NULL, true, 1.0, 44.0, NULL, 1);
INSERT INTO public.planet VALUES (7, 'plutone', NULL, NULL, NULL, true, 1.0, 44.0, NULL, 1);
INSERT INTO public.planet VALUES (8, 'pianeta1', NULL, NULL, NULL, true, 1.0, 44.0, NULL, 1);
INSERT INTO public.planet VALUES (9, 'pianeta2', NULL, NULL, NULL, true, 1.0, 44.0, NULL, 1);
INSERT INTO public.planet VALUES (10, 'pianeta3', NULL, NULL, NULL, true, 1.0, 44.0, NULL, 1);
INSERT INTO public.planet VALUES (11, 'pianeta4', NULL, NULL, NULL, true, 1.0, 44.0, NULL, 1);
INSERT INTO public.planet VALUES (12, 'pianeta5', NULL, NULL, NULL, true, 1.0, 44.0, NULL, 1);
INSERT INTO public.planet VALUES (13, 'pianeta6', NULL, NULL, NULL, true, 1.0, 44.0, NULL, 1);
INSERT INTO public.planet VALUES (14, 'pianeta7', NULL, NULL, NULL, true, 1.0, 44.0, NULL, 1);
INSERT INTO public.planet VALUES (15, 'pianeta8', NULL, NULL, NULL, true, 1.0, 44.0, NULL, 1);
INSERT INTO public.planet VALUES (16, 'pianeta9', NULL, NULL, NULL, true, 1.0, 44.0, NULL, 1);
INSERT INTO public.planet VALUES (17, 'pianeta10', NULL, NULL, NULL, true, 1.0, 44.0, NULL, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Stella1', 0, NULL, NULL, true, 11.0, 44.0, NULL, 3);
INSERT INTO public.star VALUES (2, 'Stella2', 0, NULL, NULL, true, 11.0, 44.0, NULL, 4);
INSERT INTO public.star VALUES (3, 'Stella3', 0, NULL, NULL, true, 11.0, 44.0, NULL, 5);
INSERT INTO public.star VALUES (4, 'Stella4', 0, NULL, NULL, true, 11.0, 44.0, NULL, 6);
INSERT INTO public.star VALUES (5, 'Stella5', 0, NULL, NULL, true, 11.0, 44.0, NULL, 7);
INSERT INTO public.star VALUES (6, 'Stella6', 0, NULL, NULL, true, 11.0, 44.0, NULL, 8);
INSERT INTO public.star VALUES (7, 'Stella7', 0, NULL, NULL, true, 11.0, 44.0, NULL, 9);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_item_id_seq', 16, true);


--
-- Name: moon_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_item_id_seq', 20, true);


--
-- Name: planet_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_item_id_seq', 17, true);


--
-- Name: star_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_item_id_seq', 7, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_item_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_item_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_item_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_item_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_item_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_item_id_key UNIQUE (planet_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_item_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_item_id_key UNIQUE (star_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


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


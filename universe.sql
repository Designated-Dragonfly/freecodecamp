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
    distance_to_earth numeric NOT NULL,
    age integer NOT NULL,
    number_of_stars integer NOT NULL,
    has_life boolean,
    has_black_hole boolean,
    description text
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
    distance_to_earth numeric NOT NULL,
    has_life boolean,
    age integer NOT NULL,
    circumference integer NOT NULL,
    is_only_moon boolean
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
    star_id integer,
    distance_to_earth numeric NOT NULL,
    has_life boolean,
    age integer NOT NULL,
    circumference integer NOT NULL,
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
-- Name: solar_system; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.solar_system (
    solar_system_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_to_earth numeric NOT NULL,
    age integer NOT NULL,
    number_of_stars integer NOT NULL,
    has_life boolean,
    has_planets boolean,
    galaxy_id integer
);


ALTER TABLE public.solar_system OWNER TO freecodecamp;

--
-- Name: solar_system_solar_system_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.solar_system_solar_system_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solar_system_solar_system_id_seq OWNER TO freecodecamp;

--
-- Name: solar_system_solar_system_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.solar_system_solar_system_id_seq OWNED BY public.solar_system.solar_system_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer,
    distance_to_earth numeric NOT NULL,
    has_planet boolean,
    age integer NOT NULL,
    circumference integer NOT NULL,
    has_close_orbitating_bodies boolean,
    solar_system_id integer
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
-- Name: solar_system solar_system_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system ALTER COLUMN solar_system_id SET DEFAULT nextval('public.solar_system_solar_system_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 0, 12500, 500, true, true, 'sdgedg');
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 765, 980, 5684, false, true, 'uyb');
INSERT INTO public.galaxy VALUES (3, 'MK65', 157, 15654, 5164, false, false, 'ytgbhnj');
INSERT INTO public.galaxy VALUES (4, 'Albert38', 8489, 545, 45, true, true, 'rtguhnj');
INSERT INTO public.galaxy VALUES (5, 'Calamar33', 98549, 516, 5614, true, false, 'tghnjk');
INSERT INTO public.galaxy VALUES (6, 'Calisto54', 5468, 654, 2849, false, true, 'tbhjnkm');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'yghjn', 1, 84516, true, 415689, 415, false);
INSERT INTO public.moon VALUES (2, 'rftyghj', 2, 84516, false, 415689, 415, true);
INSERT INTO public.moon VALUES (3, 'ghjn', 3, 84516, true, 415689, 415, true);
INSERT INTO public.moon VALUES (4, 'ymk7', 1, 84516, true, 415689, 415, true);
INSERT INTO public.moon VALUES (5, 'trj6', 6, 84516, true, 415689, 415, false);
INSERT INTO public.moon VALUES (6, 'sztrj6', 1, 84516, true, 415689, 415, true);
INSERT INTO public.moon VALUES (7, 'szt5j', 1, 84516, true, 415689, 415, true);
INSERT INTO public.moon VALUES (8, 'etrh', 2, 84516, false, 415689, 415, false);
INSERT INTO public.moon VALUES (9, 'aerh5', 8, 84516, true, 415689, 415, true);
INSERT INTO public.moon VALUES (10, 'aergg', 1, 84516, true, 415689, 415, false);
INSERT INTO public.moon VALUES (11, 'stj6', 5, 84516, false, 415689, 415, true);
INSERT INTO public.moon VALUES (12, 'esfrh', 5, 84516, true, 415689, 415, false);
INSERT INTO public.moon VALUES (13, 'dsffbr', 2, 84516, true, 415689, 415, true);
INSERT INTO public.moon VALUES (14, 'erbtre', 1, 84516, true, 415689, 415, false);
INSERT INTO public.moon VALUES (15, 'reher', 1, 84516, true, 415689, 415, true);
INSERT INTO public.moon VALUES (16, 'szte5j', 9, 84516, true, 415689, 415, true);
INSERT INTO public.moon VALUES (17, 'erhb', 7, 84516, true, 415689, 415, false);
INSERT INTO public.moon VALUES (18, 'ervg', 1, 84516, true, 415689, 415, true);
INSERT INTO public.moon VALUES (19, 'aerhye', 4, 84516, false, 415689, 415, true);
INSERT INTO public.moon VALUES (20, 'szrt6j', 5, 84516, true, 415689, 415, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'fghb', 1, 849156, true, 8451, 8451, true);
INSERT INTO public.planet VALUES (2, 'rtygbhjn', 5, 84561, false, 8419, 9841, true);
INSERT INTO public.planet VALUES (3, 'trvgbhj', 5, 894516, false, 78, 9841, true);
INSERT INTO public.planet VALUES (4, 'ubbhj', 4, 89415, false, 984, 965, true);
INSERT INTO public.planet VALUES (5, 'ghjk', 5, 8451, true, 895, 56, true);
INSERT INTO public.planet VALUES (6, 'ghjfv', 5, 741, false, 651, 984, true);
INSERT INTO public.planet VALUES (7, 'cvybhnj', 5, 651, false, 98465, 9841, true);
INSERT INTO public.planet VALUES (8, 'yguhinj', 3, 4156, false, 8415, 654, true);
INSERT INTO public.planet VALUES (9, 'hbjnk', 2, 849516, true, 98451, 518, true);
INSERT INTO public.planet VALUES (10, 'ghbjn k', 2, 6512, false, 159, 489, true);
INSERT INTO public.planet VALUES (11, 'vgbhnjkm', 6, 8456, false, 516, 894, false);
INSERT INTO public.planet VALUES (12, 'yhuijmdf', 5, 8415, false, 8952, 85, false);


--
-- Data for Name: solar_system; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.solar_system VALUES (1, 'Galactus XD5', 516, 89415, 5, true, true, 5);
INSERT INTO public.solar_system VALUES (2, 'Malkon 8F7', 159, 815, 4, false, false, 6);
INSERT INTO public.solar_system VALUES (3, 'Kent 84D', 15489, 5604, 8, true, true, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'SDF', 4, 189, true, 748, 65489, true, 3);
INSERT INTO public.star VALUES (2, '154hb', 5, 489, true, 894, 156, true, 1);
INSERT INTO public.star VALUES (3, 'dfg', 4, 89451, false, 6548, 9845, true, 1);
INSERT INTO public.star VALUES (4, 'tyguhb', 3, 15961, false, 561, 84, true, 2);
INSERT INTO public.star VALUES (5, 'tgyuhnj', 5, 4984, true, 856, 1487, false, 2);
INSERT INTO public.star VALUES (6, 'sdfgrfg', 4, 7465, true, 8956, 845, false, 2);


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
-- Name: solar_system_solar_system_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.solar_system_solar_system_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: solar_system solar_system_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT solar_system_name_key UNIQUE (name);


--
-- Name: solar_system solar_system_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT solar_system_pkey PRIMARY KEY (solar_system_id);


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
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: solar_system solar_system_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT solar_system_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star star_solar_system_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_solar_system_id_fkey FOREIGN KEY (solar_system_id) REFERENCES public.solar_system(solar_system_id);


--
-- PostgreSQL database dump complete
--


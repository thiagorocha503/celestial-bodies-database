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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    name character varying(45) NOT NULL,
    constellation_id integer NOT NULL,
    distance_from_earth_in_ly integer
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(45) NOT NULL,
    mass_solar text,
    radius_ly numeric(2,0),
    distance_ly numeric(2,0),
    type character varying
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
    name character varying(45) NOT NULL,
    planet_id integer,
    is_spherical boolean,
    radius_km numeric(2,0),
    mass_kg numeric(2,0),
    temperature_celsius numeric(2,0)
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
    name character varying(45) NOT NULL,
    star_id integer NOT NULL,
    has_life boolean NOT NULL,
    radius_km numeric,
    volume_km3 numeric,
    mass_earth numeric,
    discovery_year integer
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
    name character varying(45) NOT NULL,
    galaxy_id integer NOT NULL,
    constellation_id integer,
    solar_mass numeric(2,0),
    solar_radius numeric(2,0),
    temperature_celusis numeric(2,0),
    luminosity_solar numeric(2,0)
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES ('Ursa Minor', 3, 820);
INSERT INTO public.constellation VALUES ('Orion', 2, 1344);
INSERT INTO public.constellation VALUES ('Canis Major', 1, 4892);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Sombrero Galaxy', NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Backward Galaxy', NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Back Eye Galaxy', NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel Galaxy', NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (1, 'Milky Way', NULL, NULL, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon', 3, true, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'Io', 5, true, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'Ganimedes', 5, true, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'Europa', 5, true, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'Calisto', 5, true, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'Titan', 6, true, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'Rhea', 6, true, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'Iapethus', 6, true, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'Dione', 6, true, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'Enceladus', 6, true, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'Tethys', 6, true, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'Metis', 5, false, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'Adrastea', 5, false, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'Amalthea', 5, false, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'Thebe', 5, false, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'Hyperion', 6, false, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'Prometheus', 6, false, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'Atlas', 6, false, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'Janus', 6, false, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'Calipso', 6, false, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (22, 'Pandora', 6, false, NULL, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (4, 'Mars', 2, false, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (5, 'Jupiter', 2, false, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (6, 'Saturno', 2, false, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (7, 'Urano', 2, false, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (8, 'Neptune', 2, false, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (11, 'HAT-P-7b', 12, false, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (12, 'KELT-9b', 13, false, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (13, 'TrES-2b', 14, false, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (10, 'Ross 508 b', 11, false, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (1, 'Mecury', 2, false, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (3, 'Earth', 2, true, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (2, 'Venus', 2, false, NULL, NULL, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Sun', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (9, 'Alpha Centauri', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (10, 'UY Scuti', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (11, 'Ross 508', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (12, 'HAT-P-7', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (13, 'KELT-9', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (14, 'GSC 03549-02811', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (5, 'Polaris', 1, 3, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (6, 'Mintaka', 1, 2, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (7, 'Alnilan', 1, 2, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (8, 'Alnitak', 1, 2, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (4, 'Sirius', 1, 1, NULL, NULL, NULL, NULL);


--
-- Name: constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 14, true);


--
-- Name: constellation constellation_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_unique UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: galaxy galaxy_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_unique UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_unique UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_unique UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_unique UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star fk_galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon planet_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_fk FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_constellation_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_constellation_id FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: planet star_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_fk FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

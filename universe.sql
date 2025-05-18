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
-- Name: celestial_events; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.celestial_events (
    celestial_events_id integer NOT NULL,
    name character varying(50) NOT NULL,
    event_type text NOT NULL,
    discovery_year integer,
    is_periodic boolean,
    period_in_years numeric(12,2)
);


ALTER TABLE public.celestial_events OWNER TO freecodecamp;

--
-- Name: celestial_events_celestial_events_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.celestial_events_celestial_events_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.celestial_events_celestial_events_id_seq OWNER TO freecodecamp;

--
-- Name: celestial_events_celestial_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.celestial_events_celestial_events_id_seq OWNED BY public.celestial_events.celestial_events_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    age_in_millions_of_years numeric NOT NULL,
    diameter_light_years integer,
    number_of_stars bigint,
    has_black_hole boolean DEFAULT false,
    galaxy_type text
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
    name character varying(50) NOT NULL,
    planet_id integer NOT NULL,
    radius_km integer,
    is_spherical boolean,
    has_water boolean DEFAULT false,
    description text,
    orbital_period_days numeric(10,2)
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
    name character varying(50) NOT NULL,
    star_id integer NOT NULL,
    orbital_period_days numeric(10,2),
    has_atmosphere boolean NOT NULL,
    has_life boolean DEFAULT false,
    distance_from_star integer,
    planet_type text
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
    name character varying(50) NOT NULL,
    galaxy_id integer NOT NULL,
    age_in_millions_of_years integer,
    temperature_kelvin integer,
    is_spherical boolean NOT NULL,
    mass_solar_units numeric(10,2)
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
-- Name: celestial_events celestial_events_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_events ALTER COLUMN celestial_events_id SET DEFAULT nextval('public.celestial_events_celestial_events_id_seq'::regclass);


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
-- Data for Name: celestial_events; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.celestial_events VALUES (1, 'Halley''s Comet', 'Comet', 1705, true, 76.00);
INSERT INTO public.celestial_events VALUES (2, 'Supernova 1987A', 'Supernova', 1987, false, NULL);
INSERT INTO public.celestial_events VALUES (3, 'Great Comet of 1577', 'Comet', 1577, true, 10000.00);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13600, 100000, 400000000000, true, 'Spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10000, 220000, 1000000000000, true, 'Spiral');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 8000, 60000, 40000000000, false, 'Spiral');
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 1101, 14000, 30000000000, false, 'Irregular');
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 6500, 7000, 3000000000, false, 'Dwarf');
INSERT INTO public.galaxy VALUES (6, 'Sombrero Galaxy', 13250, 50000, 100000000000, true, 'Spiral');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 1737, true, true, 'Earth''s only natural satellite', 27.32);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 11, false, false, 'Larger of Mars two moons', 0.32);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 6, false, false, 'Smaller of Mars two moons', 1.26);
INSERT INTO public.moon VALUES (4, 'Io', 5, 1822, true, false, 'Volcanically active', 1.77);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 1561, true, true, 'Smooth ice surface', 3.55);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 2634, true, true, 'Largest moon in the solar system', 7.15);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 2410, true, true, 'Heavily cratered', 16.69);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 2575, true, true, 'Thick atmosphere', 15.95);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 252, true, true, 'Geysers of water', 1.37);
INSERT INTO public.moon VALUES (10, 'Mimas', 6, 198, true, false, 'Large impact crater', 0.94);
INSERT INTO public.moon VALUES (11, 'Triton', 8, 1353, true, true, 'Retrograde orbit', 5.88);
INSERT INTO public.moon VALUES (12, 'Titania', 7, 788, true, true, 'Largest moon of Uranus', 8.71);
INSERT INTO public.moon VALUES (13, 'Oberon', 7, 761, true, true, 'Outermost major moon of Uranus', 13.46);
INSERT INTO public.moon VALUES (14, 'Miranda', 7, 236, true, false, 'Smallest of Uranus five major moons', 1.41);
INSERT INTO public.moon VALUES (15, 'Ariel', 7, 579, true, true, 'Brightest moon of Uranus', 2.52);
INSERT INTO public.moon VALUES (16, 'Umbriel', 7, 585, true, true, 'Darkest of Uranus five major moons', 4.14);
INSERT INTO public.moon VALUES (17, 'Charon', 4, 606, true, true, 'Largest moon of Mercury', 6.39);
INSERT INTO public.moon VALUES (18, 'Nereid', 8, 170, false, false, 'Third-largest moon of Neptune', 360.14);
INSERT INTO public.moon VALUES (19, 'Proteus', 8, 210, false, false, 'Second-largest moon of Neptune', 1.12);
INSERT INTO public.moon VALUES (20, 'Amalthea', 5, 84, false, false, 'Third moon of Jupiter', 0.50);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 365.26, true, true, 150, 'Terrestrial');
INSERT INTO public.planet VALUES (2, 'Mars', 1, 686.98, true, false, 228, 'Terrestrial');
INSERT INTO public.planet VALUES (3, 'Venus', 1, 224.70, true, false, 108, 'Terrestrial');
INSERT INTO public.planet VALUES (4, 'Mercury', 1, 87.97, false, false, 58, 'Terrestrial');
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 4332.59, true, false, 778, 'Gas Giant');
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 10759.22, true, false, 1434, 'Gas Giant');
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 30688.50, true, false, 2871, 'Ice Giant');
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 60195.00, true, false, 4495, 'Ice Giant');
INSERT INTO public.planet VALUES (9, 'Proxima b', 2, 11.20, true, false, 0, 'Terrestrial');
INSERT INTO public.planet VALUES (10, 'Andromeda I', 5, 120.50, true, false, 1, 'Super Earth');
INSERT INTO public.planet VALUES (11, 'Andromeda II', 5, 284.40, false, false, 2, 'Gas Dwarf');
INSERT INTO public.planet VALUES (12, 'Triangulum Prime', 6, 34.20, true, false, 0, 'Hot Jupiter');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 4600, 5778, true, 1.00);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 4850, 3042, true, 0.12);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 8, 3500, true, 17.50);
INSERT INTO public.star VALUES (4, 'Sirius', 1, 230, 9940, true, 2.02);
INSERT INTO public.star VALUES (5, 'Alpha Andromedae', 2, 60, 13800, true, 3.80);
INSERT INTO public.star VALUES (6, 'Triangulum X-1', 3, 5, 30000, true, 15.00);


--
-- Name: celestial_events_celestial_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.celestial_events_celestial_events_id_seq', 3, true);


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
-- Name: celestial_events celestial_events_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_events
    ADD CONSTRAINT celestial_events_name_key UNIQUE (name);


--
-- Name: celestial_events celestial_events_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_events
    ADD CONSTRAINT celestial_events_pkey PRIMARY KEY (celestial_events_id);


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


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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    orbital_period_years integer,
    width_km integer,
    length_km integer,
    last_visit integer
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
    name character varying(30) NOT NULL,
    diameter_light_year integer,
    dist_earth_mil_light_years numeric(5,4),
    magnitude numeric(4,2),
    galaxy_type character varying(30)
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
    orbit_distance_km integer,
    equatorial_radius_km numeric(5,1),
    year_of_discovery integer,
    planet_id integer NOT NULL
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
    orbit_distance_mil_km integer,
    equatorial_radius_km numeric(7,2),
    rotation_period_earth_days numeric(6,3),
    orbit_period_earth_years numeric(6,3),
    equatorial_inclination_deg numeric(6,3),
    moons integer,
    is_dwarf boolean,
    has_rings boolean,
    is_flat boolean,
    star_id integer NOT NULL
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
    apparent_magnitude numeric(5,3),
    is_binary boolean,
    constellation text,
    evolutionary_stage text,
    temperature_k integer,
    distance_light_years numeric(8,2),
    solar_mass numeric(7,3),
    galaxy_id integer NOT NULL
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


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
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halleys Comet', 76, 8, 16, 1986);
INSERT INTO public.comet VALUES (2, 'Hale Bopp', 2399, 40, 80, 1997);
INSERT INTO public.comet VALUES (3, 'Neowise', 5500, 5, 5, 2020);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 87400, 0.0265, -20.80, 'barred spiral');
INSERT INTO public.galaxy VALUES (2, 'Large Magellanic Cloud', 32200, 0.1630, -17.93, 'irregular');
INSERT INTO public.galaxy VALUES (3, 'Andromeda - Messier 31', 152000, 2.5380, -21.50, 'spiral');
INSERT INTO public.galaxy VALUES (4, 'Triangulum - Messier M33', 61100, 2.7300, -18.87, 'spiral');
INSERT INTO public.galaxy VALUES (5, 'NGC 300', 94000, 6.0700, -17.92, 'spiral');
INSERT INTO public.galaxy VALUES (6, 'NGC 55', 70000, 6.5200, -18.47, 'barred spiral');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Earths Moon', 384400, 1737.5, NULL, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 9376, 11.1, 1877, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 23458, 6.2, 1877, 4);
INSERT INTO public.moon VALUES (4, 'Io', 421800, 1821.6, 1610, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 671100, 1560.8, 1610, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 1070400, 2631.2, 1610, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 1882700, 2410.3, 1610, 5);
INSERT INTO public.moon VALUES (8, 'Mimas', 185539, 198.2, 1789, 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', 23037, 252.1, 1789, 6);
INSERT INTO public.moon VALUES (10, 'Tethys', 294672, 533.0, 1684, 6);
INSERT INTO public.moon VALUES (11, 'Dione', 377415, 561.7, 1684, 6);
INSERT INTO public.moon VALUES (12, 'Rhea', 527068, 4802.2, 1672, 6);
INSERT INTO public.moon VALUES (13, 'Titan', 1221865, 2574.7, 1655, 6);
INSERT INTO public.moon VALUES (14, 'Hyperion', 1500934, 135.0, 1848, 6);
INSERT INTO public.moon VALUES (15, 'Oberon', 583500, 761.4, 1787, 7);
INSERT INTO public.moon VALUES (16, 'Titania', 436300, 4956.8, 1787, 7);
INSERT INTO public.moon VALUES (17, 'Rosalind', 69900, 36.0, 1986, 7);
INSERT INTO public.moon VALUES (18, 'Triton', 354759, 8503.7, 1846, 8);
INSERT INTO public.moon VALUES (19, 'Nereid', 5513818, 170.0, 1949, 8);
INSERT INTO public.moon VALUES (20, 'Proteus', 117646, 210.0, 1989, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 58, 2439.70, 58.646, 0.240, 0.000, 0, false, false, false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 108, 6051.80, -243.018, 0.615, 177.300, 0, false, false, false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 150, 6371.00, 0.997, 1.000, 23.440, 1, false, false, false, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 228, 3389.50, 1.026, 1.880, 25.200, 2, false, false, false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 778, 69911.00, 0.414, 11.863, 3.100, 95, false, true, false, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 1427, 58232.00, 0.444, 29.447, 26.700, 84, false, true, false, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 2870, 25362.00, -0.718, 84.017, 97.800, 27, false, true, false, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 4498, 24622.00, 0.671, 164.791, 28.300, 14, false, true, false, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 5906, 1151.00, 6.375, 248.000, 122.500, 5, true, false, false, 1);
INSERT INTO public.planet VALUES (10, 'Haumea', 6452, 620.00, 0.166, 285.000, 28.000, 2, true, true, false, 1);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri b', 8, 6562.13, 83.000, 11.186, NULL, NULL, false, NULL, false, 4);
INSERT INTO public.planet VALUES (12, 'Ceres', 413, 476.20, 0.375, 4.600, NULL, 0, true, false, false, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 11.300, false, NULL, 'G type main sequence', 5772, 0.00, 1.000, 1);
INSERT INTO public.star VALUES (2, 'Sirius A', -1.460, true, 'Canis Major', 'early A type main sequence', 9940, 8.60, 2.063, 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1.600, false, 'Orion', 'M1-2 type red supergiant', 3600, 548.00, 16.500, 1);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 10.430, false, 'Centaurus', 'low-mass M type dwarf', 2992, 4.25, 0.125, 1);
INSERT INTO public.star VALUES (5, 'Vega', 0.026, false, 'Lyra', 'A type main sequence', 9602, 25.00, 2.135, 1);
INSERT INTO public.star VALUES (6, 'Canopus', -0.740, false, 'Carina', 'A9 type bright giant', 7400, 310.00, 8.000, 1);
INSERT INTO public.star VALUES (7, 'S Doradus', 8.500, false, 'Dorado', 'Secchi type I', 8500, 160000.00, 24.000, 2);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 1, false);


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


--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1
-- Dumped by pg_dump version 15.1

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
-- Name: actors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.actors (
    name character varying(80),
    age integer,
    oscar text,
    birth date
);


ALTER TABLE public.actors OWNER TO postgres;

--
-- Name: directors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directors (
    name character varying(80),
    date_of_birth date,
    date_of_death character varying DEFAULT 'still alive'::character varying NOT NULL,
    country character varying(50)
);


ALTER TABLE public.directors OWNER TO postgres;

--
-- Name: films; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.films (
    name character varying(80),
    release_date date,
    imdb numeric,
    country character varying(50),
    budget character varying(50)
);


ALTER TABLE public.films OWNER TO postgres;

--
-- Data for Name: actors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.actors (name, age, oscar, birth) FROM stdin;
Meryl Streep	73	yes	1949-06-22
Sandra Bullock	58	yes	1964-07-26
Geoffrey Roy Rush	71	yes	1951-07-06
Daniel Day-Lewis	65	yes	1957-04-29
Gary Oldman	64	yes	1958-03-21
Zendaya	26	no	1996-09-01
\.


--
-- Data for Name: directors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directors (name, date_of_birth, date_of_death, country) FROM stdin;
Quentin Tarantino	1963-03-27	still alive	USA
Federico Fellini	1920-01-20	1993-10-31	Italy
Christopher Nolan	1970-07-30	still alive	UK
Guy Ritchie	1968-09-10	still alive	UK
Steven Spielberg	1946-12-18	still alive	USA
\.


--
-- Data for Name: films; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.films (name, release_date, imdb, country, budget) FROM stdin;
Scent of a Woman	1992-12-23	8.0	USA	USD 31 mln
Edge of Tomorrow	2014-06-06	7.9	USA	USD 178 mln
The Best Offer	2013-01-13	7.8	Italy	USD 18 mln
The Holiday	2006-12-08	6.9	USA and UK	USD 85 mln
The Lord of the Rings	2001-12-10	8.8	USA and New Zealand	USD 281 mln
\.


--
-- PostgreSQL database dump complete
--


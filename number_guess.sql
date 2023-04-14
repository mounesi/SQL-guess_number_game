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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: game_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.game_info (
    game_id integer NOT NULL,
    user_id integer,
    secret_number integer NOT NULL,
    guesses integer NOT NULL
);


ALTER TABLE public.game_info OWNER TO freecodecamp;

--
-- Name: game_info_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.game_info_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_info_game_id_seq OWNER TO freecodecamp;

--
-- Name: game_info_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.game_info_game_id_seq OWNED BY public.game_info.game_id;


--
-- Name: user_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.user_info (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.user_info OWNER TO freecodecamp;

--
-- Name: user_info_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.user_info_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_info_user_id_seq OWNER TO freecodecamp;

--
-- Name: user_info_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.user_info_user_id_seq OWNED BY public.user_info.user_id;


--
-- Name: game_info game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game_info ALTER COLUMN game_id SET DEFAULT nextval('public.game_info_game_id_seq'::regclass);


--
-- Name: user_info user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_info ALTER COLUMN user_id SET DEFAULT nextval('public.user_info_user_id_seq'::regclass);


--
-- Data for Name: game_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.game_info VALUES (40, 16, 504, 3);
INSERT INTO public.game_info VALUES (41, 16, 386, 4);
INSERT INTO public.game_info VALUES (42, 16, 536, 2);
INSERT INTO public.game_info VALUES (43, 16, 634, 3);
INSERT INTO public.game_info VALUES (44, 17, 324, 325);
INSERT INTO public.game_info VALUES (45, 17, 911, 912);
INSERT INTO public.game_info VALUES (46, 18, 347, 348);
INSERT INTO public.game_info VALUES (47, 18, 320, 321);
INSERT INTO public.game_info VALUES (48, 17, 589, 592);
INSERT INTO public.game_info VALUES (49, 17, 524, 525);
INSERT INTO public.game_info VALUES (50, 17, 317, 318);


--
-- Data for Name: user_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.user_info VALUES (16, 'Ali');
INSERT INTO public.user_info VALUES (17, 'user_1681499632819');
INSERT INTO public.user_info VALUES (18, 'user_1681499632818');


--
-- Name: game_info_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.game_info_game_id_seq', 50, true);


--
-- Name: user_info_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.user_info_user_id_seq', 18, true);


--
-- Name: game_info game_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game_info
    ADD CONSTRAINT game_info_pkey PRIMARY KEY (game_id);


--
-- Name: user_info user_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_info
    ADD CONSTRAINT user_info_pkey PRIMARY KEY (user_id);


--
-- Name: game_info game_info_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game_info
    ADD CONSTRAINT game_info_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.user_info(user_id);


--
-- PostgreSQL database dump complete
--


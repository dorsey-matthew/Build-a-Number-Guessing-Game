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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer NOT NULL,
    number_of_guesses integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer NOT NULL,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--



--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (13, 'user_1724008301960', 2, 145);
INSERT INTO public.users VALUES (3, 'user_1724007002046', 2, 846);
INSERT INTO public.users VALUES (12, 'user_1724008301961', 5, 511);
INSERT INTO public.users VALUES (27, 'user_1724009568590', 2, 199);
INSERT INTO public.users VALUES (2, 'user_1724007002047', 5, 708);
INSERT INTO public.users VALUES (15, 'user_1724008444799', 2, 85);
INSERT INTO public.users VALUES (26, 'user_1724009568591', 5, 313);
INSERT INTO public.users VALUES (25, 'm', 1, 20);
INSERT INTO public.users VALUES (14, 'user_1724008444800', 5, 122);
INSERT INTO public.users VALUES (5, 'user_1724007085048', 2, 949);
INSERT INTO public.users VALUES (4, 'user_1724007085049', 5, 722);
INSERT INTO public.users VALUES (7, 'user_1724007410687', 1, NULL);
INSERT INTO public.users VALUES (17, 'user_1724008567366', 2, 575);
INSERT INTO public.users VALUES (6, 'user_1724007410688', 4, NULL);
INSERT INTO public.users VALUES (29, 'user_1724009607355', 2, 113);
INSERT INTO public.users VALUES (28, 'user_1724009607356', 5, 399);
INSERT INTO public.users VALUES (16, 'user_1724008567367', 5, 350);
INSERT INTO public.users VALUES (1, 'matt', 6, 9);
INSERT INTO public.users VALUES (9, 'user_1724008206773', 2, 320);
INSERT INTO public.users VALUES (8, 'user_1724008206774', 5, 25);
INSERT INTO public.users VALUES (19, 'user_1724008684462', 2, 167);
INSERT INTO public.users VALUES (31, 'user_1724009666570', 2, 613);
INSERT INTO public.users VALUES (11, 'user_1724008211310', 2, 191);
INSERT INTO public.users VALUES (10, 'user_1724008211311', 5, 320);
INSERT INTO public.users VALUES (18, 'user_1724008684463', 5, 315);
INSERT INTO public.users VALUES (20, 'dude', 0, NULL);
INSERT INTO public.users VALUES (30, 'user_1724009666571', 5, 80);
INSERT INTO public.users VALUES (22, 'user_1724009495199', 2, 295);
INSERT INTO public.users VALUES (33, 'user_1724009786393', 2, 298);
INSERT INTO public.users VALUES (21, 'user_1724009495200', 5, 17);
INSERT INTO public.users VALUES (32, 'user_1724009786394', 5, 87);
INSERT INTO public.users VALUES (24, 'user_1724009500349', 2, 152);
INSERT INTO public.users VALUES (23, 'user_1724009500350', 5, 415);
INSERT INTO public.users VALUES (35, 'user_1724009906392', 2, 766);
INSERT INTO public.users VALUES (34, 'user_1724009906393', 5, 203);


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 1, false);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 35, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games fk_users_games; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT fk_users_games FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--


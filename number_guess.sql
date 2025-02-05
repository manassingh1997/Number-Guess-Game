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
    gameid integer NOT NULL,
    playerid integer,
    score integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_gameid_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_gameid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_gameid_seq OWNER TO freecodecamp;

--
-- Name: games_gameid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_gameid_seq OWNED BY public.games.gameid;


--
-- Name: players; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.players (
    playerid integer NOT NULL,
    playername character varying(22)
);


ALTER TABLE public.players OWNER TO freecodecamp;

--
-- Name: player_playerid_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.player_playerid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.player_playerid_seq OWNER TO freecodecamp;

--
-- Name: player_playerid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.player_playerid_seq OWNED BY public.players.playerid;


--
-- Name: games gameid; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN gameid SET DEFAULT nextval('public.games_gameid_seq'::regclass);


--
-- Name: players playerid; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players ALTER COLUMN playerid SET DEFAULT nextval('public.player_playerid_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (2, 1, 9);
INSERT INTO public.games VALUES (3, 13, 424);
INSERT INTO public.games VALUES (4, 13, 946);
INSERT INTO public.games VALUES (5, 14, 170);
INSERT INTO public.games VALUES (6, 14, 113);
INSERT INTO public.games VALUES (7, 13, 140);
INSERT INTO public.games VALUES (8, 13, 222);
INSERT INTO public.games VALUES (9, 13, 645);
INSERT INTO public.games VALUES (10, 15, 688);
INSERT INTO public.games VALUES (11, 15, 645);
INSERT INTO public.games VALUES (12, 16, 490);
INSERT INTO public.games VALUES (13, 16, 689);
INSERT INTO public.games VALUES (14, 15, 782);
INSERT INTO public.games VALUES (15, 15, 785);
INSERT INTO public.games VALUES (16, 15, 788);
INSERT INTO public.games VALUES (17, 1, 9);
INSERT INTO public.games VALUES (18, 17, 781);
INSERT INTO public.games VALUES (19, 17, 859);
INSERT INTO public.games VALUES (20, 18, 976);
INSERT INTO public.games VALUES (21, 18, 240);
INSERT INTO public.games VALUES (22, 17, 840);
INSERT INTO public.games VALUES (23, 17, 509);
INSERT INTO public.games VALUES (24, 17, 123);


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.players VALUES (1, 'manas');
INSERT INTO public.players VALUES (2, 'user_1738776710625');
INSERT INTO public.players VALUES (3, 'user_1738776710624');
INSERT INTO public.players VALUES (4, 'user_1738776783779');
INSERT INTO public.players VALUES (5, 'user_1738776783778');
INSERT INTO public.players VALUES (6, 'user_1738776883193');
INSERT INTO public.players VALUES (7, 'user_1738776883192');
INSERT INTO public.players VALUES (8, 'user_1738777167534');
INSERT INTO public.players VALUES (9, 'user_1738777167533');
INSERT INTO public.players VALUES (10, 'ASDF');
INSERT INTO public.players VALUES (11, 'user_1738777960971');
INSERT INTO public.players VALUES (12, 'user_1738777960970');
INSERT INTO public.players VALUES (13, 'user_1738778832830');
INSERT INTO public.players VALUES (14, 'user_1738778832829');
INSERT INTO public.players VALUES (15, 'user_1738778861189');
INSERT INTO public.players VALUES (16, 'user_1738778861188');
INSERT INTO public.players VALUES (17, 'user_1738779029702');
INSERT INTO public.players VALUES (18, 'user_1738779029701');


--
-- Name: games_gameid_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_gameid_seq', 24, true);


--
-- Name: player_playerid_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.player_playerid_seq', 18, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (gameid);


--
-- Name: players player_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT player_pkey PRIMARY KEY (playerid);


--
-- Name: players players_playername_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_playername_key UNIQUE (playername);


--
-- Name: games games_playerid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_playerid_fkey FOREIGN KEY (playerid) REFERENCES public.players(playerid);


--
-- PostgreSQL database dump complete
--


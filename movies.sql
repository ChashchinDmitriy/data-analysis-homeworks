--
-- PostgreSQL database dump
--

-- Dumped from database version 10.10 (Ubuntu 10.10-1.pgdg18.04+1)
-- Dumped by pg_dump version 10.10 (Ubuntu 10.10-1.pgdg18.04+1)

--
-- Name: films; Type: TABLE; Schema: public; Owner: dmitriy
--

CREATE TABLE public.films (
    id integer NOT NULL,
    title text,
    country text,
    box_office integer,
    release_date date
);


ALTER TABLE public.films OWNER TO dmitriy;

--
-- Name: persons; Type: TABLE; Schema: public; Owner: dmitriy
--

CREATE TABLE public.persons (
    id integer NOT NULL,
    fio text
);


ALTER TABLE public.persons OWNER TO dmitriy;

--
-- Name: persons2content; Type: TABLE; Schema: public; Owner: dmitriy
--

CREATE TABLE public.persons2content (
    person_id integer,
    film_id integer,
    person_type text
);


ALTER TABLE public.persons2content OWNER TO dmitriy;

--
-- Data for Name: films; Type: TABLE DATA; Schema: public; Owner: dmitriy
--

COPY public.films (id, title, country, box_office, release_date) FROM stdin;
770	Oceans Eleven	USA	450717150	2001-12-07
258687	Interstellar	USA, UK, Canada	677463813	2014-11-05
453397	It	USA, Canada	700381748	2017-09-08
467293	Filth	UK, Germany, Sweden, Belgium, USA	8334411	2014-05-30
958722	Kimi no na wa	Japan	357986087	2017-04-07
\.


--
-- Data for Name: persons; Type: TABLE DATA; Schema: public; Owner: dmitriy
--

COPY public.persons (id, fio) FROM stdin;
1	Steven Soderbergh
2	George Clooney
3	Brad Pitt
4	Matt Damon
5	Julia Roberts
6	Andy Garcia
7	Bruce Berman
8	Susan Ekins
9	Harry Brown
10	Charles Lederer
11	Christopher Nolan
12	Matthew McConaughey
13	Anne Hathaway
14	Jessica Chastain
15	Michael Caine
16	Matt Damon
17	Lynda Obst
18	Jonathan Nolan
19	Hans Zimmer
20	Nathan Crowley
21	Andres Muschietti
22	Jaeden Martell
23	Jeremy Ray Taylor
24	Sophia Lillis
25	Finn Wolfhard
26	Chosen Jacobs
27	Jack Dylan Grazer
28	Bill Skarsgård
29	Richard Brener
30	Stephen King
31	Jon S. Baird
32	James McAvoy
33	Jamie Bell
34	Eddie Marsan
35	Imogen Poots
36	Shauna Macdonald
37	Mark Amin
38	Christian Angermayer
39	Irvine Welsh
40	Matthew Jensen
41	Makoto Shinkai
42	Ryunosuke Kamiki
43	Mone Kamishiraishi
44	Ryo Narita
45	Aoi Yuki
46	Shimazaki Nobunaga
47	Radwimps
48	Akiko Majima
49	Takumi Tanji
50	Tasuku Watanabe
\.


--
-- Data for Name: persons2content; Type: TABLE DATA; Schema: public; Owner: dmitriy
--

COPY public.persons2content (person_id, film_id, person_type) FROM stdin;
1	770	Director, operator
2	770	Actor
3	770	Actor
4	770	Actor
5	770	Actor
6	770	Actor
7	770	Producer
8	770	Producer
9	770	Screenwriter
10	770	Screenwriter
11	258687	Director, producer, screenwriter
12	258687	Actor
13	258687	Actor
14	258687	Actor
15	258687	Actor
16	258687	Actor
17	258687	Producer
18	258687	Screenwriter
19	258687	Composer
20	258687	Production designer
21	453397	Director
22	453397	Actor
23	453397	Actor
24	453397	Actor
25	453397	Actor
26	453397	Actor
27	453397	Actor
28	453397	Actor
29	453397	Producer
30	467293	Screenwriter
31	467293	Director, producer, screenwriter
32	467293	Actor, producer
33	467293	Actor
34	467293	Actor
35	467293	Actor
36	467293	Actor
37	467293	Producer
38	467293	Producer
39	467293	Screenwriter
40	467293	Operator
41	958722	Director, producer, screenwriter, operator, editor
42	958722	Voice actor
43	958722	Voice actor
44	958722	Voice actor
45	958722	Voice actor
46	958722	Voice actor
47	958722	Composer
48	958722	Animator
49	958722	Animator
50	958722	Animator
\.


--
-- Name: films films_pkey; Type: CONSTRAINT; Schema: public; Owner: dmitriy
--

ALTER TABLE ONLY public.films
    ADD CONSTRAINT films_pkey PRIMARY KEY (id);


--
-- Name: persons persons_pkey; Type: CONSTRAINT; Schema: public; Owner: dmitriy
--

ALTER TABLE ONLY public.persons
    ADD CONSTRAINT persons_pkey PRIMARY KEY (id);


--
-- Name: persons2content persons2content_film_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dmitriy
--

ALTER TABLE ONLY public.persons2content
    ADD CONSTRAINT persons2content_film_id_fkey FOREIGN KEY (film_id) REFERENCES public.films(id);


--
-- Name: persons2content persons2content_person_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dmitriy
--

ALTER TABLE ONLY public.persons2content
    ADD CONSTRAINT persons2content_person_id_fkey FOREIGN KEY (person_id) REFERENCES public.persons(id);


--
-- PostgreSQL database dump complete
--


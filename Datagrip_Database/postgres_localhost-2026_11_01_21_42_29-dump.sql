--
-- PostgreSQL database dump
--

\restrict rOJPN6jybp4U6JvegqnrkCaPa0cddNTsq4dCkmZMq5dZ7q2ZdZJj8SowKbtQP0B

-- Dumped from database version 18.6
-- Dumped by pg_dump version 18.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: courses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.courses (
    id integer NOT NULL,
    name text,
    teacher_id integer
);


ALTER TABLE public.courses OWNER TO postgres;

--
-- Name: courses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.courses ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.courses_id_seq
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1
);


--
-- Name: houses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.houses (
    id integer NOT NULL,
    name text,
    colors text[] NOT NULL,
    founder text
);


ALTER TABLE public.houses OWNER TO postgres;

--
-- Name: houses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.houses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.houses_id_seq OWNER TO postgres;

--
-- Name: houses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.houses_id_seq OWNED BY public.houses.id;


--
-- Name: students; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students (
    id integer NOT NULL,
    name text,
    year numeric,
    house_id integer
);


ALTER TABLE public.students OWNER TO postgres;

--
-- Name: students_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.students ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.students_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: teachers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teachers (
    id integer NOT NULL,
    name text,
    house_id integer,
    courses_id integer
);


ALTER TABLE public.teachers OWNER TO postgres;

--
-- Name: teachers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.teachers ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.teachers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: houses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.houses ALTER COLUMN id SET DEFAULT nextval('public.houses_id_seq'::regclass);


--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.courses OVERRIDING SYSTEM VALUE VALUES (4, 'Herbology', 1);
INSERT INTO public.courses OVERRIDING SYSTEM VALUE VALUES (3, 'Spells', 1);
INSERT INTO public.courses OVERRIDING SYSTEM VALUE VALUES (2, 'Theory', 1);
INSERT INTO public.courses OVERRIDING SYSTEM VALUE VALUES (1, 'Flying', 1);
INSERT INTO public.courses OVERRIDING SYSTEM VALUE VALUES (0, 'Astronmy', 1);
INSERT INTO public.courses OVERRIDING SYSTEM VALUE VALUES (6, 'History', 1);
INSERT INTO public.courses OVERRIDING SYSTEM VALUE VALUES (5, 'Runes', 1);


--
-- Data for Name: houses; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.houses VALUES (1, 'Lunifindor', '{green,white}', 'Lun');
INSERT INTO public.houses VALUES (2, 'Pennydor', '{orange}', 'Penny');
INSERT INTO public.houses VALUES (3, 'Nicodor', '{blue}', 'Nicolai');
INSERT INTO public.houses VALUES (4, 'Maldor', '{red}', 'Malwina');


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.students OVERRIDING SYSTEM VALUE VALUES (1, 'Skytian', 2, 1);
INSERT INTO public.students OVERRIDING SYSTEM VALUE VALUES (3, 'Skynaur', 2, 3);
INSERT INTO public.students OVERRIDING SYSTEM VALUE VALUES (4, 'Shadownaur', 3, 4);
INSERT INTO public.students OVERRIDING SYSTEM VALUE VALUES (5, 'Vynadreon', 1, 1);
INSERT INTO public.students OVERRIDING SYSTEM VALUE VALUES (6, 'Skynadreon', 2, 2);
INSERT INTO public.students OVERRIDING SYSTEM VALUE VALUES (7, 'Rin', 2, 3);
INSERT INTO public.students OVERRIDING SYSTEM VALUE VALUES (8, 'Yulili', 2, 4);
INSERT INTO public.students OVERRIDING SYSTEM VALUE VALUES (9, 'Nora', 3, 4);
INSERT INTO public.students OVERRIDING SYSTEM VALUE VALUES (10, 'Norakanna', 2, 3);
INSERT INTO public.students OVERRIDING SYSTEM VALUE VALUES (11, NULL, NULL, NULL);
INSERT INTO public.students OVERRIDING SYSTEM VALUE VALUES (2, 'Studtian', 2, 3);


--
-- Data for Name: teachers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.teachers OVERRIDING SYSTEM VALUE VALUES (1, 'Mr. Nine', 1, NULL);
INSERT INTO public.teachers OVERRIDING SYSTEM VALUE VALUES (3, 'Doctor Herber', 3, NULL);
INSERT INTO public.teachers OVERRIDING SYSTEM VALUE VALUES (4, 'Mr. History', 4, NULL);
INSERT INTO public.teachers OVERRIDING SYSTEM VALUE VALUES (2, 'Ms. Eight', 3, 2);


--
-- Name: courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.courses_id_seq', 6, true);


--
-- Name: houses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.houses_id_seq', 4, true);


--
-- Name: students_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.students_id_seq', 11, true);


--
-- Name: teachers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.teachers_id_seq', 16, true);


--
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id);


--
-- Name: houses houses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.houses
    ADD CONSTRAINT houses_pkey PRIMARY KEY (id);


--
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);


--
-- Name: teachers teachers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT teachers_pkey PRIMARY KEY (id);


--
-- Name: courses courses_teachers_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_teachers_id_fk FOREIGN KEY (teacher_id) REFERENCES public.teachers(id);


--
-- Name: students students_house_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_house_fkey FOREIGN KEY (house_id) REFERENCES public.houses(id);


--
-- Name: teachers teachers_courses_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT teachers_courses_id_fk FOREIGN KEY (courses_id) REFERENCES public.courses(id);


--
-- Name: teachers teachers_house_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT teachers_house_fkey FOREIGN KEY (house_id) REFERENCES public.houses(id);


--
-- PostgreSQL database dump complete
--

\unrestrict rOJPN6jybp4U6JvegqnrkCaPa0cddNTsq4dCkmZMq5dZ7q2ZdZJj8SowKbtQP0B


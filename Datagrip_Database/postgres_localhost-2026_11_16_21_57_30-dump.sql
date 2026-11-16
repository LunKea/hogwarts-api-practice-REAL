--
-- PostgreSQL database dump
--

\restrict Nf7AcDvpvQVHwLWzO7HtSZJ9PZCXQilm7hmGFLqCO0hoHxbRtnPXashTSb6LEfz

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
    teacher_id integer,
    type_id integer,
    level_id integer,
    schoolyear_id integer
);


ALTER TABLE public.courses OWNER TO postgres;

--
-- Name: coursesLVL; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."coursesLVL" (
    id integer CONSTRAINT couseslvl_courseslvl_id_not_null NOT NULL,
    lvl text
);


ALTER TABLE public."coursesLVL" OWNER TO postgres;

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
-- Name: coursestype; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coursestype (
    id integer NOT NULL,
    type text
);


ALTER TABLE public.coursestype OWNER TO postgres;

--
-- Name: coursestype_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.coursestype ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.coursestype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: couseslvl_courseslvl_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.couseslvl_courseslvl_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.couseslvl_courseslvl_id_seq OWNER TO postgres;

--
-- Name: couseslvl_courseslvl_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.couseslvl_courseslvl_id_seq OWNED BY public."coursesLVL".id;


--
-- Name: exams; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.exams (
    id integer NOT NULL,
    course_id integer,
    student_id integer,
    grade integer
);


ALTER TABLE public.exams OWNER TO postgres;

--
-- Name: exams_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.exams ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.exams_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: house_teachers_join; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.house_teachers_join (
);


ALTER TABLE public.house_teachers_join OWNER TO postgres;

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
    house_id integer,
    birthday date,
    schoolyear numeric
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
    courses_id integer,
    currentlyactiv_statusid boolean,
    deceased_id boolean,
    employmentstart_date date
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
-- Name: coursesLVL id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."coursesLVL" ALTER COLUMN id SET DEFAULT nextval('public.couseslvl_courseslvl_id_seq'::regclass);


--
-- Name: houses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.houses ALTER COLUMN id SET DEFAULT nextval('public.houses_id_seq'::regclass);


--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.courses OVERRIDING SYSTEM VALUE VALUES (4, 'Herbology', 1, NULL, NULL, NULL);
INSERT INTO public.courses OVERRIDING SYSTEM VALUE VALUES (3, 'Spells', 1, NULL, NULL, NULL);
INSERT INTO public.courses OVERRIDING SYSTEM VALUE VALUES (2, 'Theory', 1, NULL, NULL, NULL);
INSERT INTO public.courses OVERRIDING SYSTEM VALUE VALUES (1, 'Flying', 1, NULL, NULL, NULL);
INSERT INTO public.courses OVERRIDING SYSTEM VALUE VALUES (0, 'Astronmy', 1, NULL, NULL, NULL);
INSERT INTO public.courses OVERRIDING SYSTEM VALUE VALUES (6, 'History', 1, NULL, NULL, NULL);
INSERT INTO public.courses OVERRIDING SYSTEM VALUE VALUES (5, 'Runes', 1, NULL, NULL, NULL);


--
-- Data for Name: coursesLVL; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."coursesLVL" VALUES (1, 'NEWT');
INSERT INTO public."coursesLVL" VALUES (2, 'OWL');


--
-- Data for Name: coursestype; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.coursestype OVERRIDING SYSTEM VALUE VALUES (1, 'core');
INSERT INTO public.coursestype OVERRIDING SYSTEM VALUE VALUES (2, 'elective');
INSERT INTO public.coursestype OVERRIDING SYSTEM VALUE VALUES (3, 'extra-curricular');


--
-- Data for Name: exams; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.exams OVERRIDING SYSTEM VALUE VALUES (1, 2, 2, NULL);


--
-- Data for Name: house_teachers_join; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: houses; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.houses VALUES (1, 'Lunifindor', '{green,white}', 'Lun');
INSERT INTO public.houses VALUES (4, 'Malrin', '{red}', 'Malwina');
INSERT INTO public.houses VALUES (2, 'Pennyclaw', '{orange}', 'Penny');
INSERT INTO public.houses VALUES (3, 'Nicopuff', '{blue}', 'Nicolai');
INSERT INTO public.houses VALUES (5, 'New Magic', '{rainbow}', 'Unicorn');
INSERT INTO public.houses VALUES (6, 'New Wizards', '{Shadow}', 'Voids');
INSERT INTO public.houses VALUES (7, 'New Witches', '{"Pastel blue"}', 'Girls');


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.students OVERRIDING SYSTEM VALUE VALUES (1, 'Skytian', 2, 1, NULL, NULL);
INSERT INTO public.students OVERRIDING SYSTEM VALUE VALUES (3, 'Skynaur', 2, 3, NULL, NULL);
INSERT INTO public.students OVERRIDING SYSTEM VALUE VALUES (4, 'Shadownaur', 3, 4, NULL, NULL);
INSERT INTO public.students OVERRIDING SYSTEM VALUE VALUES (5, 'Vynadreon', 1, 1, NULL, NULL);
INSERT INTO public.students OVERRIDING SYSTEM VALUE VALUES (6, 'Skynadreon', 2, 2, NULL, NULL);
INSERT INTO public.students OVERRIDING SYSTEM VALUE VALUES (7, 'Rin', 2, 3, NULL, NULL);
INSERT INTO public.students OVERRIDING SYSTEM VALUE VALUES (8, 'Yulili', 2, 4, NULL, NULL);
INSERT INTO public.students OVERRIDING SYSTEM VALUE VALUES (9, 'Nora', 3, 4, NULL, NULL);
INSERT INTO public.students OVERRIDING SYSTEM VALUE VALUES (10, 'Norakanna', 2, 3, NULL, NULL);
INSERT INTO public.students OVERRIDING SYSTEM VALUE VALUES (11, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.students OVERRIDING SYSTEM VALUE VALUES (2, 'Studtian', 2, 3, NULL, NULL);


--
-- Data for Name: teachers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.teachers OVERRIDING SYSTEM VALUE VALUES (17, 'Minerva McGonagall', 1, 1, NULL, NULL, NULL);
INSERT INTO public.teachers OVERRIDING SYSTEM VALUE VALUES (18, 'Remus Lupin', 1, 2, NULL, NULL, NULL);
INSERT INTO public.teachers OVERRIDING SYSTEM VALUE VALUES (19, 'Charity Burbage', 1, 3, NULL, NULL, NULL);
INSERT INTO public.teachers OVERRIDING SYSTEM VALUE VALUES (20, 'Albus Dumbledore', 1, 4, NULL, NULL, NULL);
INSERT INTO public.teachers OVERRIDING SYSTEM VALUE VALUES (21, 'Filius', 2, 1, NULL, NULL, NULL);
INSERT INTO public.teachers OVERRIDING SYSTEM VALUE VALUES (22, 'Quirinus Quirrel', 2, 2, NULL, NULL, NULL);
INSERT INTO public.teachers OVERRIDING SYSTEM VALUE VALUES (23, 'Gilderov Lockhart', 2, 3, NULL, NULL, NULL);
INSERT INTO public.teachers OVERRIDING SYSTEM VALUE VALUES (24, 'Sybill', 2, 4, NULL, NULL, NULL);
INSERT INTO public.teachers OVERRIDING SYSTEM VALUE VALUES (25, 'Pomona Sprout', 3, 1, NULL, NULL, NULL);
INSERT INTO public.teachers OVERRIDING SYSTEM VALUE VALUES (26, 'Silvanus Kettleburn', 3, 2, NULL, NULL, NULL);
INSERT INTO public.teachers OVERRIDING SYSTEM VALUE VALUES (27, 'Horace Slughorn', 4, 1, NULL, NULL, NULL);
INSERT INTO public.teachers OVERRIDING SYSTEM VALUE VALUES (28, 'Severus Snape', 4, 2, NULL, NULL, NULL);
INSERT INTO public.teachers OVERRIDING SYSTEM VALUE VALUES (29, 'Dolores Umbridge', 4, 3, NULL, NULL, NULL);
INSERT INTO public.teachers OVERRIDING SYSTEM VALUE VALUES (4, 'Mr. History', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.teachers OVERRIDING SYSTEM VALUE VALUES (3, 'Doctor Herber', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.teachers OVERRIDING SYSTEM VALUE VALUES (1, 'Mr. Nine', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.teachers OVERRIDING SYSTEM VALUE VALUES (2, 'Mr Two', 1, 1, NULL, NULL, NULL);


--
-- Name: courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.courses_id_seq', 6, true);


--
-- Name: coursestype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.coursestype_id_seq', 3, true);


--
-- Name: couseslvl_courseslvl_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.couseslvl_courseslvl_id_seq', 2, true);


--
-- Name: exams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.exams_id_seq', 1, true);


--
-- Name: houses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.houses_id_seq', 7, true);


--
-- Name: students_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.students_id_seq', 11, true);


--
-- Name: teachers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.teachers_id_seq', 29, true);


--
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id);


--
-- Name: coursesLVL courseslvl_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."coursesLVL"
    ADD CONSTRAINT courseslvl_pkey PRIMARY KEY (id);


--
-- Name: coursestype coursestype_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coursestype
    ADD CONSTRAINT coursestype_pk PRIMARY KEY (id);


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
-- Name: exams exams_courses_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exams
    ADD CONSTRAINT exams_courses_fk FOREIGN KEY (course_id) REFERENCES public.courses(id);


--
-- Name: exams exams_student_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exams
    ADD CONSTRAINT exams_student_fk FOREIGN KEY (student_id) REFERENCES public.students(id);


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

\unrestrict Nf7AcDvpvQVHwLWzO7HtSZJ9PZCXQilm7hmGFLqCO0hoHxbRtnPXashTSb6LEfz


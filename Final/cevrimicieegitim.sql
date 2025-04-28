--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

-- Started on 2025-04-28 10:18:03

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
-- TOC entry 223 (class 1259 OID 16488)
-- Name: blogposts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.blogposts (
    id integer NOT NULL,
    title character varying(255),
    content text,
    publish_date timestamp without time zone,
    author_id integer
);


ALTER TABLE public.blogposts OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16412)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying(100),
    description text
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16473)
-- Name: certificateassignments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.certificateassignments (
    id integer NOT NULL,
    user_id integer,
    certificate_id integer,
    assignment_date date
);


ALTER TABLE public.certificateassignments OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16466)
-- Name: certificates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.certificates (
    id integer NOT NULL,
    code character varying(100),
    date date
);


ALTER TABLE public.certificates OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16439)
-- Name: courses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.courses (
    id integer NOT NULL,
    title character varying(200),
    description text,
    start_date date,
    end_date date,
    category_id integer
);


ALTER TABLE public.courses OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16451)
-- Name: enrollments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.enrollments (
    id integer NOT NULL,
    user_id integer,
    course_id integer,
    enrollment_date timestamp without time zone
);


ALTER TABLE public.enrollments OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16396)
-- Name: members; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.members (
    id integer NOT NULL,
    username character varying(100),
    email character varying(100),
    password character varying(255),
    registration_date timestamp without time zone,
    first_name character varying(50),
    last_name character varying(50)
);


ALTER TABLE public.members OWNER TO postgres;

--
-- TOC entry 4782 (class 2606 OID 16494)
-- Name: blogposts blogposts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blogposts
    ADD CONSTRAINT blogposts_pkey PRIMARY KEY (id);


--
-- TOC entry 4770 (class 2606 OID 16418)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- TOC entry 4780 (class 2606 OID 16477)
-- Name: certificateassignments certificateassignments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.certificateassignments
    ADD CONSTRAINT certificateassignments_pkey PRIMARY KEY (id);


--
-- TOC entry 4776 (class 2606 OID 16472)
-- Name: certificates certificates_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.certificates
    ADD CONSTRAINT certificates_code_key UNIQUE (code);


--
-- TOC entry 4778 (class 2606 OID 16470)
-- Name: certificates certificates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.certificates
    ADD CONSTRAINT certificates_pkey PRIMARY KEY (id);


--
-- TOC entry 4772 (class 2606 OID 16445)
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id);


--
-- TOC entry 4774 (class 2606 OID 16455)
-- Name: enrollments enrollments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enrollments
    ADD CONSTRAINT enrollments_pkey PRIMARY KEY (id);


--
-- TOC entry 4766 (class 2606 OID 16402)
-- Name: members members_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.members
    ADD CONSTRAINT members_pkey PRIMARY KEY (id);


--
-- TOC entry 4768 (class 2606 OID 16404)
-- Name: members members_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.members
    ADD CONSTRAINT members_username_key UNIQUE (username);


--
-- TOC entry 4788 (class 2606 OID 16495)
-- Name: blogposts blogposts_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blogposts
    ADD CONSTRAINT blogposts_author_id_fkey FOREIGN KEY (author_id) REFERENCES public.members(id);


--
-- TOC entry 4786 (class 2606 OID 16483)
-- Name: certificateassignments certificateassignments_certificate_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.certificateassignments
    ADD CONSTRAINT certificateassignments_certificate_id_fkey FOREIGN KEY (certificate_id) REFERENCES public.certificates(id);


--
-- TOC entry 4787 (class 2606 OID 16478)
-- Name: certificateassignments certificateassignments_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.certificateassignments
    ADD CONSTRAINT certificateassignments_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.members(id);


--
-- TOC entry 4783 (class 2606 OID 16446)
-- Name: courses courses_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- TOC entry 4784 (class 2606 OID 16461)
-- Name: enrollments enrollments_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enrollments
    ADD CONSTRAINT enrollments_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.courses(id);


--
-- TOC entry 4785 (class 2606 OID 16456)
-- Name: enrollments enrollments_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enrollments
    ADD CONSTRAINT enrollments_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.members(id);


-- Completed on 2025-04-28 10:18:03

--
-- PostgreSQL database dump complete
--


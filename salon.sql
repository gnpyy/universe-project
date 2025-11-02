--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE salon;
--
-- Name: salon; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE salon WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE salon OWNER TO freecodecamp;

\connect salon

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
-- Name: appointments; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.appointments (
    "time" character varying(50),
    customer_id integer,
    service_id integer,
    appointment_id integer NOT NULL
);


ALTER TABLE public.appointments OWNER TO freecodecamp;

--
-- Name: appointments_appointment_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.appointments_appointment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.appointments_appointment_id_seq OWNER TO freecodecamp;

--
-- Name: appointments_appointment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.appointments_appointment_id_seq OWNED BY public.appointments.appointment_id;


--
-- Name: customers; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.customers (
    customer_id integer NOT NULL,
    phone character varying(20),
    name character varying(50)
);


ALTER TABLE public.customers OWNER TO freecodecamp;

--
-- Name: customers_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.customers_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_customer_id_seq OWNER TO freecodecamp;

--
-- Name: customers_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.customers_customer_id_seq OWNED BY public.customers.customer_id;


--
-- Name: services; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.services (
    service_id integer NOT NULL,
    name character varying(50)
);


ALTER TABLE public.services OWNER TO freecodecamp;

--
-- Name: services_service_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.services_service_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.services_service_id_seq OWNER TO freecodecamp;

--
-- Name: services_service_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.services_service_id_seq OWNED BY public.services.service_id;


--
-- Name: appointments appointment_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.appointments ALTER COLUMN appointment_id SET DEFAULT nextval('public.appointments_appointment_id_seq'::regclass);


--
-- Name: customers customer_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.customers ALTER COLUMN customer_id SET DEFAULT nextval('public.customers_customer_id_seq'::regclass);


--
-- Name: services service_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.services ALTER COLUMN service_id SET DEFAULT nextval('public.services_service_id_seq'::regclass);


--
-- Data for Name: appointments; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.appointments VALUES ('', NULL, NULL, 3);
INSERT INTO public.appointments VALUES ('', NULL, NULL, 6);
INSERT INTO public.appointments VALUES ('', NULL, NULL, 10);
INSERT INTO public.appointments VALUES ('', NULL, NULL, 13);
INSERT INTO public.appointments VALUES ('', NULL, NULL, 17);
INSERT INTO public.appointments VALUES ('', NULL, NULL, 20);
INSERT INTO public.appointments VALUES ('', NULL, NULL, 24);
INSERT INTO public.appointments VALUES ('', NULL, NULL, 27);
INSERT INTO public.appointments VALUES ('', NULL, NULL, 31);
INSERT INTO public.appointments VALUES ('', NULL, NULL, 34);
INSERT INTO public.appointments VALUES ('', 5, 1, 40);
INSERT INTO public.appointments VALUES ('11am', 57, 2, 48);
INSERT INTO public.appointments VALUES ('1', 83, 3, 49);


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.customers VALUES (2, NULL, 'Test');
INSERT INTO public.customers VALUES (4, NULL, 'Test');
INSERT INTO public.customers VALUES (5, '', NULL);
INSERT INTO public.customers VALUES (6, NULL, '');
INSERT INTO public.customers VALUES (8, NULL, 'Test');
INSERT INTO public.customers VALUES (10, NULL, 'Test');
INSERT INTO public.customers VALUES (12, NULL, 'FakeTime');
INSERT INTO public.customers VALUES (14, NULL, 'Test');
INSERT INTO public.customers VALUES (16, NULL, 'Test');
INSERT INTO public.customers VALUES (18, NULL, 'Test');
INSERT INTO public.customers VALUES (20, NULL, '');
INSERT INTO public.customers VALUES (22, NULL, 'Test');
INSERT INTO public.customers VALUES (24, NULL, 'Test');
INSERT INTO public.customers VALUES (26, NULL, 'FakeTime');
INSERT INTO public.customers VALUES (28, NULL, 'Test');
INSERT INTO public.customers VALUES (30, NULL, 'Test');
INSERT INTO public.customers VALUES (32, NULL, 'Test');
INSERT INTO public.customers VALUES (34, NULL, '');
INSERT INTO public.customers VALUES (36, NULL, 'Test');
INSERT INTO public.customers VALUES (38, NULL, 'Test');
INSERT INTO public.customers VALUES (40, NULL, 'FakeTime');
INSERT INTO public.customers VALUES (42, NULL, 'Test');
INSERT INTO public.customers VALUES (44, NULL, 'Test');
INSERT INTO public.customers VALUES (46, NULL, 'Test');
INSERT INTO public.customers VALUES (48, NULL, '');
INSERT INTO public.customers VALUES (50, NULL, 'Test');
INSERT INTO public.customers VALUES (52, NULL, 'Test');
INSERT INTO public.customers VALUES (54, NULL, 'FakeTime');
INSERT INTO public.customers VALUES (56, NULL, 'Test');
INSERT INTO public.customers VALUES (57, '555-555-5555', NULL);
INSERT INTO public.customers VALUES (59, NULL, 'Test');
INSERT INTO public.customers VALUES (61, NULL, 'Test');
INSERT INTO public.customers VALUES (63, NULL, '');
INSERT INTO public.customers VALUES (65, NULL, 'Test');
INSERT INTO public.customers VALUES (67, NULL, 'Test');
INSERT INTO public.customers VALUES (69, NULL, 'FakeTime');
INSERT INTO public.customers VALUES (71, NULL, 'Test');
INSERT INTO public.customers VALUES (83, '4', '45');


--
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.services VALUES (1, 'm');
INSERT INTO public.services VALUES (2, 'y');
INSERT INTO public.services VALUES (3, 'x');


--
-- Name: appointments_appointment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.appointments_appointment_id_seq', 61, true);


--
-- Name: customers_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.customers_customer_id_seq', 93, true);


--
-- Name: services_service_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.services_service_id_seq', 3, true);


--
-- Name: appointments appointments_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_pkey PRIMARY KEY (appointment_id);


--
-- Name: customers customers_phone_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_phone_key UNIQUE (phone);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);


--
-- Name: services services_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (service_id);


--
-- Name: appointments appointments_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);


--
-- Name: appointments appointments_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.services(service_id);


--
-- PostgreSQL database dump complete
--


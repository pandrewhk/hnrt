--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3
-- Dumped by pg_dump version 12.3

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
-- Name: curl1; Type: TABLE; Schema: public; Owner: andrew
--

CREATE TABLE public.curl1 (
    t timestamp without time zone DEFAULT now() NOT NULL,
    url text NOT NULL,
    data text,
    curlinfo jsonb
);


ALTER TABLE public.curl1 OWNER TO andrew;

--
-- PostgreSQL database dump complete
--


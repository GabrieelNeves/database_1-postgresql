--
-- PostgreSQL database dump
--

\restrict aAGCwTmpqCFQvkznnHeGtML8H45GokohICFH3DU6wEYcd7jMhSaXffTH78jIwgG

-- Dumped from database version 18.4
-- Dumped by pg_dump version 18.4

-- Started on 2026-06-20 22:50:35

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
-- TOC entry 221 (class 1259 OID 16406)
-- Name: despacho; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.despacho (
    numero integer NOT NULL,
    despacho character varying(100),
    documento integer,
    tipo integer
);


ALTER TABLE public.despacho OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16395)
-- Name: documento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.documento (
    numero integer NOT NULL,
    nome character varying(100),
    tipo integer
);


ALTER TABLE public.documento OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16412)
-- Name: tipo_despacho; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_despacho (
    nr integer NOT NULL,
    nome character varying(40)
);


ALTER TABLE public.tipo_despacho OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16389)
-- Name: tipo_documento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_documento (
    nr integer NOT NULL,
    nome character varying(40)
);


ALTER TABLE public.tipo_documento OWNER TO postgres;

--
-- TOC entry 4872 (class 2606 OID 16411)
-- Name: despacho despacho_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.despacho
    ADD CONSTRAINT despacho_pkey PRIMARY KEY (numero);


--
-- TOC entry 4870 (class 2606 OID 16400)
-- Name: documento documento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documento
    ADD CONSTRAINT documento_pkey PRIMARY KEY (numero);


--
-- TOC entry 4875 (class 2606 OID 16417)
-- Name: tipo_despacho tipo_despacho_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_despacho
    ADD CONSTRAINT tipo_despacho_pkey PRIMARY KEY (nr);


--
-- TOC entry 4868 (class 2606 OID 16394)
-- Name: tipo_documento tipo_documento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_documento
    ADD CONSTRAINT tipo_documento_pkey PRIMARY KEY (nr);


--
-- TOC entry 4873 (class 1259 OID 16428)
-- Name: inddoc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX inddoc ON public.despacho USING btree (documento);


--
-- TOC entry 4877 (class 2606 OID 16418)
-- Name: despacho despacho_documento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.despacho
    ADD CONSTRAINT despacho_documento_fkey FOREIGN KEY (documento) REFERENCES public.documento(numero);


--
-- TOC entry 4878 (class 2606 OID 16423)
-- Name: despacho despacho_tipo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.despacho
    ADD CONSTRAINT despacho_tipo_fkey FOREIGN KEY (tipo) REFERENCES public.tipo_despacho(nr);


--
-- TOC entry 4876 (class 2606 OID 16401)
-- Name: documento fk_documento_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documento
    ADD CONSTRAINT fk_documento_2 FOREIGN KEY (tipo) REFERENCES public.tipo_documento(nr) ON DELETE CASCADE;


-- Completed on 2026-06-20 22:50:36

--
-- PostgreSQL database dump complete
--

\unrestrict aAGCwTmpqCFQvkznnHeGtML8H45GokohICFH3DU6wEYcd7jMhSaXffTH78jIwgG


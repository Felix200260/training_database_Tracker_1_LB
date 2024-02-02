--
-- PostgreSQL database dump
--

-- Dumped from database version 15.5
-- Dumped by pg_dump version 15.5

-- Started on 2024-02-02 17:37:37

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
-- TOC entry 221 (class 1259 OID 16491)
-- Name: goals; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.goals (
    goal_id integer NOT NULL,
    project_id integer,
    priority_id integer,
    status_id integer,
    start_date date,
    end_date date,
    goal_short_name character varying(255) NOT NULL,
    goal_description text NOT NULL,
    user_id integer
);


ALTER TABLE public.goals OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16404)
-- Name: priority; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.priority (
    priority_id integer NOT NULL,
    priority_level character varying(50) NOT NULL
);


ALTER TABLE public.priority OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16472)
-- Name: projects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.projects (
    project_id integer NOT NULL,
    priority_id integer,
    status_id integer,
    start_date date,
    end_date date,
    project_short_name character varying(255) NOT NULL,
    project_description text NOT NULL,
    goal_id integer
);


ALTER TABLE public.projects OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16409)
-- Name: status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.status (
    status_id integer NOT NULL,
    status_description character varying(255) NOT NULL
);


ALTER TABLE public.status OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16490)
-- Name: table_goals_goal_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.table_goals_goal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.table_goals_goal_id_seq OWNER TO postgres;

--
-- TOC entry 3382 (class 0 OID 0)
-- Dependencies: 220
-- Name: table_goals_goal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.table_goals_goal_id_seq OWNED BY public.goals.goal_id;


--
-- TOC entry 218 (class 1259 OID 16471)
-- Name: table_projects_project_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.table_projects_project_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.table_projects_project_id_seq OWNER TO postgres;

--
-- TOC entry 3383 (class 0 OID 0)
-- Dependencies: 218
-- Name: table_projects_project_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.table_projects_project_id_seq OWNED BY public.projects.project_id;


--
-- TOC entry 217 (class 1259 OID 16453)
-- Name: tasks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tasks (
    task_id integer NOT NULL,
    priority_id integer,
    status_id integer,
    start_date date,
    end_date date,
    task_short_name character varying(255) NOT NULL,
    task_description text NOT NULL,
    project_id integer
);


ALTER TABLE public.tasks OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16452)
-- Name: table_tasks_task_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.table_tasks_task_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.table_tasks_task_id_seq OWNER TO postgres;

--
-- TOC entry 3384 (class 0 OID 0)
-- Dependencies: 216
-- Name: table_tasks_task_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.table_tasks_task_id_seq OWNED BY public.tasks.task_id;


--
-- TOC entry 223 (class 1259 OID 16552)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    first_name character varying(255),
    last_name character varying(255)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16551)
-- Name: table_users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.table_users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.table_users_user_id_seq OWNER TO postgres;

--
-- TOC entry 3385 (class 0 OID 0)
-- Dependencies: 222
-- Name: table_users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.table_users_user_id_seq OWNED BY public.users.user_id;


--
-- TOC entry 3198 (class 2604 OID 16494)
-- Name: goals goal_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.goals ALTER COLUMN goal_id SET DEFAULT nextval('public.table_goals_goal_id_seq'::regclass);


--
-- TOC entry 3197 (class 2604 OID 16475)
-- Name: projects project_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects ALTER COLUMN project_id SET DEFAULT nextval('public.table_projects_project_id_seq'::regclass);


--
-- TOC entry 3196 (class 2604 OID 16456)
-- Name: tasks task_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tasks ALTER COLUMN task_id SET DEFAULT nextval('public.table_tasks_task_id_seq'::regclass);


--
-- TOC entry 3199 (class 2604 OID 16555)
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.table_users_user_id_seq'::regclass);


--
-- TOC entry 3374 (class 0 OID 16491)
-- Dependencies: 221
-- Data for Name: goals; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.goals (goal_id, project_id, priority_id, status_id, start_date, end_date, goal_short_name, goal_description, user_id) FROM stdin;
\.


--
-- TOC entry 3367 (class 0 OID 16404)
-- Dependencies: 214
-- Data for Name: priority; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.priority (priority_id, priority_level) FROM stdin;
1	Высокий
2	Средний
3	Низкий
\.


--
-- TOC entry 3372 (class 0 OID 16472)
-- Dependencies: 219
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.projects (project_id, priority_id, status_id, start_date, end_date, project_short_name, project_description, goal_id) FROM stdin;
\.


--
-- TOC entry 3368 (class 0 OID 16409)
-- Dependencies: 215
-- Data for Name: status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.status (status_id, status_description) FROM stdin;
1	Новая
2	В процессе выполнения
3	Завершена
4	Отложена
5	Отменена
\.


--
-- TOC entry 3370 (class 0 OID 16453)
-- Dependencies: 217
-- Data for Name: tasks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tasks (task_id, priority_id, status_id, start_date, end_date, task_short_name, task_description, project_id) FROM stdin;
\.


--
-- TOC entry 3376 (class 0 OID 16552)
-- Dependencies: 223
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_id, username, email, password, first_name, last_name) FROM stdin;
\.


--
-- TOC entry 3386 (class 0 OID 0)
-- Dependencies: 220
-- Name: table_goals_goal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.table_goals_goal_id_seq', 1, false);


--
-- TOC entry 3387 (class 0 OID 0)
-- Dependencies: 218
-- Name: table_projects_project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.table_projects_project_id_seq', 1, false);


--
-- TOC entry 3388 (class 0 OID 0)
-- Dependencies: 216
-- Name: table_tasks_task_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.table_tasks_task_id_seq', 1, false);


--
-- TOC entry 3389 (class 0 OID 0)
-- Dependencies: 222
-- Name: table_users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.table_users_user_id_seq', 1, false);


--
-- TOC entry 3209 (class 2606 OID 16498)
-- Name: goals table_goals_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.goals
    ADD CONSTRAINT table_goals_pkey PRIMARY KEY (goal_id);


--
-- TOC entry 3201 (class 2606 OID 16408)
-- Name: priority table_priority_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.priority
    ADD CONSTRAINT table_priority_pkey PRIMARY KEY (priority_id);


--
-- TOC entry 3207 (class 2606 OID 16479)
-- Name: projects table_projects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT table_projects_pkey PRIMARY KEY (project_id);


--
-- TOC entry 3203 (class 2606 OID 16413)
-- Name: status table_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.status
    ADD CONSTRAINT table_status_pkey PRIMARY KEY (status_id);


--
-- TOC entry 3205 (class 2606 OID 16460)
-- Name: tasks table_tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT table_tasks_pkey PRIMARY KEY (task_id);


--
-- TOC entry 3211 (class 2606 OID 16563)
-- Name: users table_users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT table_users_email_key UNIQUE (email);


--
-- TOC entry 3213 (class 2606 OID 16559)
-- Name: users table_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT table_users_pkey PRIMARY KEY (user_id);


--
-- TOC entry 3215 (class 2606 OID 16561)
-- Name: users table_users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT table_users_username_key UNIQUE (username);


--
-- TOC entry 3222 (class 2606 OID 16574)
-- Name: goals fk_goals_users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.goals
    ADD CONSTRAINT fk_goals_users FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- TOC entry 3219 (class 2606 OID 16564)
-- Name: projects fk_projects_goals; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT fk_projects_goals FOREIGN KEY (goal_id) REFERENCES public.goals(goal_id);


--
-- TOC entry 3216 (class 2606 OID 16569)
-- Name: tasks fk_tasks_projects; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT fk_tasks_projects FOREIGN KEY (project_id) REFERENCES public.projects(project_id);


--
-- TOC entry 3223 (class 2606 OID 16504)
-- Name: goals table_goals_priority_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.goals
    ADD CONSTRAINT table_goals_priority_id_fkey FOREIGN KEY (priority_id) REFERENCES public.priority(priority_id);


--
-- TOC entry 3224 (class 2606 OID 16509)
-- Name: goals table_goals_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.goals
    ADD CONSTRAINT table_goals_status_id_fkey FOREIGN KEY (status_id) REFERENCES public.status(status_id);


--
-- TOC entry 3220 (class 2606 OID 16480)
-- Name: projects table_projects_priority_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT table_projects_priority_id_fkey FOREIGN KEY (priority_id) REFERENCES public.priority(priority_id);


--
-- TOC entry 3221 (class 2606 OID 16485)
-- Name: projects table_projects_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT table_projects_status_id_fkey FOREIGN KEY (status_id) REFERENCES public.status(status_id);


--
-- TOC entry 3217 (class 2606 OID 16461)
-- Name: tasks table_tasks_priority_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT table_tasks_priority_id_fkey FOREIGN KEY (priority_id) REFERENCES public.priority(priority_id);


--
-- TOC entry 3218 (class 2606 OID 16466)
-- Name: tasks table_tasks_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT table_tasks_status_id_fkey FOREIGN KEY (status_id) REFERENCES public.status(status_id);


-- Completed on 2024-02-02 17:37:37

--
-- PostgreSQL database dump complete
--


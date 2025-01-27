SET session_replication_role = replica;

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Ubuntu 15.1-1.pgdg20.04+1)
-- Dumped by pg_dump version 15.8

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

--
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."audit_log_entries" ("instance_id", "id", "payload", "created_at", "ip_address") VALUES
	('00000000-0000-0000-0000-000000000000', '58a2a8c6-ca51-436f-a83f-589fc4dd67a5', '{"action":"user_invited","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"leh.lotfi@gmail.com","user_id":"f687f0f7-45bc-44fb-9b15-26696fd4c791"}}', '2024-12-10 22:36:30.087147+00', ''),
	('00000000-0000-0000-0000-000000000000', 'cebc1611-db8d-4956-b4e6-b3942653e039', '{"action":"user_confirmation_requested","actor_id":"f24c0bbb-5431-4773-b6f2-3192eaaf5bf3","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2024-12-11 00:44:09.433515+00', ''),
	('00000000-0000-0000-0000-000000000000', '647b669a-714c-4ff8-85a0-f2e6bdd42a27', '{"action":"user_signedup","actor_id":"f24c0bbb-5431-4773-b6f2-3192eaaf5bf3","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"team"}', '2024-12-11 00:44:21.672851+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd50d636d-ad27-4839-b931-44ceeeba06c3', '{"action":"user_repeated_signup","actor_id":"f24c0bbb-5431-4773-b6f2-3192eaaf5bf3","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2024-12-11 00:44:31.412648+00', ''),
	('00000000-0000-0000-0000-000000000000', '36cb4d04-e4ae-420f-8cbf-df58a4d5c6a8', '{"action":"login","actor_id":"f24c0bbb-5431-4773-b6f2-3192eaaf5bf3","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-12-11 00:44:41.784889+00', ''),
	('00000000-0000-0000-0000-000000000000', '9ac98fce-7a65-48d4-b393-5378e280d6da', '{"action":"user_confirmation_requested","actor_id":"3dda6390-53b6-42be-a3f1-3d2de07b3a5d","actor_username":"leh.lotfi@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2024-12-11 00:57:32.153884+00', ''),
	('00000000-0000-0000-0000-000000000000', '9505e219-f444-48c1-b62f-23f28d234743', '{"action":"user_signedup","actor_id":"3dda6390-53b6-42be-a3f1-3d2de07b3a5d","actor_username":"leh.lotfi@gmail.com","actor_via_sso":false,"log_type":"team"}', '2024-12-11 00:57:49.276405+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b2877b14-54e3-4425-8989-81343c8b23e6', '{"action":"login","actor_id":"3dda6390-53b6-42be-a3f1-3d2de07b3a5d","actor_username":"leh.lotfi@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-12-11 00:57:54.795984+00', ''),
	('00000000-0000-0000-0000-000000000000', '677f7858-069f-42d2-98e1-023dfda8ef1e', '{"action":"token_refreshed","actor_id":"3dda6390-53b6-42be-a3f1-3d2de07b3a5d","actor_username":"leh.lotfi@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-11 03:46:34.176932+00', ''),
	('00000000-0000-0000-0000-000000000000', '7ec3a453-b6ba-4124-9dc2-8ac1ac40d82a', '{"action":"token_revoked","actor_id":"3dda6390-53b6-42be-a3f1-3d2de07b3a5d","actor_username":"leh.lotfi@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-11 03:46:34.177713+00', ''),
	('00000000-0000-0000-0000-000000000000', '20ad6b8e-ccc9-4058-8b89-d1b0f29f1f18', '{"action":"token_refreshed","actor_id":"3dda6390-53b6-42be-a3f1-3d2de07b3a5d","actor_username":"leh.lotfi@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-11 03:46:34.279905+00', ''),
	('00000000-0000-0000-0000-000000000000', '5749a354-a991-4b88-94a0-e7e79e93256c', '{"action":"token_refreshed","actor_id":"f24c0bbb-5431-4773-b6f2-3192eaaf5bf3","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"token"}', '2024-12-11 16:28:39.327834+00', ''),
	('00000000-0000-0000-0000-000000000000', '6cf51691-c3aa-40fc-995d-e54200a494eb', '{"action":"token_revoked","actor_id":"f24c0bbb-5431-4773-b6f2-3192eaaf5bf3","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"token"}', '2024-12-11 16:28:39.328855+00', ''),
	('00000000-0000-0000-0000-000000000000', 'bcb21001-a2f9-4965-ac8c-889038778568', '{"action":"token_refreshed","actor_id":"f24c0bbb-5431-4773-b6f2-3192eaaf5bf3","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"token"}', '2024-12-11 16:28:39.490428+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a5de2753-76b3-4633-a3f0-58dd9db5ea0f', '{"action":"logout","actor_id":"f24c0bbb-5431-4773-b6f2-3192eaaf5bf3","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account"}', '2024-12-11 16:28:45.014612+00', ''),
	('00000000-0000-0000-0000-000000000000', '268c91a3-ec7b-4237-84b7-841fabcd97a0', '{"action":"user_signedup","actor_id":"fe380a16-536d-4b91-aaf4-249d663aa5f7","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"team","traits":{"provider":"google"}}', '2024-12-14 05:07:22.220315+00', ''),
	('00000000-0000-0000-0000-000000000000', 'da53b0c1-b987-40f8-8036-19b99086cf9e', '{"action":"login","actor_id":"fe380a16-536d-4b91-aaf4-249d663aa5f7","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}', '2024-12-14 05:08:32.038934+00', ''),
	('00000000-0000-0000-0000-000000000000', '55dd0de6-b345-43e4-95a0-a9317a77535b', '{"action":"login","actor_id":"fe380a16-536d-4b91-aaf4-249d663aa5f7","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}', '2024-12-14 05:09:47.983422+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b3cb02f3-8f18-4cca-b6dd-5fb216ab47d6', '{"action":"user_signedup","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"team","traits":{"provider":"google"}}', '2024-12-14 14:46:29.117272+00', ''),
	('00000000-0000-0000-0000-000000000000', '531fd10a-d399-4181-a984-6e264dba0940', '{"action":"login","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account","traits":{"provider_type":"google"}}', '2024-12-14 14:46:29.253484+00', ''),
	('00000000-0000-0000-0000-000000000000', '31124eb5-c03e-4598-b7a4-461ca98e067d', '{"action":"login","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}', '2024-12-14 14:47:34.86089+00', ''),
	('00000000-0000-0000-0000-000000000000', 'bbfcb9cc-dc96-48b4-8fb0-8703e0272102', '{"action":"login","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}', '2024-12-15 09:44:15.038386+00', ''),
	('00000000-0000-0000-0000-000000000000', '8ff5ef2b-0084-412a-8325-387280e563b0', '{"action":"token_refreshed","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"token"}', '2024-12-15 09:44:15.411407+00', ''),
	('00000000-0000-0000-0000-000000000000', '74e6a948-df63-43ae-b899-69b3a64ce3e7', '{"action":"token_revoked","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"token"}', '2024-12-15 09:44:15.412088+00', ''),
	('00000000-0000-0000-0000-000000000000', '0291b6fe-56c1-4103-a64c-1ff54f196e84', '{"action":"login","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}', '2024-12-15 09:47:56.50676+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f218d7a8-3b02-4fef-883a-11ec69e1f6dd', '{"action":"login","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}', '2024-12-15 09:50:16.522148+00', ''),
	('00000000-0000-0000-0000-000000000000', '02e7b6ca-a11d-4d02-a35c-737548c854ce', '{"action":"login","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account","traits":{"provider_type":"google"}}', '2024-12-15 09:51:15.87346+00', ''),
	('00000000-0000-0000-0000-000000000000', '9efde8b2-a7a0-417d-96dc-610aec1a32b4', '{"action":"logout","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account"}', '2024-12-15 10:00:36.798975+00', ''),
	('00000000-0000-0000-0000-000000000000', '7a5d2214-9fa0-4f3d-95b9-929cafc84761', '{"action":"user_recovery_requested","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"user"}', '2024-12-15 10:26:57.926114+00', ''),
	('00000000-0000-0000-0000-000000000000', '21c88a26-9def-4a97-a8a9-84dbcf1e1a73', '{"action":"login","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account"}', '2024-12-15 10:27:39.546553+00', ''),
	('00000000-0000-0000-0000-000000000000', '4b37578c-878b-4489-beef-19584173539f', '{"action":"user_recovery_requested","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"user"}', '2024-12-15 10:29:41.081382+00', ''),
	('00000000-0000-0000-0000-000000000000', '778543da-4ea6-45d2-a048-be4389c60381', '{"action":"user_recovery_requested","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"user"}', '2024-12-15 10:31:39.653687+00', ''),
	('00000000-0000-0000-0000-000000000000', '74109db0-70d0-4b33-a73a-5e777f93b5d5', '{"action":"login","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account"}', '2024-12-15 10:32:55.276569+00', ''),
	('00000000-0000-0000-0000-000000000000', '8b3e9f61-1957-4ae6-a077-18e8b12b4419', '{"action":"logout","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account"}', '2024-12-15 10:33:40.892349+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ef10251e-8ee3-4f99-893b-41f97205b6cf', '{"action":"user_recovery_requested","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"user"}', '2024-12-15 10:33:50.336701+00', ''),
	('00000000-0000-0000-0000-000000000000', '0f66a0b6-fbc6-4800-b4fd-ac8cc99546c9', '{"action":"login","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account"}', '2024-12-15 10:34:07.567073+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a7cfe9df-2081-4163-87b7-4cdf84cf33ea', '{"action":"logout","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account"}', '2024-12-15 10:35:04.05509+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd9ac7954-13b5-48ff-8da6-fe212c1f03cf', '{"action":"user_recovery_requested","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"user"}', '2024-12-15 10:38:24.121046+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b99a7c00-d462-4ba3-924e-2ca80e035632', '{"action":"login","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account"}', '2024-12-15 10:38:39.619351+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e95273e6-8dc7-4b98-8293-6f2bab19aa33', '{"action":"login","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account","traits":{"provider_type":"magiclink"}}', '2024-12-15 10:38:39.721934+00', ''),
	('00000000-0000-0000-0000-000000000000', 'bc829dfd-fa7e-4f91-9cc0-6b485b0d403d', '{"action":"user_recovery_requested","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"user"}', '2024-12-15 10:39:54.583153+00', ''),
	('00000000-0000-0000-0000-000000000000', '61ba963f-7454-4ed8-85d9-4448870accf2', '{"action":"login","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account"}', '2024-12-15 10:40:09.176233+00', ''),
	('00000000-0000-0000-0000-000000000000', '9927ee66-0a67-4aaa-977c-0b2c31ee4d93', '{"action":"token_refreshed","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"token"}', '2024-12-15 11:43:13.870257+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f691ef72-029a-4fe2-b681-86ae1a7c586a', '{"action":"token_revoked","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"token"}', '2024-12-15 11:43:13.871225+00', ''),
	('00000000-0000-0000-0000-000000000000', '6e211983-8d7c-4269-b141-5722a9f21faf', '{"action":"token_refreshed","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"token"}', '2024-12-15 19:25:37.167128+00', ''),
	('00000000-0000-0000-0000-000000000000', '77bc4ca0-2ad6-438e-8752-264b6f12438c', '{"action":"token_revoked","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"token"}', '2024-12-15 19:25:37.168242+00', ''),
	('00000000-0000-0000-0000-000000000000', '178bc097-9a6f-4b48-9742-9592aab84f4d', '{"action":"token_refreshed","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"token"}', '2024-12-15 21:52:44.135717+00', ''),
	('00000000-0000-0000-0000-000000000000', '360a8b61-1754-4103-b305-baa79bf03598', '{"action":"token_revoked","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"token"}', '2024-12-15 21:52:44.136662+00', ''),
	('00000000-0000-0000-0000-000000000000', '7e40c06f-506c-439e-b1b5-9927ebb1ea6a', '{"action":"token_refreshed","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"token"}', '2024-12-15 22:45:57.739165+00', ''),
	('00000000-0000-0000-0000-000000000000', '61c066c1-c45c-41d6-b6e9-ab2c08eff657', '{"action":"token_revoked","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"token"}', '2024-12-15 22:45:57.739558+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a7a468ac-d1b3-42c7-8c0f-25c3335c555c', '{"action":"token_refreshed","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"token"}', '2024-12-15 22:53:47.541397+00', ''),
	('00000000-0000-0000-0000-000000000000', '2ac8c16b-20d3-4a5c-bc53-88bee27a9783', '{"action":"token_revoked","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"token"}', '2024-12-15 22:53:47.541962+00', ''),
	('00000000-0000-0000-0000-000000000000', '4701f350-68ff-4459-97d7-3604f1354d0c', '{"action":"token_refreshed","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"token"}', '2024-12-15 22:53:49.115748+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b0de8096-7a75-4368-8d27-7eabb195c0c4', '{"action":"token_refreshed","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"token"}', '2024-12-16 02:12:01.399785+00', ''),
	('00000000-0000-0000-0000-000000000000', '16cc3ed6-6200-47fa-ba9c-af056a189dbf', '{"action":"token_revoked","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"token"}', '2024-12-16 02:12:01.40062+00', ''),
	('00000000-0000-0000-0000-000000000000', '5774012b-4776-4102-ba26-d4533bd9ee0a', '{"action":"logout","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account"}', '2024-12-16 02:42:13.294079+00', ''),
	('00000000-0000-0000-0000-000000000000', '1e26a6ec-b60e-49a5-aa61-111e099fc274', '{"action":"user_recovery_requested","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"user"}', '2024-12-16 02:42:30.052277+00', ''),
	('00000000-0000-0000-0000-000000000000', '13e76ac1-8de6-48a9-b170-01987d7fe113', '{"action":"login","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account"}', '2024-12-16 02:42:43.928028+00', ''),
	('00000000-0000-0000-0000-000000000000', '62a4898d-2be7-48e3-8d4a-79e20b58f150', '{"action":"token_refreshed","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"token"}', '2024-12-28 13:10:52.382119+00', ''),
	('00000000-0000-0000-0000-000000000000', '457df751-e847-409c-88ea-863de2bcc4ae', '{"action":"token_revoked","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"token"}', '2024-12-28 13:10:52.382448+00', ''),
	('00000000-0000-0000-0000-000000000000', '463367b1-e2d5-4660-8644-650447b8f152', '{"action":"token_refreshed","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"token"}', '2024-12-28 13:10:54.135647+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ff1284ce-8bb7-4f64-9e76-31938bcf0931', '{"action":"logout","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account"}', '2024-12-28 13:11:01.58508+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ae7189ff-07b3-4d9f-ac61-3ea1a9353058', '{"action":"user_recovery_requested","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"user"}', '2024-12-28 13:11:59.804155+00', ''),
	('00000000-0000-0000-0000-000000000000', '2559529c-3a74-4b81-9726-25ca3f6413e7', '{"action":"login","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account"}', '2024-12-28 13:12:09.371016+00', ''),
	('00000000-0000-0000-0000-000000000000', '298a92df-0301-44e0-b246-0ddefc24f4c6', '{"action":"login","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}', '2024-12-28 13:13:22.509015+00', ''),
	('00000000-0000-0000-0000-000000000000', '47c5c574-da7e-42fe-96f6-8459d0fe46b4', '{"action":"login","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account","traits":{"provider_type":"google"}}', '2024-12-28 13:13:22.653684+00', ''),
	('00000000-0000-0000-0000-000000000000', '24fd5f15-c15a-4f4b-aad5-49617727dac3', '{"action":"logout","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account"}', '2024-12-28 13:13:27.164904+00', ''),
	('00000000-0000-0000-0000-000000000000', '94c0e2bf-db27-48f1-b9b5-70da4b8915bc', '{"action":"user_recovery_requested","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"user"}', '2024-12-28 13:13:34.234357+00', ''),
	('00000000-0000-0000-0000-000000000000', '1a3b23bb-1a7f-404d-bd1d-2d5a4ce8a4a4', '{"action":"login","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account"}', '2024-12-28 13:13:49.666169+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f119c671-9a2b-448a-a8ad-767de099d6df', '{"action":"login","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account","traits":{"provider_type":"magiclink"}}', '2024-12-28 13:13:49.767481+00', ''),
	('00000000-0000-0000-0000-000000000000', '0d51d96f-2dc4-4dae-8df8-c59eb2143886', '{"action":"user_recovery_requested","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"user"}', '2024-12-28 13:40:00.319711+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c7027905-e90b-42de-b0b8-ce8160c23da0', '{"action":"login","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account"}', '2024-12-28 13:40:15.955427+00', ''),
	('00000000-0000-0000-0000-000000000000', '3042353b-85f9-4e7e-b391-667fa91f73a1', '{"action":"login","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}', '2024-12-28 19:49:49.960419+00', ''),
	('00000000-0000-0000-0000-000000000000', 'fed5083b-57f5-4f45-a256-5bf99774d352', '{"action":"login","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account","traits":{"provider_type":"google"}}', '2024-12-28 19:49:51.001892+00', ''),
	('00000000-0000-0000-0000-000000000000', '787148bd-0293-4bc4-9372-81f7b2b0896f', '{"action":"user_recovery_requested","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"user"}', '2024-12-28 20:15:50.448667+00', ''),
	('00000000-0000-0000-0000-000000000000', '2584cd62-bdd7-4294-b556-21276ad27534', '{"action":"user_confirmation_requested","actor_id":"b2776436-115b-41b6-b8cb-ff6ff6b5adf5","actor_username":"taoufiq@veedoo.io","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2024-12-29 12:38:54.090267+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ac287afd-f3b2-43da-987c-e4dfb12797a4', '{"action":"user_signedup","actor_id":"b2776436-115b-41b6-b8cb-ff6ff6b5adf5","actor_username":"taoufiq@veedoo.io","actor_via_sso":false,"log_type":"team"}', '2024-12-29 12:40:31.54186+00', ''),
	('00000000-0000-0000-0000-000000000000', '3e0ed7d6-ad0a-4576-add9-733e0871035a', '{"action":"user_recovery_requested","actor_id":"b2776436-115b-41b6-b8cb-ff6ff6b5adf5","actor_username":"taoufiq@veedoo.io","actor_via_sso":false,"log_type":"user"}', '2024-12-29 12:41:14.48963+00', ''),
	('00000000-0000-0000-0000-000000000000', '4ecbf5a7-b173-4e5a-a05a-8f85c93a4a33', '{"action":"user_recovery_requested","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"user"}', '2024-12-29 14:25:11.218393+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ed0a1a34-8e55-4fd5-b3be-1acf7649bb26', '{"action":"login","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account"}', '2024-12-29 14:25:35.467602+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd4a7bcd1-d705-4b42-a2d3-c093802edd42', '{"action":"user_recovery_requested","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"user"}', '2024-12-29 14:27:51.234502+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd87d8fb4-7989-4ffd-98ce-f26fc0362b3f', '{"action":"login","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account"}', '2024-12-29 14:27:58.783578+00', ''),
	('00000000-0000-0000-0000-000000000000', '5b9185bf-d2ca-4502-83b4-025f446febed', '{"action":"user_recovery_requested","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"user"}', '2024-12-29 14:30:12.856135+00', ''),
	('00000000-0000-0000-0000-000000000000', '4c80566d-90eb-467d-baf5-efe983c6f3ee', '{"action":"login","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account"}', '2024-12-29 14:30:19.144318+00', ''),
	('00000000-0000-0000-0000-000000000000', '69cccd51-f85d-4969-aee5-78968c8453c9', '{"action":"login","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account","traits":{"provider_type":"magiclink"}}', '2024-12-29 14:30:19.685846+00', ''),
	('00000000-0000-0000-0000-000000000000', '704079eb-028d-4860-986a-0c255387ca21', '{"action":"logout","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account"}', '2024-12-29 14:32:11.752198+00', ''),
	('00000000-0000-0000-0000-000000000000', '1ef546bc-6c89-4791-a201-4204dc141ff7', '{"action":"user_recovery_requested","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"user"}', '2024-12-29 14:32:29.827385+00', ''),
	('00000000-0000-0000-0000-000000000000', '54b4867b-73ca-47f4-88db-f163be349f22', '{"action":"user_recovery_requested","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"user"}', '2024-12-29 14:34:33.92936+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c6789dfd-15f1-4800-ac88-1ca66353b820', '{"action":"login","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account"}', '2024-12-29 14:34:50.358126+00', ''),
	('00000000-0000-0000-0000-000000000000', '8d985a0c-a2e9-4989-9520-7cb9cdfa5fdc', '{"action":"logout","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account"}', '2024-12-29 14:36:27.62227+00', ''),
	('00000000-0000-0000-0000-000000000000', '74a40dd3-80ab-4ff3-95ab-1feb023b3910', '{"action":"login","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}', '2024-12-29 14:36:58.1582+00', ''),
	('00000000-0000-0000-0000-000000000000', '48e69679-0ff2-4cf4-87fb-42c6be0b80bf', '{"action":"login","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account","traits":{"provider_type":"google"}}', '2024-12-29 14:36:58.835703+00', ''),
	('00000000-0000-0000-0000-000000000000', '8805533d-36c2-469f-a684-3ccbff6058b0', '{"action":"logout","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account"}', '2024-12-29 14:37:05.498456+00', ''),
	('00000000-0000-0000-0000-000000000000', '74ffaf80-5c40-429b-a171-e3abd576475f', '{"action":"login","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}', '2024-12-29 14:37:22.018339+00', ''),
	('00000000-0000-0000-0000-000000000000', '81610412-f7f6-4bb2-bf72-0eadd543fe6f', '{"action":"login","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account","traits":{"provider_type":"google"}}', '2024-12-29 14:37:22.635132+00', ''),
	('00000000-0000-0000-0000-000000000000', '14b26094-7644-415d-9d1b-cb56bc77cf82', '{"action":"logout","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account"}', '2024-12-29 14:39:23.460956+00', ''),
	('00000000-0000-0000-0000-000000000000', 'dd93f5ff-e5b3-4254-93ce-d8d7bb89fbdb', '{"action":"user_confirmation_requested","actor_id":"9dab1390-b740-42e9-bfb9-20a2ce6d796d","actor_username":"a.a@a.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2024-12-29 14:48:16.065543+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd82ee16d-4c10-4bb0-a553-031920eaca5d', '{"action":"user_recovery_requested","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"user"}', '2024-12-29 14:50:29.181803+00', ''),
	('00000000-0000-0000-0000-000000000000', '985a6e5f-ec34-4795-a349-9a78624caf44', '{"action":"login","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account"}', '2024-12-29 14:50:38.481112+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a5f8dbff-6d73-4869-904f-47ca336dcc25', '{"action":"login","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account","traits":{"provider_type":"magiclink"}}', '2024-12-29 14:50:38.953691+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f18b2c9c-7fbc-44fa-801c-8a338c908650', '{"action":"logout","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account"}', '2024-12-29 14:51:07.046718+00', ''),
	('00000000-0000-0000-0000-000000000000', '11cb24d7-487f-4cf9-9dc3-8f8611974c2a', '{"action":"user_confirmation_requested","actor_id":"4cd083ed-d029-4481-843b-1736c9b7b979","actor_username":"leh.lotfi@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2024-12-29 14:52:57.903419+00', ''),
	('00000000-0000-0000-0000-000000000000', '689edfac-fe19-40ac-a7aa-a4c2724beefd', '{"action":"user_signedup","actor_id":"4cd083ed-d029-4481-843b-1736c9b7b979","actor_username":"leh.lotfi@gmail.com","actor_via_sso":false,"log_type":"team"}', '2024-12-29 14:53:10.271696+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a66629e1-c7cd-430a-a920-326f5bcda07e', '{"action":"logout","actor_id":"4cd083ed-d029-4481-843b-1736c9b7b979","actor_username":"leh.lotfi@gmail.com","actor_via_sso":false,"log_type":"account"}', '2024-12-29 14:54:33.898034+00', ''),
	('00000000-0000-0000-0000-000000000000', '3f1f47e1-e5d3-4777-9c17-afdb4a8873f1', '{"action":"login","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}', '2024-12-29 15:33:14.890596+00', ''),
	('00000000-0000-0000-0000-000000000000', '58187865-eb84-4f72-bdcb-93969f22718d', '{"action":"login","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account","traits":{"provider_type":"google"}}', '2024-12-29 15:33:15.515407+00', ''),
	('00000000-0000-0000-0000-000000000000', 'bb809ee4-6558-49ad-a0fe-c88e3dab272b', '{"action":"logout","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account"}', '2024-12-29 15:33:53.282458+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a1b31449-4bc8-4e18-a9f3-cf123dbd8389', '{"action":"login","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}', '2024-12-29 15:34:20.533744+00', ''),
	('00000000-0000-0000-0000-000000000000', '382f944d-de69-4518-9a82-6b66cce9baec', '{"action":"login","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account","traits":{"provider_type":"google"}}', '2024-12-29 15:34:21.318115+00', ''),
	('00000000-0000-0000-0000-000000000000', '4dfe4cb4-b592-435d-b551-6dac6924d2d9', '{"action":"logout","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account"}', '2024-12-29 15:38:16.479657+00', ''),
	('00000000-0000-0000-0000-000000000000', '0041a469-06b6-4b4d-ad71-bb99a48597d8', '{"action":"login","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}', '2024-12-29 15:39:07.302724+00', ''),
	('00000000-0000-0000-0000-000000000000', '92fdd0f7-a8b7-4229-88dc-ba41d7f9d567', '{"action":"login","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account","traits":{"provider_type":"google"}}', '2024-12-29 15:39:08.049049+00', ''),
	('00000000-0000-0000-0000-000000000000', 'fcc090b7-2d09-4922-8021-dfc663d1265f', '{"action":"logout","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account"}', '2024-12-29 15:40:00.163723+00', ''),
	('00000000-0000-0000-0000-000000000000', 'fb72f526-2454-4ab8-9c16-c2ef392ca2d1', '{"action":"login","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}', '2024-12-29 15:40:10.337676+00', ''),
	('00000000-0000-0000-0000-000000000000', '479144a0-a9f5-4f34-aa3d-b2c5822927aa', '{"action":"login","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account","traits":{"provider_type":"google"}}', '2024-12-29 15:40:11.109991+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c68eb3f3-d3c9-4dea-8d28-e875e51fdeda', '{"action":"logout","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account"}', '2024-12-29 15:40:26.869966+00', ''),
	('00000000-0000-0000-0000-000000000000', '8e1684ab-c059-49b0-bf61-17d5dfe68600', '{"action":"login","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}', '2024-12-29 15:40:53.221342+00', ''),
	('00000000-0000-0000-0000-000000000000', '9070aca1-dec4-4e8f-8a4d-3f925de693c0', '{"action":"login","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account","traits":{"provider_type":"google"}}', '2024-12-29 15:40:54.998595+00', ''),
	('00000000-0000-0000-0000-000000000000', 'cfc39b13-9efc-447e-acd5-1acbe25e0bf9', '{"action":"logout","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account"}', '2024-12-29 15:41:09.474071+00', ''),
	('00000000-0000-0000-0000-000000000000', 'cbb6194e-3be1-42b5-baa3-cba52765a388', '{"action":"login","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}', '2024-12-29 15:41:15.29368+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a66b02c8-1667-4b8e-ba16-81673adfeabb', '{"action":"login","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}', '2024-12-29 15:41:53.107051+00', ''),
	('00000000-0000-0000-0000-000000000000', '5fccb938-0498-4de8-a16c-914bea12a9f6', '{"action":"login","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}', '2024-12-29 15:41:57.10545+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e53b2bd9-9af0-4c4c-9646-a89a1724ed4e', '{"action":"login","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}', '2024-12-29 15:42:11.939952+00', ''),
	('00000000-0000-0000-0000-000000000000', '3fea6676-4a14-4a3f-a781-94a6dbc1fb13', '{"action":"login","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}', '2024-12-29 15:42:51.301556+00', ''),
	('00000000-0000-0000-0000-000000000000', '8cb521b7-3833-4d9b-9439-3cc21741006c', '{"action":"login","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}', '2024-12-29 15:43:00.792927+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd7bf50e5-8859-497e-b324-03324e6a611b', '{"action":"login","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account","traits":{"provider_type":"google"}}', '2024-12-29 15:43:01.580531+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd79176c5-2e17-48a8-9fa6-a28ec2205782', '{"action":"logout","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account"}', '2024-12-29 15:52:43.371821+00', ''),
	('00000000-0000-0000-0000-000000000000', '92c174ef-532d-4ba1-9ced-1402d18dfabc', '{"action":"login","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}', '2024-12-29 15:55:44.125746+00', ''),
	('00000000-0000-0000-0000-000000000000', '7d67f170-a34d-4fbf-97b8-e3841c5930ae', '{"action":"login","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account","traits":{"provider_type":"google"}}', '2024-12-29 15:55:45.030487+00', ''),
	('00000000-0000-0000-0000-000000000000', '161118c8-924d-440c-95c8-f796a00cebda', '{"action":"logout","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account"}', '2024-12-29 15:56:04.263326+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ef555408-d158-4848-80d6-2b3e790e4c25', '{"action":"login","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}', '2024-12-29 21:04:38.681724+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c93d76d5-98f6-44fb-9695-8b6d692ba323', '{"action":"login","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"account","traits":{"provider_type":"google"}}', '2024-12-29 21:04:39.292266+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ec0c9513-4aae-43c0-bca2-9fadd9e83ed4', '{"action":"token_refreshed","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"token"}', '2024-12-29 22:04:43.440556+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ca19249d-0e4b-4de3-8742-2bdde40a9325', '{"action":"token_revoked","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"token"}', '2024-12-29 22:04:43.441674+00', ''),
	('00000000-0000-0000-0000-000000000000', '73870556-2553-4d76-94bf-d6af8872cde5', '{"action":"token_refreshed","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"token"}', '2024-12-29 22:04:43.492489+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd76a04a3-c64c-49fc-aefd-dd903191b3c1', '{"action":"token_refreshed","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"token"}', '2024-12-30 17:22:48.931326+00', ''),
	('00000000-0000-0000-0000-000000000000', '5fd9ef30-14bf-46b2-9c8d-0118f2804638', '{"action":"token_revoked","actor_id":"ac64f6d7-b773-4acd-bac0-95516c46f824","actor_name":"Taoufiq Lotfi","actor_username":"admin@taoufiqlotfi.tech","actor_via_sso":false,"log_type":"token"}', '2024-12-30 17:22:48.932542+00', '');


--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."flow_state" ("id", "user_id", "auth_code", "code_challenge_method", "code_challenge", "provider_type", "provider_access_token", "provider_refresh_token", "created_at", "updated_at", "authentication_method", "auth_code_issued_at") VALUES
	('02081191-9de7-42a8-aeca-4671a45abed9', 'f24c0bbb-5431-4773-b6f2-3192eaaf5bf3', 'e538fa70-9e03-43da-9a84-1df323b0a85e', 's256', 'Xd2mIzk8H6hsjHa8qJTN3NWaWc-WOpfOuFFCYdHC-RU', 'email', '', '', '2024-12-11 00:44:09.433654+00', '2024-12-11 00:44:21.680583+00', 'email/signup', '2024-12-11 00:44:21.680494+00'),
	('80f979fc-6532-42e7-8fe0-0c5a51de523a', '3dda6390-53b6-42be-a3f1-3d2de07b3a5d', '1478fed9-513c-4bb2-be7a-85e15bd0f8e7', 's256', 'PHOMlBfegSDFXP3WPOOUHv24cbJpTF6ls0ay2sYzNgU', 'email', '', '', '2024-12-11 00:57:32.154016+00', '2024-12-11 00:57:49.281578+00', 'email/signup', '2024-12-11 00:57:49.281503+00'),
	('084ae746-4364-4636-950c-e2ad353361f3', NULL, 'cf530e14-4cea-4339-a424-98e8e8fe29e2', 's256', 'zQBHOZYVnvnqSoWpgdTgEByR44nLQ2SjReFZSX0T-W8', 'google', '', '', '2024-12-14 03:22:07.577755+00', '2024-12-14 03:22:07.577755+00', 'oauth', NULL),
	('4501f90e-0477-41d6-8202-a5d26035dc55', NULL, '5a6aa394-c29d-4d21-8cd4-a96dedee53b0', 's256', 'Dz_Mky4a_sk1fgxER_czlPDvSKmkEFxxCYrweyH11K0', 'google', '', '', '2024-12-14 03:25:06.180565+00', '2024-12-14 03:25:06.180565+00', 'oauth', NULL),
	('c42861b2-adc2-47d9-bce6-ad9094eb6910', NULL, '360500a1-2ccb-4b1b-9179-3a359b179e0e', 's256', 'Dz_Mky4a_sk1fgxER_czlPDvSKmkEFxxCYrweyH11K0', 'google', '', '', '2024-12-14 03:26:04.450082+00', '2024-12-14 03:26:04.450082+00', 'oauth', NULL),
	('0f95444b-41cd-4b82-9d17-b99625c05314', NULL, '3f878f45-7637-43af-a697-fc85ba6ee70a', 's256', 'M46n9X9pJlAEcC9m0YDhfXZMRG6llJw00Q-5esvzlRk', 'google', '', '', '2024-12-14 03:26:55.931248+00', '2024-12-14 03:26:55.931248+00', 'oauth', NULL),
	('1fbe7d4e-90cf-499b-9e5d-eef0534f530a', NULL, '09867001-b649-4126-b151-3491496c1dd2', 's256', 'AODD6l30avgHwXCSQEse1zDtln4fRGNsz-ZsrMnzgj0', 'google', '', '', '2024-12-14 03:27:53.538597+00', '2024-12-14 03:27:53.538597+00', 'oauth', NULL),
	('9db11cba-0397-4208-a031-0b1649fbb143', NULL, '8da2e645-eeab-4d65-a67c-715869494ce0', 's256', 'vnxCdKtYamZfwns6w3Sz47a_Yyv9rlaEPo2YBN4PP5A', 'google', '', '', '2024-12-14 03:33:05.898805+00', '2024-12-14 03:33:05.898805+00', 'oauth', NULL),
	('bcff2781-aaf6-41bc-869f-da2bac47a4a8', NULL, '1a703686-b7f2-4acb-8887-f949e7c2ac80', 's256', 'lu6mH-7TN8VlG32futZHaCSnf0bpksiJZsF5q2RMJaY', 'google', '', '', '2024-12-14 03:37:05.88429+00', '2024-12-14 03:37:05.88429+00', 'oauth', NULL),
	('c35e51bf-444d-4e14-9c12-ea269da50e6e', NULL, '30b9e58d-8d37-4a11-a3fc-c43ec3c3f332', 's256', 'SogPgHFFF8GWS1wJl7CI6ypvCH0e7em8BHJiCQoWnug', 'google', '', '', '2024-12-14 03:46:02.281933+00', '2024-12-14 03:46:02.281933+00', 'oauth', NULL),
	('4da6f73b-b924-469b-a7df-8a8b7b4b67a9', NULL, 'd36b6a78-77d1-4e30-bd34-64982633471e', 's256', 'OM-0i67PQc7vuOPyN1tfHGxyAT2B_BV-3_hYLhXaKOw', 'google', '', '', '2024-12-14 03:46:17.020837+00', '2024-12-14 03:46:17.020837+00', 'oauth', NULL),
	('0a7e8190-5ad3-47e0-8aa6-b06b71d11583', NULL, 'd9367978-823a-4b9f-9105-01b85495493a', 's256', 'l-TlTUPxmWUZvZ1Or3bGypQFgatqjWbramaJzd948YU', 'google', '', '', '2024-12-14 03:47:50.446859+00', '2024-12-14 03:47:50.446859+00', 'oauth', NULL),
	('de905670-37d0-4cca-a055-73b4026f7844', NULL, '9b0628ac-7d16-4026-b74b-2f86481922c7', 's256', 'Ygq_6AKLg7_Pvr_DiL1q9EQGjSajfEUE5NAXQIDAF8s', 'google', '', '', '2024-12-14 03:48:58.931621+00', '2024-12-14 03:48:58.931621+00', 'oauth', NULL),
	('2abe9f05-22ed-4c7d-bcfe-b5bee848ae07', NULL, '6bcc288a-9b8b-4020-b2b3-6e5953748b2f', 's256', 'jzY_I2wVl_lclumPWyS5YBcXbR_HINza-YYSEraMaPs', 'google', '', '', '2024-12-14 03:54:57.406294+00', '2024-12-14 03:54:57.406294+00', 'oauth', NULL),
	('d559f61f-eb94-437a-b885-5850329751c7', NULL, '269a3247-f7ac-47ee-866c-38fc03d6dda6', 's256', 'LapCbVsaGylhO1YzJlmhlmlvHcXmYteqT6PFqWTNu2c', 'google', '', '', '2024-12-14 03:55:04.996916+00', '2024-12-14 03:55:04.996916+00', 'oauth', NULL),
	('aff2b1dd-b239-4f28-9a9c-0383ba06da08', NULL, '4ea7e31c-76a8-43fd-b25f-407ea5bab471', 's256', 't5gdHMVX_jzXneB7GqbXqSo5QKWX4bauoSeJ3KhIZhM', 'google', '', '', '2024-12-14 03:58:01.682946+00', '2024-12-14 03:58:01.682946+00', 'oauth', NULL),
	('4c039d06-17a2-4beb-b378-f3b23a3f56a7', NULL, '4c36d10f-f04e-4877-82ce-fc714e268fa6', 's256', 'Hf26-a-wmtqlPckGduaxRqGhkb45xX78w0kwinvW4hk', 'google', '', '', '2024-12-14 03:59:43.519203+00', '2024-12-14 03:59:43.519203+00', 'oauth', NULL),
	('682b51d0-4f7a-44b1-9709-0416004cb3bb', NULL, '6f706311-e575-4624-a005-36371b7e8cfd', 's256', 'Ys3Vn2HSyGALfipyy32axt8-OWOk6_fCtlXcNIpjHD8', 'google', '', '', '2024-12-14 04:03:46.226915+00', '2024-12-14 04:03:46.226915+00', 'oauth', NULL),
	('cec1d7c4-c3ab-4088-9f73-4ed4160ee0ef', NULL, '1b707497-e528-4c76-95dd-db193774ad16', 's256', '0ZXMw6Sau95_kgPw3yP8LybvMZdpTfzyzdI55FoTrgA', 'google', '', '', '2024-12-14 04:06:54.136698+00', '2024-12-14 04:06:54.136698+00', 'oauth', NULL),
	('b99f154b-51f5-4154-bc9f-83c7d91ba570', NULL, 'e17fae82-89fe-4851-810d-d738ebb61a5c', 's256', '4qymksjkIxk-2yG-vT0a7wpSxi4Cy33m1pvjiTMBZKA', 'google', '', '', '2024-12-14 04:08:43.44582+00', '2024-12-14 04:08:43.44582+00', 'oauth', NULL),
	('1568f448-16da-4240-9591-965b01015096', NULL, '593b0663-6502-470d-ae7a-227b49879349', 's256', 'G2qpFdNLzquZNJ9VRP4cFGsxvMux9QVZowRPTN6-H0o', 'google', '', '', '2024-12-14 04:20:15.53517+00', '2024-12-14 04:20:15.53517+00', 'oauth', NULL),
	('76b98a9f-484c-4b56-9a85-8ac05b37cfda', NULL, 'eb160813-6fd2-427a-985a-d31cab783975', 's256', 'Qp_o5piDX6LxhKJ3FuRtyh6xYkwzfkxGO1om0Uy62Ls', 'google', '', '', '2024-12-14 04:20:27.83827+00', '2024-12-14 04:20:27.83827+00', 'oauth', NULL),
	('139979f9-74f4-413f-8859-f4de77988227', NULL, '7d6cbf8b-7b44-443d-9e39-f3405934746d', 's256', 'LLTHSe_K9g54MqdCrJg9zXTytTSFdLPGdmT3QunGBrk', 'google', '', '', '2024-12-14 04:22:43.942325+00', '2024-12-14 04:22:43.942325+00', 'oauth', NULL),
	('c790e7c5-261d-45c2-9fd2-1a879e6f62d6', NULL, '03b9a5ba-d7a2-4999-84d4-639b0815472c', 's256', 'eu2IqSATY_PExV9PphyWxDsvJ7j6Pr4tbEUkeyDNT2Q', 'google', '', '', '2024-12-14 04:53:45.812602+00', '2024-12-14 04:53:45.812602+00', 'oauth', NULL),
	('7e79dc4d-12fa-4e7b-8ef7-16242312792c', NULL, 'e25f306c-97fb-43ad-8baf-d830d6519089', 's256', 'HLYV65TOnx6PWe_r9AtharwqwZ6GpizHa59UbEHtPgE', 'google', '', '', '2024-12-14 04:54:22.488186+00', '2024-12-14 04:54:22.488186+00', 'oauth', NULL),
	('e6a1c979-383a-44de-b300-370c8902c3e7', NULL, '3bb42675-281b-4e9c-9c96-f2924c849845', 's256', '5gg8qU4Nrf6sXkfvnz9838wF-40Q6LILgT-WDdRpcWU', 'google', '', '', '2024-12-14 04:57:07.131232+00', '2024-12-14 04:57:07.131232+00', 'oauth', NULL),
	('30c903d6-2876-4270-b1ee-d28a6a712b15', 'fe380a16-536d-4b91-aaf4-249d663aa5f7', '77203353-8e4d-41a5-95fc-575090ba8189', 's256', 'klkpwql7OnlF1j6JB90JUGpYZIju4SssMk45j7b19nU', 'google', 'ya29.a0ARW5m76Q8GBtdmfi2jEELKGtoBx4l-jqKha2RssPKVCZWOG30avbaOIh3XlZvbkKeDmW3VBJ5EJzlUUTLhw0CGJkEylWVG9VkMJ6MR4g0obKUu0DtqlqnHLh6CTGS2okEJ49vKjCQra8VB8VMfnPFVNKkRqOGXb8k7ePQNkeaCgYKAcUSARASFQHGX2MiOS-_9ZUvtqVrqEyk71oMNA0175', '', '2024-12-14 05:07:18.107295+00', '2024-12-14 05:07:22.226814+00', 'oauth', '2024-12-14 05:07:22.226691+00'),
	('22af88b1-5661-46cb-b3ec-fdd819b3b80a', 'fe380a16-536d-4b91-aaf4-249d663aa5f7', 'e0c6f21c-28a4-4b22-a42b-035bb302b9f7', 's256', '4oXHjIdN0PShl3V2NQ3ZmCarTdkftI4mQOjaLAOz8CQ', 'google', 'ya29.a0ARW5m74s59WqeTlOi8kgQAPQYWAMom-jkTZ3WbRCpG8CT3b8Un6PETBVKM33ZAc-C_WEdGmTJIQ64rKUNS1z7XvGEZ2QJw5JrpfkHH-gfaVzmGnuXxSl6lbQA7o4JjxeBRSXEiR6pUVcPyqSp2cDnpzj0PiqaoJZigaCgYKAR4SARASFQHGX2MiT5q84vsQkWng1SdfO5fE2w0169', '', '2024-12-14 05:08:29.598095+00', '2024-12-14 05:08:32.040025+00', 'oauth', '2024-12-14 05:08:32.039928+00'),
	('20eb7fb3-c9fa-46df-a703-78813b746297', 'fe380a16-536d-4b91-aaf4-249d663aa5f7', 'c3ed70c6-7619-4193-a957-21b7a18ff3b5', 's256', 'NYZFd4rsv-xjn4Pow-ojDdAz8xbjQlz98T6JqToMURE', 'google', 'ya29.a0ARW5m74M1V-gs026_smjiEFz31qHwJMi3V0-aHKrMdfTGHY-C1z4x2jgxTIhVqTmxq8mTMpyP5PsSxkb5gTZAMvBwwYiPwaxgcsceM9sj88VygQOSZ9YbzhYXq3vyTXn0qSG-gccWD_LeUdFktLtNqLrRPC98Pnt5waCgYKARYSARASFQHGX2MiQtsJ2sbLzIrmfUN0tNlNAQ0169', '', '2024-12-14 05:09:45.299242+00', '2024-12-14 05:09:47.984364+00', 'oauth', '2024-12-14 05:09:47.984273+00'),
	('6753c3b7-c411-4cf4-8dde-b2855602748e', NULL, '6d2c3ab3-cd83-4455-823c-4bb69ec771fe', 's256', '0WDkn2Zu9_uZF_qCAjjCo7Q89g-JYvhEp6EEbIDq6Jg', 'google', '', '', '2024-12-14 05:12:43.190381+00', '2024-12-14 05:12:43.190381+00', 'oauth', NULL),
	('0a47b534-6ba7-4daa-a631-dd88877975b6', NULL, '7fc588ba-7875-44e8-8e0a-fd723bc89abc', 's256', '8eXU_2YxM3ykZscTEVPZSEsywpn-_QeZL8H8Z1B3W7w', 'google', '', '', '2024-12-14 05:29:39.810561+00', '2024-12-14 05:29:39.810561+00', 'oauth', NULL),
	('736ddf7b-4afa-455a-bd85-2f6e0606c0e2', NULL, '060e3c83-e8e7-484a-9be6-b2cd1ac1085c', 's256', 'DfCszkPeYYRcM7F0nS9n4cm7o8vi9jazvCuqO3tlyBo', 'google', '', '', '2024-12-14 05:29:43.339885+00', '2024-12-14 05:29:43.339885+00', 'oauth', NULL),
	('e0bc36a6-ff2e-4385-8621-496858dcf92d', NULL, '8bf30079-c5c7-4b82-b370-fb18ee1d4ef9', 's256', '_3MNiFzhSxyd2iyw-U4KazFOvvXfZXDjbdiMAjXMtRI', 'google', '', '', '2024-12-14 05:29:46.737887+00', '2024-12-14 05:29:46.737887+00', 'oauth', NULL),
	('b1c1aceb-506a-4c49-8887-9d2d973ba88a', NULL, '5d4bfa3f-79f4-4603-ad6b-94b5190d7750', 's256', 'bp9hHiMG2xe1IOVLPFJ7V5FMiBj4AcNltfoE9BPwaIY', 'google', '', '', '2024-12-14 05:32:40.474033+00', '2024-12-14 05:32:40.474033+00', 'oauth', NULL),
	('1a4234e6-2965-429e-8284-d55adc9edd68', 'ac64f6d7-b773-4acd-bac0-95516c46f824', '40694f14-a39f-4d12-be12-c3cd899512fa', 's256', 'TUyOFkDMm101jx5WVLaq85G_lrfcF12yTbaMgBgY7zQ', 'google', 'ya29.a0ARW5m769PoUL413pWOUJQh3ftMYkkjOjnRnTJW0hoebpfvRjLwhT1L6C7orpTZP_nnW3gajHOllTUk3tlqS4oT2pFNI37J3McRMeK0lIiuf1c43mHOCs3kjxwF8mWBvqDfFzVVi5yxvyvhN-I4hW0UTAopSpEr2DnmsaCgYKAWoSARASFQHGX2Mi-6LfKmaxj-xm1CNmFad3_g0170', '', '2024-12-14 14:47:32.689372+00', '2024-12-14 14:47:34.861285+00', 'oauth', '2024-12-14 14:47:34.861271+00'),
	('b1049ce7-2686-4a22-8cfa-eafdcf4ed014', 'ac64f6d7-b773-4acd-bac0-95516c46f824', 'd20e26fb-0563-42aa-ba06-fc0218119cd9', 's256', 'TT1qFo9t1h3X2RJCt5MruLkqkTlj-lOKv2JuGXMiNKw', 'google', 'ya29.a0ARW5m77w1dCeAcCyUkNXj27wh-yaRBQ4cyZycara64_AdKkexwQXmoqhj4hoGPi5MWJOJ7YQ5kFWjrDmQKczFk9V3KtCPY2zt_NjS0tF0aTWYGIt3U1n1oU-HNSxUPA1pzNduIwBnkgAVaXe3C1vXwS0QWWmofo1-r4aCgYKAUUSARASFQHGX2Mi71pB_OYDYcfHqqwmfpf6dA0170', '', '2024-12-15 09:44:12.438469+00', '2024-12-15 09:44:15.039851+00', 'oauth', '2024-12-15 09:44:15.039754+00'),
	('76598149-f3d7-4d7d-a3b9-a00889b5a26b', 'ac64f6d7-b773-4acd-bac0-95516c46f824', '6ae52988-4a03-4379-8d60-11883fdb0077', 's256', 'QX8OLttuzeys1MpRwS10Ymvap4p9z2Issa-DC3S73po', 'magiclink', '', '', '2024-12-15 10:26:57.903783+00', '2024-12-15 10:27:39.547597+00', 'magiclink', '2024-12-15 10:27:39.547583+00'),
	('f26f68c0-6cfa-426a-a099-39d9e2853ee9', 'ac64f6d7-b773-4acd-bac0-95516c46f824', 'bcc3370c-ce2f-436b-b83e-5eacb63494f7', 's256', 'Igr9NNUEIOuhyzGGOvJ0pkkdc5FcSQFk8o6kO6LT2T0', 'google', 'ya29.a0ARW5m740YEY2SJRpWGHUEfvbjc-rA3Yvjh13KUbqevcgXBvFMHihwbUuWbP5ZzgngueRbQU7obMe0iv75aqwg8hXn9_aHYjlNtguyRQgoAOW_bbK-Hpy3aCxkWDv7nEgyOlqpu9psxNTtxhFClv3VbDKw9lVJ0Xcn3UaCgYKAQcSARASFQHGX2Mi8TZyQSKWd2eF1zM1hZ1zPg0170', '', '2024-12-15 09:47:54.226562+00', '2024-12-15 09:47:56.508024+00', 'oauth', '2024-12-15 09:47:56.507931+00'),
	('e607bc42-1ae1-444a-80ea-b876877a62cb', 'ac64f6d7-b773-4acd-bac0-95516c46f824', 'ff8dae2e-bf73-414b-adc7-a1dcef917173', 's256', 'Kz_BJuowMaR2AIEBu6G8WmtOCvMJYhEm3hL9winUBkA', 'magiclink', '', '', '2024-12-16 02:42:30.044344+00', '2024-12-16 02:42:30.044344+00', 'magiclink', NULL),
	('fa5be4c6-1e7c-4dd3-952b-363080af1ee7', 'ac64f6d7-b773-4acd-bac0-95516c46f824', 'd49a7305-ad02-4091-a4ce-cfe0688ce303', 's256', '-HVNPtl2WW1zmdNDDwH3ds6yU3_rFQYMPxARZsamYYk', 'magiclink', '', '', '2024-12-15 10:29:41.076085+00', '2024-12-15 10:29:41.076085+00', 'magiclink', NULL),
	('aba0effa-5827-4d3e-ac9a-b193b58573b2', 'ac64f6d7-b773-4acd-bac0-95516c46f824', 'c7282692-2618-4914-91ed-3c344302a84a', 's256', 'zOyfeUYIhSe1Pv7_6N_XuV20sET-fh3G01njjD8Czt4', 'magiclink', '', '', '2024-12-15 10:31:39.650587+00', '2024-12-15 10:31:39.650587+00', 'magiclink', NULL),
	('bb514cfe-bda0-42ba-9b10-ba6960127c17', 'ac64f6d7-b773-4acd-bac0-95516c46f824', '98921a1f-ff86-43b4-8ee6-9d516551216a', 's256', 'Nn0ezOeiVbOcsJe4Z-IYDbZhkvKHOvKk-nKO5PHfMKo', 'magiclink', '', '', '2024-12-15 10:33:50.311135+00', '2024-12-15 10:33:50.311135+00', 'magiclink', NULL),
	('c112dc1b-7cc3-475b-b6f5-288b1020d1d7', 'ac64f6d7-b773-4acd-bac0-95516c46f824', 'a6ebf153-37ba-4247-9148-99c2dcf9c282', 's256', 'hx_OAQE9T8ajt4jSEk3eZP9BxPD2xk4lRaqYBJ-5WpE', 'google', 'ya29.a0ARW5m76RGojph1bumyDy6d6HStWn_GCCXRTijExk1TjH3SEltpMVUIEzKuWCPLMBgLQMzEZfyjbONNw058W88VSZ_n8AGpbP1GL1Er_xth1KobiqwQxhdIIrk7sruU9H0EJP441KzuSJqlzFka9y9pd9Kr0YEWapWt4aCgYKAYYSARASFQHGX2MivGBUpp7IrGh_zU8jGUfJIw0170', '', '2024-12-29 15:41:52.709279+00', '2024-12-29 15:41:53.107367+00', 'oauth', '2024-12-29 15:41:53.107336+00'),
	('55a0ace1-1f95-4448-bd3f-cc139b957784', 'ac64f6d7-b773-4acd-bac0-95516c46f824', '787f293f-1934-4e84-bd71-6ae08874320e', 's256', 'SzTSyBkdO1qfrc2Xb2KT6kaOrsYiIZRB3dnVj8R7CXc', 'magiclink', '', '', '2024-12-15 10:39:54.557945+00', '2024-12-15 10:39:54.557945+00', 'magiclink', NULL),
	('0f01cd8e-dd64-4d41-a1f5-1799c4793b86', 'ac64f6d7-b773-4acd-bac0-95516c46f824', 'a9eb5855-0ec9-4adc-b294-6a9573afa6ea', 's256', 'ZaKG_L3tiHPhEw3h9o2G7S3UMld7AvsM_Xbi1QtWPGk', 'magiclink', '', '', '2024-12-28 13:11:59.779234+00', '2024-12-28 13:12:09.37835+00', 'magiclink', '2024-12-28 13:12:09.378277+00'),
	('5862217d-fd06-4161-a9f8-d4dadc3d090c', '4cd083ed-d029-4481-843b-1736c9b7b979', '9bd02cdc-deff-4bc0-b24f-a142f304010d', 's256', 'yeK_TkSv81Jygjxwf2xE8jF8k1loV8pvgSYbn5MUnJQ', 'email', '', '', '2024-12-29 14:52:57.90356+00', '2024-12-29 14:52:57.90356+00', 'email/signup', NULL),
	('80faef16-e166-4e9f-9ac5-cf152224d909', 'ac64f6d7-b773-4acd-bac0-95516c46f824', 'faf3289c-58a2-4ace-8b79-3006f43a9b7a', 's256', 'duv8bcXsSjS9H--2omWC3qF2HaE9-U_tEbQFQyZCXro', 'magiclink', '', '', '2024-12-28 13:40:00.31683+00', '2024-12-28 13:40:00.31683+00', 'magiclink', NULL),
	('28e8f4d3-22a4-4f8d-8b6c-e24d23dad5eb', 'ac64f6d7-b773-4acd-bac0-95516c46f824', 'f07b028a-183e-4a71-ac5c-e379227218c8', 's256', 'Oqow2pgz2j8PhfbQgL1JC1Etp5kWrXuq1kkV8F5RJU4', 'magiclink', '', '', '2024-12-28 20:15:50.419985+00', '2024-12-28 20:15:50.419985+00', 'magiclink', NULL),
	('ea6985aa-4832-412c-a977-c9c7eaebdc97', 'b2776436-115b-41b6-b8cb-ff6ff6b5adf5', '3e5c94a9-5337-401c-b8af-c401180b1827', 's256', 'bMvk0_wWs0JobTJ6CleZiEdwuOmyvCpAEH77O5FPqBg', 'email', '', '', '2024-12-29 12:38:54.090457+00', '2024-12-29 12:40:31.550097+00', 'email/signup', '2024-12-29 12:40:31.550007+00'),
	('70e34581-e1c3-4588-86ca-1e5d08cf54e9', 'b2776436-115b-41b6-b8cb-ff6ff6b5adf5', '868e27ca-b671-4ce0-bfbb-67cab3e01626', 's256', 'TTy3vPbUKMZsnuK_EOYLzS3qVNC7I96GpP_lUC3HTss', 'magiclink', '', '', '2024-12-29 12:41:14.474931+00', '2024-12-29 12:41:14.474931+00', 'magiclink', NULL),
	('370cf4ba-98e8-4e5e-9f05-5b3c21cb054c', 'b2776436-115b-41b6-b8cb-ff6ff6b5adf5', '60bbbd65-93eb-44e8-9ec1-83ff38323ead', 's256', 'mdGywfd0sdfCeaMJyH8Dm1uEJkSJWxIcyKs2vw0wjq0', 'magiclink', '', '', '2024-12-29 12:41:24.281281+00', '2024-12-29 12:41:24.281281+00', 'magiclink', NULL),
	('7278bc5a-437a-4a2f-957c-cb81839107c2', 'ac64f6d7-b773-4acd-bac0-95516c46f824', '4e9534ce-b82b-476e-923f-0a518b3dc012', 's256', 'wGz1JVYKksvCE_DF437x9Wy22AGPAxGZW1pMGR-T2qE', 'magiclink', '', '', '2024-12-29 14:25:11.205518+00', '2024-12-29 14:25:35.471262+00', 'magiclink', '2024-12-29 14:25:35.471164+00'),
	('122625f7-eda5-4826-bc35-b32291204b30', 'ac64f6d7-b773-4acd-bac0-95516c46f824', '863c8b75-e9e0-43c9-88aa-60732adf2dfb', 's256', 'XzrseCXS__YSgSqpeyK8I0r0RwmXa2Jm07VfxPBa2sA', 'magiclink', '', '', '2024-12-29 14:27:51.209987+00', '2024-12-29 14:27:58.788761+00', 'magiclink', '2024-12-29 14:27:58.788689+00'),
	('1f513d2d-191d-4b20-8e11-7c4674a60d18', 'ac64f6d7-b773-4acd-bac0-95516c46f824', 'd5cde350-9fd9-41db-9ba0-3da7c705d9e6', 's256', '1u1joP5x8M4G_jdPesebreG4a3Pts3p0YpDZ5fjrO2M', 'magiclink', '', '', '2024-12-29 14:32:29.793061+00', '2024-12-29 14:32:29.793061+00', 'magiclink', NULL),
	('7c8b64e4-ca88-41d9-b4d4-5d6f180cb79b', 'ac64f6d7-b773-4acd-bac0-95516c46f824', 'abc678bb-2801-4f5d-84f2-933fd6f899bd', 's256', 'XYRBb2nUm7JxR65uubJq-mFlGAaxdPIb-Anb3KgQrtQ', 'magiclink', '', '', '2024-12-29 14:34:33.917437+00', '2024-12-29 14:34:33.917437+00', 'magiclink', NULL),
	('918c1180-268b-419f-8118-4f335e859b08', '9dab1390-b740-42e9-bfb9-20a2ce6d796d', '2e2ac933-3f1d-4447-bac8-c779310d9c05', 's256', '_A6NNi2cbspGyAxJEiSvRPcdYAo3N89ukAXJllPkvOY', 'email', '', '', '2024-12-29 14:48:16.0657+00', '2024-12-29 14:48:16.0657+00', 'email/signup', NULL),
	('d29ea61f-5551-42c0-9afc-65dcf9a8b0c6', 'ac64f6d7-b773-4acd-bac0-95516c46f824', '0a115a97-3e48-4186-a200-816ac857f6c3', 's256', 'QE4nky-EsXW-Qpos8UdX5Mp7Gh1TmLm02vANT7h29-k', 'google', 'ya29.a0ARW5m765yxlDNinp3rXgQV6xAkv9CVN1sfZfoLvrP_KoDC85R2JY78zd0CRtrmq_7z1vTl-918uJE5te4Fva8wwSCj9Z39M3Tk3ia9iIvIi1m4BI9LlC1h7g97wcpPjpwir26r4d3vJPOZ6QA0uN-W4aCvce780YY-AaCgYKARYSARASFQHGX2MiBjr0en1RYKfWheUV-Z8NzQ0170', '', '2024-12-29 15:41:14.883146+00', '2024-12-29 15:41:15.294556+00', 'oauth', '2024-12-29 15:41:15.294473+00'),
	('66c11af8-f26c-42dc-975f-44ec692646e5', 'ac64f6d7-b773-4acd-bac0-95516c46f824', '4bc0c371-9d5e-4806-92b2-a2135b798a8c', 's256', 'HFG1DluS0qv6t0qfDSqHyGcYPNwSvwV26U1PA9KEJA4', 'google', 'ya29.a0ARW5m77s26H2Uz_M4ZbT7gCxnEktj5x38gpITfK2RxluSvW-p4_U4i-9IB9GwbjYcR4U8VtEZXw-JoUCpMDFZ3nq5_3lSeUmh8lFDhikYbzixEZwJ7hzzGHYje9kH6nSN1Kd_PTEGiRJcts1hGkjVclZ_e2_lWCtNfoaCgYKAdYSARASFQHGX2MiIPI06YCFrGO48rjFztuoPg0170', '', '2024-12-29 15:41:56.716781+00', '2024-12-29 15:41:57.105675+00', 'oauth', '2024-12-29 15:41:57.105654+00'),
	('cdb393d5-8cb1-4af9-8787-df761ba0796d', 'ac64f6d7-b773-4acd-bac0-95516c46f824', 'c2f85b0d-30b3-4b7d-a3ee-4500c740470e', 's256', 'BZHM9p-AlY8ktx7ENybyzOScTHz7x4XCWp1ZlLtprXM', 'google', 'ya29.a0ARW5m75N81Z8TA6_r3BrHjtshGdr-T7bCiMAWmPeh0x9nBuVgqQJOogo46SRmky4O4II4hBD1DHRBso1p4h3b_k8pFyf1MxhVa35WUCU5MHuGrIxiZzC-OxMaYdSW6E64hg-kXmyt42VrtHWwOaQGByaseZ5sLPwyGgaCgYKAQ4SARASFQHGX2MiXK5V2ihfMukkRM_lM1uEAw0170', '', '2024-12-29 15:42:11.531212+00', '2024-12-29 15:42:11.941305+00', 'oauth', '2024-12-29 15:42:11.941209+00'),
	('2a513a67-3294-4882-9bbf-8278902a1a64', 'ac64f6d7-b773-4acd-bac0-95516c46f824', '44738807-6aad-414d-a8b1-65974d7fc020', 's256', 'IKbT9BHD6ucnIBAg-Jotuk0-oG4rcf7OeGUYiidQN-o', 'google', 'ya29.a0ARW5m77-xUSrKxd3Xk4-jO-0FdlRwIjxfxI5dEeQhrO9B6LEgIG9qT8RLUYl2qxtwo8RaW-IQ5PntBxWttg8y7Q4yOJ9hrTNjYVzHdY1BrNuHR1JCNf6xe3q0bUmE7Usq3eEfcQkOEOkY5rpjiCWbl6W_8c6AM-4k2AaCgYKAckSARASFQHGX2MiyFdN4TzczJqb2Oe-M5u8nA0170', '', '2024-12-29 15:42:50.90822+00', '2024-12-29 15:42:51.301761+00', 'oauth', '2024-12-29 15:42:51.301742+00');


--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."users" ("instance_id", "id", "aud", "role", "email", "encrypted_password", "email_confirmed_at", "invited_at", "confirmation_token", "confirmation_sent_at", "recovery_token", "recovery_sent_at", "email_change_token_new", "email_change", "email_change_sent_at", "last_sign_in_at", "raw_app_meta_data", "raw_user_meta_data", "is_super_admin", "created_at", "updated_at", "phone", "phone_confirmed_at", "phone_change", "phone_change_token", "phone_change_sent_at", "email_change_token_current", "email_change_confirm_status", "banned_until", "reauthentication_token", "reauthentication_sent_at", "is_sso_user", "deleted_at", "is_anonymous") VALUES
	('00000000-0000-0000-0000-000000000000', 'ac64f6d7-b773-4acd-bac0-95516c46f824', 'authenticated', 'authenticated', 'admin@taoufiqlotfi.tech', NULL, '2024-12-14 14:46:29.11926+00', NULL, '', NULL, '', '2024-12-29 14:50:29.182698+00', '', '', NULL, '2024-12-29 21:04:39.293267+00', '{"provider": "google", "providers": ["google"]}', '{"iss": "https://accounts.google.com", "sub": "103621411448768729852", "name": "Taoufiq Lotfi", "email": "admin@taoufiqlotfi.tech", "full_name": "Taoufiq Lotfi", "provider_id": "103621411448768729852", "custom_claims": {"hd": "taoufiqlotfi.tech"}, "email_verified": true, "phone_verified": false}', NULL, '2024-12-14 14:46:29.10357+00', '2024-12-30 17:22:48.935815+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false),
	('00000000-0000-0000-0000-000000000000', '4cd083ed-d029-4481-843b-1736c9b7b979', 'authenticated', 'authenticated', 'leh.lotfi@gmail.com', '$2a$10$szsfUY38IIDCcGsBTHAweeLEWIFlhnIYrkcLqY7Sv08ygYglttcm.', '2024-12-29 14:53:10.273302+00', NULL, '', '2024-12-29 14:52:57.903706+00', '', NULL, '', '', NULL, '2024-12-29 14:53:10.278416+00', '{"provider": "email", "providers": ["email"]}', '{"sub": "4cd083ed-d029-4481-843b-1736c9b7b979", "name": "Taoufiq Lotfi", "email": "leh.lotfi@gmail.com", "lastName": "Lotfi", "firstName": "Taoufiq", "email_verified": false, "phone_verified": false}', NULL, '2024-12-29 14:52:57.901752+00', '2024-12-29 14:53:10.281155+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false);


--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."identities" ("provider_id", "user_id", "identity_data", "provider", "last_sign_in_at", "created_at", "updated_at", "id") VALUES
	('4cd083ed-d029-4481-843b-1736c9b7b979', '4cd083ed-d029-4481-843b-1736c9b7b979', '{"sub": "4cd083ed-d029-4481-843b-1736c9b7b979", "name": "Taoufiq Lotfi", "email": "leh.lotfi@gmail.com", "lastName": "Lotfi", "firstName": "Taoufiq", "email_verified": false, "phone_verified": false}', 'email', '2024-12-29 14:52:57.902751+00', '2024-12-29 14:52:57.902772+00', '2024-12-29 14:52:57.902772+00', 'a27aee26-7f32-461a-9cd0-9b2a5ec8f72f'),
	('103621411448768729852', 'ac64f6d7-b773-4acd-bac0-95516c46f824', '{"iss": "https://accounts.google.com", "sub": "103621411448768729852", "name": "Taoufiq Lotfi", "email": "admin@taoufiqlotfi.tech", "full_name": "Taoufiq Lotfi", "provider_id": "103621411448768729852", "custom_claims": {"hd": "taoufiqlotfi.tech"}, "email_verified": true, "phone_verified": false}', 'google', '2024-12-14 14:46:29.109842+00', '2024-12-14 14:46:29.109984+00', '2024-12-29 21:04:38.67825+00', 'b4cd1e60-2031-434a-b1d9-e65a30ade7fc');


--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."sessions" ("id", "user_id", "created_at", "updated_at", "factor_id", "aal", "not_after", "refreshed_at", "user_agent", "ip", "tag") VALUES
	('328772b3-e856-4ea0-ac35-badd30c1baab', 'ac64f6d7-b773-4acd-bac0-95516c46f824', '2024-12-29 21:04:39.293448+00', '2024-12-30 17:22:48.937494+00', NULL, 'aal1', NULL, '2024-12-30 17:22:48.937325', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', '89.149.89.171', NULL);


--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."mfa_amr_claims" ("session_id", "created_at", "updated_at", "authentication_method", "id") VALUES
	('328772b3-e856-4ea0-ac35-badd30c1baab', '2024-12-29 21:04:39.296556+00', '2024-12-29 21:04:39.296556+00', 'oauth', 'dbd4c2ec-db31-4837-97cf-c3977b945853');


--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."refresh_tokens" ("instance_id", "id", "token", "user_id", "revoked", "created_at", "updated_at", "parent", "session_id") VALUES
	('00000000-0000-0000-0000-000000000000', 69, 'RgDpQjT5_lo4eoXUBmcqDw', 'ac64f6d7-b773-4acd-bac0-95516c46f824', true, '2024-12-29 21:04:39.294711+00', '2024-12-29 22:04:43.442535+00', NULL, '328772b3-e856-4ea0-ac35-badd30c1baab'),
	('00000000-0000-0000-0000-000000000000', 70, 'PHSsPufZy0SOhfvRmTM2cw', 'ac64f6d7-b773-4acd-bac0-95516c46f824', true, '2024-12-29 22:04:43.443601+00', '2024-12-30 17:22:48.93339+00', 'RgDpQjT5_lo4eoXUBmcqDw', '328772b3-e856-4ea0-ac35-badd30c1baab'),
	('00000000-0000-0000-0000-000000000000', 71, '0VjGpLa6ldu8dOzi4okHKw', 'ac64f6d7-b773-4acd-bac0-95516c46f824', false, '2024-12-30 17:22:48.934145+00', '2024-12-30 17:22:48.934145+00', 'PHSsPufZy0SOhfvRmTM2cw', '328772b3-e856-4ea0-ac35-badd30c1baab');


--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: key; Type: TABLE DATA; Schema: pgsodium; Owner: supabase_admin
--



--
-- Data for Name: test table; Type: TABLE DATA; Schema: public; Owner: supabase_admin
--

INSERT INTO "public"."test table" ("id", "created_at", "value", "user_id", "related user") VALUES
	(1, '2025-01-01 21:53:01.895306+00', 'test', NULL, NULL);


--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

INSERT INTO "storage"."buckets" ("id", "name", "owner", "created_at", "updated_at", "public", "avif_autodetection", "file_size_limit", "allowed_mime_types", "owner_id") VALUES
	('files', 'files', NULL, '2024-12-11 01:25:48.393091+00', '2024-12-11 01:25:48.393091+00', false, false, NULL, NULL, NULL);


--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

INSERT INTO "storage"."objects" ("id", "bucket_id", "name", "owner", "created_at", "updated_at", "last_accessed_at", "metadata", "version", "owner_id", "user_metadata") VALUES
	('f4b889bc-afeb-49be-849a-647b07636434', 'files', 'mermaid-diagram-2024-11-29-164231.png', NULL, '2024-12-11 01:27:07.587571+00', '2024-12-11 01:27:07.587571+00', '2024-12-11 01:27:07.587571+00', '{"eTag": "\"aa022ba3fa75a8d5f8439190bfc390c3-1\"", "size": 105114, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2024-12-11T01:27:07.000Z", "contentLength": 105114, "httpStatusCode": 200}', '6cc34b43-c369-4f37-ad4d-4fd9b3480900', NULL, NULL);


--
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: hooks; Type: TABLE DATA; Schema: supabase_functions; Owner: supabase_functions_admin
--



--
-- Data for Name: secrets; Type: TABLE DATA; Schema: vault; Owner: supabase_admin
--



--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('"auth"."refresh_tokens_id_seq"', 71, true);


--
-- Name: key_key_id_seq; Type: SEQUENCE SET; Schema: pgsodium; Owner: supabase_admin
--

SELECT pg_catalog.setval('"pgsodium"."key_key_id_seq"', 1, false);


--
-- Name: test table_id_seq; Type: SEQUENCE SET; Schema: public; Owner: supabase_admin
--

SELECT pg_catalog.setval('"public"."test table_id_seq"', 1, true);


--
-- Name: hooks_id_seq; Type: SEQUENCE SET; Schema: supabase_functions; Owner: supabase_functions_admin
--

SELECT pg_catalog.setval('"supabase_functions"."hooks_id_seq"', 1, false);


--
-- PostgreSQL database dump complete
--

RESET ALL;

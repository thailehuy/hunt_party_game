
COPY attribute_types (id, name, description, created_at, updated_at, base_value) FROM stdin;
1	Power	Your ability to inflict damage to enemies.	2017-06-21 03:08:36.659581	2017-06-21 03:08:36.659581	0
2	Health	Your ability to sustain damage. If health reach 0, your characters will be incapacitated and need to be resuscitated before joining battles again	2017-06-21 03:09:52.492285	2017-06-21 03:09:52.492285	0
3	Defense	Your ability to reduce damage taken	2017-06-21 03:11:05.248833	2017-06-21 03:11:05.248833	0
4	Pierce	Your ability to penetrate enemies' defenses	2017-06-21 03:11:27.435752	2017-06-21 03:11:27.435752	0
5	Taunt	Your ability to attract enemies and shielding for your party. This is unique to knights	2017-06-21 03:40:45.489733	2017-06-21 03:40:45.489733	0
6	Dodge	Ability to avoid damage. This is unique to rangers	2017-06-21 03:45:37.51338	2017-06-21 03:45:37.51338	0
7	Power Charge	Great power requires preparation. This is unique to wizards, making them only able to attack once every 5 turns	2017-06-21 03:46:22.638624	2017-06-21 03:46:22.638624	0
8	Recovery	The ability to use potions to cure allies. This is unique to alchemists	2017-06-21 03:46:57.710958	2017-06-21 03:46:57.710958	0
\.


--
-- Name: attribute_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: huythai
--

SELECT pg_catalog.setval('attribute_types_id_seq', 8, true);


--
-- Data for Name: character_attributes; Type: TABLE DATA; Schema: public; Owner: huythai
--

COPY character_attributes (id, character_id, attribute_type_id, value, created_at, updated_at) FROM stdin;
\.


--
-- Name: character_attributes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: huythai
--

SELECT pg_catalog.setval('character_attributes_id_seq', 1, false);


--
-- Data for Name: character_classes; Type: TABLE DATA; Schema: public; Owner: huythai
--

COPY character_classes (id, name, description, created_at, updated_at) FROM stdin;
2	Ranger	Veterans of using ranged weapon to inflict damage	2017-06-21 03:13:01.166018	2017-06-21 03:13:01.166018
3	Wizard	Wielders of magic that can cause the most destructive force	2017-06-21 03:13:20.786405	2017-06-21 03:13:20.786405
4	Alchemist	Potion masters that can support comrades in battle	2017-06-21 03:13:44.320271	2017-06-21 03:13:44.320271
1	Knight	Armored vanguards that will shield comrades on front line	2017-06-21 03:12:37.426513	2017-06-21 03:13:53.967165
\.


--
-- Name: character_classes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: huythai
--

SELECT pg_catalog.setval('character_classes_id_seq', 4, true);


--
-- Data for Name: character_slots; Type: TABLE DATA; Schema: public; Owner: huythai
--

COPY character_slots (id, character_id, slot_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: character_slots_id_seq; Type: SEQUENCE SET; Schema: public; Owner: huythai
--

SELECT pg_catalog.setval('character_slots_id_seq', 1, false);


--
-- Data for Name: character_traits; Type: TABLE DATA; Schema: public; Owner: huythai
--

COPY character_traits (id, character_id, trait_id, created_at, updated_at) FROM stdin;
92	7	17	2017-06-22 02:58:33.61696	2017-06-22 02:58:33.61696
93	7	23	2017-06-22 02:58:33.622767	2017-06-22 02:58:33.622767
94	7	24	2017-06-22 02:58:33.634335	2017-06-22 02:58:33.634335
95	7	25	2017-06-22 02:58:33.640999	2017-06-22 02:58:33.640999
96	7	26	2017-06-22 02:58:33.648388	2017-06-22 02:58:33.648388
97	7	27	2017-06-22 02:58:33.652418	2017-06-22 02:58:33.652418
98	7	5	2017-06-22 02:58:33.661073	2017-06-22 02:58:33.661073
99	7	8	2017-06-22 02:58:33.667242	2017-06-22 02:58:33.667242
100	8	16	2017-06-22 02:58:33.695899	2017-06-22 02:58:33.695899
101	8	28	2017-06-22 02:58:33.700342	2017-06-22 02:58:33.700342
102	8	29	2017-06-22 02:58:33.704687	2017-06-22 02:58:33.704687
103	8	34	2017-06-22 02:58:33.708768	2017-06-22 02:58:33.708768
104	8	11	2017-06-22 02:58:33.715899	2017-06-22 02:58:33.715899
105	8	9	2017-06-22 02:58:33.722349	2017-06-22 02:58:33.722349
106	9	15	2017-06-22 02:58:33.753134	2017-06-22 02:58:33.753134
107	9	30	2017-06-22 02:58:33.7642	2017-06-22 02:58:33.7642
108	9	31	2017-06-22 02:58:33.769925	2017-06-22 02:58:33.769925
109	9	32	2017-06-22 02:58:33.780554	2017-06-22 02:58:33.780554
110	9	33	2017-06-22 02:58:33.786891	2017-06-22 02:58:33.786891
111	9	14	2017-06-22 02:58:33.79488	2017-06-22 02:58:33.79488
112	9	13	2017-06-22 02:58:33.800467	2017-06-22 02:58:33.800467
113	10	18	2017-06-22 02:58:33.836806	2017-06-22 02:58:33.836806
114	10	19	2017-06-22 02:58:33.847035	2017-06-22 02:58:33.847035
115	10	20	2017-06-22 02:58:33.852578	2017-06-22 02:58:33.852578
116	10	21	2017-06-22 02:58:33.857857	2017-06-22 02:58:33.857857
117	10	22	2017-06-22 02:58:33.865284	2017-06-22 02:58:33.865284
118	10	2	2017-06-22 02:58:33.873418	2017-06-22 02:58:33.873418
119	10	3	2017-06-22 02:58:33.88192	2017-06-22 02:58:33.88192
\.


--
-- Name: character_traits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: huythai
--

SELECT pg_catalog.setval('character_traits_id_seq', 119, true);


--
-- Data for Name: characters; Type: TABLE DATA; Schema: public; Owner: huythai
--

COPY characters (id, character_class_id, name, party_id, created_at, updated_at) FROM stdin;
7	2	Lynwood Dagnone	4	2017-06-22 02:58:33.583542	2017-06-22 02:58:33.583542
8	3	Catrice Emlin	4	2017-06-22 02:58:33.68345	2017-06-22 02:58:33.68345
9	4	Shon Falcione	4	2017-06-22 02:58:33.743138	2017-06-22 02:58:33.743138
10	1	Chasidy Chuh	4	2017-06-22 02:58:33.825927	2017-06-22 02:58:33.825927
\.


--
-- Name: characters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: huythai
--

SELECT pg_catalog.setval('characters_id_seq', 10, true);


--
-- Data for Name: item_attributes; Type: TABLE DATA; Schema: public; Owner: huythai
--

COPY item_attributes (id, item_type_id, attribute_id, value, created_at, updated_at) FROM stdin;
\.


--
-- Name: item_attributes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: huythai
--

SELECT pg_catalog.setval('item_attributes_id_seq', 1, false);


--
-- Data for Name: item_types; Type: TABLE DATA; Schema: public; Owner: huythai
--

COPY item_types (id, name, slot_id, rarity_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: item_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: huythai
--

SELECT pg_catalog.setval('item_types_id_seq', 1, false);


--
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: huythai
--

COPY items (id, character_id, party_id, character_slot_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: huythai
--

SELECT pg_catalog.setval('items_id_seq', 1, false);


--
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: huythai
--

COPY locations (id, name, description, created_at, updated_at) FROM stdin;
1	Beginner Zone	The first ever zone	2017-06-21 03:14:24.347069	2017-06-21 03:14:24.347069
\.


--
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: huythai
--

SELECT pg_catalog.setval('locations_id_seq', 1, true);


--
-- Data for Name: monster_attributes; Type: TABLE DATA; Schema: public; Owner: huythai
--

COPY monster_attributes (id, monster_id, attribute_type_id, value, created_at, updated_at) FROM stdin;
1	1	2	30	2017-06-21 04:07:21.062506	2017-06-21 04:07:21.062506
2	1	1	3	2017-06-21 04:07:42.712106	2017-06-21 04:07:42.712106
\.


--
-- Name: monster_attributes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: huythai
--

SELECT pg_catalog.setval('monster_attributes_id_seq', 2, true);


--
-- Data for Name: monster_classes; Type: TABLE DATA; Schema: public; Owner: huythai
--

COPY monster_classes (id, name, created_at, updated_at, description) FROM stdin;
1	Undead	2017-06-21 03:55:29.589679	2017-06-21 03:59:13.646669	Raised by dark magic, Undeads swarm the waste land with their endless force
2	Demon	2017-06-21 03:59:49.180206	2017-06-21 03:59:49.180206	These hellspawns are summoned through the dark portal. Demon beings possess high intelligence and power
3	Beast	2017-06-21 04:00:37.26851	2017-06-21 04:00:37.26851	Angered by the expansion of human society into their territories, beasts are always on the hunt
4	Human	2017-06-21 04:01:01.240998	2017-06-21 04:01:01.240998	The worst monsters are usually human themseleves
\.


--
-- Name: monster_classes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: huythai
--

SELECT pg_catalog.setval('monster_classes_id_seq', 4, true);


--
-- Data for Name: monster_loots; Type: TABLE DATA; Schema: public; Owner: huythai
--

COPY monster_loots (id, monster_id, item_type_id, value, loot_chance, created_at, updated_at) FROM stdin;
\.


--
-- Name: monster_loots_id_seq; Type: SEQUENCE SET; Schema: public; Owner: huythai
--

SELECT pg_catalog.setval('monster_loots_id_seq', 1, false);


--
-- Data for Name: monsters; Type: TABLE DATA; Schema: public; Owner: huythai
--

COPY monsters (id, location_id, monster_class_id, name, created_at, updated_at) FROM stdin;
1	1	3	White Wolf	2017-06-21 04:02:13.62362	2017-06-21 04:02:13.62362
2	1	3	Dire Wolf	2017-06-21 04:02:24.208126	2017-06-21 04:02:24.208126
3	1	3	Dire Boar	2017-06-21 04:02:33.909124	2017-06-21 04:02:33.909124
4	1	3	Dire Bear	2017-06-21 04:02:42.382549	2017-06-21 04:02:42.382549
5	1	4	Bandit	2017-06-21 04:02:53.982098	2017-06-21 04:02:53.982098
6	1	4	Rogue	2017-06-21 04:03:21.338934	2017-06-21 04:03:21.338934
\.


--
-- Name: monsters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: huythai
--

SELECT pg_catalog.setval('monsters_id_seq', 6, true);


--
-- Data for Name: parties; Type: TABLE DATA; Schema: public; Owner: huythai
--

COPY parties (id, player_id, hunt_energy, bounty_energy, location_id, experience, level, created_at, updated_at) FROM stdin;
4	1	20	0	1	0	1	2017-06-22 02:58:33.549846	2017-06-22 02:58:33.549846
\.


--
-- Name: parties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: huythai
--

SELECT pg_catalog.setval('parties_id_seq', 4, true);


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: huythai
--

COPY players (id, name, slug, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, confirmation_token, confirmed_at, confirmation_sent_at, unconfirmed_email) FROM stdin;
1			player@test.com	$2a$11$gjCu1fQq8Fo6nTDp.ab6du3ZjEoMqbdNIUm488Rr7EF1R4mpxjhaC	\N	\N	\N	0	\N	\N	\N	\N	2017-06-22 02:50:36.257825	2017-06-22 02:50:36.257825	PGnfa1U2FymnfrDq7-Vw	\N	2017-06-22 02:50:36.260036	\N
\.


--
-- Name: players_id_seq; Type: SEQUENCE SET; Schema: public; Owner: huythai
--

SELECT pg_catalog.setval('players_id_seq', 1, true);


--
-- Data for Name: rarities; Type: TABLE DATA; Schema: public; Owner: huythai
--

COPY rarities (id, name, created_at, updated_at) FROM stdin;
\.


--
-- Name: rarities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: huythai
--

SELECT pg_catalog.setval('rarities_id_seq', 1, false);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: huythai
--

COPY schema_migrations (version) FROM stdin;
20170620040754
20170620041347
20170620041650
20170620041745
20170620041838
20170620042047
20170620042150
20170620042310
20170620042520
20170620043914
20170620080702
20170620080814
20170620080915
20170620082217
20170620082541
20170620082627
20170620082721
20170620082828
20170620083019
20170620083046
20170621035601
20170621040519
20170621041720
20170621042133
20170621075044
\.


--
-- Data for Name: slots; Type: TABLE DATA; Schema: public; Owner: huythai
--

COPY slots (id, name, created_at, updated_at) FROM stdin;
\.


--
-- Name: slots_id_seq; Type: SEQUENCE SET; Schema: public; Owner: huythai
--

SELECT pg_catalog.setval('slots_id_seq', 1, false);


--
-- Data for Name: traits; Type: TABLE DATA; Schema: public; Owner: huythai
--

COPY traits (id, character_class_id, name, description, attribute_type_id, value, created_at, updated_at, exclusive) FROM stdin;
1	1	Military Training	Knights have their body toughen with intense training in the army	2	2	2017-06-21 03:18:36.583679	2017-06-21 03:18:36.583679	f
2	1	Shield Training	Knights training that provides better shield handling, resulting in better defense	3	1	2017-06-21 03:19:43.699837	2017-06-21 03:19:43.699837	f
3	1	Sword Training	Knight training that provides better sword handling, resulting in more damage dealt	1	1	2017-06-21 03:20:35.771198	2017-06-21 03:20:35.771198	f
4	1	Spear Training	Knights training that provides better power thrusts that can penetrate enemies defense	4	1	2017-06-21 03:22:42.103728	2017-06-21 03:22:42.103728	f
5	2	Sharpshooting	Pinpoint marksmanship allows ranger to hit with high accuracy, dealing the most damage possible	1	2	2017-06-21 03:24:51.538286	2017-06-21 03:24:51.538286	f
6	2	Outdoorsman	Seasoned rangers have their constitution trained by the wild, resulting in better health	2	1	2017-06-21 03:26:56.105717	2017-06-21 03:26:56.105717	f
7	2	Hawkeye	On top of pinpoint marksmanship, rangers can aim at critical spots on enemies armor to maximize damage output	4	2	2017-06-21 03:27:57.917442	2017-06-21 03:27:57.917442	f
8	2	Melee Training	Any ranger veteran knows that he need to be able to handle close combat as well	3	1	2017-06-21 03:29:10.354318	2017-06-21 03:29:10.354318	f
9	3	Protective Sphere	In order to compensate the weak defense, some wizards use protective spells to shield themselves	3	1	2017-06-21 03:30:11.822309	2017-06-21 03:30:11.822309	f
10	3	Reckless Power	Because offense is the best defense	1	5	2017-06-21 03:30:55.210448	2017-06-21 03:30:55.210448	f
11	3	Physical Training	A healthy mind can only dwell in a healthy body	2	2	2017-06-21 03:31:30.948445	2017-06-21 03:31:30.948445	f
12	4	Physique Booster	Alchemists can boost their health with master physique potion	2	3	2017-06-21 03:38:50.045743	2017-06-21 03:38:50.045743	f
13	4	Power Booster	Alchemists can boost their power with energizing potion	1	3	2017-06-21 03:39:26.236034	2017-06-21 03:39:26.236034	f
14	4	Stoneskin	Alchemists can toughen their defenses with stoneskin potion	3	2	2017-06-21 03:39:52.033385	2017-06-21 03:39:52.033385	f
18	1	Battle Cry	Knights use their battle cries to drive enemies attention to themselves and away from their comrades	5	20	2017-06-21 03:51:58.96839	2017-06-21 04:19:48.761793	t
17	2	Heightened Sense	Rangers can sense danger and avoid incoming attack	6	20	2017-06-21 03:51:06.712754	2017-06-21 04:19:57.995872	t
16	3	Mana Gathering	Wizards need to gradually build up power for their spells	7	5	2017-06-21 03:50:32.955868	2017-06-21 04:20:08.496832	t
15	4	Healing potion	Alchemists can use potion to heal their comrades in battle	8	2	2017-06-21 03:48:13.506747	2017-06-21 04:20:17.220191	t
19	1	Knight Attack	Base attack	1	1	2017-06-21 04:27:06.45904	2017-06-21 04:27:06.45904	t
20	1	Knight Defense	Base defense	3	2	2017-06-21 04:27:34.747946	2017-06-21 04:27:34.747946	t
21	1	Knight Pierce	Base pierce	4	0	2017-06-21 04:27:55.815094	2017-06-21 04:27:55.815094	t
22	1	Knight Health	Base health	2	10	2017-06-21 04:28:22.59239	2017-06-21 04:28:22.59239	t
23	2	Ranger Attack	Base attack	1	3	2017-06-21 04:28:49.082401	2017-06-21 04:28:49.082401	t
24	2	Ranger Defense	Base defense	3	1	2017-06-21 04:29:06.291375	2017-06-21 04:29:06.291375	t
25	2	Ranger Dodge	Base dodge	6	10	2017-06-21 04:29:33.761365	2017-06-21 04:29:33.761365	t
26	2	Ranger Pierce	Base Pierce	4	1	2017-06-21 04:29:48.500315	2017-06-21 04:29:48.500315	t
27	2	Ranger Health	Base health	2	8	2017-06-21 04:30:21.046542	2017-06-21 04:30:21.046542	t
28	3	Wizard Attack	Base attack	1	0	2017-06-21 04:30:55.289172	2017-06-21 04:30:55.289172	t
29	3	Wizard Health	Base health	2	5	2017-06-21 04:31:13.458323	2017-06-21 04:31:13.458323	t
30	4	Alchemist attack	Base attack	1	1	2017-06-21 04:31:37.601901	2017-06-21 04:31:37.601901	t
31	4	Alchemist healing	Base recovery	8	2	2017-06-21 04:31:58.659425	2017-06-21 04:31:58.659425	t
32	4	Alchemist defense	Base defense	3	1	2017-06-21 04:32:16.047216	2017-06-21 04:32:16.047216	t
33	4	Alchemist Health	Base health	2	8	2017-06-21 04:32:34.381614	2017-06-21 04:32:34.381614	t
34	3	Wizard Defense	Base defense	3	0	2017-06-21 04:34:01.878038	2017-06-21 04:34:01.878038	t
\.


--
-- Name: traits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: huythai
--

SELECT pg_catalog.setval('traits_id_seq', 34, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: huythai
--

COPY users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at) FROM stdin;
1	admin@test.com	$2a$11$BUsJNj2qq1Lo2Y9Ulxy9yesS9bViO4bgZ1GVVnnglA6iyaRlBnp2O	\N	\N	\N	1	2017-06-21 02:58:33.001605	2017-06-21 02:58:33.001605	127.0.0.1	127.0.0.1	2017-06-21 02:55:17.141933	2017-06-21 02:58:33.003687
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: huythai
--

SELECT pg_catalog.setval('users_id_seq', 1, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: huythai
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: attribute_types attribute_types_pkey; Type: CONSTRAINT; Schema: public; Owner: huythai
--

ALTER TABLE ONLY attribute_types
    ADD CONSTRAINT attribute_types_pkey PRIMARY KEY (id);


--
-- Name: character_attributes character_attributes_pkey; Type: CONSTRAINT; Schema: public; Owner: huythai
--

ALTER TABLE ONLY character_attributes
    ADD CONSTRAINT character_attributes_pkey PRIMARY KEY (id);


--
-- Name: character_classes character_classes_pkey; Type: CONSTRAINT; Schema: public; Owner: huythai
--

ALTER TABLE ONLY character_classes
    ADD CONSTRAINT character_classes_pkey PRIMARY KEY (id);


--
-- Name: character_slots character_slots_pkey; Type: CONSTRAINT; Schema: public; Owner: huythai
--

ALTER TABLE ONLY character_slots
    ADD CONSTRAINT character_slots_pkey PRIMARY KEY (id);


--
-- Name: character_traits character_traits_pkey; Type: CONSTRAINT; Schema: public; Owner: huythai
--

ALTER TABLE ONLY character_traits
    ADD CONSTRAINT character_traits_pkey PRIMARY KEY (id);


--
-- Name: characters characters_pkey; Type: CONSTRAINT; Schema: public; Owner: huythai
--

ALTER TABLE ONLY characters
    ADD CONSTRAINT characters_pkey PRIMARY KEY (id);


--
-- Name: item_attributes item_attributes_pkey; Type: CONSTRAINT; Schema: public; Owner: huythai
--

ALTER TABLE ONLY item_attributes
    ADD CONSTRAINT item_attributes_pkey PRIMARY KEY (id);


--
-- Name: item_types item_types_pkey; Type: CONSTRAINT; Schema: public; Owner: huythai
--

ALTER TABLE ONLY item_types
    ADD CONSTRAINT item_types_pkey PRIMARY KEY (id);


--
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: huythai
--

ALTER TABLE ONLY items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- Name: locations locations_pkey; Type: CONSTRAINT; Schema: public; Owner: huythai
--

ALTER TABLE ONLY locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- Name: monster_attributes monster_attributes_pkey; Type: CONSTRAINT; Schema: public; Owner: huythai
--

ALTER TABLE ONLY monster_attributes
    ADD CONSTRAINT monster_attributes_pkey PRIMARY KEY (id);


--
-- Name: monster_classes monster_classes_pkey; Type: CONSTRAINT; Schema: public; Owner: huythai
--

ALTER TABLE ONLY monster_classes
    ADD CONSTRAINT monster_classes_pkey PRIMARY KEY (id);


--
-- Name: monster_loots monster_loots_pkey; Type: CONSTRAINT; Schema: public; Owner: huythai
--

ALTER TABLE ONLY monster_loots
    ADD CONSTRAINT monster_loots_pkey PRIMARY KEY (id);


--
-- Name: monsters monsters_pkey; Type: CONSTRAINT; Schema: public; Owner: huythai
--

ALTER TABLE ONLY monsters
    ADD CONSTRAINT monsters_pkey PRIMARY KEY (id);


--
-- Name: parties parties_pkey; Type: CONSTRAINT; Schema: public; Owner: huythai
--

ALTER TABLE ONLY parties
    ADD CONSTRAINT parties_pkey PRIMARY KEY (id);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: huythai
--

ALTER TABLE ONLY players
    ADD CONSTRAINT players_pkey PRIMARY KEY (id);


--
-- Name: rarities rarities_pkey; Type: CONSTRAINT; Schema: public; Owner: huythai
--

ALTER TABLE ONLY rarities
    ADD CONSTRAINT rarities_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: huythai
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: slots slots_pkey; Type: CONSTRAINT; Schema: public; Owner: huythai
--

ALTER TABLE ONLY slots
    ADD CONSTRAINT slots_pkey PRIMARY KEY (id);


--
-- Name: traits traits_pkey; Type: CONSTRAINT; Schema: public; Owner: huythai
--

ALTER TABLE ONLY traits
    ADD CONSTRAINT traits_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: huythai
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_players_on_email; Type: INDEX; Schema: public; Owner: huythai
--

CREATE UNIQUE INDEX index_players_on_email ON players USING btree (email);


--
-- Name: index_players_on_reset_password_token; Type: INDEX; Schema: public; Owner: huythai
--

CREATE UNIQUE INDEX index_players_on_reset_password_token ON players USING btree (reset_password_token);


--
-- Name: index_players_on_slug; Type: INDEX; Schema: public; Owner: huythai
--

CREATE UNIQUE INDEX index_players_on_slug ON players USING btree (slug);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: huythai
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: huythai
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- PostgreSQL database dump complete
--


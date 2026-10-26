-- Sales Analysis Project: schema + sample data
DROP TABLE IF EXISTS order_items, orders, employees, products, categories, customers CASCADE;

CREATE TABLE customers (
  id SERIAL PRIMARY KEY, first_name TEXT NOT NULL, last_name TEXT NOT NULL,
  email TEXT UNIQUE NOT NULL, phone TEXT, gender TEXT, birth_date DATE,
  city TEXT, country TEXT, registration_date DATE, is_active BOOLEAN DEFAULT TRUE);
CREATE TABLE categories (id SERIAL PRIMARY KEY, name TEXT NOT NULL, description TEXT);
CREATE TABLE products (
  id SERIAL PRIMARY KEY, name TEXT NOT NULL, category_id INT REFERENCES categories(id),
  brand TEXT, price NUMERIC(10,2) NOT NULL, cost NUMERIC(10,2) NOT NULL,
  stock_quantity INT DEFAULT 0, created_at DATE, is_available BOOLEAN DEFAULT TRUE);
CREATE TABLE employees (
  id SERIAL PRIMARY KEY, first_name TEXT NOT NULL, last_name TEXT NOT NULL,
  email TEXT UNIQUE, position TEXT, hire_date DATE, salary NUMERIC(10,2));
CREATE TABLE orders (
  id SERIAL PRIMARY KEY, customer_id INT REFERENCES customers(id), employee_id INT REFERENCES employees(id),
  order_date TIMESTAMP NOT NULL, status TEXT, payment_method TEXT, shipping_city TEXT,
  shipping_cost NUMERIC(8,2) DEFAULT 0, discount NUMERIC(8,2) DEFAULT 0);
CREATE TABLE order_items (
  id SERIAL PRIMARY KEY, order_id INT REFERENCES orders(id), product_id INT REFERENCES products(id),
  quantity INT NOT NULL, unit_price NUMERIC(10,2) NOT NULL);

COPY categories (id,name,description) FROM stdin;
1	Electronics	Phones, laptops and gadgets
2	Clothing	Men and women apparel
3	Home & Kitchen	Appliances and home items
4	Beauty	Skin care and perfumes
5	Sports	Sports gear and fitness
6	Books	Books and stationery
7	Toys	Toys and games
8	Grocery	Food and beverages
\.

COPY customers (id,first_name,last_name,email,phone,gender,birth_date,city,country,registration_date,is_active) FROM stdin;
1	Samer	Saleh	samer.saleh1@example.com	0796631931	Male	1987-12-27	Zarqa	Jordan	2026-03-25	t
2	Zainab	Saleh	zainab.saleh2@example.com	0796518506	Female	1963-09-07	Madaba	Jordan	2024-12-12	t
3	Hamza	Rimawi	hamza.rimawi3@example.com	0782849877	Male	2001-03-30	Zarqa	Jordan	2023-11-10	t
4	Dima	Taha	dima.taha4@example.com	0783799650	Female	1967-10-10	Jerash	Jordan	2024-07-25	t
5	Hala	Jaber	hala.jaber5@example.com	0789480831	Female	1983-03-06	Amman	Jordan	2024-11-28	t
6	Hiba	Fakhouri	hiba.fakhouri6@example.com	0797701436	Female	2002-09-17	Salt	Jordan	2026-08-15	t
7	Yasmin	Rimawi	yasmin.rimawi7@example.com	0798557444	Female	1990-11-03	Irbid	Jordan	2025-05-21	t
8	Tariq	Saleh	tariq.saleh8@example.com	0777498941	Male	1976-08-10	Salt	Jordan	2024-01-28	t
9	Reem	Rimawi	reem.rimawi9@example.com	0774008427	Female	1961-04-08	Amman	Jordan	2025-12-29	t
10	Layth	Omari	layth.omari10@example.com	0770471167	Male	1999-07-08	Irbid	Jordan	2024-11-28	f
11	Yousef	Qasem	yousef.qasem11@example.com	0771869993	Male	1987-04-05	Jerash	Jordan	2023-06-24	t
12	Farah	Odeh	farah.odeh12@example.com	0799091334	Female	1998-06-21	Amman	Jordan	2024-09-17	t
13	Ibrahim	Abdullah	ibrahim.abdullah13@example.com	0787974034	Male	1974-01-16	Irbid	Jordan	2023-01-06	t
14	Noor	Taha	noor.taha14@example.com	0778324210	Female	1977-09-30	Dubai	UAE	2025-05-20	t
15	Zainab	Zoubi	zainab.zoubi15@example.com	0784648877	Female	1999-05-26	Dubai	UAE	2023-09-12	t
16	Hamza	Barakat	hamza.barakat16@example.com	0779904902	Male	1962-04-27	Zarqa	Jordan	2023-07-07	t
17	Aya	Abdullah	aya.abdullah17@example.com	0781756551	Female	1999-02-08	Doha	Qatar	2026-07-24	t
18	Rahaf	Jaber	rahaf.jaber18@example.com	0777154516	Female	1995-12-05	Amman	Jordan	2026-01-31	t
19	Rami	Odeh	rami.odeh19@example.com	0789770348	Male	1976-10-29	Amman	Jordan	2025-11-27	t
20	Farah	Jaber	farah.jaber20@example.com	0788086131	Female	1981-06-20	Amman	Jordan	2023-11-21	t
21	Yousef	Jaber	yousef.jaber21@example.com	0794677378	Male	1986-03-08	Dubai	UAE	2025-11-08	t
22	Majd	Daher	majd.daher22@example.com	0786584044	Male	1972-03-31	Salt	Jordan	2023-05-23	t
23	Dana	Odeh	dana.odeh23@example.com	0798675339	Female	1990-12-18	Irbid	Jordan	2024-11-11	t
24	Lina	Barakat	lina.barakat24@example.com	0792702895	Female	1994-03-15	Salt	Jordan	2025-03-01	t
25	Rana	Daher	rana.daher25@example.com	0782174596	Female	1961-05-17	Riyadh	Saudi Arabia	2023-10-23	t
26	Lama	Shami	lama.shami26@example.com	0779134316	Female	2003-10-11	Dubai	UAE	2026-01-13	t
27	Anas	Abdullah	anas.abdullah27@example.com	0780455623	Male	1962-08-06	Aqaba	Jordan	2023-04-05	t
28	Ali	Abdullah	ali.abdullah28@example.com	0793792374	Male	1994-04-27	Amman	Jordan	2026-06-23	t
29	Anas	Omari	anas.omari29@example.com	0785946474	Male	1974-03-04	Aqaba	Jordan	2023-06-01	t
30	Hiba	Saleh	hiba.saleh30@example.com	0784064090	Female	1992-03-15	Amman	Jordan	2026-03-23	t
31	Salma	Taha	salma.taha31@example.com	0793942104	Female	1991-08-10	Zarqa	Jordan	2024-03-24	t
32	Layth	Rimawi	layth.rimawi32@example.com	0786232858	Male	1968-02-01	Salt	Jordan	2024-08-27	t
33	Hala	Hijazi	hala.hijazi33@example.com	0795171236	Female	2003-03-25	Riyadh	Saudi Arabia	2024-08-27	t
34	Noor	Shami	noor.shami34@example.com	0784965137	Female	1971-02-01	Amman	Jordan	2025-07-20	f
35	Zainab	Taha	zainab.taha35@example.com	0796120047	Female	2001-08-26	Zarqa	Jordan	2024-09-10	t
36	Rami	Qasem	rami.qasem36@example.com	0789261796	Male	1993-04-14	Amman	Jordan	2026-01-11	t
37	Lina	Rimawi	lina.rimawi37@example.com	0781585064	Female	1999-11-23	Amman	Jordan	2024-04-28	t
38	Anas	Nasser	anas.nasser38@example.com	0783293183	Male	1961-11-30	Zarqa	Jordan	2023-04-14	t
39	Tariq	Qasem	tariq.qasem39@example.com	0772842102	Male	1960-04-02	Madaba	Jordan	2024-07-21	f
40	Layth	Barakat	layth.barakat40@example.com	0776811775	Male	1983-10-22	Amman	Jordan	2023-04-18	t
41	Anas	Daher	anas.daher41@example.com	0794700766	Male	1963-11-21	Amman	Jordan	2026-09-11	t
42	Farah	Nasser	farah.nasser42@example.com	0771249985	Female	1988-11-23	Riyadh	Saudi Arabia	2026-05-30	t
43	Farah	Daher	farah.daher43@example.com	0798367365	Female	1968-11-23	Zarqa	Jordan	2023-08-23	t
44	Rahaf	Saleh	rahaf.saleh44@example.com	0785271111	Female	1988-01-14	Amman	Jordan	2026-09-24	t
45	Dana	Fakhouri	dana.fakhouri45@example.com	0785604945	Female	1989-07-28	Amman	Jordan	2023-09-08	t
46	Yousef	Jaber	yousef.jaber46@example.com	0795149368	Male	1969-09-16	Amman	Jordan	2024-12-18	t
47	Majd	Hijazi	majd.hijazi47@example.com	0785022961	Male	1984-07-07	Amman	Jordan	2024-09-24	t
48	Omar	Daher	omar.daher48@example.com	0782545991	Male	1997-08-31	Amman	Jordan	2025-07-18	t
49	Ali	Amr	ali.amr49@example.com	0786797643	Male	1967-04-27	Amman	Jordan	2024-07-11	t
50	Faris	Masri	faris.masri50@example.com	0794036900	Male	2003-08-28	Amman	Jordan	2025-12-15	t
51	Yousef	Hijazi	yousef.hijazi51@example.com	0786226838	Male	1970-10-06	Amman	Jordan	2023-01-16	t
52	Noor	Shami	noor.shami52@example.com	0777159696	Female	1963-10-18	Karak	Jordan	2025-06-12	t
53	Salma	Saleh	salma.saleh53@example.com	0797516136	Female	1989-02-19	Amman	Jordan	2023-12-18	t
54	Zaid	Omari	zaid.omari54@example.com	0771818835	Male	1979-11-17	Salt	Jordan	2024-11-13	t
55	Ibrahim	Saleh	ibrahim.saleh55@example.com	0792127799	Male	1977-09-12	Amman	Jordan	2023-12-22	t
56	Dima	Qasem	dima.qasem56@example.com	0794490581	Female	2002-01-25	Amman	Jordan	2025-06-24	t
57	Lina	Khalil	lina.khalil57@example.com	0791998679	Female	1985-10-02	Amman	Jordan	2023-06-07	t
58	Anas	Zoubi	anas.zoubi58@example.com	0788207151	Male	1988-11-04	Zarqa	Jordan	2026-05-24	t
59	Mohammad	Taha	mohammad.taha59@example.com	0799255466	Male	1999-06-03	Aqaba	Jordan	2025-12-09	t
60	Tariq	Nasser	tariq.nasser60@example.com	0789251925	Male	1994-09-05	Amman	Jordan	2024-08-04	t
61	Dana	Amr	dana.amr61@example.com	0796528168	Female	1967-08-08	Aqaba	Jordan	2024-09-26	t
62	Salma	Abdullah	salma.abdullah62@example.com	0773221418	Female	1990-08-28	Dubai	UAE	2025-09-22	t
63	Tariq	Amr	tariq.amr63@example.com	0772927065	Male	1993-10-18	Amman	Jordan	2023-11-12	t
64	Anas	Amr	anas.amr64@example.com	0793473597	Male	2000-04-10	Amman	Jordan	2024-04-24	t
65	Tala	Daher	tala.daher65@example.com	0792407581	Female	1974-07-16	Irbid	Jordan	2024-02-13	t
66	Samer	Nasser	samer.nasser66@example.com	0792613750	Male	1984-06-21	Salt	Jordan	2025-07-09	t
67	Jana	Rimawi	jana.rimawi67@example.com	0770515220	Female	1967-04-28	Amman	Jordan	2025-02-06	t
68	Dana	Jaber	dana.jaber68@example.com	0774328986	Female	1960-06-21	Amman	Jordan	2023-06-12	t
69	Reem	Omari	reem.omari69@example.com	0799711798	Female	1981-05-23	Amman	Jordan	2025-05-09	f
70	Yousef	Omari	yousef.omari70@example.com	0796218518	Male	1991-08-27	Amman	Jordan	2024-05-07	t
71	Zaid	Jaber	zaid.jaber71@example.com	0780515319	Male	1994-09-16	Amman	Jordan	2025-02-03	t
72	Dana	Khalil	dana.khalil72@example.com	0777722170	Female	1990-05-16	Amman	Jordan	2026-08-09	t
73	Hassan	Khalil	hassan.khalil73@example.com	0788740345	Male	1987-10-26	Amman	Jordan	2025-11-21	t
74	Tariq	Hijazi	tariq.hijazi74@example.com	0787652775	Male	1993-01-06	Amman	Jordan	2025-06-13	t
75	Noor	Masri	noor.masri75@example.com	0785115447	Female	1976-03-10	Amman	Jordan	2026-01-22	t
76	Hala	Odeh	hala.odeh76@example.com	0796401658	Female	1963-10-19	Amman	Jordan	2024-12-23	t
77	Ahmad	Qasem	ahmad.qasem77@example.com	0771355690	Male	1999-04-24	Karak	Jordan	2023-03-13	t
78	Layan	Rimawi	layan.rimawi78@example.com	0778565431	Female	1966-11-24	Amman	Jordan	2026-03-21	f
79	Bilal	Daher	bilal.daher79@example.com	0787394731	Male	1970-07-25	Amman	Jordan	2024-06-20	t
80	Anas	Abdullah	anas.abdullah80@example.com	0795518844	Male	1999-12-07	Riyadh	Saudi Arabia	2023-06-29	t
81	Faris	Daher	faris.daher81@example.com	0777058957	Male	1978-01-11	Amman	Jordan	2023-10-12	t
82	Majd	Nasser	majd.nasser82@example.com	0796691251	Male	1995-09-20	Amman	Jordan	2025-09-07	t
83	Dana	Fakhouri	dana.fakhouri83@example.com	0788018242	Female	1976-04-28	Zarqa	Jordan	2023-09-22	t
84	Faris	Daher	faris.daher84@example.com	0778424981	Male	1967-01-28	Riyadh	Saudi Arabia	2024-05-28	t
85	Layth	Zoubi	layth.zoubi85@example.com	0770109439	Male	1990-04-16	Amman	Jordan	2026-02-28	t
86	Bilal	Fakhouri	bilal.fakhouri86@example.com	0776471027	Male	1987-02-07	Amman	Jordan	2025-09-16	t
87	Maya	Barakat	maya.barakat87@example.com	0795625881	Female	1988-01-16	Zarqa	Jordan	2024-10-15	t
88	Rana	Hijazi	rana.hijazi88@example.com	0774696325	Female	1972-08-21	Amman	Jordan	2023-07-18	t
89	Maya	Abdullah	maya.abdullah89@example.com	0784701687	Female	2006-03-06	Irbid	Jordan	2025-08-14	t
90	Layth	Rimawi	layth.rimawi90@example.com	0797480162	Male	1985-03-29	Amman	Jordan	2025-10-10	t
91	Tala	Rimawi	tala.rimawi91@example.com	0793584168	Female	1964-08-03	Amman	Jordan	2026-03-13	t
92	Zainab	Amr	zainab.amr92@example.com	0785852398	Female	1968-09-03	Amman	Jordan	2025-03-17	t
93	Mohammad	Khalil	mohammad.khalil93@example.com	0797298259	Male	1989-11-17	Amman	Jordan	2025-08-28	t
94	Zainab	Omari	zainab.omari94@example.com	0797947055	Female	2005-07-06	Zarqa	Jordan	2025-11-09	t
95	Yasmin	Omari	yasmin.omari95@example.com	0784993097	Female	1962-05-23	Madaba	Jordan	2026-05-07	t
96	Dana	Taha	dana.taha96@example.com	0777562636	Female	1969-11-10	Amman	Jordan	2024-01-26	t
97	Lina	Qasem	lina.qasem97@example.com	0788652785	Female	1989-02-28	Irbid	Jordan	2026-09-18	t
98	Zainab	Jaber	zainab.jaber98@example.com	0794344375	Female	1982-02-11	Amman	Jordan	2024-07-25	t
99	Salma	Saleh	salma.saleh99@example.com	0782404157	Female	1994-01-23	Zarqa	Jordan	2025-03-19	t
100	Maya	Mansour	maya.mansour100@example.com	0794219933	Female	1984-04-28	Jerash	Jordan	2026-02-25	f
101	Ibrahim	Khalil	ibrahim.khalil101@example.com	0772082677	Male	1989-08-19	Amman	Jordan	2025-08-25	t
102	Dima	Omari	dima.omari102@example.com	0793802620	Female	1968-01-10	Zarqa	Jordan	2026-08-28	t
103	Hiba	Abdullah	hiba.abdullah103@example.com	0774991547	Female	1985-12-20	Dubai	UAE	2023-03-18	t
104	Dana	Daher	dana.daher104@example.com	0782742054	Female	1977-04-19	Irbid	Jordan	2023-08-19	t
105	Ali	Amr	ali.amr105@example.com	0795161227	Male	1996-05-18	Karak	Jordan	2025-05-25	t
106	Ahmad	Hijazi	ahmad.hijazi106@example.com	0784990453	Male	2000-01-29	Amman	Jordan	2024-06-30	f
107	Anas	Omari	anas.omari107@example.com	0791459332	Male	2005-01-30	Amman	Jordan	2024-09-28	t
108	Zainab	Rimawi	zainab.rimawi108@example.com	0793391878	Female	2002-03-29	Amman	Jordan	2026-01-05	t
109	Layth	Saleh	layth.saleh109@example.com	0798225871	Male	2005-05-07	Amman	Jordan	2024-02-19	t
110	Noor	Daher	noor.daher110@example.com	0778679087	Female	1964-12-28	Amman	Jordan	2025-07-17	t
111	Sara	Shami	sara.shami111@example.com	0791065180	Female	1960-04-08	Amman	Jordan	2024-03-22	t
112	Bilal	Khalil	bilal.khalil112@example.com	0796567661	Male	1976-02-23	Amman	Jordan	2023-10-05	t
113	Faris	Saleh	faris.saleh113@example.com	0773004786	Male	1995-04-06	Amman	Jordan	2025-12-19	t
114	Ibrahim	Odeh	ibrahim.odeh114@example.com	0791069033	Male	1984-09-23	Amman	Jordan	2024-01-22	f
115	Anas	Amr	anas.amr115@example.com	0790673830	Male	1964-05-14	Aqaba	Jordan	2024-05-16	t
116	Reem	Zoubi	reem.zoubi116@example.com	0782836440	Female	1988-10-07	Amman	Jordan	2024-04-30	t
117	Hamza	Fakhouri	hamza.fakhouri117@example.com	0796856624	Male	1990-11-24	Irbid	Jordan	2026-08-10	t
118	Reem	Taha	reem.taha118@example.com	0778668826	Female	1972-12-13	Amman	Jordan	2025-08-06	t
119	Tariq	Nasser	tariq.nasser119@example.com	0793046990	Male	1993-04-16	Dubai	UAE	2023-07-09	t
120	Layth	Fakhouri	layth.fakhouri120@example.com	0780331739	Male	1978-09-27	Amman	Jordan	2024-11-12	t
121	Reem	Fakhouri	reem.fakhouri121@example.com	0788544587	Female	1985-05-24	Amman	Jordan	2025-02-18	t
122	Dima	Mansour	dima.mansour122@example.com	0793204899	Female	1997-02-18	Amman	Jordan	2023-04-04	t
123	Dana	Mansour	dana.mansour123@example.com	0777854777	Female	1994-01-28	Amman	Jordan	2026-03-12	t
124	Hala	Qasem	hala.qasem124@example.com	0790801006	Female	2003-10-23	Aqaba	Jordan	2024-01-12	t
125	Omar	Qasem	omar.qasem125@example.com	0780997700	Male	2005-05-15	Amman	Jordan	2025-07-22	t
126	Sara	Haddad	sara.haddad126@example.com	0780862118	Female	1984-08-24	Irbid	Jordan	2026-01-02	t
127	Majd	Daher	majd.daher127@example.com	0781567933	Male	1991-10-19	Amman	Jordan	2024-07-01	t
128	Mohammad	Nasser	mohammad.nasser128@example.com	0780021765	Male	1993-11-02	Amman	Jordan	2026-02-05	t
129	Nasser	Khalil	nasser.khalil129@example.com	0771489025	Male	2002-08-29	Amman	Jordan	2024-07-09	f
130	Layth	Qasem	layth.qasem130@example.com	0782939685	Male	1995-09-25	Salt	Jordan	2023-06-07	t
131	Omar	Daher	omar.daher131@example.com	0776315999	Male	1991-01-11	Salt	Jordan	2023-04-20	t
132	Sara	Hijazi	sara.hijazi132@example.com	0775866296	Female	2000-06-02	Madaba	Jordan	2025-10-01	t
133	Reem	Nasser	reem.nasser133@example.com	0792655110	Female	1973-11-01	Amman	Jordan	2025-02-17	t
134	Layan	Hijazi	layan.hijazi134@example.com	0787888610	Female	1967-10-31	Amman	Jordan	2024-01-19	t
135	Majd	Amr	majd.amr135@example.com	0786618398	Male	1994-07-24	Madaba	Jordan	2023-01-26	t
136	Hala	Qasem	hala.qasem136@example.com	0771264647	Female	1984-01-30	Amman	Jordan	2025-10-06	t
137	Aya	Taha	aya.taha137@example.com	0793712406	Female	2004-06-24	Aqaba	Jordan	2026-05-01	t
138	Dima	Odeh	dima.odeh138@example.com	0789375265	Female	1972-03-18	Amman	Jordan	2024-09-07	t
139	Yasmin	Taha	yasmin.taha139@example.com	0781939828	Female	1985-02-22	Amman	Jordan	2025-03-15	f
140	Maya	Odeh	maya.odeh140@example.com	0797243426	Female	1966-03-16	Madaba	Jordan	2025-04-17	t
141	Anas	Amr	anas.amr141@example.com	0796805891	Male	1995-12-16	Irbid	Jordan	2025-12-30	t
142	Faris	Abdullah	faris.abdullah142@example.com	0796561014	Male	1963-12-22	Zarqa	Jordan	2026-02-27	t
143	Anas	Rimawi	anas.rimawi143@example.com	0780714611	Male	2004-11-24	Amman	Jordan	2023-11-05	t
144	Faris	Omari	faris.omari144@example.com	0785717751	Male	1978-07-23	Amman	Jordan	2025-12-03	t
145	Ahmad	Barakat	ahmad.barakat145@example.com	0792825867	Male	1974-09-29	Zarqa	Jordan	2024-05-14	t
146	Hala	Abdullah	hala.abdullah146@example.com	0779379660	Female	1998-10-08	Zarqa	Jordan	2025-03-21	t
147	Mahmoud	Nasser	mahmoud.nasser147@example.com	0783714785	Male	1976-10-09	Zarqa	Jordan	2025-01-19	t
148	Yasmin	Saleh	yasmin.saleh148@example.com	0774991251	Female	2001-01-28	Amman	Jordan	2026-06-18	t
149	Ali	Rimawi	ali.rimawi149@example.com	0789296627	Male	2005-10-29	Aqaba	Jordan	2025-03-06	t
150	Rami	Abdullah	rami.abdullah150@example.com	0787905072	Male	1972-08-02	Irbid	Jordan	2024-01-19	t
151	Lama	Daher	lama.daher151@example.com	0787721903	Female	1996-09-14	Zarqa	Jordan	2025-10-04	t
152	Reem	Fakhouri	reem.fakhouri152@example.com	0797881914	Female	2001-01-10	Amman	Jordan	2026-03-04	t
153	Lama	Khalil	lama.khalil153@example.com	0776134074	Female	1999-08-06	Salt	Jordan	2026-01-23	t
154	Anas	Saleh	anas.saleh154@example.com	0799596292	Male	1981-04-04	Madaba	Jordan	2024-03-05	t
155	Mohammad	Zoubi	mohammad.zoubi155@example.com	0792544948	Male	1985-03-20	Amman	Jordan	2026-05-07	t
156	Yousef	Masri	yousef.masri156@example.com	0772325367	Male	1984-11-17	Riyadh	Saudi Arabia	2026-09-05	t
157	Rahaf	Shami	rahaf.shami157@example.com	0794577590	Female	1968-05-08	Irbid	Jordan	2025-04-05	t
158	Anas	Rimawi	anas.rimawi158@example.com	0783745458	Male	1995-09-06	Karak	Jordan	2024-03-22	t
159	Dima	Khalil	dima.khalil159@example.com	0772770632	Female	2001-03-25	Amman	Jordan	2023-02-03	t
160	Hala	Hijazi	hala.hijazi160@example.com	0775206436	Female	1992-05-02	Amman	Jordan	2024-05-27	t
161	Ahmad	Mansour	ahmad.mansour161@example.com	0778700516	Male	1971-11-27	Irbid	Jordan	2026-04-30	t
162	Noor	Taha	noor.taha162@example.com	0785426221	Female	1969-03-10	Amman	Jordan	2023-07-31	t
163	Majd	Abdullah	majd.abdullah163@example.com	0792697311	Male	1979-02-11	Amman	Jordan	2026-07-10	t
164	Layth	Shami	layth.shami164@example.com	0773413899	Male	1998-07-10	Amman	Jordan	2024-10-06	t
165	Sara	Omari	sara.omari165@example.com	0796403761	Female	2005-09-17	Amman	Jordan	2024-01-22	t
166	Nasser	Haddad	nasser.haddad166@example.com	0789658271	Male	1988-05-23	Doha	Qatar	2023-09-28	f
167	Ahmad	Hijazi	ahmad.hijazi167@example.com	0794866618	Male	1965-06-04	Amman	Jordan	2025-03-26	t
168	Mahmoud	Nasser	mahmoud.nasser168@example.com	0778569146	Male	2005-11-14	Amman	Jordan	2024-02-21	t
169	Mohammad	Taha	mohammad.taha169@example.com	0789904210	Male	1998-12-24	Amman	Jordan	2023-08-26	t
170	Ali	Jaber	ali.jaber170@example.com	0794252410	Male	2006-12-02	Dubai	UAE	2025-11-25	t
171	Aya	Daher	aya.daher171@example.com	0788507925	Female	1966-11-30	Amman	Jordan	2025-10-13	t
172	Layth	Saleh	layth.saleh172@example.com	0770307562	Male	2005-08-25	Amman	Jordan	2023-01-06	t
173	Rami	Masri	rami.masri173@example.com	0795419518	Male	1982-04-10	Amman	Jordan	2025-05-02	t
174	Ali	Taha	ali.taha174@example.com	0777445187	Male	1964-02-13	Madaba	Jordan	2025-04-01	f
175	Samer	Zoubi	samer.zoubi175@example.com	0789738320	Male	1981-10-05	Madaba	Jordan	2025-08-08	t
176	Ibrahim	Fakhouri	ibrahim.fakhouri176@example.com	0776413836	Male	1960-11-10	Amman	Jordan	2024-11-17	t
177	Yousef	Hijazi	yousef.hijazi177@example.com	0785719182	Male	1980-10-06	Amman	Jordan	2025-11-30	t
178	Noor	Zoubi	noor.zoubi178@example.com	0773445655	Female	1999-01-09	Irbid	Jordan	2026-09-18	t
179	Omar	Mansour	omar.mansour179@example.com	0772775618	Male	1969-10-10	Amman	Jordan	2023-11-15	t
180	Anas	Omari	anas.omari180@example.com	0774903521	Male	1970-10-04	Irbid	Jordan	2023-07-05	t
181	Tala	Daher	tala.daher181@example.com	0770678831	Female	1986-10-23	Amman	Jordan	2024-06-16	t
182	Khaled	Haddad	khaled.haddad182@example.com	0776519941	Male	1979-12-10	Amman	Jordan	2023-09-25	f
183	Hassan	Odeh	hassan.odeh183@example.com	0770702966	Male	1968-04-01	Madaba	Jordan	2024-11-10	t
184	Rahaf	Abdullah	rahaf.abdullah184@example.com	0787209993	Female	1976-10-15	Amman	Jordan	2024-07-17	t
185	Rahaf	Fakhouri	rahaf.fakhouri185@example.com	0782638380	Female	1967-11-14	Irbid	Jordan	2024-07-26	t
186	Hiba	Fakhouri	hiba.fakhouri186@example.com	0795642059	Female	1990-11-12	Madaba	Jordan	2026-03-04	t
187	Lina	Jaber	lina.jaber187@example.com	0773348039	Female	1980-11-18	Irbid	Jordan	2023-11-23	t
188	Layan	Abdullah	layan.abdullah188@example.com	0790599293	Female	1988-07-12	Amman	Jordan	2025-01-04	t
189	Lama	Omari	lama.omari189@example.com	0773930870	Female	1963-05-28	Amman	Jordan	2023-07-04	t
190	Yousef	Barakat	yousef.barakat190@example.com	0772921851	Male	1989-01-11	Aqaba	Jordan	2023-05-02	t
191	Yasmin	Saleh	yasmin.saleh191@example.com	0776752895	Female	1988-12-10	Amman	Jordan	2023-10-07	t
192	Zaid	Omari	zaid.omari192@example.com	0770969029	Male	1986-06-03	Salt	Jordan	2023-09-18	t
193	Layth	Saleh	layth.saleh193@example.com	0791355215	Male	1972-08-13	Dubai	UAE	2024-11-09	t
194	Maya	Taha	maya.taha194@example.com	0770067626	Female	1991-06-11	Aqaba	Jordan	2024-06-09	t
195	Layan	Fakhouri	layan.fakhouri195@example.com	0793271040	Female	2003-01-06	Amman	Jordan	2026-03-29	t
196	Omar	Barakat	omar.barakat196@example.com	0791815997	Male	1993-09-07	Amman	Jordan	2023-11-26	t
197	Hala	Amr	hala.amr197@example.com	0775336884	Female	1974-02-03	Riyadh	Saudi Arabia	2023-04-20	t
198	Reem	Saleh	reem.saleh198@example.com	0775061497	Female	2004-01-17	Amman	Jordan	2023-11-11	t
199	Hassan	Abdullah	hassan.abdullah199@example.com	0774677418	Male	1967-05-08	Zarqa	Jordan	2025-08-27	t
200	Tala	Rimawi	tala.rimawi200@example.com	0787434902	Female	1964-01-02	Amman	Jordan	2024-06-23	t
201	Omar	Rimawi	omar.rimawi201@example.com	0778068687	Male	1997-02-20	Madaba	Jordan	2026-04-22	t
202	Bilal	Omari	bilal.omari202@example.com	0798992172	Male	1963-02-11	Amman	Jordan	2025-10-25	t
203	Hassan	Mansour	hassan.mansour203@example.com	0796329451	Male	1997-12-25	Amman	Jordan	2023-06-10	t
204	Lama	Barakat	lama.barakat204@example.com	0779986162	Female	2006-08-16	Karak	Jordan	2025-07-27	t
205	Khaled	Zoubi	khaled.zoubi205@example.com	0786467997	Male	1985-08-31	Madaba	Jordan	2026-01-01	f
206	Tala	Qasem	tala.qasem206@example.com	0785307450	Female	1996-01-15	Zarqa	Jordan	2023-03-21	t
207	Salma	Hijazi	salma.hijazi207@example.com	0774754691	Female	1968-10-23	Karak	Jordan	2024-04-11	t
208	Hamza	Jaber	hamza.jaber208@example.com	0792148628	Male	1993-07-18	Salt	Jordan	2023-04-26	t
209	Ali	Mansour	ali.mansour209@example.com	0770705345	Male	1978-01-03	Riyadh	Saudi Arabia	2023-04-29	t
210	Rana	Haddad	rana.haddad210@example.com	0782798552	Female	2003-11-07	Amman	Jordan	2026-05-01	t
211	Noor	Omari	noor.omari211@example.com	0793333468	Female	1964-06-14	Amman	Jordan	2023-11-30	f
212	Bilal	Qasem	bilal.qasem212@example.com	0789446657	Male	1960-10-04	Zarqa	Jordan	2024-04-03	t
213	Salma	Daher	salma.daher213@example.com	0770858994	Female	1995-08-18	Jerash	Jordan	2026-04-12	t
214	Bilal	Nasser	bilal.nasser214@example.com	0784443283	Male	1984-10-20	Amman	Jordan	2026-08-04	t
215	Dima	Qasem	dima.qasem215@example.com	0786660993	Female	2004-08-14	Aqaba	Jordan	2024-08-28	t
216	Rami	Jaber	rami.jaber216@example.com	0782824172	Male	1992-02-29	Riyadh	Saudi Arabia	2025-11-04	t
217	Tariq	Nasser	tariq.nasser217@example.com	0785549471	Male	1980-01-14	Amman	Jordan	2024-09-20	t
218	Bilal	Mansour	bilal.mansour218@example.com	0786022356	Male	1994-03-29	Irbid	Jordan	2025-12-21	t
219	Dana	Barakat	dana.barakat219@example.com	0785250074	Female	1976-03-06	Karak	Jordan	2023-06-15	t
220	Layth	Abdullah	layth.abdullah220@example.com	0796666760	Male	1967-11-24	Irbid	Jordan	2023-09-23	f
221	Faris	Haddad	faris.haddad221@example.com	0790335421	Male	1977-02-04	Riyadh	Saudi Arabia	2023-02-06	t
222	Hala	Nasser	hala.nasser222@example.com	0788985625	Female	1986-10-02	Jerash	Jordan	2024-08-18	t
223	Layan	Mansour	layan.mansour223@example.com	0773230982	Female	1996-03-10	Amman	Jordan	2023-02-09	t
224	Zaid	Hijazi	zaid.hijazi224@example.com	0771001676	Male	1964-05-11	Madaba	Jordan	2026-05-01	t
225	Hiba	Qasem	hiba.qasem225@example.com	0781849926	Female	1960-10-31	Amman	Jordan	2024-09-08	t
226	Nasser	Amr	nasser.amr226@example.com	0783934835	Male	1970-03-24	Amman	Jordan	2023-08-06	t
227	Hala	Khalil	hala.khalil227@example.com	0783001197	Female	1978-08-19	Irbid	Jordan	2025-09-11	t
228	Nasser	Nasser	nasser.nasser228@example.com	0793744701	Male	1969-02-01	Aqaba	Jordan	2024-06-08	t
229	Samer	Rimawi	samer.rimawi229@example.com	0791100225	Male	1988-01-20	Madaba	Jordan	2025-05-22	t
230	Zainab	Hijazi	zainab.hijazi230@example.com	0782166746	Female	1968-05-03	Riyadh	Saudi Arabia	2025-02-02	t
231	Rahaf	Abdullah	rahaf.abdullah231@example.com	0776979729	Female	1965-04-05	Amman	Jordan	2023-11-23	t
232	Zainab	Haddad	zainab.haddad232@example.com	0781670145	Female	1971-09-21	Karak	Jordan	2025-09-16	f
233	Tariq	Daher	tariq.daher233@example.com	0793756289	Male	1968-07-17	Irbid	Jordan	2025-06-05	f
234	Nasser	Jaber	nasser.jaber234@example.com	0785354083	Male	1974-11-02	Karak	Jordan	2023-06-03	t
235	Tala	Taha	tala.taha235@example.com	0781775170	Female	1999-11-07	Amman	Jordan	2026-03-19	t
236	Lina	Fakhouri	lina.fakhouri236@example.com	0794883755	Female	1968-02-26	Irbid	Jordan	2026-05-22	t
237	Anas	Barakat	anas.barakat237@example.com	0787113055	Male	2002-06-12	Irbid	Jordan	2026-09-07	t
238	Lama	Daher	lama.daher238@example.com	0777261493	Female	1969-07-15	Amman	Jordan	2023-04-04	t
239	Maya	Odeh	maya.odeh239@example.com	0776091779	Female	1977-02-04	Jerash	Jordan	2024-11-23	t
240	Bilal	Haddad	bilal.haddad240@example.com	0789782922	Male	1964-05-10	Irbid	Jordan	2026-02-07	t
241	Jana	Shami	jana.shami241@example.com	0785472269	Female	1982-04-09	Amman	Jordan	2024-07-14	t
242	Lama	Barakat	lama.barakat242@example.com	0779452288	Female	1979-07-01	Aqaba	Jordan	2024-02-16	t
243	Rana	Rimawi	rana.rimawi243@example.com	0786081062	Female	1997-06-14	Irbid	Jordan	2025-12-29	f
244	Hassan	Hijazi	hassan.hijazi244@example.com	0794204380	Male	1974-06-09	Salt	Jordan	2024-08-09	t
245	Rana	Amr	rana.amr245@example.com	0796384066	Female	1980-02-15	Karak	Jordan	2026-08-18	t
246	Lama	Khalil	lama.khalil246@example.com	0797359893	Female	1982-07-19	Amman	Jordan	2024-02-20	t
247	Samer	Odeh	samer.odeh247@example.com	0778160648	Male	1966-09-06	Amman	Jordan	2024-01-18	t
248	Layth	Hijazi	layth.hijazi248@example.com	0772590947	Male	2001-11-01	Amman	Jordan	2023-11-14	t
249	Noor	Barakat	noor.barakat249@example.com	0778268861	Female	1976-06-30	Irbid	Jordan	2025-12-02	t
250	Tariq	Barakat	tariq.barakat250@example.com	0797801573	Male	1979-08-07	Amman	Jordan	2026-06-20	t
251	Mohammad	Barakat	mohammad.barakat251@example.com	0788408588	Male	1970-03-04	Amman	Jordan	2025-03-01	t
252	Samer	Mansour	samer.mansour252@example.com	0778801336	Male	1967-05-22	Amman	Jordan	2023-07-16	t
253	Rami	Masri	rami.masri253@example.com	0777501102	Male	1966-06-21	Zarqa	Jordan	2023-11-11	t
254	Layth	Taha	layth.taha254@example.com	0786650618	Male	1996-07-27	Riyadh	Saudi Arabia	2025-03-05	f
255	Layth	Khalil	layth.khalil255@example.com	0791449147	Male	1966-07-06	Aqaba	Jordan	2025-01-02	t
256	Bilal	Abdullah	bilal.abdullah256@example.com	0794245088	Male	1972-03-26	Irbid	Jordan	2025-03-11	t
257	Ahmad	Zoubi	ahmad.zoubi257@example.com	0775368222	Male	1967-08-21	Zarqa	Jordan	2024-09-16	t
258	Maya	Saleh	maya.saleh258@example.com	0788141413	Female	1964-11-17	Amman	Jordan	2026-01-29	t
259	Dima	Rimawi	dima.rimawi259@example.com	0789135775	Female	1981-01-15	Amman	Jordan	2023-07-24	t
260	Yasmin	Qasem	yasmin.qasem260@example.com	0782053364	Female	1992-09-12	Irbid	Jordan	2024-10-09	t
261	Tariq	Jaber	tariq.jaber261@example.com	0788129142	Male	1992-03-08	Irbid	Jordan	2024-09-17	t
262	Mahmoud	Nasser	mahmoud.nasser262@example.com	0790996930	Male	1961-09-02	Aqaba	Jordan	2025-11-04	t
263	Dana	Rimawi	dana.rimawi263@example.com	0788816580	Female	1986-02-08	Amman	Jordan	2023-10-02	t
264	Nasser	Qasem	nasser.qasem264@example.com	0792750373	Male	1976-01-27	Amman	Jordan	2026-03-05	f
265	Reem	Khalil	reem.khalil265@example.com	0787700518	Female	2006-06-18	Zarqa	Jordan	2025-01-09	t
266	Aya	Zoubi	aya.zoubi266@example.com	0796591846	Female	1975-08-06	Irbid	Jordan	2025-02-10	t
267	Nasser	Shami	nasser.shami267@example.com	0789082723	Male	1990-12-15	Amman	Jordan	2025-09-24	f
268	Maya	Qasem	maya.qasem268@example.com	0791365177	Female	1992-06-30	Amman	Jordan	2026-05-17	t
269	Hamza	Haddad	hamza.haddad269@example.com	0792280920	Male	1971-06-22	Amman	Jordan	2026-03-20	t
270	Nasser	Shami	nasser.shami270@example.com	0781379772	Male	1961-09-02	Zarqa	Jordan	2026-09-17	t
271	Zainab	Qasem	zainab.qasem271@example.com	0798425799	Female	1976-04-25	Madaba	Jordan	2026-06-30	f
272	Tala	Qasem	tala.qasem272@example.com	0796291279	Female	1978-02-25	Amman	Jordan	2025-12-06	t
273	Omar	Jaber	omar.jaber273@example.com	0788650863	Male	1960-02-09	Zarqa	Jordan	2026-08-22	t
274	Tala	Rimawi	tala.rimawi274@example.com	0774731498	Female	1968-10-06	Zarqa	Jordan	2025-05-21	t
275	Ahmad	Haddad	ahmad.haddad275@example.com	0776356512	Male	1970-07-28	Zarqa	Jordan	2025-11-30	t
276	Aya	Fakhouri	aya.fakhouri276@example.com	0786368872	Female	1992-10-20	Amman	Jordan	2026-06-07	t
277	Aya	Omari	aya.omari277@example.com	0791372138	Female	1995-09-19	Zarqa	Jordan	2023-10-10	t
278	Lama	Amr	lama.amr278@example.com	0780127961	Female	1964-09-01	Aqaba	Jordan	2023-11-26	f
279	Faris	Nasser	faris.nasser279@example.com	0798490277	Male	1994-06-24	Zarqa	Jordan	2025-03-31	f
280	Maya	Khalil	maya.khalil280@example.com	0793920530	Female	2005-10-20	Madaba	Jordan	2025-11-22	t
281	Mahmoud	Shami	mahmoud.shami281@example.com	0793801184	Male	1995-06-14	Amman	Jordan	2025-04-10	t
282	Layan	Hijazi	layan.hijazi282@example.com	0789042681	Female	1977-06-14	Amman	Jordan	2025-07-20	t
283	Dima	Saleh	dima.saleh283@example.com	0794769735	Female	1983-02-13	Madaba	Jordan	2026-01-06	t
284	Farah	Zoubi	farah.zoubi284@example.com	0781633565	Female	2003-03-29	Karak	Jordan	2023-08-27	t
285	Mahmoud	Taha	mahmoud.taha285@example.com	0778275539	Male	1995-10-16	Amman	Jordan	2024-12-01	t
286	Bilal	Mansour	bilal.mansour286@example.com	0773339521	Male	1981-09-18	Amman	Jordan	2024-06-27	t
287	Bilal	Amr	bilal.amr287@example.com	0789579472	Male	1963-10-16	Amman	Jordan	2025-09-14	t
288	Tala	Taha	tala.taha288@example.com	0796780856	Female	1971-07-04	Salt	Jordan	2023-04-21	t
289	Anas	Saleh	anas.saleh289@example.com	0790036915	Male	2001-04-10	Aqaba	Jordan	2024-10-08	t
290	Hala	Fakhouri	hala.fakhouri290@example.com	0795527636	Female	1984-03-02	Amman	Jordan	2025-08-23	t
291	Layan	Shami	layan.shami291@example.com	0779314386	Female	1976-02-20	Amman	Jordan	2026-03-16	t
292	Yousef	Qasem	yousef.qasem292@example.com	0787288574	Male	1960-11-15	Irbid	Jordan	2023-12-28	t
293	Zaid	Saleh	zaid.saleh293@example.com	0787175455	Male	1965-05-21	Aqaba	Jordan	2024-03-17	t
294	Layan	Haddad	layan.haddad294@example.com	0779982455	Female	1991-07-01	Amman	Jordan	2026-05-25	t
295	Farah	Nasser	farah.nasser295@example.com	0792256996	Female	1985-09-14	Amman	Jordan	2025-08-07	t
296	Omar	Abdullah	omar.abdullah296@example.com	0794496475	Male	1988-02-15	Amman	Jordan	2024-10-10	t
297	Rahaf	Abdullah	rahaf.abdullah297@example.com	0793413261	Female	1962-01-26	Amman	Jordan	2023-09-14	t
298	Lama	Khalil	lama.khalil298@example.com	0771492164	Female	1995-08-14	Amman	Jordan	2025-12-09	t
299	Farah	Qasem	farah.qasem299@example.com	0775577848	Female	1975-04-22	Amman	Jordan	2023-02-28	t
300	Layth	Amr	layth.amr300@example.com	0798457831	Male	1999-01-09	Irbid	Jordan	2025-12-08	t
301	Rahaf	Hijazi	rahaf.hijazi301@example.com	0792547807	Female	1960-12-11	Amman	Jordan	2023-01-01	t
302	Salma	Haddad	salma.haddad302@example.com	0770853686	Female	1986-04-12	Salt	Jordan	2026-05-07	t
303	Zaid	Shami	zaid.shami303@example.com	0793894484	Male	1967-02-08	Amman	Jordan	2025-05-14	t
304	Ali	Qasem	ali.qasem304@example.com	0784973502	Male	2000-11-06	Amman	Jordan	2026-06-19	f
305	Ali	Saleh	ali.saleh305@example.com	0790312073	Male	1971-03-21	Amman	Jordan	2025-06-16	t
306	Hiba	Rimawi	hiba.rimawi306@example.com	0772046187	Female	1962-11-05	Irbid	Jordan	2024-11-07	t
307	Tala	Haddad	tala.haddad307@example.com	0783037183	Female	1982-05-02	Amman	Jordan	2025-02-27	t
308	Dima	Abdullah	dima.abdullah308@example.com	0791474350	Female	1963-10-14	Zarqa	Jordan	2026-01-30	t
309	Khaled	Taha	khaled.taha309@example.com	0774916300	Male	1989-02-10	Zarqa	Jordan	2023-01-31	t
310	Zainab	Qasem	zainab.qasem310@example.com	0777195005	Female	1968-01-11	Amman	Jordan	2024-05-24	t
311	Yousef	Jaber	yousef.jaber311@example.com	0793065240	Male	1991-02-27	Amman	Jordan	2025-06-17	t
312	Lama	Omari	lama.omari312@example.com	0792855749	Female	2003-12-20	Irbid	Jordan	2024-01-24	t
313	Omar	Daher	omar.daher313@example.com	0795708620	Male	1986-07-11	Amman	Jordan	2024-06-23	t
314	Zainab	Taha	zainab.taha314@example.com	0796387829	Female	1965-09-06	Amman	Jordan	2026-09-10	t
315	Dima	Saleh	dima.saleh315@example.com	0772031731	Female	1965-12-24	Amman	Jordan	2023-03-31	f
316	Hiba	Daher	hiba.daher316@example.com	0783910371	Female	1982-12-17	Zarqa	Jordan	2023-04-11	t
317	Faris	Fakhouri	faris.fakhouri317@example.com	0790948014	Male	1997-04-25	Salt	Jordan	2025-01-25	f
318	Nasser	Saleh	nasser.saleh318@example.com	0783383928	Male	1980-09-21	Amman	Jordan	2025-12-24	t
319	Rana	Zoubi	rana.zoubi319@example.com	0781228685	Female	2001-02-25	Amman	Jordan	2026-09-24	t
320	Layan	Barakat	layan.barakat320@example.com	0786593983	Female	1989-02-15	Irbid	Jordan	2025-01-31	t
321	Layan	Odeh	layan.odeh321@example.com	0790490824	Female	1995-08-16	Amman	Jordan	2023-01-01	f
322	Hassan	Barakat	hassan.barakat322@example.com	0798992107	Male	1984-10-03	Amman	Jordan	2026-02-07	t
323	Mahmoud	Rimawi	mahmoud.rimawi323@example.com	0784196931	Male	1982-06-01	Riyadh	Saudi Arabia	2024-04-22	t
324	Hala	Jaber	hala.jaber324@example.com	0794096105	Female	1968-07-21	Jerash	Jordan	2026-05-04	t
325	Rahaf	Saleh	rahaf.saleh325@example.com	0790604805	Female	1980-05-04	Karak	Jordan	2026-08-29	t
326	Tariq	Daher	tariq.daher326@example.com	0796799813	Male	1973-09-28	Aqaba	Jordan	2023-04-14	t
327	Dana	Qasem	dana.qasem327@example.com	0790864168	Female	2002-09-09	Amman	Jordan	2026-03-16	t
328	Yousef	Jaber	yousef.jaber328@example.com	0799389833	Male	2003-10-08	Irbid	Jordan	2025-03-20	f
329	Dima	Zoubi	dima.zoubi329@example.com	0785355904	Female	1997-02-07	Amman	Jordan	2025-05-17	t
330	Zainab	Odeh	zainab.odeh330@example.com	0773521103	Female	1999-07-08	Zarqa	Jordan	2023-04-02	t
331	Samer	Haddad	samer.haddad331@example.com	0787053833	Male	1969-12-25	Amman	Jordan	2024-09-16	t
332	Lama	Jaber	lama.jaber332@example.com	0776980420	Female	1972-09-05	Zarqa	Jordan	2026-09-30	t
333	Lina	Odeh	lina.odeh333@example.com	0784510463	Female	1960-09-30	Zarqa	Jordan	2023-05-17	t
334	Tariq	Jaber	tariq.jaber334@example.com	0778780038	Male	1967-11-24	Karak	Jordan	2024-01-17	t
335	Tala	Abdullah	tala.abdullah335@example.com	0794384046	Female	1991-07-28	Amman	Jordan	2024-12-28	t
336	Rami	Hijazi	rami.hijazi336@example.com	0792168936	Male	1990-08-30	Amman	Jordan	2025-03-15	t
337	Hamza	Omari	hamza.omari337@example.com	0792329832	Male	1989-07-17	Riyadh	Saudi Arabia	2025-07-08	t
338	Hamza	Qasem	hamza.qasem338@example.com	0778812520	Male	1974-03-06	Zarqa	Jordan	2024-10-12	t
339	Rahaf	Omari	rahaf.omari339@example.com	0771220994	Female	1984-07-24	Amman	Jordan	2023-11-08	t
340	Majd	Taha	majd.taha340@example.com	0777289752	Male	1962-05-04	Amman	Jordan	2025-01-05	t
341	Hiba	Qasem	hiba.qasem341@example.com	0780463331	Female	1980-04-19	Amman	Jordan	2023-03-08	t
342	Zainab	Jaber	zainab.jaber342@example.com	0786096569	Female	2001-01-17	Aqaba	Jordan	2024-05-20	t
343	Nasser	Saleh	nasser.saleh343@example.com	0798608680	Male	1963-10-21	Irbid	Jordan	2024-05-18	t
344	Tala	Omari	tala.omari344@example.com	0776490827	Female	1985-08-25	Madaba	Jordan	2025-08-02	t
345	Noor	Daher	noor.daher345@example.com	0785702793	Female	1972-02-20	Amman	Jordan	2025-03-16	t
346	Mahmoud	Barakat	mahmoud.barakat346@example.com	0771751868	Male	1974-09-17	Aqaba	Jordan	2023-09-11	t
347	Zaid	Fakhouri	zaid.fakhouri347@example.com	0792222064	Male	1975-05-01	Amman	Jordan	2024-11-17	t
348	Salma	Abdullah	salma.abdullah348@example.com	0779407778	Female	1971-10-21	Amman	Jordan	2024-02-20	t
349	Reem	Mansour	reem.mansour349@example.com	0787199038	Female	2002-09-05	Zarqa	Jordan	2025-07-18	t
350	Mohammad	Abdullah	mohammad.abdullah350@example.com	0770994510	Male	1991-04-24	Amman	Jordan	2023-03-17	t
351	Ali	Omari	ali.omari351@example.com	0799501455	Male	1975-12-01	Zarqa	Jordan	2025-07-21	t
352	Hamza	Fakhouri	hamza.fakhouri352@example.com	0774586833	Male	2002-03-28	Amman	Jordan	2023-10-03	t
353	Layth	Daher	layth.daher353@example.com	0794695489	Male	2003-05-23	Doha	Qatar	2026-05-23	t
354	Dana	Amr	dana.amr354@example.com	0787293430	Female	2006-08-16	Irbid	Jordan	2026-07-18	t
355	Rana	Mansour	rana.mansour355@example.com	0775583034	Female	1997-03-13	Madaba	Jordan	2025-04-27	t
356	Samer	Omari	samer.omari356@example.com	0775569902	Male	1989-01-22	Irbid	Jordan	2023-01-13	t
357	Hiba	Jaber	hiba.jaber357@example.com	0777857608	Female	1972-03-06	Madaba	Jordan	2025-09-13	t
358	Lama	Fakhouri	lama.fakhouri358@example.com	0772405682	Female	1989-10-04	Amman	Jordan	2024-12-25	t
359	Hala	Amr	hala.amr359@example.com	0790461735	Female	1987-08-28	Amman	Jordan	2024-10-06	t
360	Maya	Daher	maya.daher360@example.com	0773178078	Female	1970-01-25	Amman	Jordan	2025-02-05	t
361	Hiba	Daher	hiba.daher361@example.com	0778230768	Female	1989-05-14	Amman	Jordan	2023-10-21	t
362	Lina	Amr	lina.amr362@example.com	0771840943	Female	1989-11-25	Riyadh	Saudi Arabia	2025-08-14	t
363	Samer	Hijazi	samer.hijazi363@example.com	0782241098	Male	1999-07-29	Irbid	Jordan	2023-08-29	t
364	Rami	Rimawi	rami.rimawi364@example.com	0794932149	Male	1984-04-25	Irbid	Jordan	2023-10-17	t
365	Lina	Qasem	lina.qasem365@example.com	0780166299	Female	1964-07-11	Amman	Jordan	2023-08-05	t
366	Zainab	Rimawi	zainab.rimawi366@example.com	0777921717	Female	1977-10-10	Amman	Jordan	2025-12-28	t
367	Hiba	Taha	hiba.taha367@example.com	0785625577	Female	1972-11-22	Dubai	UAE	2026-06-17	f
368	Rana	Rimawi	rana.rimawi368@example.com	0789928161	Female	1975-04-28	Irbid	Jordan	2024-08-01	t
369	Samer	Fakhouri	samer.fakhouri369@example.com	0793827615	Male	1997-02-02	Irbid	Jordan	2024-05-03	t
370	Rahaf	Zoubi	rahaf.zoubi370@example.com	0791971997	Female	1981-03-09	Madaba	Jordan	2023-12-21	t
371	Anas	Abdullah	anas.abdullah371@example.com	0791965701	Male	1996-05-28	Amman	Jordan	2023-05-23	t
372	Layth	Haddad	layth.haddad372@example.com	0794699733	Male	1973-05-21	Salt	Jordan	2025-07-16	t
373	Salma	Zoubi	salma.zoubi373@example.com	0795190986	Female	1987-04-28	Madaba	Jordan	2025-06-09	t
374	Lina	Rimawi	lina.rimawi374@example.com	0798514036	Female	1964-10-06	Riyadh	Saudi Arabia	2023-01-02	t
375	Dima	Shami	dima.shami375@example.com	0772723865	Female	1999-01-16	Amman	Jordan	2026-01-21	t
376	Samer	Qasem	samer.qasem376@example.com	0772762126	Male	1966-06-08	Amman	Jordan	2026-08-20	t
377	Zainab	Abdullah	zainab.abdullah377@example.com	0786532690	Female	1998-01-18	Irbid	Jordan	2026-02-04	t
378	Nasser	Hijazi	nasser.hijazi378@example.com	0779751971	Male	1992-12-02	Amman	Jordan	2023-03-10	t
379	Farah	Daher	farah.daher379@example.com	0781894905	Female	1967-12-08	Amman	Jordan	2024-05-17	t
380	Bilal	Odeh	bilal.odeh380@example.com	0795654420	Male	2002-02-04	Irbid	Jordan	2026-03-21	t
381	Yasmin	Hijazi	yasmin.hijazi381@example.com	0779049047	Female	2002-06-13	Amman	Jordan	2026-03-30	t
382	Mahmoud	Hijazi	mahmoud.hijazi382@example.com	0780192927	Male	1985-03-16	Amman	Jordan	2024-07-17	t
383	Mahmoud	Taha	mahmoud.taha383@example.com	0772927663	Male	1962-12-20	Irbid	Jordan	2024-12-03	t
384	Hassan	Zoubi	hassan.zoubi384@example.com	0794102767	Male	1990-12-16	Salt	Jordan	2023-04-22	t
385	Zaid	Shami	zaid.shami385@example.com	0780476580	Male	1973-01-08	Irbid	Jordan	2025-12-22	t
386	Rahaf	Amr	rahaf.amr386@example.com	0784149673	Female	1984-06-15	Riyadh	Saudi Arabia	2024-11-17	t
387	Nasser	Barakat	nasser.barakat387@example.com	0790010618	Male	1976-02-21	Aqaba	Jordan	2024-10-03	t
388	Layan	Taha	layan.taha388@example.com	0770910939	Female	1982-08-07	Aqaba	Jordan	2024-01-31	t
389	Omar	Amr	omar.amr389@example.com	0792447174	Male	1976-07-29	Amman	Jordan	2023-08-16	t
390	Aya	Abdullah	aya.abdullah390@example.com	0786504427	Female	1984-11-16	Madaba	Jordan	2023-05-08	f
391	Majd	Shami	majd.shami391@example.com	0778639174	Male	2004-02-22	Amman	Jordan	2023-08-11	t
392	Omar	Zoubi	omar.zoubi392@example.com	0782006425	Male	2000-01-01	Aqaba	Jordan	2023-02-08	t
393	Nasser	Jaber	nasser.jaber393@example.com	0793067198	Male	1996-03-27	Irbid	Jordan	2023-05-24	t
394	Dima	Omari	dima.omari394@example.com	0795174328	Female	1968-02-18	Amman	Jordan	2025-01-18	f
395	Maya	Omari	maya.omari395@example.com	0795717320	Female	1969-07-30	Aqaba	Jordan	2026-07-15	t
396	Bilal	Shami	bilal.shami396@example.com	0797005050	Male	1987-08-10	Amman	Jordan	2025-10-20	t
397	Nasser	Odeh	nasser.odeh397@example.com	0771027079	Male	1973-05-12	Dubai	UAE	2026-04-01	f
398	Ahmad	Abdullah	ahmad.abdullah398@example.com	0789291117	Male	1987-07-28	Zarqa	Jordan	2023-07-19	t
399	Omar	Mansour	omar.mansour399@example.com	0779825309	Male	1996-01-25	Amman	Jordan	2024-10-26	t
400	Khaled	Hijazi	khaled.hijazi400@example.com	0795827390	Male	1997-03-30	Amman	Jordan	2023-12-11	t
401	Hala	Haddad	hala.haddad401@example.com	0772194672	Female	1967-03-30	Riyadh	Saudi Arabia	2023-01-14	t
402	Jana	Odeh	jana.odeh402@example.com	0790927914	Female	1975-08-29	Amman	Jordan	2026-06-04	t
403	Rami	Taha	rami.taha403@example.com	0788837340	Male	1968-08-01	Amman	Jordan	2026-06-21	t
404	Bilal	Jaber	bilal.jaber404@example.com	0795436459	Male	1963-11-13	Amman	Jordan	2023-04-21	t
405	Lina	Saleh	lina.saleh405@example.com	0777811379	Female	1975-10-12	Salt	Jordan	2023-11-20	t
406	Maya	Barakat	maya.barakat406@example.com	0771363631	Female	1969-11-17	Amman	Jordan	2024-10-29	t
407	Lina	Masri	lina.masri407@example.com	0785273543	Female	2000-10-26	Amman	Jordan	2023-12-31	t
408	Layth	Khalil	layth.khalil408@example.com	0786253492	Male	1969-12-19	Amman	Jordan	2025-08-11	t
409	Layth	Fakhouri	layth.fakhouri409@example.com	0797397740	Male	1967-10-04	Karak	Jordan	2025-04-23	t
410	Ibrahim	Barakat	ibrahim.barakat410@example.com	0779060078	Male	1979-12-14	Amman	Jordan	2026-04-26	f
411	Hiba	Saleh	hiba.saleh411@example.com	0790632543	Female	1981-07-30	Irbid	Jordan	2023-06-20	t
412	Ahmad	Jaber	ahmad.jaber412@example.com	0799077262	Male	1974-07-07	Zarqa	Jordan	2025-07-29	t
413	Farah	Haddad	farah.haddad413@example.com	0795804649	Female	1966-05-05	Karak	Jordan	2025-02-27	t
414	Omar	Amr	omar.amr414@example.com	0795016579	Male	1964-12-01	Riyadh	Saudi Arabia	2025-11-20	f
415	Hala	Fakhouri	hala.fakhouri415@example.com	0783817933	Female	1978-05-14	Aqaba	Jordan	2023-10-11	t
416	Jana	Masri	jana.masri416@example.com	0787788178	Female	1965-09-07	Amman	Jordan	2025-02-02	t
417	Farah	Amr	farah.amr417@example.com	0781162411	Female	1965-11-20	Amman	Jordan	2024-01-21	t
418	Yousef	Jaber	yousef.jaber418@example.com	0790468275	Male	1978-04-29	Amman	Jordan	2025-12-02	t
419	Samer	Mansour	samer.mansour419@example.com	0795695579	Male	1980-11-03	Amman	Jordan	2025-11-30	t
420	Farah	Omari	farah.omari420@example.com	0783754025	Female	1987-07-01	Irbid	Jordan	2023-12-18	t
421	Majd	Abdullah	majd.abdullah421@example.com	0772231059	Male	1985-08-03	Aqaba	Jordan	2024-01-09	t
422	Layan	Abdullah	layan.abdullah422@example.com	0785257828	Female	1963-02-10	Amman	Jordan	2026-09-25	t
423	Zaid	Jaber	zaid.jaber423@example.com	0770885474	Male	2001-02-03	Salt	Jordan	2024-10-17	t
424	Layth	Odeh	layth.odeh424@example.com	0772814069	Male	1970-01-28	Amman	Jordan	2025-09-07	t
425	Layan	Nasser	layan.nasser425@example.com	0793430187	Female	1977-07-04	Amman	Jordan	2026-04-09	t
426	Nasser	Shami	nasser.shami426@example.com	0798056265	Male	1988-07-04	Amman	Jordan	2026-05-20	t
427	Samer	Rimawi	samer.rimawi427@example.com	0773767426	Male	1999-12-22	Amman	Jordan	2026-02-22	t
428	Dana	Zoubi	dana.zoubi428@example.com	0787851961	Female	1972-11-19	Zarqa	Jordan	2024-03-01	f
429	Rahaf	Abdullah	rahaf.abdullah429@example.com	0776487049	Female	1972-04-13	Irbid	Jordan	2024-02-13	t
430	Reem	Haddad	reem.haddad430@example.com	0787146273	Female	1973-10-26	Madaba	Jordan	2024-06-21	f
431	Hiba	Nasser	hiba.nasser431@example.com	0789647158	Female	1992-06-15	Zarqa	Jordan	2026-04-05	t
432	Mahmoud	Abdullah	mahmoud.abdullah432@example.com	0782520456	Male	1973-02-09	Zarqa	Jordan	2024-10-16	t
433	Lina	Omari	lina.omari433@example.com	0772192855	Female	1966-11-22	Amman	Jordan	2025-11-18	t
434	Aya	Rimawi	aya.rimawi434@example.com	0772845765	Female	1991-07-19	Amman	Jordan	2023-10-22	t
435	Khaled	Mansour	khaled.mansour435@example.com	0799888167	Male	1979-11-02	Amman	Jordan	2024-01-21	t
436	Yousef	Haddad	yousef.haddad436@example.com	0777985240	Male	1987-12-14	Irbid	Jordan	2025-01-12	t
437	Ibrahim	Qasem	ibrahim.qasem437@example.com	0782321611	Male	1972-10-08	Karak	Jordan	2024-04-09	f
438	Rahaf	Khalil	rahaf.khalil438@example.com	0799071401	Female	1962-12-10	Amman	Jordan	2026-09-13	t
439	Khaled	Saleh	khaled.saleh439@example.com	0772501249	Male	1978-06-05	Dubai	UAE	2026-04-18	t
440	Nasser	Amr	nasser.amr440@example.com	0790833428	Male	1966-02-17	Amman	Jordan	2023-07-22	f
441	Hassan	Daher	hassan.daher441@example.com	0799271256	Male	2002-08-03	Karak	Jordan	2025-01-20	t
442	Hamza	Saleh	hamza.saleh442@example.com	0781827548	Male	1988-03-12	Salt	Jordan	2023-09-11	t
443	Tariq	Jaber	tariq.jaber443@example.com	0794738646	Male	1985-06-11	Amman	Jordan	2025-07-24	t
444	Bilal	Rimawi	bilal.rimawi444@example.com	0787811266	Male	2004-02-09	Amman	Jordan	2023-08-04	t
445	Ali	Nasser	ali.nasser445@example.com	0779613674	Male	1977-11-10	Amman	Jordan	2024-11-24	t
446	Tala	Rimawi	tala.rimawi446@example.com	0794271147	Female	1996-04-13	Irbid	Jordan	2025-09-19	t
447	Ahmad	Saleh	ahmad.saleh447@example.com	0790269524	Male	1966-02-13	Salt	Jordan	2025-10-17	t
448	Omar	Daher	omar.daher448@example.com	0787784858	Male	2001-10-22	Salt	Jordan	2024-02-18	t
449	Hamza	Saleh	hamza.saleh449@example.com	0787002842	Male	1988-03-21	Amman	Jordan	2025-02-09	t
450	Samer	Shami	samer.shami450@example.com	0797889778	Male	1969-10-24	Irbid	Jordan	2026-03-11	t
451	Zaid	Hijazi	zaid.hijazi451@example.com	0795450090	Male	1993-11-22	Irbid	Jordan	2026-06-17	t
452	Layan	Zoubi	layan.zoubi452@example.com	0776556503	Female	1990-08-13	Amman	Jordan	2025-02-18	t
453	Yasmin	Nasser	yasmin.nasser453@example.com	0775208507	Female	1965-11-16	Riyadh	Saudi Arabia	2024-09-16	t
454	Yasmin	Daher	yasmin.daher454@example.com	0797905696	Female	1983-12-02	Riyadh	Saudi Arabia	2023-02-11	t
455	Bilal	Saleh	bilal.saleh455@example.com	0788529456	Male	1978-06-22	Aqaba	Jordan	2024-11-19	t
456	Rami	Mansour	rami.mansour456@example.com	0796391919	Male	1964-04-06	Amman	Jordan	2024-08-31	t
457	Layth	Daher	layth.daher457@example.com	0774846853	Male	1978-10-25	Irbid	Jordan	2024-12-12	t
458	Zainab	Daher	zainab.daher458@example.com	0798297374	Female	1976-03-14	Irbid	Jordan	2023-02-08	t
459	Yasmin	Khalil	yasmin.khalil459@example.com	0773246651	Female	1992-09-05	Irbid	Jordan	2025-08-05	t
460	Aya	Omari	aya.omari460@example.com	0776312303	Female	1983-01-03	Zarqa	Jordan	2026-05-16	t
461	Farah	Jaber	farah.jaber461@example.com	0790324204	Female	1999-02-16	Irbid	Jordan	2025-05-14	t
462	Lama	Abdullah	lama.abdullah462@example.com	0770159416	Female	1963-10-15	Zarqa	Jordan	2025-09-22	t
463	Zaid	Qasem	zaid.qasem463@example.com	0799847139	Male	2004-11-17	Amman	Jordan	2023-09-05	t
464	Dima	Zoubi	dima.zoubi464@example.com	0772123476	Female	1981-03-02	Salt	Jordan	2025-05-16	t
465	Bilal	Fakhouri	bilal.fakhouri465@example.com	0796734257	Male	1970-02-18	Amman	Jordan	2024-10-10	t
466	Sara	Amr	sara.amr466@example.com	0788645183	Female	1964-11-26	Amman	Jordan	2024-05-05	t
467	Sara	Shami	sara.shami467@example.com	0773432756	Female	1982-12-04	Dubai	UAE	2024-09-08	t
468	Noor	Jaber	noor.jaber468@example.com	0796124815	Female	1997-01-17	Irbid	Jordan	2024-11-12	t
469	Farah	Haddad	farah.haddad469@example.com	0782063459	Female	1976-06-25	Salt	Jordan	2026-07-14	t
470	Ibrahim	Daher	ibrahim.daher470@example.com	0796577242	Male	1971-09-02	Aqaba	Jordan	2026-05-01	t
471	Salma	Mansour	salma.mansour471@example.com	0786930089	Female	1992-12-23	Amman	Jordan	2024-01-08	t
472	Anas	Mansour	anas.mansour472@example.com	0789694215	Male	1975-02-20	Amman	Jordan	2023-04-12	t
473	Ahmad	Daher	ahmad.daher473@example.com	0773334476	Male	2000-09-14	Amman	Jordan	2025-10-09	t
474	Majd	Mansour	majd.mansour474@example.com	0782620443	Male	1985-05-21	Doha	Qatar	2024-01-23	t
475	Faris	Zoubi	faris.zoubi475@example.com	0777256366	Male	2001-02-07	Aqaba	Jordan	2023-06-25	t
476	Noor	Saleh	noor.saleh476@example.com	0777599004	Female	1964-09-03	Irbid	Jordan	2024-11-12	t
477	Salma	Shami	salma.shami477@example.com	0779242875	Female	1971-11-12	Aqaba	Jordan	2026-02-19	t
478	Omar	Barakat	omar.barakat478@example.com	0781502745	Male	1998-11-03	Aqaba	Jordan	2023-10-18	t
479	Aya	Amr	aya.amr479@example.com	0786257287	Female	1983-08-30	Jerash	Jordan	2025-11-24	f
480	Mohammad	Taha	mohammad.taha480@example.com	0777617075	Male	2002-03-10	Amman	Jordan	2024-06-16	t
481	Farah	Jaber	farah.jaber481@example.com	0781342284	Female	1973-04-13	Amman	Jordan	2023-09-11	t
482	Layth	Haddad	layth.haddad482@example.com	0773715041	Male	1976-03-13	Irbid	Jordan	2025-05-02	t
483	Tariq	Qasem	tariq.qasem483@example.com	0787490509	Male	2001-04-15	Amman	Jordan	2026-09-12	t
484	Yasmin	Qasem	yasmin.qasem484@example.com	0785018961	Female	1964-05-14	Amman	Jordan	2026-08-11	t
485	Ibrahim	Shami	ibrahim.shami485@example.com	0786421476	Male	1978-09-06	Amman	Jordan	2023-11-30	t
486	Zainab	Qasem	zainab.qasem486@example.com	0793776749	Female	1968-08-15	Amman	Jordan	2025-01-22	t
487	Hamza	Rimawi	hamza.rimawi487@example.com	0781085732	Male	1998-12-11	Zarqa	Jordan	2026-07-15	t
488	Samer	Odeh	samer.odeh488@example.com	0772438649	Male	2002-11-06	Amman	Jordan	2024-09-07	f
489	Mohammad	Daher	mohammad.daher489@example.com	0777945491	Male	1998-02-13	Amman	Jordan	2025-04-25	t
490	Khaled	Odeh	khaled.odeh490@example.com	0771645977	Male	1976-05-06	Amman	Jordan	2025-03-15	t
491	Dima	Abdullah	dima.abdullah491@example.com	0781680061	Female	1967-01-07	Amman	Jordan	2026-05-22	f
492	Farah	Shami	farah.shami492@example.com	0799564122	Female	2003-08-31	Karak	Jordan	2024-09-12	f
493	Ahmad	Mansour	ahmad.mansour493@example.com	0792368314	Male	1978-10-09	Karak	Jordan	2025-09-12	t
494	Bilal	Masri	bilal.masri494@example.com	0797770793	Male	1974-11-25	Amman	Jordan	2023-11-09	t
495	Lina	Barakat	lina.barakat495@example.com	0789984076	Female	1998-09-26	Amman	Jordan	2025-05-01	t
496	Reem	Khalil	reem.khalil496@example.com	0788146717	Female	1997-11-10	Irbid	Jordan	2026-03-26	t
497	Farah	Masri	farah.masri497@example.com	0785738395	Female	1985-11-02	Amman	Jordan	2024-01-29	t
498	Dana	Omari	dana.omari498@example.com	0795729341	Female	1995-01-08	Aqaba	Jordan	2025-05-03	t
499	Ali	Mansour	ali.mansour499@example.com	0787433800	Male	2004-02-26	Amman	Jordan	2023-07-26	t
500	Layan	Abdullah	layan.abdullah500@example.com	0775619318	Female	2005-03-02	Amman	Jordan	2023-03-07	t
\.

COPY products (id,name,category_id,brand,price,cost,stock_quantity,created_at,is_available) FROM stdin;
1	Samsung Smartphone	1	Samsung	414.28	230.44	140	2024-09-07	t
2	Apple Smartphone	1	Apple	434.66	312.6	279	2024-03-30	t
3	Xiaomi Smartphone	1	Xiaomi	286.67	164.38	5	2025-06-01	t
4	Samsung Laptop	1	Samsung	738.89	538.65	3	2025-03-05	t
5	Apple Laptop	1	Apple	749.81	564.13	3	2024-06-12	t
6	Xiaomi Laptop	1	Xiaomi	652.7	384.36	7	2024-04-14	t
7	Samsung Headphones	1	Samsung	38.61	29.42	135	2024-02-14	t
8	Apple Headphones	1	Apple	50.48	40.04	193	2024-03-21	t
9	Samsung Smart Watch	1	Samsung	155.72	109.72	185	2025-08-14	t
10	Apple Smart Watch	1	Apple	101.01	72.25	148	2024-03-22	t
11	Samsung Tablet	1	Samsung	369.57	238.38	232	2025-01-08	t
12	Apple Tablet	1	Apple	283.69	203.56	36	2025-09-15	t
13	Samsung Power Bank	1	Samsung	22.41	13.7	236	2025-01-23	t
14	Apple Power Bank	1	Apple	27.1	19.57	112	2024-11-28	t
15	Zara T-Shirt	2	Zara	15.19	9.22	16	2024-11-19	t
16	H&M T-Shirt	2	H&M	10.08	7.85	290	2024-11-18	t
17	Nike T-Shirt	2	Nike	13.19	10.17	234	2024-05-26	t
18	Zara Jeans	2	Zara	33.18	22.91	134	2025-08-21	t
19	H&M Jeans	2	H&M	40.25	25.78	70	2025-06-05	t
20	Nike Jeans	2	Nike	43.87	33.57	1	2024-06-12	t
21	Zara Jacket	2	Zara	63.2	35.76	195	2025-09-02	t
22	H&M Jacket	2	H&M	67.05	53.16	5	2024-04-27	t
23	Zara Sneakers	2	Zara	61.72	38.06	174	2024-04-24	t
24	H&M Sneakers	2	H&M	49.22	27.11	134	2025-05-27	t
25	Zara Dress	2	Zara	49.71	28.66	152	2025-06-03	t
26	H&M Dress	2	H&M	40.13	29.72	4	2025-06-27	t
27	Zara Hoodie	2	Zara	34.78	23.38	57	2025-01-06	t
28	H&M Hoodie	2	H&M	38.97	24.43	29	2024-09-03	t
29	Philips Blender	3	Philips	41.05	23.46	248	2024-03-11	t
30	Tefal Blender	3	Tefal	33.59	19.53	243	2025-07-16	t
31	Bosch Blender	3	Bosch	33.5	23.51	108	2025-07-06	t
32	Philips Air Fryer	3	Philips	84.97	61.88	7	2025-01-17	t
33	Tefal Air Fryer	3	Tefal	77.74	45.11	115	2024-03-06	t
34	Bosch Air Fryer	3	Bosch	80.71	49.03	112	2024-01-08	t
35	Philips Coffee Maker	3	Philips	64.83	39.37	16	2024-12-04	t
36	Tefal Coffee Maker	3	Tefal	51.85	37.19	109	2025-07-06	t
37	Philips Vacuum Cleaner	3	Philips	149.74	103.73	242	2024-09-05	t
38	Tefal Vacuum Cleaner	3	Tefal	141.29	84.44	49	2025-03-17	t
39	Philips Pan Set	3	Philips	41.87	32.07	27	2024-04-10	t
40	Tefal Pan Set	3	Tefal	49.48	37.12	55	2024-09-11	t
41	Philips Microwave	3	Philips	106.57	62.35	93	2024-10-12	t
42	Tefal Microwave	3	Tefal	125.85	71.59	281	2024-04-10	t
43	Loreal Perfume	4	Loreal	69.98	53.12	47	2024-08-30	t
44	Nivea Perfume	4	Nivea	54.57	32.93	205	2024-03-01	t
45	Dove Perfume	4	Dove	40.06	25.94	232	2024-10-19	t
46	Loreal Face Cream	4	Loreal	24.74	19.76	284	2025-05-13	t
47	Nivea Face Cream	4	Nivea	17.6	13.94	296	2025-07-09	t
48	Dove Face Cream	4	Dove	17.79	10.01	244	2025-05-29	t
49	Loreal Shampoo	4	Loreal	8.95	5.05	260	2024-03-23	t
50	Nivea Shampoo	4	Nivea	6.73	3.82	120	2025-02-17	t
51	Loreal Lipstick	4	Loreal	16.01	9.79	20	2025-09-26	t
52	Nivea Lipstick	4	Nivea	14.33	9.91	161	2024-09-24	t
53	Loreal Hair Dryer	4	Loreal	43.04	26.24	202	2024-05-14	t
54	Nivea Hair Dryer	4	Nivea	34.3	21.58	37	2024-01-10	t
55	Loreal Body Lotion	4	Loreal	12.59	10.06	37	2025-07-04	t
56	Nivea Body Lotion	4	Nivea	8.63	6.76	35	2024-09-07	t
57	Adidas Football	5	Adidas	13.42	10.18	154	2025-09-18	t
58	Puma Football	5	Puma	19.26	13.14	283	2024-11-02	t
59	Decathlon Football	5	Decathlon	12.93	9.95	135	2024-04-28	t
60	Adidas Yoga Mat	5	Adidas	22.42	13.2	144	2025-09-11	t
61	Puma Yoga Mat	5	Puma	18.1	13.07	135	2025-06-01	t
62	Decathlon Yoga Mat	5	Decathlon	24.18	18.41	47	2025-03-09	t
63	Adidas Dumbbell Set	5	Adidas	33.06	20.94	66	2024-09-25	t
64	Puma Dumbbell Set	5	Puma	42.6	30.95	287	2024-01-10	t
65	Adidas Running Shoes	5	Adidas	88.86	64.22	76	2025-07-12	f
66	Puma Running Shoes	5	Puma	66.4	45.69	220	2024-05-10	f
67	Adidas Bicycle	5	Adidas	183.38	143.64	20	2025-01-01	t
68	Puma Bicycle	5	Puma	170.95	98.42	286	2025-02-20	t
69	Adidas Tennis Racket	5	Adidas	62.48	48.82	121	2024-06-15	t
70	Puma Tennis Racket	5	Puma	64.32	49.55	12	2024-07-02	t
71	Penguin Novel	6	Penguin	7.99	6.25	127	2024-09-30	t
72	Oxford Novel	6	Oxford	9.77	6.31	19	2025-04-26	t
73	Staedtler Novel	6	Staedtler	10.32	6.86	156	2024-08-21	t
74	Penguin Notebook	6	Penguin	3.59	2.33	142	2024-03-12	t
75	Oxford Notebook	6	Oxford	2.9	2.06	204	2025-07-03	t
76	Staedtler Notebook	6	Staedtler	2.45	1.88	133	2024-07-01	t
77	Penguin Textbook	6	Penguin	34.75	19.44	222	2024-12-19	t
78	Oxford Textbook	6	Oxford	24.71	17.34	261	2024-04-28	t
79	Penguin Pen Set	6	Penguin	6.88	4.22	223	2024-01-02	t
80	Oxford Pen Set	6	Oxford	7.7	5.56	2	2025-01-07	t
81	Penguin Planner	6	Penguin	13.69	10.68	160	2024-05-07	t
82	Oxford Planner	6	Oxford	9.8	6.15	209	2024-11-30	t
83	Penguin Art Book	6	Penguin	19.55	11.37	215	2025-01-23	t
84	Oxford Art Book	6	Oxford	26.83	18.89	2	2025-02-19	t
85	Mattel Lego Set	7	Mattel	36.01	22.39	220	2025-08-16	t
86	Hasbro Lego Set	7	Hasbro	44.7	29.52	109	2025-06-07	t
87	Lego Lego Set	7	Lego	60.33	45.19	86	2024-03-27	t
88	Mattel Puzzle	7	Mattel	14.38	10.14	47	2024-08-28	t
89	Hasbro Puzzle	7	Hasbro	11.22	6.73	12	2024-02-17	t
90	Lego Puzzle	7	Lego	13.02	9.93	37	2025-04-11	t
91	Mattel Board Game	7	Mattel	25.91	15.51	196	2025-05-21	t
92	Hasbro Board Game	7	Hasbro	19.55	14.11	54	2025-03-11	t
93	Mattel Doll	7	Mattel	19.24	13.93	237	2024-02-21	t
94	Hasbro Doll	7	Hasbro	20.26	11.76	68	2025-04-20	t
95	Mattel RC Car	7	Mattel	48.75	34.07	226	2025-09-19	t
96	Hasbro RC Car	7	Hasbro	46.73	30.69	280	2025-04-01	t
97	Mattel Plush Toy	7	Mattel	12.46	8.33	1	2024-09-10	t
98	Hasbro Plush Toy	7	Hasbro	9.66	7.19	248	2024-09-01	t
99	Al-Wazir Olive Oil 1L	8	Al-Wazir	7.62	4.74	139	2024-12-09	t
100	Nestle Olive Oil 1L	8	Nestle	10.12	5.92	3	2025-01-27	t
\.

COPY employees (id,first_name,last_name,email,position,hire_date,salary) FROM stdin;
1	Dima	Rimawi	dima.rimawi.emp1@company.com	Sales Manager	2019-07-11	2035.85
2	Dana	Daher	dana.daher.emp2@company.com	Senior Sales Rep	2020-03-02	1223.11
3	Farah	Saleh	farah.saleh.emp3@company.com	Sales Rep	2020-03-09	907.6
4	Rami	Khalil	rami.khalil.emp4@company.com	Sales Rep	2024-09-08	745.3
5	Hassan	Rimawi	hassan.rimawi.emp5@company.com	Sales Rep	2020-10-05	894.8
6	Jana	Jaber	jana.jaber.emp6@company.com	Sales Rep	2020-02-11	757.03
7	Dima	Qasem	dima.qasem.emp7@company.com	Sales Rep	2020-05-18	923.66
8	Rahaf	Haddad	rahaf.haddad.emp8@company.com	Junior Sales Rep	2021-10-01	632.74
9	Dima	Omari	dima.omari.emp9@company.com	Junior Sales Rep	2024-08-30	523.26
10	Layan	Masri	layan.masri.emp10@company.com	Junior Sales Rep	2023-01-17	598.86
11	Yousef	Daher	yousef.daher.emp11@company.com	Account Manager	2023-09-24	1136.16
12	Hamza	Masri	hamza.masri.emp12@company.com	Account Manager	2023-08-04	1169.42
13	Sara	Odeh	sara.odeh.emp13@company.com	Team Lead	2020-08-19	1470.36
14	Omar	Barakat	omar.barakat.emp14@company.com	Team Lead	2022-07-13	1326.64
15	Hamza	Khalil	hamza.khalil.emp15@company.com	Sales Rep	2023-05-30	902.21
\.

COPY orders (id,customer_id,employee_id,order_date,status,payment_method,shipping_city,shipping_cost,discount) FROM stdin;
1	47	5	2025-12-07 16:12:21	Delivered	Cash	Amman	2	5
2	5	13	2026-04-03 13:50:25	Cancelled	Card	Amman	2	0
3	354	7	2026-08-13 16:37:50	Delivered	Transfer	Irbid	3	0
4	472	2	2026-06-02 15:54:35	Delivered	Transfer	Amman	2	0
5	375	15	2026-10-23 17:01:36	Shipped	Cash	Amman	2	15
6	98	9	2026-05-20 14:12:30	Delivered	Card	Amman	2	10
7	18	5	2026-10-08 11:04:58	New	Cash	Amman	2	0
8	83	12	2026-05-30 09:08:34	Delivered	Card	Zarqa	2.5	10
9	407	8	2026-10-07 17:36:19	Shipped	Card	Amman	2	0
10	198	7	2026-03-07 22:36:56	Delivered	Cash	Amman	2	0
11	193	7	2026-01-29 10:57:39	Delivered	Transfer	Dubai	15	0
12	129	12	2026-09-18 18:58:04	Delivered	Cash	Amman	2	0
13	250	6	2026-10-16 18:44:43	Shipped	Card	Amman	2	10
14	231	7	2026-06-25 16:42:15	Delivered	Card	Amman	2	0
15	85	1	2026-03-31 14:10:04	Delivered	Cash	Amman	2	0
16	265	11	2026-06-15 21:40:51	Delivered	Card	Zarqa	2.5	0
17	97	1	2026-10-03 11:12:05	Delivered	Cash	Irbid	3	10
18	334	9	2026-01-25 16:06:52	Delivered	Cash	Karak	4.5	0
19	7	10	2026-02-17 09:42:52	Delivered	Cash	Irbid	3	10
20	392	11	2026-08-19 09:38:20	Shipped	Card	Aqaba	5	20
21	425	6	2026-08-10 08:38:58	Delivered	Card	Amman	2	0
22	146	8	2026-06-08 17:05:03	Delivered	Cash	Zarqa	2.5	0
23	441	13	2026-01-08 18:50:48	Delivered	Card	Karak	4.5	5
24	106	14	2026-05-15 10:28:40	Delivered	Cash	Amman	2	0
25	415	3	2026-02-13 09:27:46	Delivered	Cash	Aqaba	5	0
26	432	7	2026-07-05 13:25:24	Delivered	Card	Zarqa	2.5	5
27	464	7	2026-09-01 16:46:11	Delivered	Card	Salt	3	0
28	90	15	2025-11-07 19:46:23	Delivered	Transfer	Amman	2	20
29	496	15	2026-04-26 17:10:12	Delivered	Card	Irbid	3	5
30	177	7	2025-12-29 22:27:47	Delivered	Transfer	Amman	2	0
31	421	6	2025-11-07 09:41:45	Cancelled	Card	Aqaba	5	10
32	371	2	2025-12-16 17:49:51	Delivered	Card	Amman	2	15
33	406	11	2025-11-01 20:44:26	Delivered	Card	Amman	2	0
34	86	12	2025-12-27 21:13:11	Delivered	Transfer	Amman	2	0
35	32	1	2025-11-16 15:31:43	Delivered	Cash	Salt	3	15
36	374	11	2026-07-07 13:38:27	Delivered	Cash	Riyadh	15	0
37	401	15	2025-11-02 19:25:46	Delivered	Cash	Riyadh	15	0
38	342	15	2026-07-02 18:12:00	Shipped	Transfer	Aqaba	5	0
39	154	2	2026-06-16 15:25:47	Delivered	Card	Madaba	3	15
40	284	11	2026-07-17 15:50:05	Delivered	Card	Karak	4.5	10
41	333	2	2026-03-04 10:48:42	Delivered	Transfer	Zarqa	2.5	0
42	45	10	2026-10-21 11:59:36	Shipped	Card	Amman	2	0
43	107	15	2025-12-30 09:05:21	Delivered	Card	Amman	2	0
44	286	15	2025-11-01 17:34:12	Delivered	Cash	Amman	2	0
45	246	13	2026-06-22 12:09:47	Delivered	Card	Amman	2	0
46	499	15	2026-08-21 21:13:31	Delivered	Cash	Amman	2	5
47	271	1	2026-08-12 15:22:48	Delivered	Card	Madaba	3	0
48	222	3	2026-07-06 10:13:13	Delivered	Card	Jerash	3.5	0
49	81	8	2025-11-29 15:11:03	Delivered	Cash	Amman	2	0
50	52	6	2026-05-23 19:38:11	Delivered	Card	Karak	4.5	5
51	327	11	2026-06-18 09:05:07	Delivered	Card	Amman	2	0
52	47	13	2025-12-03 21:50:34	Delivered	Cash	Amman	2	0
53	354	3	2026-10-09 20:13:42	Cancelled	Card	Irbid	3	0
54	76	8	2026-08-15 20:02:05	Cancelled	Card	Amman	2	0
55	258	5	2026-06-28 15:08:36	Delivered	Transfer	Amman	2	20
56	20	3	2026-01-12 21:13:08	Delivered	Card	Amman	2	0
57	199	3	2025-12-13 18:27:44	Delivered	Card	Zarqa	2.5	0
58	253	1	2026-01-23 10:20:50	Delivered	Card	Zarqa	2.5	0
59	33	14	2026-09-24 22:21:49	Delivered	Cash	Riyadh	15	0
60	49	13	2026-01-03 19:56:19	Delivered	Cash	Amman	2	0
61	150	8	2026-05-19 20:47:43	Cancelled	Card	Irbid	3	10
62	126	7	2026-07-10 11:43:38	Delivered	Card	Irbid	3	0
63	465	5	2026-02-26 21:05:19	Delivered	Cash	Amman	2	0
64	469	11	2026-07-31 16:43:43	Cancelled	Card	Salt	3	0
65	443	11	2026-07-29 08:38:28	Cancelled	Transfer	Amman	2	0
66	254	6	2025-11-27 14:10:23	Cancelled	Card	Riyadh	15	10
67	424	2	2025-11-30 17:29:21	Delivered	Cash	Amman	2	5
68	451	4	2026-09-30 15:00:09	Delivered	Card	Irbid	3	0
69	127	7	2026-06-13 15:10:08	Delivered	Card	Amman	2	10
70	195	7	2026-10-05 08:10:42	Delivered	Card	Amman	2	0
71	377	2	2026-08-27 22:47:53	Delivered	Transfer	Irbid	3	5
72	342	7	2025-11-27 13:27:38	Delivered	Cash	Aqaba	5	0
73	217	10	2026-07-01 20:06:44	Delivered	Cash	Amman	2	10
74	91	6	2026-04-19 17:12:05	Cancelled	Card	Amman	2	5
75	353	11	2026-07-25 08:11:02	Delivered	Cash	Doha	16	0
76	118	11	2026-07-10 12:07:06	Delivered	Card	Amman	2	0
77	292	2	2026-09-06 18:17:13	Delivered	Cash	Irbid	3	0
78	97	14	2026-09-27 11:26:35	Delivered	Card	Irbid	3	10
79	219	10	2026-07-06 22:32:50	Delivered	Card	Karak	4.5	0
80	347	3	2026-05-23 16:55:32	Cancelled	Card	Amman	2	0
81	442	14	2026-07-21 19:46:33	Delivered	Cash	Salt	3	0
82	138	14	2026-09-24 22:17:59	Delivered	Cash	Amman	2	20
83	124	10	2026-01-08 17:18:20	Shipped	Cash	Aqaba	5	0
84	290	10	2026-10-19 18:16:55	Shipped	Cash	Amman	2	0
85	429	3	2026-05-22 11:46:46	Delivered	Card	Irbid	3	0
86	86	11	2026-03-25 10:56:11	Delivered	Cash	Amman	2	0
87	63	1	2025-11-07 14:24:01	Delivered	Transfer	Amman	2	15
88	470	13	2026-10-01 08:50:06	Delivered	Transfer	Aqaba	5	0
89	405	5	2026-04-07 10:15:03	Delivered	Card	Salt	3	0
90	445	6	2026-06-01 22:14:01	Delivered	Card	Amman	2	0
91	133	2	2025-12-10 09:23:59	Cancelled	Cash	Amman	2	0
92	167	13	2025-12-24 15:42:23	Cancelled	Card	Amman	2	0
93	329	7	2026-04-13 15:46:50	Delivered	Cash	Amman	2	0
94	207	7	2026-09-22 20:41:58	Delivered	Card	Karak	4.5	0
95	104	9	2025-12-15 08:13:54	Delivered	Transfer	Irbid	3	15
96	434	15	2026-01-11 10:53:54	Delivered	Card	Amman	2	0
97	348	11	2026-01-13 08:44:27	Delivered	Card	Amman	2	0
98	348	11	2026-04-03 19:21:28	Delivered	Cash	Amman	2	0
99	122	5	2026-08-20 19:14:27	Cancelled	Cash	Amman	2	0
100	346	1	2026-07-03 18:25:52	Delivered	Card	Aqaba	5	0
101	385	3	2026-06-11 12:10:34	Delivered	Cash	Irbid	3	10
102	112	7	2025-12-14 17:02:36	Shipped	Cash	Amman	2	0
103	480	2	2026-07-15 20:25:46	Delivered	Card	Amman	2	0
104	436	10	2025-11-20 10:43:29	Delivered	Transfer	Irbid	3	0
105	354	12	2026-09-20 19:38:41	Delivered	Card	Irbid	3	0
106	22	3	2026-10-16 11:39:38	Delivered	Card	Salt	3	0
107	47	6	2026-04-10 12:10:04	Delivered	Cash	Amman	2	0
108	55	14	2026-08-19 13:54:18	Delivered	Transfer	Amman	2	0
109	180	11	2026-10-16 15:16:56	Cancelled	Card	Irbid	3	0
110	198	7	2025-12-08 21:29:42	Delivered	Card	Amman	2	10
111	379	8	2026-02-11 09:20:21	Shipped	Card	Amman	2	0
112	233	1	2026-09-24 17:02:38	Delivered	Transfer	Irbid	3	5
113	129	3	2025-12-12 19:28:55	Delivered	Transfer	Amman	2	0
114	484	11	2026-09-18 13:26:30	Delivered	Cash	Amman	2	0
115	6	11	2026-09-09 18:37:39	Delivered	Transfer	Salt	3	5
116	392	15	2026-10-12 16:46:00	New	Transfer	Aqaba	5	0
117	178	2	2026-10-11 22:19:32	Cancelled	Card	Irbid	3	20
118	161	8	2026-06-14 13:11:35	Delivered	Card	Irbid	3	10
119	428	15	2025-12-15 09:05:41	Delivered	Cash	Zarqa	2.5	5
120	337	3	2026-06-04 20:29:35	Delivered	Card	Riyadh	15	0
121	134	11	2026-10-04 21:57:50	Cancelled	Cash	Amman	2	10
122	298	6	2026-05-29 17:27:15	Delivered	Card	Amman	2	0
123	84	2	2026-04-12 14:14:06	Delivered	Cash	Riyadh	15	0
124	98	1	2025-12-18 08:40:49	Delivered	Card	Amman	2	15
125	59	14	2026-07-29 20:22:11	Delivered	Cash	Aqaba	5	0
126	380	10	2026-09-05 09:59:09	Delivered	Card	Irbid	3	0
127	459	8	2026-02-15 15:50:01	Delivered	Card	Irbid	3	0
128	316	10	2025-11-17 13:22:30	Shipped	Cash	Zarqa	2.5	0
129	267	14	2026-07-24 10:13:55	Delivered	Cash	Amman	2	0
130	232	3	2026-07-12 14:59:12	Delivered	Transfer	Karak	4.5	5
131	311	10	2026-09-07 11:36:22	Delivered	Cash	Amman	2	0
132	263	3	2026-05-23 10:51:20	Delivered	Cash	Amman	2	0
133	5	5	2026-10-19 13:13:29	Shipped	Cash	Amman	2	0
134	401	7	2026-10-10 22:41:26	Shipped	Transfer	Riyadh	15	0
135	129	3	2026-01-01 10:38:20	Delivered	Cash	Amman	2	0
136	265	14	2026-07-29 18:01:04	Delivered	Card	Zarqa	2.5	0
137	382	8	2026-07-11 14:19:44	Shipped	Card	Amman	2	10
138	431	13	2026-10-07 10:05:12	Shipped	Transfer	Zarqa	2.5	0
139	445	10	2025-11-23 12:04:16	Delivered	Transfer	Amman	2	0
140	337	5	2026-07-26 17:30:42	Delivered	Card	Riyadh	15	0
141	35	6	2026-07-12 08:42:13	Delivered	Card	Zarqa	2.5	0
142	424	7	2025-12-25 11:58:23	Delivered	Card	Amman	2	0
143	286	1	2025-12-23 22:06:47	Delivered	Card	Amman	2	0
144	170	7	2026-03-13 16:27:32	Delivered	Card	Dubai	15	0
145	263	15	2026-07-11 09:43:03	Delivered	Cash	Amman	2	0
146	349	11	2026-05-27 09:14:46	Delivered	Card	Zarqa	2.5	0
147	136	12	2025-11-02 16:58:44	Delivered	Transfer	Amman	2	0
148	158	1	2026-06-22 08:42:30	Delivered	Transfer	Karak	4.5	10
149	169	1	2026-07-01 15:55:15	Delivered	Cash	Amman	2	0
150	371	12	2025-12-19 20:47:21	Delivered	Transfer	Amman	2	0
151	453	1	2026-09-02 12:43:33	Delivered	Transfer	Riyadh	15	10
152	488	10	2026-05-04 09:12:58	Cancelled	Transfer	Amman	2	10
153	125	15	2026-10-14 13:25:37	Delivered	Cash	Amman	2	0
154	487	3	2026-10-24 09:00:31	Cancelled	Card	Zarqa	2.5	0
155	241	13	2025-12-04 08:29:02	Delivered	Cash	Amman	2	0
156	23	15	2026-01-10 12:50:54	Delivered	Card	Irbid	3	15
157	318	5	2026-07-28 22:06:57	Delivered	Cash	Amman	2	0
158	61	10	2026-08-11 12:05:19	Delivered	Card	Aqaba	5	0
159	232	1	2026-06-07 14:29:01	Cancelled	Card	Karak	4.5	0
160	288	1	2026-05-11 16:57:36	Cancelled	Transfer	Salt	3	0
161	409	9	2026-08-17 13:55:03	Delivered	Card	Karak	4.5	5
162	469	3	2026-10-25 19:12:07	New	Transfer	Salt	3	0
163	249	3	2026-06-20 09:19:25	Delivered	Cash	Irbid	3	10
164	330	12	2026-01-03 18:01:11	Delivered	Cash	Zarqa	2.5	0
165	231	1	2026-06-06 12:29:07	Delivered	Cash	Amman	2	0
166	130	14	2026-01-21 21:55:32	Delivered	Card	Salt	3	0
167	280	11	2026-07-15 20:08:17	Delivered	Transfer	Madaba	3	0
168	330	10	2026-03-13 13:37:37	Delivered	Card	Zarqa	2.5	0
169	492	12	2026-03-02 22:11:46	Cancelled	Card	Karak	4.5	0
170	152	3	2026-08-29 10:40:36	Delivered	Card	Amman	2	0
171	263	1	2026-02-07 08:40:42	Delivered	Cash	Amman	2	0
172	283	2	2026-09-05 13:39:57	Delivered	Cash	Madaba	3	0
173	388	5	2026-04-02 15:14:03	Delivered	Cash	Aqaba	5	15
174	469	2	2026-09-16 17:03:34	Delivered	Card	Salt	3	10
175	30	15	2026-05-14 19:21:59	Delivered	Cash	Amman	2	0
176	127	7	2025-11-22 15:32:14	Delivered	Cash	Amman	2	10
177	274	7	2025-11-27 14:44:08	Delivered	Cash	Zarqa	2.5	0
178	292	9	2026-02-25 20:56:51	Delivered	Transfer	Irbid	3	0
179	58	15	2026-09-02 09:42:04	Delivered	Cash	Zarqa	2.5	5
180	436	2	2026-03-06 12:20:44	Delivered	Cash	Irbid	3	0
181	354	7	2026-08-05 11:44:28	Delivered	Cash	Irbid	3	0
182	413	14	2025-12-14 21:39:24	Delivered	Card	Karak	4.5	0
183	25	10	2026-04-06 20:22:59	Delivered	Transfer	Riyadh	15	15
184	360	5	2025-11-30 16:24:46	Cancelled	Transfer	Amman	2	0
185	232	5	2026-03-02 08:17:51	Delivered	Transfer	Karak	4.5	5
186	388	5	2026-09-08 12:36:42	Delivered	Cash	Aqaba	5	0
187	103	5	2025-11-30 09:17:57	Delivered	Cash	Dubai	15	0
188	23	9	2025-12-29 10:43:32	Cancelled	Cash	Irbid	3	5
189	299	3	2026-04-29 16:28:07	Delivered	Cash	Amman	2	0
190	76	10	2025-11-23 10:58:37	Delivered	Transfer	Amman	2	0
191	496	8	2026-08-17 17:40:35	Delivered	Cash	Irbid	3	10
192	459	12	2026-04-18 20:23:14	Delivered	Cash	Irbid	3	0
193	301	2	2026-06-18 11:36:52	Delivered	Card	Amman	2	5
194	148	14	2026-07-08 16:09:36	Delivered	Cash	Amman	2	0
195	233	3	2025-12-22 08:53:27	Delivered	Cash	Irbid	3	0
196	113	10	2026-05-18 22:52:57	Delivered	Cash	Amman	2	5
197	459	11	2026-09-19 21:27:18	Delivered	Card	Irbid	3	5
198	184	2	2026-06-13 19:37:17	Cancelled	Cash	Amman	2	0
199	360	2	2026-02-16 12:36:56	Delivered	Cash	Amman	2	0
200	251	13	2026-01-26 22:02:57	Delivered	Cash	Amman	2	10
201	283	11	2026-08-21 21:29:18	Cancelled	Transfer	Madaba	3	0
202	155	12	2026-09-13 15:40:47	Delivered	Card	Amman	2	0
203	318	11	2025-12-28 17:24:55	Cancelled	Cash	Amman	2	0
204	370	3	2025-11-02 15:35:39	Delivered	Card	Madaba	3	0
205	337	5	2026-07-09 14:38:22	Delivered	Cash	Riyadh	15	15
206	478	14	2026-10-05 19:25:45	Delivered	Transfer	Aqaba	5	10
207	425	7	2026-07-22 20:20:16	Delivered	Transfer	Amman	2	0
208	146	10	2026-05-29 22:10:34	Delivered	Transfer	Zarqa	2.5	0
209	354	12	2026-09-04 19:21:58	Delivered	Cash	Irbid	3	0
210	116	6	2025-11-07 08:48:33	Delivered	Card	Amman	2	0
211	35	12	2026-07-17 20:46:26	Delivered	Card	Zarqa	2.5	10
212	215	11	2025-11-12 15:12:06	Delivered	Card	Aqaba	5	0
213	240	6	2026-10-24 08:31:46	New	Card	Irbid	3	0
214	108	13	2026-07-13 09:41:19	Delivered	Transfer	Amman	2	0
215	116	9	2026-01-12 21:30:33	Delivered	Cash	Amman	2	5
216	297	8	2025-11-03 11:48:35	Delivered	Cash	Amman	2	0
217	430	12	2025-12-12 14:44:04	Delivered	Cash	Madaba	3	5
218	22	12	2026-06-06 18:51:33	Delivered	Card	Salt	3	0
219	464	11	2026-10-13 13:39:56	Delivered	Cash	Salt	3	0
220	258	12	2026-06-06 11:59:21	Cancelled	Transfer	Amman	2	0
221	34	7	2025-11-03 11:12:44	Delivered	Cash	Amman	2	0
222	8	12	2026-02-07 21:58:55	Delivered	Card	Salt	3	5
223	57	14	2026-07-26 20:24:21	Delivered	Card	Amman	2	15
224	468	2	2026-09-11 10:30:55	Delivered	Transfer	Irbid	3	0
225	382	14	2026-07-01 21:33:20	Delivered	Transfer	Amman	2	15
226	219	11	2026-04-28 21:23:54	Delivered	Card	Karak	4.5	0
227	368	5	2025-11-06 13:33:12	Delivered	Cash	Irbid	3	0
228	129	7	2025-11-30 21:01:55	Delivered	Card	Amman	2	0
229	271	11	2026-07-13 08:39:57	Delivered	Cash	Madaba	3	10
230	223	3	2025-12-02 21:34:17	Shipped	Card	Amman	2	0
231	256	3	2026-10-07 21:42:42	Delivered	Card	Irbid	3	0
232	303	15	2026-10-19 10:40:47	Cancelled	Cash	Amman	2	0
233	42	3	2026-09-25 22:05:11	Delivered	Card	Riyadh	15	15
234	433	2	2026-01-24 14:45:18	Delivered	Cash	Amman	2	0
235	140	6	2026-10-24 09:31:22	Shipped	Card	Madaba	3	0
236	394	5	2026-02-15 16:35:53	Delivered	Card	Amman	2	0
237	256	9	2026-09-20 10:29:37	Delivered	Card	Irbid	3	10
238	452	3	2026-01-21 13:21:41	Cancelled	Card	Amman	2	0
239	347	6	2026-05-24 11:16:46	Delivered	Card	Amman	2	0
240	15	15	2026-07-21 12:56:38	Cancelled	Cash	Dubai	15	20
241	397	14	2026-07-27 15:00:42	Delivered	Cash	Dubai	15	0
242	383	6	2025-11-03 13:06:30	Delivered	Cash	Irbid	3	0
243	461	5	2026-05-18 20:59:08	Delivered	Cash	Irbid	3	0
244	177	15	2026-05-23 08:39:38	Delivered	Card	Amman	2	0
245	163	13	2026-10-01 10:18:19	Delivered	Cash	Amman	2	15
246	7	8	2026-04-13 16:24:43	Delivered	Transfer	Irbid	3	0
247	180	3	2026-07-01 21:34:23	Delivered	Card	Irbid	3	5
248	306	8	2026-06-21 15:18:02	Delivered	Card	Irbid	3	10
249	271	10	2026-07-22 14:01:28	Delivered	Card	Madaba	3	0
250	40	5	2025-12-19 10:40:31	Delivered	Transfer	Amman	2	0
251	359	3	2026-07-27 08:04:20	Delivered	Transfer	Amman	2	0
252	365	4	2025-12-11 14:07:50	Delivered	Cash	Amman	2	0
253	368	3	2026-02-04 18:02:38	Delivered	Cash	Irbid	3	0
254	129	1	2026-06-25 18:20:06	Delivered	Cash	Amman	2	0
255	7	12	2026-04-24 21:28:09	Delivered	Cash	Irbid	3	0
256	39	7	2026-07-30 12:48:20	Delivered	Cash	Madaba	3	0
257	181	3	2026-08-03 17:54:07	Delivered	Transfer	Amman	2	0
258	169	10	2026-02-20 17:17:20	Delivered	Card	Amman	2	0
259	202	3	2026-06-26 22:28:10	Cancelled	Cash	Amman	2	0
260	210	10	2026-08-16 18:01:39	Delivered	Card	Amman	2	0
261	312	13	2026-10-17 13:01:47	Shipped	Card	Irbid	3	0
262	354	2	2026-08-17 22:45:58	Delivered	Cash	Irbid	3	0
263	85	14	2026-06-26 09:51:38	Delivered	Transfer	Amman	2	0
264	445	11	2026-08-03 20:38:41	Shipped	Card	Amman	2	10
265	355	7	2025-11-21 19:59:32	Delivered	Card	Madaba	3	0
266	100	8	2026-03-21 19:04:29	Cancelled	Cash	Jerash	3.5	0
267	349	5	2026-08-18 08:48:08	Delivered	Cash	Zarqa	2.5	0
268	74	12	2026-09-21 19:28:43	Delivered	Card	Amman	2	0
269	69	8	2025-11-07 19:32:47	Cancelled	Card	Amman	2	10
270	8	10	2025-12-04 12:13:14	Delivered	Card	Salt	3	0
271	198	8	2025-12-21 16:04:17	Delivered	Card	Amman	2	10
272	344	12	2026-06-22 17:17:35	Delivered	Card	Madaba	3	10
273	24	3	2026-09-21 15:07:28	Delivered	Card	Salt	3	0
274	445	15	2026-09-26 20:40:39	Delivered	Cash	Amman	2	0
275	143	10	2026-07-31 12:43:35	Delivered	Cash	Amman	2	5
276	252	2	2026-07-12 09:48:27	Delivered	Transfer	Amman	2	0
277	145	15	2026-04-06 16:30:06	Delivered	Cash	Zarqa	2.5	0
278	327	7	2026-10-03 19:17:14	Cancelled	Transfer	Amman	2	0
279	367	12	2026-10-10 17:25:48	Delivered	Card	Dubai	15	15
280	378	5	2025-11-10 11:13:42	Delivered	Card	Amman	2	0
281	49	15	2026-03-05 19:30:46	Delivered	Transfer	Amman	2	5
282	130	12	2026-05-09 12:07:30	Delivered	Cash	Salt	3	5
283	43	8	2026-03-06 16:48:42	Delivered	Cash	Zarqa	2.5	0
284	224	3	2026-06-24 15:14:29	Delivered	Transfer	Madaba	3	0
285	401	9	2025-11-25 08:58:32	Delivered	Transfer	Riyadh	15	15
286	264	10	2026-09-25 21:05:36	Cancelled	Transfer	Amman	2	5
287	474	1	2025-11-11 12:00:39	Delivered	Cash	Doha	16	0
288	448	2	2026-08-23 20:09:13	Delivered	Card	Salt	3	15
289	330	3	2026-02-12 14:17:14	Cancelled	Card	Zarqa	2.5	0
290	184	13	2026-06-17 11:13:49	Delivered	Cash	Amman	2	0
291	90	15	2025-12-17 13:30:16	Delivered	Cash	Amman	2	0
292	33	6	2026-09-30 19:05:41	Delivered	Card	Riyadh	15	15
293	65	11	2026-03-08 08:08:33	Delivered	Card	Irbid	3	0
294	403	8	2026-07-14 22:07:50	Delivered	Cash	Amman	2	0
295	354	7	2026-08-08 08:22:57	Delivered	Cash	Irbid	3	15
296	402	5	2026-06-04 15:57:57	Delivered	Card	Amman	2	15
297	57	2	2026-07-22 10:14:42	Delivered	Card	Amman	2	10
298	231	2	2026-08-30 17:56:17	Delivered	Card	Amman	2	0
299	8	1	2026-09-21 20:15:10	Delivered	Card	Salt	3	10
300	202	5	2026-02-18 12:34:28	Delivered	Card	Amman	2	15
301	401	6	2026-07-08 15:42:06	Delivered	Card	Riyadh	15	0
302	141	15	2026-06-25 14:35:05	Cancelled	Cash	Irbid	3	10
303	263	15	2025-11-25 13:34:14	Delivered	Cash	Amman	2	0
304	303	15	2026-02-12 14:18:24	Cancelled	Transfer	Amman	2	0
305	33	13	2026-05-30 15:52:10	Delivered	Transfer	Riyadh	15	0
306	130	7	2026-05-25 19:37:43	Delivered	Card	Salt	3	5
307	108	3	2026-08-17 09:34:47	Delivered	Transfer	Amman	2	5
308	345	12	2026-07-08 11:33:06	Delivered	Transfer	Amman	2	10
309	350	14	2026-06-10 18:06:55	Delivered	Card	Amman	2	10
310	8	5	2026-07-07 15:14:37	Delivered	Transfer	Salt	3	10
311	336	2	2025-11-22 17:53:50	Delivered	Cash	Amman	2	15
312	300	14	2026-06-27 08:22:41	Delivered	Card	Irbid	3	0
313	357	4	2026-03-10 18:22:22	Cancelled	Card	Madaba	3	0
314	159	5	2026-09-12 20:53:14	Delivered	Transfer	Amman	2	0
315	427	3	2026-06-26 20:28:57	Delivered	Cash	Amman	2	0
316	322	2	2026-07-08 16:11:25	Delivered	Cash	Amman	2	5
317	223	3	2025-11-21 10:42:17	Delivered	Card	Amman	2	0
318	240	14	2026-09-19 16:36:12	Delivered	Card	Irbid	3	0
319	178	14	2026-10-03 13:04:44	Delivered	Transfer	Irbid	3	0
320	235	12	2026-06-07 21:38:14	Delivered	Card	Amman	2	0
321	69	14	2026-10-16 19:17:36	Delivered	Cash	Amman	2	0
322	251	1	2026-05-28 16:43:37	Delivered	Card	Amman	2	5
323	305	10	2026-07-30 10:46:12	Delivered	Card	Amman	2	0
324	52	6	2025-12-16 14:36:44	Cancelled	Card	Karak	4.5	0
325	246	10	2026-02-03 11:14:22	Shipped	Cash	Amman	2	5
326	180	5	2026-01-26 16:00:00	Delivered	Transfer	Irbid	3	0
327	318	15	2026-09-05 11:22:06	Cancelled	Card	Amman	2	0
328	147	14	2026-03-30 18:11:37	Delivered	Card	Zarqa	2.5	0
329	162	1	2026-05-07 21:31:12	Delivered	Cash	Amman	2	20
330	424	11	2025-12-17 13:58:33	Delivered	Card	Amman	2	5
331	313	5	2026-05-26 09:31:01	Delivered	Card	Amman	2	0
332	362	8	2026-08-01 12:24:12	Delivered	Transfer	Riyadh	15	0
333	22	1	2026-02-18 10:57:14	Delivered	Cash	Salt	3	0
334	465	15	2025-11-03 18:52:58	Delivered	Transfer	Amman	2	10
335	122	3	2026-06-05 19:55:57	Delivered	Transfer	Amman	2	5
336	90	11	2026-07-08 08:40:44	Delivered	Card	Amman	2	0
337	453	4	2026-07-09 16:20:10	Cancelled	Card	Riyadh	15	15
338	275	2	2026-08-11 16:02:30	Delivered	Cash	Zarqa	2.5	0
339	219	11	2026-05-09 10:28:38	Delivered	Card	Karak	4.5	20
340	84	15	2026-06-25 18:03:25	Delivered	Card	Riyadh	15	0
341	421	5	2026-09-05 16:10:09	Delivered	Cash	Aqaba	5	0
342	22	13	2025-12-24 08:24:00	Delivered	Card	Salt	3	0
343	134	10	2026-09-12 22:47:15	Delivered	Cash	Amman	2	20
344	218	14	2026-05-23 15:26:45	Cancelled	Transfer	Irbid	3	0
345	229	12	2026-05-18 13:20:42	Delivered	Cash	Madaba	3	0
346	331	6	2026-09-13 15:35:55	Delivered	Card	Amman	2	0
347	144	3	2026-10-18 11:13:21	Shipped	Card	Amman	2	0
348	189	10	2026-10-08 19:43:36	Shipped	Card	Amman	2	5
349	362	10	2026-07-08 22:48:39	Delivered	Cash	Riyadh	15	0
350	148	6	2026-09-17 10:13:19	Delivered	Transfer	Amman	2	0
351	71	9	2026-06-01 22:39:26	Delivered	Card	Amman	2	20
352	224	12	2026-05-11 14:30:24	Delivered	Card	Madaba	3	20
353	225	15	2025-11-11 18:36:22	Cancelled	Transfer	Amman	2	0
354	69	15	2026-10-09 18:20:18	Shipped	Cash	Amman	2	0
355	124	11	2026-06-10 12:47:48	Delivered	Cash	Aqaba	5	0
356	348	11	2026-04-21 16:54:50	Delivered	Cash	Amman	2	0
357	431	2	2026-05-04 10:51:48	Delivered	Card	Zarqa	2.5	0
358	485	2	2026-06-24 13:50:42	Delivered	Card	Amman	2	0
359	23	3	2025-12-11 18:33:12	Delivered	Transfer	Irbid	3	0
360	433	3	2025-12-19 16:00:05	Delivered	Cash	Amman	2	0
361	294	13	2026-10-25 18:18:13	New	Card	Amman	2	0
362	38	12	2026-06-17 19:43:05	Delivered	Transfer	Zarqa	2.5	0
363	171	15	2026-07-04 12:48:31	Delivered	Cash	Amman	2	0
364	231	12	2026-05-26 22:29:28	Delivered	Card	Amman	2	15
365	406	7	2026-01-28 10:13:06	Delivered	Cash	Amman	2	0
366	219	1	2026-01-21 18:03:22	Cancelled	Cash	Karak	4.5	0
367	399	5	2026-06-02 12:40:10	Delivered	Card	Amman	2	0
368	31	15	2026-06-17 11:13:20	Delivered	Transfer	Zarqa	2.5	0
369	303	14	2026-03-08 15:56:01	Delivered	Card	Amman	2	0
370	452	5	2026-03-17 14:49:12	Delivered	Cash	Amman	2	10
371	155	8	2026-10-12 10:50:17	New	Cash	Amman	2	10
372	465	8	2026-09-06 19:03:47	Cancelled	Card	Amman	2	0
373	142	7	2026-04-20 08:01:41	Delivered	Card	Zarqa	2.5	5
374	302	14	2026-07-18 10:20:01	Delivered	Card	Salt	3	0
375	314	1	2026-10-21 10:20:39	Delivered	Cash	Amman	2	0
376	32	3	2025-12-05 09:33:10	Cancelled	Card	Salt	3	20
377	243	3	2026-10-04 14:41:50	Delivered	Transfer	Irbid	3	5
378	323	1	2026-08-13 18:53:44	Delivered	Cash	Riyadh	15	0
379	196	7	2026-07-20 15:01:42	Delivered	Cash	Amman	2	0
380	168	6	2025-12-12 13:32:57	Delivered	Cash	Amman	2	0
381	417	2	2026-09-08 11:20:57	Delivered	Cash	Amman	2	0
382	22	12	2025-12-25 21:13:12	Delivered	Cash	Salt	3	0
383	281	3	2026-03-10 08:19:00	Delivered	Cash	Amman	2	0
384	116	14	2026-09-12 08:54:01	Delivered	Transfer	Amman	2	15
385	75	6	2026-02-18 18:12:27	Delivered	Cash	Amman	2	0
386	445	14	2026-02-13 18:47:43	Delivered	Transfer	Amman	2	0
387	127	6	2026-08-16 19:44:09	Delivered	Card	Amman	2	0
388	89	14	2026-10-20 08:41:02	Delivered	Card	Irbid	3	15
389	179	3	2026-08-10 13:47:40	Delivered	Card	Amman	2	0
390	371	4	2026-07-12 14:23:27	Delivered	Cash	Amman	2	15
391	165	3	2026-09-17 13:34:40	Delivered	Card	Amman	2	0
392	22	3	2025-12-24 12:59:35	Delivered	Cash	Salt	3	5
393	261	15	2026-05-21 13:47:26	Delivered	Cash	Irbid	3	0
394	244	13	2025-12-07 12:15:48	Delivered	Card	Salt	3	0
395	118	10	2025-12-31 13:42:25	Delivered	Cash	Amman	2	0
396	318	1	2026-10-23 15:02:31	New	Card	Amman	2	10
397	474	12	2026-10-17 08:24:02	New	Cash	Doha	16	0
398	316	7	2025-12-19 19:21:15	Delivered	Cash	Zarqa	2.5	0
399	15	9	2026-07-18 16:11:29	Delivered	Transfer	Dubai	15	0
400	22	2	2026-09-04 09:43:09	Cancelled	Card	Salt	3	0
401	85	9	2026-06-04 10:14:21	Cancelled	Card	Amman	2	5
402	12	14	2026-07-13 19:27:01	Delivered	Card	Amman	2	0
403	42	14	2026-08-29 16:58:15	Cancelled	Cash	Riyadh	15	0
404	124	9	2025-12-05 18:11:37	Delivered	Cash	Aqaba	5	0
405	30	1	2026-10-10 16:42:17	Shipped	Transfer	Amman	2	0
406	270	12	2026-09-21 10:54:32	Delivered	Card	Zarqa	2.5	20
407	207	12	2026-09-17 11:52:16	Delivered	Cash	Karak	4.5	0
408	180	7	2026-06-19 21:14:47	Cancelled	Transfer	Irbid	3	0
409	245	11	2026-08-27 08:26:04	Delivered	Card	Karak	4.5	5
410	325	14	2026-09-19 16:38:20	Cancelled	Card	Karak	4.5	0
411	63	10	2026-04-22 15:21:34	Delivered	Cash	Amman	2	0
412	91	11	2026-06-06 14:17:16	Delivered	Cash	Amman	2	0
413	98	5	2026-06-25 10:07:46	Delivered	Cash	Amman	2	0
414	231	6	2026-04-24 17:04:16	Delivered	Card	Amman	2	0
415	131	8	2026-08-18 12:03:27	Delivered	Cash	Salt	3	0
416	373	5	2025-11-28 09:17:06	Delivered	Card	Madaba	3	15
417	135	15	2026-03-04 17:38:36	Delivered	Card	Madaba	3	0
418	83	12	2026-05-16 17:01:10	Delivered	Transfer	Zarqa	2.5	0
419	132	14	2025-11-02 12:27:37	Cancelled	Card	Madaba	3	0
420	12	8	2026-03-20 18:31:27	Delivered	Cash	Amman	2	0
421	81	11	2026-05-26 13:22:25	Delivered	Transfer	Amman	2	0
422	12	7	2026-08-20 14:01:31	Delivered	Card	Amman	2	0
423	122	8	2026-01-20 21:37:41	Delivered	Cash	Amman	2	0
424	352	8	2026-01-21 19:35:03	Delivered	Cash	Amman	2	0
425	87	10	2026-05-29 16:04:14	Cancelled	Card	Zarqa	2.5	5
426	35	7	2025-12-22 20:11:34	Delivered	Card	Zarqa	2.5	5
427	254	1	2025-11-11 22:03:25	Delivered	Cash	Riyadh	15	0
428	22	11	2026-05-13 12:29:33	Delivered	Card	Salt	3	0
429	261	3	2026-05-28 21:31:08	Delivered	Card	Irbid	3	0
430	181	7	2026-05-11 15:12:48	Delivered	Card	Amman	2	0
431	108	14	2026-08-17 14:29:45	Delivered	Card	Amman	2	0
432	464	11	2026-04-01 13:29:58	Delivered	Card	Salt	3	0
433	469	3	2026-09-13 13:12:19	Cancelled	Transfer	Salt	3	0
434	395	8	2026-09-11 13:18:23	Delivered	Cash	Aqaba	5	0
435	281	11	2025-12-05 10:59:52	Delivered	Card	Amman	2	5
436	46	15	2026-05-16 11:02:02	Delivered	Cash	Amman	2	0
437	461	7	2025-11-01 10:54:02	Delivered	Cash	Irbid	3	0
438	157	9	2026-10-07 10:42:43	Cancelled	Card	Irbid	3	5
439	487	2	2026-09-04 17:19:51	Cancelled	Cash	Zarqa	2.5	0
440	206	10	2026-05-24 13:19:05	Delivered	Transfer	Zarqa	2.5	0
441	159	15	2026-05-09 11:31:56	Shipped	Card	Amman	2	0
442	297	12	2026-08-31 09:06:05	Delivered	Cash	Amman	2	0
443	157	15	2025-11-20 09:02:39	Delivered	Card	Irbid	3	10
444	64	8	2026-06-25 12:10:41	Delivered	Card	Amman	2	0
445	172	13	2026-07-19 18:45:52	Delivered	Cash	Amman	2	20
446	69	2	2026-01-19 08:37:56	Delivered	Card	Amman	2	0
447	287	11	2026-07-05 09:59:41	Delivered	Card	Amman	2	0
448	421	6	2026-03-10 21:31:29	Delivered	Card	Aqaba	5	0
449	371	7	2026-10-25 21:50:10	Cancelled	Card	Amman	2	20
450	354	13	2026-09-09 08:40:23	Delivered	Card	Irbid	3	0
451	330	10	2026-07-17 14:56:33	Shipped	Card	Zarqa	2.5	0
452	464	1	2026-08-30 12:19:57	Delivered	Cash	Salt	3	10
453	22	13	2026-06-19 08:27:03	Cancelled	Cash	Salt	3	5
454	191	2	2026-04-18 18:12:00	Delivered	Card	Amman	2	15
455	122	3	2026-10-03 12:26:10	Cancelled	Cash	Amman	2	0
456	50	7	2026-08-03 16:49:53	Delivered	Cash	Amman	2	0
457	393	13	2025-12-15 10:09:21	Delivered	Card	Irbid	3	0
458	382	15	2026-10-24 19:14:53	Shipped	Card	Amman	2	5
459	22	15	2026-06-20 17:22:01	Shipped	Card	Salt	3	0
460	51	2	2026-01-09 16:35:46	Delivered	Transfer	Amman	2	5
461	500	7	2026-10-23 14:09:17	New	Cash	Amman	2	0
462	12	8	2026-03-26 19:05:55	Delivered	Card	Amman	2	0
463	150	1	2026-01-03 11:37:51	Delivered	Cash	Irbid	3	5
464	456	5	2026-10-03 22:25:48	Cancelled	Transfer	Amman	2	0
465	47	6	2026-08-29 22:30:02	Delivered	Card	Amman	2	0
466	49	15	2025-11-09 19:45:08	Delivered	Transfer	Amman	2	0
467	100	6	2026-08-14 21:33:18	Delivered	Card	Jerash	3.5	10
468	56	6	2026-06-04 17:31:00	Cancelled	Cash	Amman	2	0
469	53	12	2026-10-10 19:02:14	New	Card	Amman	2	0
470	285	2	2026-09-30 09:53:44	Delivered	Cash	Amman	2	0
471	68	4	2026-05-19 21:42:54	Cancelled	Card	Amman	2	0
472	30	2	2026-10-22 15:33:18	New	Cash	Amman	2	0
473	166	7	2026-09-26 11:44:55	Delivered	Card	Doha	16	0
474	109	2	2026-07-07 16:32:41	Cancelled	Card	Amman	2	0
475	49	14	2026-03-25 11:48:42	Cancelled	Card	Amman	2	15
476	2	4	2026-02-08 19:19:46	Delivered	Transfer	Madaba	3	0
477	184	6	2026-09-16 11:20:02	Delivered	Card	Amman	2	0
478	449	15	2026-02-27 08:13:29	Delivered	Cash	Amman	2	0
479	227	13	2026-02-16 22:15:39	Delivered	Card	Irbid	3	0
480	47	11	2026-07-16 22:36:17	Delivered	Transfer	Amman	2	5
481	336	3	2026-02-07 10:14:47	Delivered	Transfer	Amman	2	0
482	308	12	2026-02-15 22:46:13	Delivered	Card	Zarqa	2.5	10
483	83	2	2025-11-18 18:53:57	Delivered	Cash	Zarqa	2.5	0
484	354	15	2026-10-12 22:59:37	Cancelled	Transfer	Irbid	3	10
485	282	5	2026-06-18 17:53:50	Delivered	Card	Amman	2	15
486	288	15	2026-10-22 08:14:47	Shipped	Cash	Salt	3	0
487	251	6	2026-09-07 09:15:34	Delivered	Card	Amman	2	0
488	216	8	2026-02-17 20:14:44	Delivered	Card	Riyadh	15	0
489	16	13	2025-11-06 20:42:44	Delivered	Cash	Zarqa	2.5	0
490	148	4	2026-07-17 16:41:18	Delivered	Cash	Amman	2	5
491	148	1	2026-10-16 14:29:01	Delivered	Card	Amman	2	10
492	354	7	2026-08-22 14:24:36	Delivered	Card	Irbid	3	0
493	233	7	2026-05-28 14:38:54	Delivered	Card	Irbid	3	20
494	118	4	2026-07-29 16:58:33	Delivered	Card	Amman	2	15
495	92	11	2026-02-05 09:25:17	Delivered	Cash	Amman	2	0
496	145	2	2026-04-02 11:56:26	Delivered	Card	Zarqa	2.5	10
497	22	12	2026-05-19 18:24:10	Delivered	Card	Salt	3	10
498	341	15	2026-04-24 10:18:12	Cancelled	Cash	Amman	2	0
499	263	11	2025-11-12 19:06:23	Delivered	Card	Amman	2	10
500	303	10	2026-10-23 19:21:02	New	Transfer	Amman	2	0
501	401	14	2025-12-17 17:29:33	Delivered	Cash	Riyadh	15	0
502	203	8	2025-11-18 09:58:48	Delivered	Card	Amman	2	0
503	262	13	2025-11-08 10:13:52	Delivered	Card	Aqaba	5	0
504	343	13	2026-04-20 19:31:16	Delivered	Card	Irbid	3	15
505	320	8	2026-08-22 16:18:14	Delivered	Cash	Irbid	3	0
506	302	7	2026-09-13 11:28:17	Delivered	Cash	Salt	3	15
507	385	13	2026-06-12 22:25:27	Delivered	Cash	Irbid	3	0
508	10	6	2025-11-22 21:03:33	Cancelled	Card	Irbid	3	0
509	477	7	2026-09-03 22:21:22	Delivered	Card	Aqaba	5	0
510	492	9	2026-03-16 08:07:15	Delivered	Card	Karak	4.5	20
511	203	2	2026-02-17 13:39:46	Delivered	Card	Amman	2	0
512	311	12	2026-09-17 17:36:51	Delivered	Cash	Amman	2	0
513	229	10	2026-07-26 16:50:23	Delivered	Card	Madaba	3	0
514	447	12	2025-12-26 20:51:52	Delivered	Card	Salt	3	0
515	277	14	2026-01-19 09:29:48	Delivered	Card	Zarqa	2.5	0
516	108	4	2026-04-27 18:38:58	Delivered	Transfer	Amman	2	0
517	445	6	2025-12-31 22:44:36	Delivered	Card	Amman	2	10
518	342	6	2026-06-11 09:50:35	Delivered	Card	Aqaba	5	0
519	90	14	2026-07-29 13:59:48	Delivered	Card	Amman	2	0
520	22	1	2025-11-16 10:30:48	Delivered	Transfer	Salt	3	0
521	27	10	2026-05-18 09:05:42	Delivered	Transfer	Aqaba	5	10
522	27	12	2026-09-28 12:40:38	Delivered	Cash	Aqaba	5	0
523	289	3	2026-06-15 18:09:03	Delivered	Cash	Aqaba	5	0
524	296	12	2026-04-26 20:05:47	Cancelled	Transfer	Amman	2	15
525	124	15	2026-02-08 15:14:05	Cancelled	Cash	Aqaba	5	5
526	451	2	2026-07-29 09:38:10	Delivered	Card	Irbid	3	0
527	165	5	2026-01-02 15:04:57	Delivered	Cash	Amman	2	0
528	498	7	2026-03-02 18:16:53	Delivered	Cash	Aqaba	5	0
529	441	8	2026-08-29 10:06:40	Delivered	Transfer	Karak	4.5	0
530	108	11	2026-10-08 09:54:32	Delivered	Cash	Amman	2	0
531	12	15	2026-08-29 18:27:25	Delivered	Card	Amman	2	5
532	68	11	2025-11-08 08:24:34	Delivered	Cash	Amman	2	0
533	194	15	2026-10-04 20:21:34	Shipped	Card	Aqaba	5	0
534	64	9	2026-08-18 15:48:38	Cancelled	Card	Amman	2	0
535	389	5	2025-11-09 10:57:58	Delivered	Cash	Amman	2	0
536	138	8	2026-01-06 17:21:54	Delivered	Card	Amman	2	0
537	230	3	2025-11-19 15:05:22	Cancelled	Card	Riyadh	15	0
538	334	14	2026-06-25 16:31:24	Delivered	Card	Karak	4.5	0
539	93	6	2025-11-20 16:20:43	Delivered	Cash	Amman	2	0
540	192	2	2026-09-14 15:36:02	Delivered	Cash	Salt	3	0
541	163	8	2026-07-31 18:43:58	Delivered	Cash	Amman	2	20
542	202	12	2026-08-29 19:14:21	Delivered	Card	Amman	2	0
543	424	5	2026-04-16 13:48:31	Delivered	Cash	Amman	2	0
544	448	7	2026-08-23 21:07:58	Delivered	Cash	Salt	3	0
545	154	12	2026-06-21 21:20:12	Delivered	Card	Madaba	3	10
546	22	13	2026-09-14 21:09:44	Cancelled	Cash	Salt	3	5
547	54	2	2026-08-30 16:03:38	Delivered	Card	Salt	3	0
548	428	13	2026-04-28 22:08:59	Delivered	Transfer	Zarqa	2.5	0
549	250	8	2026-10-13 12:19:55	Delivered	Cash	Amman	2	0
550	150	15	2026-09-11 16:08:19	Cancelled	Transfer	Irbid	3	5
551	22	1	2026-04-07 11:37:41	Cancelled	Cash	Salt	3	0
552	239	11	2026-07-26 18:27:35	Delivered	Cash	Jerash	3.5	0
553	69	15	2025-11-04 21:32:47	Delivered	Cash	Amman	2	15
554	352	10	2025-12-25 11:53:04	Delivered	Transfer	Amman	2	0
555	259	6	2026-06-01 10:13:45	Delivered	Card	Amman	2	5
556	168	7	2026-06-26 19:23:35	Delivered	Card	Amman	2	10
557	357	2	2026-05-20 21:11:45	Delivered	Card	Madaba	3	0
558	466	3	2026-04-16 10:36:36	Cancelled	Card	Amman	2	0
559	426	14	2026-06-08 11:35:35	Delivered	Cash	Amman	2	0
560	231	1	2026-07-11 20:25:18	Delivered	Cash	Amman	2	10
561	431	1	2026-07-26 17:11:28	Delivered	Cash	Zarqa	2.5	10
562	449	3	2026-04-17 16:58:33	Delivered	Transfer	Amman	2	5
563	391	12	2025-11-28 10:02:56	Delivered	Card	Amman	2	5
564	464	11	2025-11-21 12:19:15	Cancelled	Transfer	Salt	3	10
565	467	15	2025-12-18 10:41:36	Delivered	Transfer	Dubai	15	5
566	253	15	2025-11-30 11:58:00	Delivered	Cash	Zarqa	2.5	0
567	359	15	2025-12-30 09:55:43	Cancelled	Card	Amman	2	5
568	340	1	2025-12-30 14:06:08	Cancelled	Card	Amman	2	0
569	218	14	2026-06-11 08:42:11	Delivered	Transfer	Irbid	3	5
570	47	2	2026-03-26 16:43:25	Delivered	Cash	Amman	2	0
571	420	14	2026-08-30 21:23:22	Delivered	Cash	Irbid	3	5
572	58	7	2026-10-20 08:49:06	New	Cash	Zarqa	2.5	0
573	365	6	2026-01-19 15:59:03	Delivered	Cash	Amman	2	0
574	484	2	2026-10-05 17:01:26	Delivered	Cash	Amman	2	0
575	136	6	2026-03-08 08:39:23	Cancelled	Card	Amman	2	10
576	166	2	2026-03-26 10:15:16	Delivered	Transfer	Doha	16	0
577	254	9	2025-11-20 20:58:47	Delivered	Cash	Riyadh	15	0
578	338	15	2026-06-18 17:01:55	Delivered	Card	Zarqa	2.5	0
579	115	5	2026-06-25 13:05:03	Delivered	Transfer	Aqaba	5	15
580	10	7	2026-06-11 16:55:33	Delivered	Card	Irbid	3	0
581	420	8	2026-05-21 10:05:22	Delivered	Transfer	Irbid	3	0
582	13	7	2025-12-05 08:28:37	Delivered	Transfer	Irbid	3	0
583	285	1	2026-04-11 19:04:20	Delivered	Card	Amman	2	0
584	493	11	2026-09-24 09:12:29	Delivered	Transfer	Karak	4.5	0
585	241	7	2026-08-20 11:53:11	Delivered	Cash	Amman	2	0
586	303	7	2025-11-08 21:58:16	Delivered	Transfer	Amman	2	0
587	49	10	2026-05-30 10:42:42	Delivered	Card	Amman	2	0
588	307	3	2026-07-21 22:49:37	Delivered	Cash	Amman	2	20
589	144	8	2026-02-11 09:28:56	Cancelled	Card	Amman	2	0
590	151	9	2026-10-08 21:11:53	Delivered	Cash	Zarqa	2.5	0
591	79	12	2026-10-10 22:32:09	Shipped	Card	Amman	2	20
592	288	4	2025-12-28 08:31:57	Delivered	Card	Salt	3	0
593	445	9	2026-06-04 12:53:39	Delivered	Card	Amman	2	15
594	72	12	2026-09-21 10:10:59	Delivered	Transfer	Amman	2	0
595	106	14	2026-08-01 19:32:14	Delivered	Cash	Amman	2	0
596	44	15	2026-09-28 21:07:37	Cancelled	Cash	Amman	2	0
597	22	14	2026-03-11 16:06:25	Delivered	Cash	Salt	3	0
598	208	12	2025-12-03 19:30:57	Cancelled	Card	Salt	3	0
599	315	7	2026-08-07 22:46:00	Cancelled	Card	Amman	2	0
600	473	4	2026-08-07 18:34:39	Delivered	Transfer	Amman	2	0
601	448	1	2025-12-17 17:16:20	Delivered	Cash	Salt	3	0
602	22	3	2025-12-29 09:27:43	Delivered	Card	Salt	3	5
603	324	6	2026-05-29 12:20:23	Delivered	Cash	Jerash	3.5	0
604	117	13	2026-08-16 14:24:43	Cancelled	Card	Irbid	3	0
605	9	6	2026-06-06 21:23:31	Delivered	Transfer	Amman	2	0
606	59	14	2026-06-16 14:56:24	Delivered	Cash	Aqaba	5	0
607	347	5	2026-10-12 21:11:07	Delivered	Transfer	Amman	2	5
608	376	15	2026-08-28 09:05:11	Delivered	Cash	Amman	2	10
609	455	7	2026-08-02 15:37:33	Shipped	Card	Aqaba	5	0
610	444	5	2026-05-03 20:57:00	Cancelled	Cash	Amman	2	5
611	98	7	2026-03-09 20:56:30	Delivered	Card	Amman	2	5
612	473	3	2026-01-29 09:42:35	Delivered	Cash	Amman	2	0
613	135	2	2026-06-28 10:55:12	Delivered	Cash	Madaba	3	0
614	492	11	2026-06-19 20:25:48	Delivered	Card	Karak	4.5	0
615	416	6	2026-08-03 10:52:04	Cancelled	Cash	Amman	2	0
616	392	10	2026-02-26 16:32:53	Delivered	Cash	Aqaba	5	10
617	354	14	2026-09-06 16:18:32	Cancelled	Cash	Irbid	3	0
618	123	6	2026-06-29 16:13:52	Delivered	Cash	Amman	2	0
619	9	15	2026-06-11 17:07:09	Delivered	Card	Amman	2	0
620	377	14	2026-03-07 13:30:37	Delivered	Cash	Irbid	3	10
621	185	11	2026-03-10 10:57:13	Delivered	Card	Irbid	3	0
622	73	1	2026-09-07 10:33:55	Delivered	Card	Amman	2	15
623	9	6	2026-04-25 08:01:04	Delivered	Card	Amman	2	0
624	40	15	2026-04-01 14:50:05	Delivered	Cash	Amman	2	0
625	428	9	2026-09-25 13:19:26	Cancelled	Transfer	Zarqa	2.5	5
626	476	11	2026-08-29 21:04:21	Delivered	Card	Irbid	3	20
627	2	15	2026-06-17 09:25:39	Delivered	Cash	Madaba	3	0
628	279	6	2026-02-08 16:12:18	Delivered	Card	Zarqa	2.5	0
629	219	15	2026-08-12 18:36:07	Delivered	Card	Karak	4.5	0
630	229	3	2025-12-10 22:24:01	Delivered	Cash	Madaba	3	0
631	88	15	2025-11-08 09:35:54	Delivered	Transfer	Amman	2	0
632	52	8	2026-07-08 19:05:42	Delivered	Card	Karak	4.5	0
633	323	2	2026-01-14 17:45:37	Delivered	Cash	Riyadh	15	0
634	176	8	2026-01-07 16:22:43	Delivered	Transfer	Amman	2	0
635	352	15	2025-11-10 08:04:40	Delivered	Transfer	Amman	2	0
636	132	3	2025-11-30 16:41:58	Delivered	Card	Madaba	3	5
637	393	9	2026-05-11 09:03:50	Delivered	Card	Irbid	3	15
638	49	1	2026-10-03 10:27:05	Delivered	Card	Amman	2	15
639	295	15	2026-10-15 15:16:57	Shipped	Cash	Amman	2	0
640	100	7	2026-10-02 10:38:16	Delivered	Cash	Jerash	3.5	10
641	466	14	2026-07-01 12:51:34	Delivered	Card	Amman	2	0
642	279	5	2026-09-09 18:11:04	Delivered	Transfer	Zarqa	2.5	5
643	492	3	2026-06-11 14:28:12	Delivered	Card	Karak	4.5	0
644	144	15	2026-03-03 11:24:58	Shipped	Transfer	Amman	2	0
645	161	12	2026-05-20 14:10:13	Delivered	Cash	Irbid	3	0
646	47	7	2026-10-18 13:51:18	Shipped	Card	Amman	2	0
647	309	2	2026-02-28 22:59:17	Delivered	Cash	Zarqa	2.5	0
648	37	14	2025-12-27 21:46:59	Delivered	Transfer	Amman	2	0
649	134	7	2026-07-11 15:45:12	Delivered	Card	Amman	2	15
650	5	12	2026-05-21 18:39:13	Cancelled	Cash	Amman	2	0
651	217	5	2026-07-18 20:18:04	Delivered	Card	Amman	2	0
652	342	6	2026-04-24 13:24:04	Delivered	Card	Aqaba	5	15
653	472	5	2026-08-08 16:24:45	Delivered	Card	Amman	2	10
654	11	6	2026-05-21 14:48:54	Delivered	Cash	Jerash	3.5	0
655	492	7	2026-04-10 22:25:11	Delivered	Cash	Karak	4.5	0
656	35	11	2025-11-17 18:57:57	Delivered	Card	Zarqa	2.5	0
657	43	5	2026-05-21 20:08:39	Cancelled	Card	Zarqa	2.5	15
658	380	11	2026-06-08 08:14:53	Delivered	Transfer	Irbid	3	5
659	13	6	2026-09-02 22:28:07	Delivered	Cash	Irbid	3	5
660	394	2	2026-10-05 13:58:58	Shipped	Card	Amman	2	0
661	49	9	2025-12-28 11:34:23	Delivered	Card	Amman	2	10
662	186	3	2026-07-14 08:48:49	Delivered	Card	Madaba	3	5
663	251	15	2026-08-25 10:51:32	Delivered	Cash	Amman	2	0
664	371	8	2026-01-23 10:35:13	Delivered	Card	Amman	2	10
665	118	15	2026-03-23 12:41:13	Delivered	Transfer	Amman	2	5
666	57	3	2026-09-21 08:17:59	Delivered	Transfer	Amman	2	0
667	180	7	2026-02-08 20:48:08	Delivered	Transfer	Irbid	3	0
668	108	10	2026-08-18 13:25:57	Delivered	Cash	Amman	2	5
669	404	15	2025-12-08 14:55:38	Delivered	Card	Amman	2	15
670	33	3	2026-05-18 10:36:05	Delivered	Cash	Riyadh	15	0
671	421	3	2026-05-21 20:56:57	Delivered	Card	Aqaba	5	0
672	385	3	2026-05-01 08:28:27	Delivered	Cash	Irbid	3	5
673	423	15	2026-05-17 22:53:07	Delivered	Cash	Salt	3	5
674	151	14	2026-10-11 18:32:54	Shipped	Cash	Zarqa	2.5	5
675	184	12	2026-02-21 13:51:15	Cancelled	Transfer	Amman	2	0
676	110	4	2026-03-06 11:52:02	Delivered	Cash	Amman	2	10
677	126	13	2026-06-20 14:37:45	Cancelled	Cash	Irbid	3	5
678	186	3	2026-09-26 11:57:17	Delivered	Cash	Madaba	3	0
679	471	2	2026-07-19 13:11:48	Delivered	Card	Amman	2	0
680	50	12	2026-04-16 21:17:08	Delivered	Card	Amman	2	0
681	326	13	2026-08-26 20:57:10	Cancelled	Cash	Aqaba	5	0
682	230	11	2025-12-24 18:57:01	Delivered	Card	Riyadh	15	0
683	358	3	2026-06-17 22:35:17	Delivered	Transfer	Amman	2	0
684	447	14	2026-07-14 15:12:41	Cancelled	Transfer	Salt	3	0
685	455	6	2026-06-25 17:27:25	Delivered	Cash	Aqaba	5	0
686	31	15	2026-05-08 16:42:02	Delivered	Card	Zarqa	2.5	0
687	103	3	2026-05-23 18:44:05	Delivered	Cash	Dubai	15	0
688	257	9	2026-05-20 19:01:38	Delivered	Card	Zarqa	2.5	0
689	458	3	2026-01-15 18:44:49	Delivered	Card	Irbid	3	10
690	108	7	2026-05-01 09:32:22	Cancelled	Cash	Amman	2	0
691	185	11	2025-12-21 09:09:25	Delivered	Transfer	Irbid	3	20
692	386	3	2026-07-03 15:48:16	Delivered	Transfer	Riyadh	15	0
693	318	14	2026-05-22 10:22:35	Shipped	Card	Amman	2	5
694	202	11	2026-05-13 22:39:21	Delivered	Transfer	Amman	2	0
695	130	15	2026-03-01 18:20:14	Delivered	Card	Salt	3	0
696	104	11	2026-05-17 18:03:32	Delivered	Cash	Irbid	3	10
697	22	11	2026-04-13 09:51:11	Cancelled	Card	Salt	3	0
698	469	7	2026-07-25 14:37:13	Delivered	Card	Salt	3	5
699	10	14	2026-01-26 10:42:00	Delivered	Card	Irbid	3	0
700	354	1	2026-10-05 16:36:41	Shipped	Transfer	Irbid	3	0
701	108	7	2026-04-09 18:24:43	Delivered	Cash	Amman	2	0
702	186	10	2026-05-22 16:43:46	Delivered	Cash	Madaba	3	0
703	421	7	2026-04-28 14:17:18	Delivered	Transfer	Aqaba	5	0
704	219	14	2026-05-25 15:37:28	Cancelled	Cash	Karak	4.5	5
705	19	3	2026-05-15 14:15:22	Delivered	Cash	Amman	2	0
706	87	6	2026-06-26 09:56:40	Delivered	Card	Zarqa	2.5	0
707	231	7	2025-11-05 13:07:10	Delivered	Card	Amman	2	0
708	138	10	2026-07-27 16:53:36	Delivered	Cash	Amman	2	0
709	473	5	2026-03-13 15:18:14	Delivered	Card	Amman	2	0
710	265	2	2026-07-26 22:17:06	Delivered	Cash	Zarqa	2.5	10
711	22	10	2026-04-17 21:33:22	Delivered	Card	Salt	3	0
712	69	12	2026-09-09 08:52:01	Delivered	Card	Amman	2	0
713	429	6	2026-05-02 17:25:12	Delivered	Card	Irbid	3	0
714	274	1	2026-02-05 13:25:24	Delivered	Transfer	Zarqa	2.5	0
715	90	4	2026-05-28 18:47:08	Delivered	Cash	Amman	2	0
716	144	13	2026-07-21 14:32:47	Delivered	Card	Amman	2	10
717	283	11	2026-05-29 17:03:09	Cancelled	Card	Madaba	3	20
718	98	6	2026-04-13 11:34:50	Delivered	Cash	Amman	2	0
719	161	3	2026-06-09 10:33:09	Delivered	Cash	Irbid	3	0
720	104	11	2026-03-10 15:04:46	Delivered	Card	Irbid	3	0
721	82	2	2025-11-15 19:58:50	Delivered	Cash	Amman	2	0
722	60	7	2025-11-27 08:28:52	Cancelled	Transfer	Amman	2	0
723	318	14	2026-09-03 12:26:06	Delivered	Transfer	Amman	2	0
724	108	8	2026-08-18 18:30:40	Delivered	Transfer	Amman	2	0
725	388	15	2026-04-25 20:34:18	Delivered	Card	Aqaba	5	0
726	284	1	2025-12-10 09:08:05	Delivered	Card	Karak	4.5	15
727	274	14	2026-09-11 22:57:57	Delivered	Transfer	Zarqa	2.5	0
728	360	15	2025-12-27 10:11:09	Cancelled	Card	Amman	2	0
729	50	14	2026-03-15 13:43:51	Delivered	Card	Amman	2	15
730	157	10	2026-03-19 20:10:00	Cancelled	Card	Irbid	3	0
731	90	6	2026-10-16 12:39:44	New	Card	Amman	2	0
732	172	2	2026-01-18 09:56:25	Delivered	Transfer	Amman	2	0
733	35	11	2026-05-30 10:37:20	Delivered	Card	Zarqa	2.5	0
734	86	1	2026-06-09 13:42:16	Delivered	Card	Amman	2	0
735	268	11	2026-05-27 17:34:54	Delivered	Cash	Amman	2	5
736	414	2	2025-12-29 12:32:42	Cancelled	Card	Riyadh	15	0
737	49	6	2026-08-26 13:16:35	Delivered	Transfer	Amman	2	5
738	222	12	2026-07-27 21:20:33	Delivered	Card	Jerash	3.5	0
739	86	3	2026-02-07 12:44:04	Delivered	Cash	Amman	2	0
740	47	1	2026-01-22 11:07:47	Delivered	Transfer	Amman	2	0
741	2	3	2025-11-03 11:47:10	Delivered	Card	Madaba	3	10
742	421	1	2026-09-12 20:36:49	Delivered	Card	Aqaba	5	0
743	115	8	2026-02-25 16:56:13	Cancelled	Transfer	Aqaba	5	0
744	370	5	2026-05-26 15:06:15	Delivered	Card	Madaba	3	0
745	71	3	2026-10-11 16:46:14	Delivered	Card	Amman	2	5
746	376	11	2026-08-22 22:30:31	Delivered	Card	Amman	2	0
747	309	11	2026-06-28 14:07:29	Cancelled	Card	Zarqa	2.5	0
748	47	14	2026-04-15 12:39:32	Delivered	Cash	Amman	2	0
749	303	7	2026-06-16 15:09:48	Delivered	Transfer	Amman	2	0
750	342	5	2026-07-13 13:43:39	Delivered	Cash	Aqaba	5	15
751	144	10	2026-07-01 12:53:29	Delivered	Cash	Amman	2	5
752	15	8	2026-03-29 20:38:10	Delivered	Card	Dubai	15	0
753	453	6	2025-11-10 10:17:34	Delivered	Cash	Riyadh	15	0
754	208	1	2026-03-02 22:28:50	Delivered	Cash	Salt	3	0
755	48	6	2026-09-02 11:01:58	Cancelled	Cash	Amman	2	0
756	264	10	2026-04-15 18:51:02	Delivered	Cash	Amman	2	0
757	22	6	2026-07-06 13:27:35	Cancelled	Transfer	Salt	3	0
758	469	5	2026-10-20 21:11:07	Shipped	Cash	Salt	3	0
759	191	10	2026-08-05 20:20:23	Delivered	Cash	Amman	2	0
760	357	1	2026-02-20 19:53:55	Cancelled	Card	Madaba	3	0
761	234	5	2026-09-24 15:31:10	Delivered	Card	Karak	4.5	5
762	86	14	2026-10-09 18:53:22	Delivered	Cash	Amman	2	0
763	122	3	2026-06-21 15:14:48	Delivered	Card	Amman	2	0
764	288	3	2026-08-20 12:18:54	Cancelled	Cash	Salt	3	0
765	391	15	2026-10-19 21:41:33	New	Card	Amman	2	0
766	393	7	2026-07-04 11:00:18	Delivered	Cash	Irbid	3	0
767	155	13	2026-10-23 13:46:14	New	Card	Amman	2	0
768	436	3	2026-07-13 15:28:47	Delivered	Transfer	Irbid	3	0
769	217	11	2026-04-24 17:36:37	Delivered	Cash	Amman	2	0
770	469	6	2026-10-12 09:45:05	Shipped	Card	Salt	3	10
771	469	10	2026-10-21 17:48:57	Delivered	Card	Salt	3	0
772	383	2	2026-07-10 19:36:22	Delivered	Card	Irbid	3	0
773	408	7	2026-04-03 11:40:38	Cancelled	Cash	Amman	2	0
774	391	6	2026-02-14 20:55:10	Delivered	Card	Amman	2	0
775	492	13	2026-08-03 22:21:36	Delivered	Card	Karak	4.5	0
776	148	12	2026-10-25 08:48:46	New	Card	Amman	2	0
777	391	15	2025-12-11 21:34:08	Delivered	Cash	Amman	2	0
778	22	14	2025-12-01 13:52:34	Delivered	Card	Salt	3	0
779	354	13	2026-08-13 22:21:59	Delivered	Card	Irbid	3	0
780	298	11	2026-09-25 13:15:51	Delivered	Card	Amman	2	0
781	431	13	2026-07-10 15:36:11	Delivered	Cash	Zarqa	2.5	0
782	234	15	2026-02-02 21:10:34	Delivered	Card	Karak	4.5	0
783	39	1	2026-03-11 21:45:43	Delivered	Cash	Madaba	3	20
784	407	1	2026-04-03 12:02:23	Cancelled	Card	Amman	2	0
785	65	2	2026-06-03 10:59:54	Delivered	Card	Irbid	3	0
786	466	4	2026-08-22 20:02:26	Delivered	Card	Amman	2	10
787	131	15	2026-09-11 20:17:55	Delivered	Cash	Salt	3	5
788	446	15	2025-11-11 14:51:35	Cancelled	Card	Irbid	3	5
789	250	8	2026-08-11 15:41:47	Delivered	Card	Amman	2	0
790	472	1	2026-04-28 21:40:55	Delivered	Card	Amman	2	0
791	465	2	2025-12-05 10:55:55	Delivered	Cash	Amman	2	0
792	352	3	2026-07-12 21:45:17	Delivered	Cash	Amman	2	20
793	309	5	2026-09-12 18:59:09	Delivered	Transfer	Zarqa	2.5	0
794	86	3	2026-05-11 15:53:19	Delivered	Cash	Amman	2	10
795	310	6	2025-11-19 14:33:27	Delivered	Cash	Amman	2	0
796	386	13	2025-11-17 20:50:15	Delivered	Card	Riyadh	15	0
797	17	8	2026-09-05 17:20:01	Delivered	Cash	Doha	16	15
798	90	8	2025-11-18 10:10:05	Delivered	Card	Amman	2	0
799	13	6	2026-03-10 22:45:49	Delivered	Cash	Irbid	3	0
800	229	5	2026-04-06 08:09:52	Delivered	Transfer	Madaba	3	15
801	197	2	2026-01-13 11:58:37	Delivered	Transfer	Riyadh	15	10
802	421	10	2026-02-01 08:13:43	Delivered	Card	Aqaba	5	0
803	473	2	2026-10-21 16:22:07	New	Cash	Amman	2	0
804	445	8	2026-03-11 14:50:56	Cancelled	Card	Amman	2	0
805	262	13	2026-04-12 08:32:47	Delivered	Card	Aqaba	5	0
806	41	8	2026-09-30 14:36:47	Delivered	Transfer	Amman	2	10
807	22	7	2026-01-20 17:33:26	Delivered	Cash	Salt	3	10
808	69	3	2025-11-08 13:00:56	Delivered	Cash	Amman	2	0
809	111	12	2025-12-27 08:33:33	Delivered	Transfer	Amman	2	0
810	478	3	2025-12-18 20:47:40	Delivered	Card	Aqaba	5	0
811	231	5	2026-09-13 08:34:50	Delivered	Transfer	Amman	2	15
812	487	2	2026-09-18 11:15:27	Delivered	Transfer	Zarqa	2.5	15
813	323	13	2026-10-22 16:09:48	Shipped	Cash	Riyadh	15	0
814	375	9	2026-06-12 08:28:20	Delivered	Card	Amman	2	0
815	327	3	2026-07-25 22:49:18	Cancelled	Transfer	Amman	2	0
816	172	7	2026-02-07 10:59:14	Delivered	Cash	Amman	2	0
817	49	15	2025-12-30 09:40:11	Delivered	Cash	Amman	2	0
818	84	9	2025-11-29 14:01:03	Delivered	Card	Riyadh	15	0
819	494	14	2026-09-18 13:05:08	Delivered	Transfer	Amman	2	5
820	154	3	2026-03-13 19:02:56	Delivered	Cash	Madaba	3	0
821	146	15	2026-01-16 13:35:26	Delivered	Card	Zarqa	2.5	0
822	195	15	2026-03-29 21:26:45	Delivered	Transfer	Amman	2	5
823	333	15	2026-08-24 11:23:00	Delivered	Cash	Zarqa	2.5	0
824	433	12	2026-03-05 12:46:26	Cancelled	Card	Amman	2	15
825	171	11	2026-05-02 20:11:01	Cancelled	Cash	Amman	2	0
826	264	3	2026-07-01 21:42:27	Delivered	Card	Amman	2	5
827	131	1	2026-06-03 14:25:16	Cancelled	Transfer	Salt	3	5
828	432	8	2025-12-31 08:19:39	Delivered	Cash	Zarqa	2.5	15
829	492	9	2026-02-12 19:12:06	Delivered	Card	Karak	4.5	0
830	370	9	2026-07-13 17:52:29	Delivered	Cash	Madaba	3	5
831	491	14	2026-06-04 12:06:37	Delivered	Card	Amman	2	10
832	163	3	2026-08-22 19:07:01	Delivered	Card	Amman	2	10
833	27	11	2026-02-25 14:06:27	Delivered	Cash	Aqaba	5	0
834	53	7	2026-02-10 21:14:02	Delivered	Transfer	Amman	2	10
835	340	1	2026-08-09 13:29:55	Cancelled	Cash	Amman	2	0
836	54	9	2026-08-27 14:38:42	Delivered	Transfer	Salt	3	0
837	219	11	2026-10-20 17:54:58	Cancelled	Transfer	Karak	4.5	15
838	191	15	2025-11-03 08:13:12	Delivered	Transfer	Amman	2	0
839	434	3	2026-08-23 16:54:18	Delivered	Cash	Amman	2	10
840	177	9	2026-01-05 19:23:48	Delivered	Card	Amman	2	0
841	46	8	2026-04-16 09:56:48	Delivered	Cash	Amman	2	20
842	151	8	2025-12-27 20:04:57	Delivered	Transfer	Zarqa	2.5	0
843	404	13	2026-06-25 19:24:01	Delivered	Card	Amman	2	5
844	412	7	2026-06-26 14:51:16	Delivered	Transfer	Zarqa	2.5	5
845	351	4	2026-10-10 08:10:36	Delivered	Card	Zarqa	2.5	0
846	499	14	2026-06-18 12:08:00	Delivered	Card	Amman	2	0
847	171	7	2026-01-04 16:27:46	Delivered	Cash	Amman	2	10
848	294	3	2026-07-23 19:21:49	Delivered	Cash	Amman	2	5
849	155	11	2026-08-30 12:49:00	Delivered	Card	Amman	2	0
850	231	11	2026-04-23 10:27:54	Delivered	Cash	Amman	2	10
851	419	15	2026-07-21 10:03:45	Delivered	Cash	Amman	2	0
852	49	6	2026-01-24 12:10:39	Cancelled	Cash	Amman	2	10
853	214	1	2026-10-17 17:54:51	Delivered	Cash	Amman	2	0
854	30	12	2026-08-09 09:28:29	Cancelled	Transfer	Amman	2	5
855	385	3	2026-06-15 08:18:37	Delivered	Transfer	Irbid	3	0
856	461	15	2025-11-03 17:02:47	Delivered	Cash	Irbid	3	0
857	104	8	2026-09-06 15:44:10	Shipped	Card	Irbid	3	0
858	354	3	2026-09-13 13:52:10	Delivered	Card	Irbid	3	0
859	313	7	2026-05-11 19:00:32	Delivered	Transfer	Amman	2	0
860	79	4	2025-12-10 20:52:19	Cancelled	Cash	Amman	2	0
861	91	3	2026-05-04 10:15:22	Delivered	Card	Amman	2	0
862	108	11	2026-07-31 21:35:51	Delivered	Cash	Amman	2	0
863	4	11	2026-08-03 17:47:47	Delivered	Cash	Jerash	3.5	10
864	60	7	2025-11-29 11:31:25	Delivered	Cash	Amman	2	0
865	281	6	2026-06-18 20:06:37	Delivered	Cash	Amman	2	0
866	129	4	2026-04-13 21:32:40	Cancelled	Cash	Amman	2	10
867	149	6	2026-01-10 11:10:45	Delivered	Cash	Aqaba	5	0
868	23	7	2026-06-15 17:29:40	Delivered	Transfer	Irbid	3	0
869	360	8	2025-11-04 16:30:31	Delivered	Card	Amman	2	0
870	79	14	2026-06-28 18:18:27	Delivered	Cash	Amman	2	0
871	219	5	2026-07-03 20:11:01	Delivered	Card	Karak	4.5	0
872	390	1	2026-05-20 10:11:11	Cancelled	Cash	Madaba	3	0
873	443	15	2026-09-27 21:10:50	Delivered	Cash	Amman	2	0
874	350	6	2026-06-02 21:44:28	Delivered	Cash	Amman	2	10
875	135	12	2025-11-21 11:39:04	Delivered	Card	Madaba	3	0
876	106	7	2025-11-03 14:01:59	Delivered	Card	Amman	2	0
877	210	3	2026-05-15 14:55:08	Delivered	Card	Amman	2	15
878	84	14	2026-03-19 15:52:27	Delivered	Card	Riyadh	15	0
879	46	5	2026-06-11 11:45:06	Delivered	Transfer	Amman	2	0
880	448	5	2025-11-17 19:13:50	Delivered	Card	Salt	3	0
881	156	14	2026-09-26 16:28:01	Shipped	Card	Riyadh	15	0
882	224	5	2026-07-08 09:49:31	Delivered	Card	Madaba	3	0
883	226	12	2025-11-06 21:18:49	Delivered	Card	Amman	2	5
884	219	8	2026-03-17 08:00:38	Delivered	Cash	Karak	4.5	10
885	417	11	2025-11-17 11:30:34	Delivered	Cash	Amman	2	0
886	456	2	2026-03-15 15:03:25	Delivered	Card	Amman	2	10
887	465	6	2025-12-05 12:56:44	Delivered	Card	Amman	2	0
888	49	14	2026-07-23 08:44:29	Delivered	Card	Amman	2	0
889	19	10	2025-12-15 11:28:17	Cancelled	Cash	Amman	2	0
890	392	6	2026-01-01 10:11:47	Delivered	Transfer	Aqaba	5	10
891	324	13	2026-08-22 16:48:21	Delivered	Cash	Jerash	3.5	0
892	404	7	2026-10-23 17:55:54	Shipped	Card	Amman	2	5
893	347	12	2025-12-01 21:35:27	Delivered	Card	Amman	2	0
894	251	8	2026-09-12 17:52:34	Cancelled	Card	Amman	2	0
895	399	7	2026-06-26 19:58:59	Delivered	Transfer	Amman	2	0
896	343	15	2026-10-07 22:05:43	Shipped	Cash	Irbid	3	20
897	297	6	2025-12-03 21:34:28	Delivered	Transfer	Amman	2	0
898	438	14	2026-09-17 16:07:26	Delivered	Cash	Amman	2	0
899	330	12	2026-10-01 13:00:12	Cancelled	Cash	Zarqa	2.5	0
900	18	15	2026-03-05 14:09:33	Delivered	Card	Amman	2	0
901	68	7	2026-07-18 13:36:11	Delivered	Cash	Amman	2	0
902	448	9	2025-12-27 15:25:25	Delivered	Card	Salt	3	10
903	125	3	2026-03-18 20:38:24	Delivered	Cash	Amman	2	20
904	230	6	2026-03-08 16:58:17	Delivered	Transfer	Riyadh	15	5
905	1	14	2026-10-04 14:20:08	Delivered	Cash	Zarqa	2.5	0
906	371	5	2026-10-25 15:50:23	Shipped	Cash	Amman	2	0
907	52	15	2026-08-19 15:15:33	Delivered	Card	Karak	4.5	0
908	185	2	2026-06-26 17:33:26	Delivered	Card	Irbid	3	0
909	87	1	2026-07-27 10:26:36	Delivered	Card	Zarqa	2.5	0
910	360	15	2026-03-07 20:35:47	Delivered	Card	Amman	2	0
911	54	14	2026-03-11 08:33:55	Delivered	Transfer	Salt	3	0
912	377	14	2026-03-19 10:25:00	Delivered	Cash	Irbid	3	0
913	358	13	2026-08-16 12:07:01	Delivered	Card	Amman	2	0
914	323	11	2026-10-10 10:47:50	Shipped	Cash	Riyadh	15	0
915	415	13	2025-11-16 15:27:27	Delivered	Card	Aqaba	5	0
916	492	11	2026-05-09 10:56:00	Delivered	Cash	Karak	4.5	15
917	491	12	2026-06-30 18:58:46	Delivered	Transfer	Amman	2	0
918	53	10	2026-01-23 09:42:12	Delivered	Transfer	Amman	2	0
919	168	15	2026-02-24 20:36:48	Delivered	Cash	Amman	2	0
920	241	5	2026-02-16 11:19:46	Delivered	Transfer	Amman	2	0
921	223	1	2026-08-01 10:49:14	Delivered	Transfer	Amman	2	0
922	489	10	2025-12-16 11:42:10	Cancelled	Cash	Amman	2	0
923	35	12	2026-05-01 13:22:34	Delivered	Transfer	Zarqa	2.5	0
924	464	1	2025-11-25 21:30:00	Delivered	Cash	Salt	3	10
925	391	3	2026-08-07 09:51:34	Delivered	Card	Amman	2	5
926	366	10	2026-08-12 08:09:25	Delivered	Cash	Amman	2	20
927	164	7	2026-06-02 08:59:12	Delivered	Cash	Amman	2	0
928	22	10	2026-01-26 18:45:07	Delivered	Card	Salt	3	5
929	183	6	2025-12-20 12:35:21	Delivered	Transfer	Madaba	3	0
930	68	7	2026-04-10 22:30:43	Delivered	Cash	Amman	2	5
931	27	14	2026-07-31 18:49:08	Cancelled	Cash	Aqaba	5	5
932	286	12	2025-11-02 08:08:47	Delivered	Cash	Amman	2	0
933	25	6	2026-03-02 14:15:27	Delivered	Cash	Riyadh	15	0
934	292	3	2025-11-06 17:02:37	Delivered	Transfer	Irbid	3	0
935	379	3	2026-06-24 17:29:44	Delivered	Cash	Amman	2	0
936	354	15	2026-09-11 21:29:22	Cancelled	Transfer	Irbid	3	0
937	476	5	2025-11-23 19:35:38	Delivered	Cash	Irbid	3	0
938	354	14	2026-10-02 18:22:33	Delivered	Transfer	Irbid	3	5
939	296	5	2026-10-18 09:31:39	Shipped	Card	Amman	2	0
940	202	1	2026-01-07 20:04:23	Delivered	Card	Amman	2	0
941	318	6	2026-02-08 20:06:20	Delivered	Card	Amman	2	0
942	115	15	2026-04-17 17:16:03	Delivered	Card	Aqaba	5	0
943	492	15	2026-06-28 13:46:29	Delivered	Cash	Karak	4.5	0
944	354	15	2026-09-19 18:35:29	Delivered	Card	Irbid	3	0
945	125	10	2025-11-04 09:36:11	Delivered	Card	Amman	2	0
946	300	14	2026-08-10 18:08:13	Delivered	Cash	Irbid	3	0
947	327	11	2026-05-21 15:58:15	Delivered	Cash	Amman	2	0
948	342	10	2025-11-12 12:44:00	Delivered	Cash	Aqaba	5	5
949	301	5	2026-07-27 17:00:51	Delivered	Cash	Amman	2	0
950	344	11	2026-09-15 16:14:07	Delivered	Card	Madaba	3	0
951	70	2	2026-01-05 15:29:13	Delivered	Transfer	Amman	2	0
952	111	5	2025-11-18 13:10:39	Delivered	Card	Amman	2	0
953	341	7	2026-06-11 20:23:32	Delivered	Cash	Amman	2	0
954	8	15	2025-11-21 14:12:51	Delivered	Card	Salt	3	5
955	291	11	2026-04-11 11:37:44	Delivered	Card	Amman	2	10
956	404	2	2025-11-08 17:44:51	Delivered	Card	Amman	2	10
957	48	8	2025-12-22 16:37:45	Cancelled	Card	Amman	2	0
958	364	11	2026-01-23 11:52:37	Cancelled	Cash	Irbid	3	0
959	163	8	2026-10-09 16:44:31	Delivered	Card	Amman	2	0
960	120	10	2026-09-25 12:29:47	Cancelled	Transfer	Amman	2	15
961	217	14	2026-06-16 17:49:50	Delivered	Card	Amman	2	20
962	285	7	2026-01-12 14:25:08	Delivered	Card	Amman	2	0
963	261	6	2026-05-24 20:48:22	Cancelled	Transfer	Irbid	3	0
964	171	14	2026-06-01 12:20:06	Delivered	Transfer	Amman	2	0
965	409	1	2025-11-22 15:01:15	Delivered	Card	Karak	4.5	5
966	206	10	2026-01-28 19:21:46	Delivered	Card	Zarqa	2.5	0
967	7	14	2026-06-10 21:38:30	Delivered	Transfer	Irbid	3	10
968	303	6	2026-07-28 13:58:02	Delivered	Card	Amman	2	5
969	313	10	2026-08-08 18:27:00	Delivered	Cash	Amman	2	0
970	437	9	2026-06-28 12:09:02	Delivered	Card	Karak	4.5	0
971	175	5	2025-12-29 09:32:57	Delivered	Transfer	Madaba	3	0
972	354	8	2026-10-03 18:33:55	Delivered	Transfer	Irbid	3	0
973	17	5	2026-10-14 16:24:45	Shipped	Card	Doha	16	10
974	263	14	2025-12-17 16:09:18	Delivered	Transfer	Amman	2	10
975	467	2	2026-03-01 19:09:14	Delivered	Card	Dubai	15	15
976	234	7	2026-08-21 19:52:50	Delivered	Transfer	Karak	4.5	10
977	288	5	2026-03-13 20:28:26	Delivered	Card	Salt	3	0
978	33	5	2026-08-26 15:38:03	Delivered	Card	Riyadh	15	0
979	98	3	2025-11-12 08:43:30	Delivered	Card	Amman	2	0
980	271	8	2026-10-11 10:59:36	Shipped	Card	Madaba	3	10
981	200	3	2026-09-02 09:03:29	Delivered	Card	Amman	2	0
982	107	14	2026-07-20 21:27:42	Delivered	Transfer	Amman	2	0
983	8	13	2026-07-08 19:06:49	Delivered	Transfer	Salt	3	0
984	422	2	2026-10-05 22:02:22	Delivered	Card	Amman	2	0
985	384	14	2026-09-05 08:37:40	Delivered	Card	Salt	3	0
986	285	12	2026-03-31 20:14:52	Delivered	Card	Amman	2	0
987	305	2	2026-07-04 15:32:42	Delivered	Card	Amman	2	0
988	220	1	2025-12-24 16:49:47	Delivered	Card	Irbid	3	0
989	108	9	2026-04-04 14:54:47	Delivered	Card	Amman	2	0
990	473	4	2026-02-15 20:24:54	Delivered	Cash	Amman	2	0
991	465	15	2026-09-09 09:28:00	Delivered	Transfer	Amman	2	0
992	447	7	2025-12-21 20:19:53	Delivered	Card	Salt	3	0
993	354	15	2026-08-03 12:42:40	Shipped	Card	Irbid	3	0
994	487	13	2026-10-18 19:41:37	Delivered	Cash	Zarqa	2.5	10
995	207	5	2025-12-10 13:47:25	Cancelled	Transfer	Karak	4.5	15
996	342	15	2026-02-21 17:34:02	Delivered	Card	Aqaba	5	20
997	235	13	2026-07-12 13:09:40	Delivered	Cash	Amman	2	0
998	425	13	2026-07-10 12:08:55	Delivered	Cash	Amman	2	0
999	171	12	2026-09-26 17:40:21	Delivered	Card	Amman	2	0
1000	14	1	2026-08-08 10:47:51	Delivered	Card	Dubai	15	0
1001	108	15	2026-01-05 20:15:14	Delivered	Cash	Amman	2	5
1002	171	7	2025-12-29 20:37:29	Delivered	Transfer	Amman	2	0
1003	289	8	2026-03-27 15:41:27	Delivered	Cash	Aqaba	5	0
1004	42	7	2026-07-21 13:05:04	Delivered	Card	Riyadh	15	0
1005	271	8	2026-09-08 08:39:42	Delivered	Card	Madaba	3	0
1006	287	5	2026-02-10 20:46:04	Delivered	Card	Amman	2	0
1007	160	5	2026-10-23 13:58:53	New	Cash	Amman	2	0
1008	48	2	2025-12-09 19:37:36	Delivered	Transfer	Amman	2	0
1009	58	9	2026-06-27 08:20:14	Cancelled	Cash	Zarqa	2.5	0
1010	424	9	2025-12-29 12:34:19	Delivered	Cash	Amman	2	0
1011	51	14	2026-02-18 19:38:16	Delivered	Card	Amman	2	0
1012	381	9	2026-06-14 14:50:00	Delivered	Card	Amman	2	0
1013	475	14	2026-03-07 15:40:42	Delivered	Transfer	Aqaba	5	0
1014	171	5	2025-12-18 10:24:25	Delivered	Transfer	Amman	2	0
1015	209	6	2026-04-03 15:50:23	Delivered	Card	Riyadh	15	0
1016	127	9	2026-05-21 13:42:14	Delivered	Card	Amman	2	0
1017	369	6	2026-01-18 22:58:45	Delivered	Transfer	Irbid	3	0
1018	210	3	2026-06-20 16:59:14	Delivered	Card	Amman	2	0
1019	194	10	2026-08-03 17:30:37	Delivered	Card	Aqaba	5	5
1020	449	1	2026-07-22 19:29:05	Delivered	Transfer	Amman	2	0
1021	414	7	2025-11-22 12:34:39	Delivered	Card	Riyadh	15	5
1022	492	12	2026-03-27 11:37:49	Delivered	Card	Karak	4.5	0
1023	415	3	2026-01-24 19:18:22	Delivered	Transfer	Aqaba	5	0
1024	144	2	2026-03-23 17:16:32	Delivered	Card	Amman	2	0
1025	205	3	2026-01-14 22:35:14	Delivered	Cash	Madaba	3	0
1026	283	12	2026-03-05 19:15:36	Delivered	Cash	Madaba	3	5
1027	101	11	2026-10-07 15:42:51	Delivered	Card	Amman	2	0
1028	125	1	2025-12-02 21:27:31	Delivered	Transfer	Amman	2	10
1029	39	14	2025-11-13 12:41:57	Cancelled	Cash	Madaba	3	0
1030	115	14	2026-01-13 21:49:12	Delivered	Transfer	Aqaba	5	0
1031	151	2	2025-12-09 19:30:36	Shipped	Transfer	Zarqa	2.5	15
1032	37	2	2026-07-05 19:56:05	Delivered	Transfer	Amman	2	5
1033	406	15	2026-01-09 15:42:55	Delivered	Card	Amman	2	5
1034	265	2	2026-09-20 10:58:31	Cancelled	Transfer	Zarqa	2.5	0
1035	88	8	2025-12-07 20:05:02	Cancelled	Card	Amman	2	0
1036	111	15	2026-04-21 08:26:38	Delivered	Cash	Amman	2	0
1037	2	11	2026-09-21 15:46:51	Delivered	Card	Madaba	3	0
1038	297	6	2025-11-30 09:37:40	Delivered	Card	Amman	2	15
1039	73	4	2026-06-15 18:23:25	Delivered	Transfer	Amman	2	0
1040	420	7	2025-11-03 14:32:41	Cancelled	Cash	Irbid	3	0
1041	492	3	2025-12-22 16:09:00	Delivered	Card	Karak	4.5	0
1042	108	8	2026-10-14 10:35:09	Delivered	Card	Amman	2	10
1043	275	2	2026-07-19 09:14:23	Cancelled	Cash	Zarqa	2.5	0
1044	78	15	2026-09-01 10:59:52	Delivered	Cash	Amman	2	0
1045	354	2	2026-08-29 09:39:21	Cancelled	Card	Irbid	3	5
1046	276	3	2026-10-01 22:40:08	Delivered	Card	Amman	2	0
1047	51	12	2026-01-14 21:42:39	Delivered	Cash	Amman	2	10
1048	480	1	2026-07-11 17:36:19	Delivered	Card	Amman	2	0
1049	448	12	2026-07-25 16:27:00	Delivered	Card	Salt	3	0
1050	223	15	2025-11-23 13:09:28	Delivered	Card	Amman	2	0
1051	171	10	2026-09-22 12:12:30	Delivered	Cash	Amman	2	0
1052	419	11	2026-03-02 22:51:00	Delivered	Cash	Amman	2	0
1053	378	5	2026-03-21 19:08:19	Delivered	Cash	Amman	2	10
1054	291	1	2026-03-23 21:31:36	Delivered	Cash	Amman	2	0
1055	341	10	2026-03-30 22:14:54	Delivered	Transfer	Amman	2	0
1056	413	10	2026-09-06 10:57:56	Delivered	Card	Karak	4.5	0
1057	59	14	2026-05-12 15:34:59	Delivered	Card	Aqaba	5	0
1058	235	1	2026-10-18 11:08:52	Delivered	Cash	Amman	2	10
1059	4	9	2026-01-17 09:42:37	Delivered	Card	Jerash	3.5	0
1060	324	3	2026-06-20 18:21:27	Delivered	Transfer	Jerash	3.5	0
1061	404	13	2026-01-13 12:50:49	Delivered	Cash	Amman	2	5
1062	135	1	2026-05-12 19:18:53	Delivered	Card	Madaba	3	0
1063	353	12	2026-08-18 10:42:30	Delivered	Cash	Doha	16	0
1064	27	4	2026-10-06 19:39:03	Delivered	Card	Aqaba	5	0
1065	317	2	2026-02-13 10:09:12	Delivered	Card	Salt	3	0
1066	245	1	2026-08-28 10:38:19	Delivered	Transfer	Karak	4.5	0
1067	350	10	2025-12-08 12:27:22	Delivered	Transfer	Amman	2	0
1068	266	8	2026-03-13 18:35:12	Delivered	Cash	Irbid	3	0
1069	170	14	2026-07-02 10:27:28	Cancelled	Transfer	Dubai	15	0
1070	490	3	2026-03-14 16:18:37	Delivered	Transfer	Amman	2	0
1071	58	2	2026-10-16 14:34:59	Delivered	Transfer	Zarqa	2.5	0
1072	350	5	2026-09-11 20:13:16	Delivered	Cash	Amman	2	0
1073	179	7	2025-11-03 20:12:18	Cancelled	Transfer	Amman	2	0
1074	429	1	2026-01-10 21:33:18	Delivered	Cash	Irbid	3	0
1075	73	12	2025-12-19 19:45:17	Delivered	Card	Amman	2	0
1076	401	13	2026-06-07 09:04:08	Cancelled	Cash	Riyadh	15	15
1077	139	8	2026-03-18 21:16:49	Cancelled	Cash	Amman	2	5
1078	79	2	2026-10-20 14:31:46	Shipped	Cash	Amman	2	0
1079	298	11	2025-12-21 13:58:26	Delivered	Cash	Amman	2	10
1080	439	6	2026-05-07 13:18:25	Delivered	Transfer	Dubai	15	5
1081	371	5	2025-11-19 18:04:03	Delivered	Cash	Amman	2	0
1082	255	3	2026-02-20 15:20:22	Delivered	Card	Aqaba	5	0
1083	467	6	2025-11-20 15:50:58	Delivered	Card	Dubai	15	0
1084	256	9	2026-05-19 20:33:27	Delivered	Card	Irbid	3	10
1085	354	6	2026-07-21 16:13:23	Delivered	Card	Irbid	3	0
1086	295	2	2026-07-19 10:24:25	Delivered	Transfer	Amman	2	5
1087	217	3	2026-07-07 11:00:52	Cancelled	Cash	Amman	2	0
1088	238	5	2026-05-16 16:51:41	Delivered	Card	Amman	2	5
1089	4	9	2026-08-06 11:58:00	Delivered	Card	Jerash	3.5	10
1090	393	12	2026-06-29 19:48:07	Delivered	Cash	Irbid	3	0
1091	300	2	2025-12-12 09:09:04	Delivered	Transfer	Irbid	3	0
1092	342	11	2025-11-27 18:30:54	Delivered	Transfer	Aqaba	5	0
1093	287	6	2026-09-20 14:23:45	Delivered	Card	Amman	2	5
1094	9	2	2026-07-04 22:52:53	Delivered	Card	Amman	2	0
1095	479	4	2026-02-25 09:37:04	Delivered	Card	Jerash	3.5	0
1096	114	2	2025-11-26 13:31:50	Delivered	Transfer	Amman	2	0
1097	18	14	2026-08-24 17:45:13	Delivered	Transfer	Amman	2	0
1098	448	2	2026-09-04 12:36:25	Delivered	Cash	Salt	3	0
1099	73	6	2026-03-07 15:44:08	Delivered	Card	Amman	2	5
1100	493	11	2026-07-14 12:00:02	Delivered	Card	Karak	4.5	0
1101	144	12	2026-06-14 13:05:37	Delivered	Cash	Amman	2	10
1102	44	10	2026-09-27 08:37:03	Delivered	Cash	Amman	2	0
1103	486	1	2026-01-28 11:21:44	Cancelled	Card	Amman	2	15
1104	223	15	2026-06-06 20:26:25	Delivered	Cash	Amman	2	5
1105	217	7	2025-12-05 21:48:36	Delivered	Card	Amman	2	0
1106	414	11	2026-01-04 13:43:35	Cancelled	Card	Riyadh	15	0
1107	491	7	2026-06-15 09:47:19	Delivered	Cash	Amman	2	20
1108	434	8	2026-07-19 14:55:57	Delivered	Transfer	Amman	2	0
1109	76	7	2026-05-25 10:11:27	Delivered	Transfer	Amman	2	0
1110	493	14	2026-04-16 16:58:41	Delivered	Card	Karak	4.5	0
1111	239	1	2026-01-17 17:53:31	Delivered	Transfer	Jerash	3.5	10
1112	16	2	2025-12-08 22:18:07	Delivered	Transfer	Zarqa	2.5	0
1113	168	15	2025-12-18 15:05:41	Delivered	Card	Amman	2	0
1114	86	15	2026-06-17 22:31:22	Delivered	Card	Amman	2	0
1115	20	10	2026-03-21 20:01:25	Delivered	Cash	Amman	2	0
1116	188	2	2025-11-22 15:40:12	Delivered	Cash	Amman	2	0
1117	350	5	2026-08-21 11:30:50	Delivered	Cash	Amman	2	5
1118	177	6	2026-06-26 22:31:16	Delivered	Transfer	Amman	2	5
1119	132	6	2026-10-02 16:34:42	Delivered	Transfer	Madaba	3	0
1120	257	6	2026-03-04 21:42:51	Delivered	Card	Zarqa	2.5	15
1121	345	5	2026-08-02 08:48:46	Delivered	Cash	Amman	2	20
1122	231	12	2025-11-05 11:17:11	Cancelled	Card	Amman	2	0
1123	487	15	2026-08-24 20:59:22	Delivered	Cash	Zarqa	2.5	0
1124	496	1	2026-04-23 18:08:44	Delivered	Transfer	Irbid	3	0
1125	165	11	2025-12-04 15:38:16	Delivered	Card	Amman	2	10
1126	80	7	2026-05-03 15:52:16	Delivered	Card	Riyadh	15	10
1127	342	15	2026-04-28 09:16:40	Delivered	Card	Aqaba	5	10
1128	348	7	2026-06-02 10:34:54	Delivered	Cash	Amman	2	0
1129	337	12	2026-07-02 14:46:46	Delivered	Card	Riyadh	15	0
1130	121	1	2025-12-31 20:41:28	Delivered	Card	Amman	2	0
1131	474	5	2026-06-12 08:19:21	Delivered	Card	Doha	16	0
1132	350	15	2026-06-03 18:51:06	Cancelled	Cash	Amman	2	5
1133	330	6	2026-09-29 10:23:38	Delivered	Card	Zarqa	2.5	10
1134	49	7	2026-03-11 13:49:23	Delivered	Card	Amman	2	0
1135	352	15	2026-09-28 14:56:39	Delivered	Cash	Amman	2	0
1136	322	11	2026-07-21 10:43:37	Delivered	Card	Amman	2	0
1137	40	3	2025-11-28 15:14:52	Delivered	Card	Amman	2	0
1138	172	5	2026-08-17 15:31:00	Delivered	Transfer	Amman	2	5
1139	182	3	2026-07-25 15:35:39	Delivered	Transfer	Amman	2	0
1140	22	11	2025-11-05 19:50:13	Delivered	Card	Salt	3	0
1141	249	7	2025-12-24 11:53:35	Delivered	Cash	Irbid	3	10
1142	30	11	2026-08-09 10:00:06	Delivered	Cash	Amman	2	5
1143	342	12	2025-12-10 18:24:33	Delivered	Card	Aqaba	5	0
1144	299	7	2026-06-27 17:45:19	Delivered	Cash	Amman	2	0
1145	47	4	2025-11-26 22:00:29	Delivered	Card	Amman	2	10
1146	302	12	2026-06-02 15:00:33	Delivered	Transfer	Salt	3	0
1147	173	6	2026-05-06 15:09:39	Delivered	Transfer	Amman	2	0
1148	51	4	2026-10-12 14:48:09	Cancelled	Card	Amman	2	0
1149	243	12	2026-08-20 16:54:54	Delivered	Transfer	Irbid	3	0
1150	84	2	2026-06-06 11:00:18	Cancelled	Transfer	Riyadh	15	0
1151	48	8	2026-02-04 11:07:38	Delivered	Card	Amman	2	10
1152	453	1	2025-11-12 16:35:49	Cancelled	Cash	Riyadh	15	0
1153	352	6	2026-09-01 18:10:30	Cancelled	Card	Amman	2	0
1154	39	8	2026-06-20 16:10:17	Delivered	Cash	Madaba	3	0
1155	262	9	2026-07-28 21:36:30	Cancelled	Card	Aqaba	5	0
1156	242	7	2025-12-27 21:26:50	Delivered	Card	Aqaba	5	0
1157	342	2	2026-04-10 11:06:26	Delivered	Card	Aqaba	5	20
1158	367	8	2026-10-01 17:19:38	Delivered	Card	Dubai	15	0
1159	288	12	2026-08-27 16:10:44	Delivered	Card	Salt	3	0
1160	394	3	2026-10-23 14:14:51	Cancelled	Transfer	Amman	2	5
1161	157	14	2026-08-24 21:02:19	Delivered	Cash	Irbid	3	0
1162	448	12	2025-12-25 12:04:53	Delivered	Cash	Salt	3	10
1163	202	4	2025-11-20 16:25:14	Delivered	Cash	Amman	2	10
1164	5	15	2026-06-29 16:42:47	Delivered	Cash	Amman	2	0
1165	315	11	2025-11-17 19:39:38	Cancelled	Card	Amman	2	0
1166	98	11	2026-09-15 22:27:28	Delivered	Cash	Amman	2	0
1167	425	12	2026-06-17 17:33:56	Delivered	Transfer	Amman	2	0
1168	9	5	2026-10-03 20:19:18	Delivered	Transfer	Amman	2	10
1169	74	10	2026-03-24 21:48:23	Delivered	Card	Amman	2	0
1170	135	1	2026-04-08 11:39:34	Delivered	Cash	Madaba	3	0
1171	86	3	2025-12-09 21:49:04	Delivered	Card	Amman	2	0
1172	20	11	2026-01-29 14:45:24	Delivered	Transfer	Amman	2	0
1173	91	5	2026-09-02 17:50:14	Delivered	Cash	Amman	2	0
1174	85	11	2026-09-06 14:12:12	Delivered	Card	Amman	2	0
1175	470	8	2026-09-12 22:39:16	Delivered	Card	Aqaba	5	0
1176	275	1	2026-05-24 12:13:21	Delivered	Transfer	Zarqa	2.5	0
1177	213	6	2026-07-04 17:06:53	Cancelled	Cash	Jerash	3.5	0
1178	251	11	2026-06-22 12:18:47	Delivered	Card	Amman	2	0
1179	204	14	2025-12-25 21:54:41	Delivered	Transfer	Karak	4.5	0
1180	39	15	2025-11-14 11:51:33	Delivered	Card	Madaba	3	15
1181	210	7	2026-07-23 13:04:34	Delivered	Cash	Amman	2	0
1182	285	1	2026-04-17 22:17:20	Delivered	Cash	Amman	2	0
1183	397	15	2026-05-02 08:54:08	Delivered	Card	Dubai	15	0
1184	374	6	2026-03-08 12:36:15	Delivered	Card	Riyadh	15	0
1185	11	9	2025-12-14 09:54:48	Delivered	Card	Jerash	3.5	0
1186	241	6	2026-04-29 20:30:03	Cancelled	Card	Amman	2	0
1187	122	3	2026-07-19 14:47:47	Delivered	Card	Amman	2	0
1188	212	3	2026-07-03 19:57:03	Delivered	Cash	Zarqa	2.5	0
1189	217	7	2026-10-12 10:24:15	New	Cash	Amman	2	0
1190	430	14	2026-09-10 12:41:15	Cancelled	Card	Madaba	3	0
1191	391	7	2025-11-15 20:15:30	Delivered	Card	Amman	2	0
1192	95	12	2026-05-29 20:30:49	Delivered	Cash	Madaba	3	0
1193	171	4	2026-07-18 19:18:46	Delivered	Transfer	Amman	2	5
1194	217	14	2025-11-17 22:58:42	Delivered	Cash	Amman	2	0
1195	335	9	2026-06-04 17:44:48	Delivered	Card	Amman	2	10
1196	35	12	2026-04-06 14:59:05	Delivered	Card	Zarqa	2.5	0
1197	388	6	2026-05-16 10:45:39	Delivered	Cash	Aqaba	5	0
1198	86	5	2026-02-04 22:18:54	Delivered	Card	Amman	2	0
1199	102	7	2026-09-02 14:02:19	Delivered	Cash	Zarqa	2.5	0
1200	413	15	2025-11-02 17:16:18	Delivered	Card	Karak	4.5	0
1201	430	2	2026-05-31 21:55:31	Delivered	Cash	Madaba	3	0
1202	65	8	2026-07-22 12:57:26	Delivered	Cash	Irbid	3	0
1203	241	13	2026-09-05 22:39:51	Delivered	Card	Amman	2	5
1204	420	8	2025-12-27 13:48:39	Delivered	Transfer	Irbid	3	0
1205	45	14	2025-11-22 11:34:04	Delivered	Cash	Amman	2	0
1206	440	14	2026-08-22 21:15:48	Delivered	Card	Amman	2	0
1207	92	4	2025-12-17 12:46:25	Delivered	Cash	Amman	2	0
1208	151	7	2025-11-20 20:19:18	Delivered	Cash	Zarqa	2.5	5
1209	145	2	2026-04-05 16:47:11	Delivered	Card	Zarqa	2.5	0
1210	46	8	2025-12-01 22:53:54	Delivered	Cash	Amman	2	0
1211	71	3	2025-12-13 15:22:59	Delivered	Card	Amman	2	10
1212	244	11	2025-12-15 08:22:36	Delivered	Card	Salt	3	15
1213	126	9	2026-06-24 19:08:16	Delivered	Transfer	Irbid	3	0
1214	354	1	2026-07-23 16:56:59	Delivered	Transfer	Irbid	3	10
1215	302	10	2026-08-02 17:01:16	Cancelled	Transfer	Salt	3	0
1216	98	13	2025-12-19 13:40:53	Delivered	Cash	Amman	2	0
1217	111	15	2026-02-14 08:26:41	Delivered	Transfer	Amman	2	0
1218	92	11	2026-05-15 12:30:53	Delivered	Card	Amman	2	10
1219	428	3	2026-07-25 20:20:46	Delivered	Card	Zarqa	2.5	0
1220	479	14	2026-03-23 10:35:15	Delivered	Transfer	Jerash	3.5	0
1221	194	6	2025-11-05 12:55:32	Delivered	Card	Aqaba	5	5
1222	453	7	2025-12-27 10:15:23	Delivered	Card	Riyadh	15	0
1223	285	3	2026-08-22 10:05:14	Delivered	Transfer	Amman	2	0
1224	485	8	2025-12-15 09:45:40	Delivered	Card	Amman	2	20
1225	420	6	2026-09-30 17:39:31	Delivered	Cash	Irbid	3	0
1226	263	9	2026-06-07 19:00:58	Delivered	Cash	Amman	2	5
1227	83	12	2026-03-24 16:17:48	Delivered	Cash	Zarqa	2.5	0
1228	282	2	2026-07-25 14:41:44	Delivered	Card	Amman	2	0
1229	458	7	2026-08-11 21:54:21	Cancelled	Cash	Irbid	3	5
1230	165	8	2026-08-27 14:02:39	Cancelled	Cash	Amman	2	5
1231	311	15	2025-12-03 19:09:45	Delivered	Card	Amman	2	5
1232	340	3	2026-06-21 13:35:08	Delivered	Cash	Amman	2	0
1233	415	15	2026-04-25 20:57:36	Delivered	Card	Aqaba	5	0
1234	115	7	2026-09-26 17:30:17	Delivered	Card	Aqaba	5	0
1235	319	8	2026-10-13 20:27:34	Shipped	Cash	Amman	2	0
1236	304	6	2026-07-02 19:15:19	Cancelled	Card	Amman	2	0
1237	306	11	2026-03-15 09:52:57	Delivered	Card	Irbid	3	0
1238	47	11	2026-08-01 18:23:29	Delivered	Cash	Amman	2	10
1239	370	15	2026-04-26 17:19:53	Delivered	Cash	Madaba	3	0
1240	51	13	2026-02-08 11:13:47	Delivered	Card	Amman	2	0
1241	401	11	2026-06-16 09:16:46	Cancelled	Card	Riyadh	15	5
1242	257	1	2026-02-19 12:23:45	Delivered	Card	Zarqa	2.5	0
1243	49	9	2025-11-19 15:36:50	Delivered	Card	Amman	2	0
1244	350	11	2025-12-27 13:37:51	Delivered	Card	Amman	2	15
1245	241	10	2026-03-03 18:50:22	Delivered	Cash	Amman	2	0
1246	386	10	2026-02-18 13:52:06	Delivered	Cash	Riyadh	15	0
1247	306	11	2026-06-10 18:59:14	Delivered	Card	Irbid	3	0
1248	488	3	2026-10-08 08:58:29	Shipped	Card	Amman	2	0
1249	474	15	2026-10-09 22:46:30	Cancelled	Card	Doha	16	5
1250	192	3	2026-08-26 20:08:43	Delivered	Transfer	Salt	3	0
1251	49	14	2026-07-09 16:36:51	Cancelled	Transfer	Amman	2	10
1252	484	11	2026-09-14 13:44:13	Delivered	Cash	Amman	2	0
1253	455	15	2026-04-25 14:58:28	Delivered	Card	Aqaba	5	0
1254	47	12	2026-08-31 21:46:27	Delivered	Card	Amman	2	10
1255	260	3	2026-02-10 12:03:57	Delivered	Cash	Irbid	3	0
1256	232	7	2026-07-06 17:00:26	Delivered	Cash	Karak	4.5	0
1257	33	8	2026-06-02 09:31:09	Delivered	Transfer	Riyadh	15	0
1258	404	14	2026-02-22 22:52:42	Delivered	Card	Amman	2	5
1259	292	3	2025-12-13 13:45:57	Delivered	Card	Irbid	3	0
1260	404	9	2025-12-29 17:28:43	Delivered	Card	Amman	2	0
1261	478	10	2026-06-25 09:21:59	Delivered	Card	Aqaba	5	0
1262	200	12	2025-11-02 09:27:36	Delivered	Card	Amman	2	0
1263	433	8	2026-09-22 20:23:34	Delivered	Cash	Amman	2	0
1264	155	3	2026-05-28 13:58:16	Delivered	Card	Amman	2	0
1265	22	5	2025-12-16 16:15:12	Delivered	Card	Salt	3	0
1266	243	6	2026-09-07 15:44:01	Delivered	Card	Irbid	3	10
1267	151	7	2026-03-03 16:16:07	Delivered	Transfer	Zarqa	2.5	0
1268	235	7	2026-05-18 11:11:16	Delivered	Transfer	Amman	2	5
1269	492	8	2026-04-24 08:19:34	Delivered	Cash	Karak	4.5	0
1270	428	9	2026-03-29 08:29:38	Delivered	Transfer	Zarqa	2.5	5
1271	285	6	2026-05-20 15:23:18	Delivered	Cash	Amman	2	0
1272	7	14	2026-06-11 17:46:38	Delivered	Card	Irbid	3	10
1273	388	14	2026-07-02 20:55:28	Cancelled	Card	Aqaba	5	0
1274	448	14	2026-05-28 11:31:29	Delivered	Transfer	Salt	3	15
1275	136	2	2026-01-23 18:49:15	Delivered	Card	Amman	2	15
1276	404	11	2025-11-15 14:36:16	Delivered	Cash	Amman	2	0
1277	65	14	2026-04-06 16:21:15	Delivered	Cash	Irbid	3	0
1278	287	5	2026-07-25 12:10:23	Delivered	Cash	Amman	2	5
1279	496	15	2026-04-28 20:01:30	Delivered	Card	Irbid	3	0
1280	461	9	2025-11-18 09:39:45	Cancelled	Transfer	Irbid	3	15
1281	97	13	2026-09-22 10:51:19	Delivered	Cash	Irbid	3	5
1282	109	5	2026-02-02 16:00:30	Delivered	Card	Amman	2	0
1283	75	15	2026-01-23 22:31:23	Delivered	Cash	Amman	2	0
1284	126	12	2026-08-02 15:20:41	Delivered	Card	Irbid	3	0
1285	354	8	2026-07-25 22:49:21	Delivered	Transfer	Irbid	3	0
1286	433	8	2026-05-08 17:09:14	Delivered	Cash	Amman	2	0
1287	231	10	2025-12-19 19:06:36	Delivered	Transfer	Amman	2	0
1288	283	6	2026-01-29 16:09:35	Delivered	Cash	Madaba	3	5
1289	458	13	2026-04-25 18:58:23	Cancelled	Cash	Irbid	3	10
1290	415	15	2026-06-24 21:07:50	Cancelled	Cash	Aqaba	5	5
1291	346	7	2026-01-31 17:50:58	Delivered	Card	Aqaba	5	0
1292	231	6	2026-07-12 21:24:23	Delivered	Card	Amman	2	5
1293	324	5	2026-06-13 17:03:48	Delivered	Card	Jerash	3.5	0
1294	354	7	2026-09-28 17:04:26	Delivered	Card	Irbid	3	0
1295	72	12	2026-08-13 20:38:14	Delivered	Card	Amman	2	0
1296	50	4	2026-08-07 10:25:19	Cancelled	Transfer	Amman	2	0
1297	492	10	2026-03-20 12:10:10	Delivered	Transfer	Karak	4.5	15
1298	391	3	2025-12-13 11:55:38	Delivered	Card	Amman	2	10
1299	280	7	2026-09-12 18:03:27	Delivered	Cash	Madaba	3	10
1300	116	3	2026-04-16 18:03:45	Cancelled	Cash	Amman	2	0
1301	108	1	2026-04-15 11:43:36	Delivered	Cash	Amman	2	0
1302	106	14	2026-06-22 21:51:52	Delivered	Cash	Amman	2	15
1303	420	3	2026-02-15 11:27:19	Delivered	Cash	Irbid	3	0
1304	90	15	2026-06-23 11:14:22	Delivered	Card	Amman	2	0
1305	430	3	2025-11-28 12:40:44	Delivered	Transfer	Madaba	3	5
1306	59	2	2026-04-07 21:02:31	Delivered	Cash	Aqaba	5	0
1307	439	8	2026-05-16 15:54:48	Delivered	Cash	Dubai	15	15
1308	131	2	2026-03-06 20:27:07	Delivered	Transfer	Salt	3	0
1309	148	8	2026-08-31 13:38:35	Delivered	Card	Amman	2	0
1310	249	12	2026-10-01 08:05:58	Delivered	Card	Irbid	3	10
1311	50	13	2026-09-01 16:46:22	Delivered	Card	Amman	2	0
1312	372	3	2026-05-14 16:02:00	Delivered	Card	Salt	3	10
1313	230	12	2026-04-30 08:29:33	Delivered	Card	Riyadh	15	15
1314	476	10	2026-07-25 17:40:36	Delivered	Cash	Irbid	3	0
1315	280	1	2026-07-02 16:46:26	Delivered	Card	Madaba	3	5
1316	200	10	2026-04-05 20:05:32	Delivered	Card	Amman	2	0
1317	263	7	2026-04-27 20:50:13	Delivered	Card	Amman	2	5
1318	343	6	2026-07-05 20:10:53	Delivered	Card	Irbid	3	0
1319	28	11	2026-10-23 21:18:21	New	Transfer	Amman	2	0
1320	316	6	2026-03-02 15:08:19	Delivered	Cash	Zarqa	2.5	5
1321	108	9	2026-01-14 19:17:06	Delivered	Transfer	Amman	2	0
1322	67	3	2026-01-19 13:40:25	Delivered	Cash	Amman	2	0
1323	87	4	2025-12-11 16:36:47	Delivered	Transfer	Zarqa	2.5	10
1324	7	2	2025-12-06 14:02:45	Delivered	Cash	Irbid	3	0
1325	208	13	2026-04-17 14:39:20	Delivered	Transfer	Salt	3	0
1326	91	6	2026-03-31 15:15:29	Delivered	Cash	Amman	2	0
1327	205	2	2026-07-16 12:29:59	Delivered	Card	Madaba	3	10
1328	338	2	2026-02-17 08:14:16	Delivered	Card	Zarqa	2.5	0
1329	317	3	2026-04-09 13:58:05	Delivered	Cash	Salt	3	0
1330	129	11	2025-11-25 22:24:29	Delivered	Card	Amman	2	0
1331	401	5	2026-05-19 15:08:48	Delivered	Transfer	Riyadh	15	0
1332	308	11	2026-10-25 17:14:15	Shipped	Card	Zarqa	2.5	15
1333	4	6	2026-05-17 10:27:48	Delivered	Transfer	Jerash	3.5	5
1334	418	5	2026-01-12 16:38:25	Delivered	Card	Amman	2	0
1335	12	14	2026-03-24 16:25:29	Delivered	Card	Amman	2	0
1336	7	15	2026-09-29 20:06:01	Shipped	Card	Irbid	3	0
1337	405	7	2025-11-19 09:07:59	Cancelled	Card	Salt	3	5
1338	473	3	2026-05-02 17:27:28	Delivered	Card	Amman	2	0
1339	238	15	2026-10-15 11:46:14	Delivered	Transfer	Amman	2	5
1340	86	2	2026-09-17 13:13:46	Delivered	Card	Amman	2	0
1341	460	3	2026-07-24 19:46:09	Cancelled	Card	Zarqa	2.5	0
1342	190	15	2026-06-21 12:44:05	Shipped	Cash	Aqaba	5	0
1343	192	7	2025-11-18 13:23:35	Delivered	Cash	Salt	3	0
1344	194	1	2026-05-25 17:34:44	Delivered	Transfer	Aqaba	5	0
1345	354	2	2026-09-06 19:37:09	Delivered	Transfer	Irbid	3	0
1346	492	11	2025-11-04 09:50:50	Delivered	Card	Karak	4.5	0
1347	39	8	2025-12-15 08:03:43	Delivered	Card	Madaba	3	0
1348	103	14	2025-12-02 12:33:07	Delivered	Transfer	Dubai	15	15
1349	470	1	2026-07-21 09:38:08	Delivered	Transfer	Aqaba	5	0
1350	239	3	2025-12-03 18:45:14	Delivered	Card	Jerash	3.5	5
1351	312	14	2026-08-30 21:29:27	Delivered	Cash	Irbid	3	5
1352	64	7	2026-08-01 22:40:51	Delivered	Cash	Amman	2	0
1353	122	10	2026-10-17 20:15:51	New	Card	Amman	2	5
1354	487	1	2026-08-12 12:01:38	Delivered	Card	Zarqa	2.5	0
1355	263	3	2026-09-09 22:22:36	Delivered	Card	Amman	2	0
1356	206	8	2026-05-23 08:13:09	Delivered	Cash	Zarqa	2.5	5
1357	293	13	2026-07-09 11:46:29	Cancelled	Cash	Aqaba	5	10
1358	41	3	2026-09-15 11:25:59	Delivered	Card	Amman	2	0
1359	218	3	2026-02-11 16:18:46	Delivered	Cash	Irbid	3	0
1360	365	10	2026-07-19 17:10:40	Delivered	Cash	Amman	2	0
1361	375	1	2026-06-18 10:11:00	Delivered	Card	Amman	2	10
1362	342	10	2026-01-22 19:27:48	Cancelled	Cash	Aqaba	5	0
1363	58	15	2026-07-07 08:00:13	Delivered	Cash	Zarqa	2.5	0
1364	342	2	2026-09-24 15:21:51	Delivered	Card	Aqaba	5	0
1365	420	5	2026-06-07 21:35:30	Delivered	Cash	Irbid	3	10
1366	472	1	2026-05-19 14:16:37	Delivered	Card	Amman	2	0
1367	473	2	2026-10-21 08:37:08	New	Cash	Amman	2	5
1368	47	3	2026-02-08 21:10:45	Delivered	Cash	Amman	2	0
1369	92	5	2026-06-22 18:19:15	Delivered	Cash	Amman	2	0
1370	22	5	2025-12-25 22:21:49	Delivered	Card	Salt	3	0
1371	268	1	2026-08-27 09:28:17	Delivered	Cash	Amman	2	0
1372	296	7	2026-02-01 19:50:22	Delivered	Card	Amman	2	0
1373	232	2	2026-01-13 12:20:49	Cancelled	Transfer	Karak	4.5	0
1374	474	12	2025-12-26 18:59:10	Delivered	Cash	Doha	16	5
1375	219	9	2025-12-07 16:40:36	Cancelled	Card	Karak	4.5	0
1376	286	11	2026-09-01 09:40:58	Cancelled	Transfer	Amman	2	10
1377	414	6	2026-08-09 18:35:55	Delivered	Card	Riyadh	15	0
1378	282	9	2026-09-27 11:31:37	Delivered	Card	Amman	2	5
1379	396	14	2026-03-22 08:28:25	Delivered	Card	Amman	2	0
1380	414	4	2026-09-06 14:01:59	Delivered	Cash	Riyadh	15	0
1381	432	7	2025-11-28 17:45:50	Delivered	Card	Zarqa	2.5	0
1382	395	5	2026-07-24 16:19:52	Delivered	Cash	Aqaba	5	10
1383	92	3	2026-10-03 18:00:31	Delivered	Card	Amman	2	0
1384	8	9	2026-02-05 17:38:21	Delivered	Card	Salt	3	0
1385	149	13	2026-01-21 13:44:42	Delivered	Cash	Aqaba	5	0
1386	487	10	2026-08-15 15:04:18	Delivered	Transfer	Zarqa	2.5	0
1387	22	5	2025-12-29 09:12:26	Cancelled	Transfer	Salt	3	0
1388	478	7	2026-01-15 19:48:50	Delivered	Cash	Aqaba	5	5
1389	329	11	2026-09-20 14:18:18	Delivered	Cash	Amman	2	0
1390	163	1	2026-08-21 14:13:45	Delivered	Card	Amman	2	5
1391	206	9	2025-11-15 19:47:52	Delivered	Card	Zarqa	2.5	20
1392	31	7	2026-06-16 13:43:01	Delivered	Card	Zarqa	2.5	0
1393	118	15	2026-09-10 14:38:30	Cancelled	Card	Amman	2	5
1394	360	11	2025-12-08 10:36:58	Delivered	Cash	Amman	2	0
1395	84	3	2026-06-02 08:57:35	Delivered	Cash	Riyadh	15	0
1396	266	6	2026-06-16 22:35:59	Delivered	Cash	Irbid	3	0
1397	453	2	2026-03-13 14:23:32	Delivered	Transfer	Riyadh	15	0
1398	409	10	2026-09-28 21:16:28	Delivered	Transfer	Karak	4.5	20
1399	231	7	2026-03-09 16:57:34	Delivered	Transfer	Amman	2	0
1400	383	8	2025-11-28 09:09:57	Delivered	Card	Irbid	3	15
1401	343	1	2025-12-07 20:24:16	Delivered	Cash	Irbid	3	10
1402	160	14	2026-05-23 08:50:12	Delivered	Card	Amman	2	0
1403	374	11	2026-03-15 18:23:15	Shipped	Cash	Riyadh	15	10
1404	221	6	2025-12-31 19:32:49	Delivered	Transfer	Riyadh	15	0
1405	354	7	2026-07-25 12:03:18	Delivered	Card	Irbid	3	0
1406	40	9	2025-11-28 09:05:02	Cancelled	Cash	Amman	2	0
1407	173	9	2026-01-30 08:09:22	Delivered	Cash	Amman	2	5
1408	235	6	2026-08-31 19:41:42	Cancelled	Cash	Amman	2	0
1409	80	4	2026-01-17 18:43:39	Delivered	Card	Riyadh	15	0
1410	354	2	2026-09-12 20:50:43	Delivered	Transfer	Irbid	3	0
1411	184	14	2025-12-29 22:24:49	Cancelled	Cash	Amman	2	0
1412	329	2	2026-05-05 17:46:25	Delivered	Cash	Amman	2	0
1413	134	9	2025-11-24 15:16:16	Delivered	Card	Amman	2	0
1414	67	11	2026-06-14 09:06:57	Delivered	Cash	Amman	2	5
1415	407	11	2025-12-10 21:36:26	Delivered	Cash	Amman	2	0
1416	5	14	2026-04-19 21:10:52	Delivered	Transfer	Amman	2	15
1417	119	9	2026-08-04 12:24:00	Delivered	Transfer	Dubai	15	15
1418	86	1	2026-03-15 15:11:31	Delivered	Cash	Amman	2	5
1419	308	8	2026-10-14 17:29:37	New	Transfer	Zarqa	2.5	0
1420	372	15	2025-12-06 08:07:58	Delivered	Card	Salt	3	0
1421	483	15	2026-10-09 15:21:42	New	Card	Amman	2	0
1422	140	2	2026-09-06 19:50:42	Delivered	Transfer	Madaba	3	20
1423	435	6	2025-12-02 20:29:01	Delivered	Cash	Amman	2	0
1424	59	3	2026-02-13 22:19:15	Delivered	Card	Aqaba	5	0
1425	396	8	2025-12-24 09:13:34	Delivered	Transfer	Amman	2	0
1426	348	6	2026-04-02 21:32:21	Delivered	Card	Amman	2	0
1427	261	14	2026-08-04 17:02:58	Cancelled	Card	Irbid	3	0
1428	445	11	2026-04-18 11:05:42	Delivered	Transfer	Amman	2	0
1429	261	8	2026-03-31 15:59:55	Delivered	Cash	Irbid	3	15
1430	114	14	2025-11-04 22:30:28	Delivered	Card	Amman	2	0
1431	84	11	2026-09-29 20:54:53	Delivered	Card	Riyadh	15	0
1432	290	10	2026-02-20 10:49:29	Delivered	Transfer	Amman	2	0
1433	391	15	2025-11-22 10:21:21	Delivered	Card	Amman	2	5
1434	49	6	2026-06-01 16:34:54	Cancelled	Card	Amman	2	0
1435	184	5	2025-11-06 12:32:42	Cancelled	Card	Amman	2	0
1436	424	7	2026-10-20 16:38:21	New	Card	Amman	2	0
1437	212	3	2025-11-17 08:40:35	Delivered	Cash	Zarqa	2.5	15
1438	253	12	2026-10-22 19:32:31	New	Cash	Zarqa	2.5	0
1439	94	3	2026-06-03 10:40:41	Delivered	Card	Zarqa	2.5	0
1440	331	6	2026-05-08 22:37:42	Cancelled	Card	Amman	2	0
1441	324	2	2026-10-12 17:45:40	Delivered	Card	Jerash	3.5	10
1442	177	15	2025-12-31 22:42:49	Delivered	Cash	Amman	2	5
1443	303	11	2026-02-03 21:58:23	Delivered	Cash	Amman	2	0
1444	235	8	2026-06-25 22:16:29	Delivered	Card	Amman	2	0
1445	441	12	2026-03-27 19:11:37	Delivered	Cash	Karak	4.5	0
1446	173	1	2026-10-04 15:36:20	Delivered	Cash	Amman	2	15
1447	455	2	2026-04-16 08:05:35	Cancelled	Transfer	Aqaba	5	0
1448	448	13	2026-06-07 09:11:31	Delivered	Cash	Salt	3	0
1449	348	14	2026-02-13 11:02:05	Delivered	Card	Amman	2	0
1450	287	13	2026-10-13 20:23:10	Delivered	Cash	Amman	2	0
1451	484	14	2026-09-06 10:14:48	Delivered	Card	Amman	2	0
1452	494	14	2026-07-06 21:41:13	Delivered	Cash	Amman	2	0
1453	12	1	2026-03-08 20:16:37	Delivered	Card	Amman	2	0
1454	165	2	2026-01-18 21:41:29	Delivered	Card	Amman	2	5
1455	380	15	2026-06-09 19:48:28	Cancelled	Transfer	Irbid	3	5
1456	231	14	2025-11-07 17:17:25	Cancelled	Transfer	Amman	2	0
1457	231	1	2025-11-15 19:43:20	Delivered	Cash	Amman	2	0
1458	139	11	2026-10-23 16:35:12	Shipped	Cash	Amman	2	0
1459	346	15	2026-10-18 13:47:17	Delivered	Cash	Aqaba	5	0
1460	109	3	2026-07-12 22:13:35	Delivered	Transfer	Amman	2	10
1461	18	7	2026-05-31 15:23:33	Delivered	Card	Amman	2	0
1462	108	6	2026-08-27 22:10:36	Delivered	Cash	Amman	2	0
1463	178	6	2026-09-29 19:19:45	Delivered	Cash	Irbid	3	0
1464	35	5	2026-07-23 14:47:47	Delivered	Cash	Zarqa	2.5	0
1465	473	5	2026-02-27 09:17:51	Delivered	Card	Amman	2	0
1466	391	15	2025-11-15 08:54:05	Delivered	Card	Amman	2	0
1467	485	3	2026-06-16 20:13:24	Delivered	Card	Amman	2	5
1468	315	11	2025-11-11 17:12:16	Delivered	Card	Amman	2	0
1469	314	1	2026-10-15 21:47:30	Cancelled	Card	Amman	2	0
1470	190	12	2026-08-22 10:53:05	Shipped	Card	Aqaba	5	0
1471	499	9	2025-12-05 15:13:17	Delivered	Card	Amman	2	0
1472	273	12	2026-09-11 22:46:32	Delivered	Card	Zarqa	2.5	0
1473	276	6	2026-07-03 19:39:18	Delivered	Card	Amman	2	0
1474	44	13	2026-10-12 19:57:40	Cancelled	Cash	Amman	2	0
1475	270	6	2026-09-30 18:34:51	Delivered	Card	Zarqa	2.5	0
1476	47	15	2025-12-13 16:08:56	Delivered	Transfer	Amman	2	10
1477	53	6	2026-06-02 12:59:25	Delivered	Card	Amman	2	15
1478	241	15	2026-10-10 16:54:41	Shipped	Cash	Amman	2	0
1479	317	12	2026-04-24 13:59:06	Delivered	Card	Salt	3	0
1480	30	7	2026-07-05 14:46:01	Delivered	Transfer	Amman	2	10
1481	205	12	2026-07-26 18:33:08	Cancelled	Cash	Madaba	3	0
1482	492	8	2026-06-17 11:31:33	Delivered	Card	Karak	4.5	5
1483	20	11	2026-07-22 16:17:38	Delivered	Card	Amman	2	5
1484	30	6	2026-07-22 18:55:17	Delivered	Card	Amman	2	0
1485	297	9	2026-01-22 15:37:17	Delivered	Cash	Amman	2	10
1486	371	3	2025-12-02 10:25:39	Shipped	Cash	Amman	2	10
1487	106	7	2025-11-06 19:48:02	Shipped	Card	Amman	2	0
1488	231	7	2026-07-04 10:21:45	Delivered	Card	Amman	2	0
1489	420	3	2026-02-16 22:49:26	Delivered	Cash	Irbid	3	0
1490	473	2	2026-10-23 20:49:33	New	Card	Amman	2	10
1491	370	13	2026-02-15 11:51:14	Delivered	Card	Madaba	3	5
1492	65	1	2026-02-15 22:02:13	Delivered	Cash	Irbid	3	0
1493	198	15	2025-12-13 18:31:57	Delivered	Cash	Amman	2	0
1494	189	14	2025-11-09 18:40:24	Delivered	Card	Amman	2	0
1495	74	7	2026-03-29 11:45:09	Delivered	Card	Amman	2	20
1496	60	7	2026-08-12 20:36:02	Delivered	Transfer	Amman	2	0
1497	371	11	2026-10-12 13:51:23	Shipped	Card	Amman	2	0
1498	360	7	2026-07-27 18:49:02	Delivered	Transfer	Amman	2	0
1499	1	3	2026-08-07 12:09:54	Delivered	Cash	Zarqa	2.5	0
1500	300	9	2026-10-18 17:18:00	Delivered	Cash	Irbid	3	5
1501	29	1	2026-07-10 08:09:47	Delivered	Cash	Aqaba	5	5
1502	231	7	2026-02-04 19:13:18	Cancelled	Card	Amman	2	0
1503	47	6	2026-01-03 08:19:35	Delivered	Transfer	Amman	2	0
1504	254	13	2026-09-11 12:05:30	Shipped	Card	Riyadh	15	0
1505	319	11	2026-09-30 13:48:31	Delivered	Card	Amman	2	15
1506	271	8	2026-07-07 20:57:45	Delivered	Card	Madaba	3	0
1507	274	2	2026-06-15 22:19:47	Delivered	Card	Zarqa	2.5	5
1508	302	3	2026-08-18 17:13:32	Delivered	Cash	Salt	3	0
1509	414	15	2026-06-07 20:38:40	Delivered	Cash	Riyadh	15	10
1510	85	13	2026-03-28 09:43:22	Delivered	Card	Amman	2	0
1511	292	7	2025-12-01 14:16:28	Delivered	Transfer	Irbid	3	0
1512	356	11	2026-10-15 13:22:35	Shipped	Card	Irbid	3	5
1513	148	11	2026-08-13 13:08:54	Delivered	Card	Amman	2	0
1514	426	1	2026-07-08 08:06:56	Cancelled	Transfer	Amman	2	5
1515	401	15	2026-09-03 17:49:37	Delivered	Card	Riyadh	15	5
1516	47	2	2026-08-31 22:36:26	Delivered	Card	Amman	2	0
1517	350	2	2026-09-04 10:37:14	Delivered	Card	Amman	2	0
1518	437	11	2026-03-16 08:52:13	Delivered	Transfer	Karak	4.5	0
1519	354	15	2026-08-19 14:25:06	Delivered	Transfer	Irbid	3	0
1520	30	8	2026-06-30 21:23:04	Delivered	Cash	Amman	2	0
1521	93	8	2026-02-02 17:55:47	Delivered	Card	Amman	2	0
1522	405	12	2025-11-11 19:24:40	Delivered	Transfer	Salt	3	0
1523	33	6	2025-11-26 20:27:00	Delivered	Cash	Riyadh	15	0
1524	203	15	2025-11-22 19:04:44	Delivered	Cash	Amman	2	5
1525	440	12	2025-11-16 08:37:43	Delivered	Transfer	Amman	2	10
1526	229	10	2026-04-24 17:35:14	Delivered	Transfer	Madaba	3	0
1527	138	3	2026-05-03 21:41:28	Cancelled	Transfer	Amman	2	0
1528	299	8	2026-04-26 09:25:54	Cancelled	Card	Amman	2	0
1529	181	15	2026-07-24 22:00:08	Cancelled	Card	Amman	2	0
1530	354	2	2026-09-07 20:12:19	Delivered	Transfer	Irbid	3	0
1531	22	13	2026-05-22 10:53:31	Delivered	Cash	Salt	3	0
1532	129	1	2026-02-12 13:52:47	Delivered	Card	Amman	2	5
1533	49	12	2025-11-29 10:00:40	Delivered	Cash	Amman	2	0
1534	179	11	2026-05-31 17:53:39	Delivered	Cash	Amman	2	0
1535	321	13	2025-12-09 08:51:57	Delivered	Card	Amman	2	0
1536	22	3	2026-01-16 09:27:59	Delivered	Cash	Salt	3	0
1537	77	13	2026-05-29 15:33:49	Delivered	Transfer	Karak	4.5	0
1538	209	15	2026-04-03 16:09:12	Delivered	Transfer	Riyadh	15	0
1539	152	12	2026-05-26 22:29:33	Delivered	Card	Amman	2	0
1540	197	8	2026-06-11 14:45:02	Delivered	Transfer	Riyadh	15	0
1541	48	14	2026-01-09 09:42:41	Delivered	Card	Amman	2	15
1542	318	6	2026-02-24 14:05:17	Cancelled	Card	Amman	2	10
1543	147	2	2026-02-13 17:50:39	Delivered	Cash	Zarqa	2.5	10
1544	390	2	2026-06-19 14:53:39	Delivered	Card	Madaba	3	5
1545	313	6	2026-07-30 09:53:59	Delivered	Transfer	Amman	2	20
1546	490	1	2026-02-21 15:57:18	Delivered	Transfer	Amman	2	0
1547	152	3	2026-07-24 22:28:00	Delivered	Cash	Amman	2	0
1548	4	12	2025-11-10 14:26:55	Shipped	Card	Jerash	3.5	0
1549	323	8	2026-01-05 21:59:13	Delivered	Transfer	Riyadh	15	0
1550	391	12	2026-09-03 21:00:58	Delivered	Card	Amman	2	20
1551	486	3	2025-11-17 16:22:14	Delivered	Card	Amman	2	0
1552	395	6	2026-08-28 12:11:07	Delivered	Cash	Aqaba	5	0
1553	118	6	2026-07-29 19:26:46	Delivered	Card	Amman	2	20
1554	310	14	2026-07-14 11:58:06	Delivered	Cash	Amman	2	0
1555	231	13	2026-07-25 15:23:36	Delivered	Card	Amman	2	0
1556	396	10	2026-01-31 15:54:08	Delivered	Cash	Amman	2	5
1557	145	4	2025-11-01 10:47:12	Delivered	Card	Zarqa	2.5	5
1558	350	15	2025-11-10 18:51:42	Delivered	Cash	Amman	2	10
1559	229	15	2026-08-21 18:14:24	Delivered	Card	Madaba	3	0
1560	86	6	2026-04-06 10:03:23	Delivered	Card	Amman	2	20
1561	73	11	2026-07-29 09:07:43	Delivered	Cash	Amman	2	15
1562	4	8	2026-08-28 13:26:32	Delivered	Card	Jerash	3.5	0
1563	407	14	2026-08-30 11:44:58	Delivered	Cash	Amman	2	10
1564	196	10	2026-07-11 22:51:48	Cancelled	Transfer	Amman	2	5
1565	487	4	2026-10-18 13:53:40	Cancelled	Transfer	Zarqa	2.5	10
1566	82	8	2026-09-28 19:17:43	Delivered	Card	Amman	2	10
1567	18	12	2026-10-04 13:14:34	Delivered	Card	Amman	2	0
1568	203	5	2026-05-14 19:33:02	Delivered	Card	Amman	2	0
1569	354	5	2026-09-05 20:45:16	Delivered	Cash	Irbid	3	5
1570	232	7	2026-09-28 19:50:57	Delivered	Cash	Karak	4.5	0
1571	295	1	2025-11-28 20:36:18	Delivered	Transfer	Amman	2	0
1572	296	7	2025-12-29 16:16:37	Cancelled	Card	Amman	2	0
1573	216	6	2026-03-18 22:20:28	Cancelled	Card	Riyadh	15	0
1574	233	15	2026-06-10 08:30:05	Delivered	Card	Irbid	3	15
1575	249	12	2025-12-07 09:48:02	Delivered	Transfer	Irbid	3	0
1576	342	13	2026-04-04 19:17:32	Cancelled	Cash	Aqaba	5	0
1577	238	9	2026-07-22 08:12:07	Cancelled	Transfer	Amman	2	0
1578	217	4	2026-07-24 17:32:53	Delivered	Cash	Amman	2	0
1579	219	12	2026-04-25 17:39:49	Delivered	Cash	Karak	4.5	10
1580	185	4	2026-02-21 17:52:57	Delivered	Transfer	Irbid	3	0
1581	99	3	2026-01-23 10:55:40	Delivered	Card	Zarqa	2.5	15
1582	334	15	2026-07-31 08:48:44	Delivered	Cash	Karak	4.5	10
1583	27	8	2026-04-27 12:45:28	Delivered	Card	Aqaba	5	10
1584	181	12	2025-12-14 15:09:55	Delivered	Transfer	Amman	2	0
1585	479	11	2026-08-09 21:23:23	Delivered	Card	Jerash	3.5	5
1586	469	5	2026-07-29 19:46:54	Delivered	Cash	Salt	3	5
1587	140	5	2026-08-11 19:07:56	Delivered	Cash	Madaba	3	0
1588	396	1	2026-02-16 13:32:32	Delivered	Card	Amman	2	0
1589	225	14	2026-06-20 22:31:17	Delivered	Card	Amman	2	10
1590	404	11	2026-07-06 17:02:01	Delivered	Transfer	Amman	2	10
1591	423	13	2025-12-25 10:12:43	Delivered	Card	Salt	3	0
1592	392	3	2026-05-12 20:09:58	Delivered	Cash	Aqaba	5	0
1593	406	15	2025-12-28 11:17:06	Delivered	Transfer	Amman	2	0
1594	391	7	2026-04-30 13:56:53	Delivered	Cash	Amman	2	0
1595	208	5	2025-11-28 20:39:22	Delivered	Transfer	Salt	3	0
1596	139	9	2025-12-11 13:58:21	Delivered	Card	Amman	2	0
1597	337	9	2026-06-04 17:56:33	Shipped	Card	Riyadh	15	0
1598	273	3	2026-09-01 13:53:13	Delivered	Cash	Zarqa	2.5	0
1599	22	7	2025-11-02 22:15:34	Delivered	Cash	Salt	3	0
1600	229	2	2026-05-26 22:17:56	Delivered	Cash	Madaba	3	0
1601	138	1	2026-03-23 21:26:19	Delivered	Card	Amman	2	0
1602	326	14	2026-07-24 19:35:30	Delivered	Cash	Aqaba	5	0
1603	145	11	2026-03-12 17:13:50	Delivered	Cash	Zarqa	2.5	5
1604	66	9	2026-09-11 10:40:24	Delivered	Cash	Salt	3	0
1605	336	3	2026-07-24 22:07:42	Shipped	Cash	Amman	2	5
1606	489	14	2026-09-27 14:35:31	Delivered	Cash	Amman	2	0
1607	32	8	2026-07-22 22:19:45	Cancelled	Cash	Salt	3	0
1608	2	10	2026-04-30 21:47:08	Cancelled	Card	Madaba	3	0
1609	79	14	2025-11-19 09:16:27	Delivered	Card	Amman	2	0
1610	252	1	2026-06-15 19:06:55	Delivered	Cash	Amman	2	0
1611	473	3	2025-11-12 14:23:40	Delivered	Transfer	Amman	2	0
1612	235	10	2026-07-05 11:11:54	Delivered	Card	Amman	2	5
1613	35	8	2026-07-10 13:09:08	Delivered	Cash	Zarqa	2.5	10
1614	308	6	2026-02-09 10:30:01	Delivered	Card	Zarqa	2.5	0
1615	492	12	2026-02-08 21:00:40	Delivered	Card	Karak	4.5	0
1616	371	13	2026-01-11 16:37:29	Delivered	Cash	Amman	2	0
1617	72	13	2026-09-14 17:08:28	Delivered	Cash	Amman	2	0
1618	96	12	2025-12-15 13:21:32	Delivered	Cash	Amman	2	0
1619	448	2	2026-10-12 18:57:30	Shipped	Card	Salt	3	0
1620	272	12	2025-12-27 08:20:29	Cancelled	Transfer	Amman	2	0
1621	86	12	2026-03-04 20:12:36	Delivered	Transfer	Amman	2	0
1622	157	2	2025-11-29 17:18:12	Delivered	Card	Irbid	3	0
1623	342	14	2025-12-27 10:46:02	Delivered	Card	Aqaba	5	0
1624	382	5	2026-03-07 14:12:48	Delivered	Card	Amman	2	0
1625	52	3	2026-03-15 22:28:02	Delivered	Card	Karak	4.5	0
1626	268	1	2026-08-22 15:24:38	Delivered	Card	Amman	2	0
1627	271	14	2026-07-31 09:31:37	Delivered	Cash	Madaba	3	0
1628	350	12	2026-09-19 21:22:52	Delivered	Card	Amman	2	15
1629	4	11	2026-03-14 21:00:30	Delivered	Card	Jerash	3.5	0
1630	414	7	2026-10-22 19:52:04	New	Transfer	Riyadh	15	0
1631	292	1	2025-12-05 21:36:00	Delivered	Card	Irbid	3	0
1632	336	11	2026-07-29 22:54:51	Delivered	Card	Amman	2	10
1633	443	12	2025-12-22 13:27:41	Delivered	Transfer	Amman	2	0
1634	150	15	2026-09-01 19:51:36	Delivered	Transfer	Irbid	3	0
1635	487	15	2026-08-31 21:59:46	Delivered	Card	Zarqa	2.5	5
1636	368	9	2026-07-27 15:12:23	Delivered	Card	Irbid	3	0
1637	145	12	2026-08-02 14:38:37	Delivered	Cash	Zarqa	2.5	0
1638	348	8	2026-03-11 17:07:09	Delivered	Card	Amman	2	0
1639	22	13	2026-09-25 10:32:51	Delivered	Card	Salt	3	0
1640	242	10	2026-07-04 09:11:35	Delivered	Card	Aqaba	5	0
1641	221	4	2026-06-24 13:57:59	Delivered	Card	Riyadh	15	0
1642	331	2	2026-07-06 17:05:29	Delivered	Cash	Amman	2	0
1643	248	14	2026-10-23 19:21:31	New	Cash	Amman	2	15
1644	359	6	2026-02-05 19:54:23	Delivered	Card	Amman	2	10
1645	401	3	2026-08-02 08:25:36	Delivered	Transfer	Riyadh	15	0
1646	354	7	2026-07-20 21:31:49	Delivered	Card	Irbid	3	0
1647	441	15	2026-09-11 22:39:41	Delivered	Card	Karak	4.5	10
1648	394	14	2026-09-21 09:20:45	Delivered	Cash	Amman	2	0
1649	206	15	2026-10-18 10:19:53	New	Cash	Zarqa	2.5	20
1650	311	8	2026-10-23 18:15:36	New	Transfer	Amman	2	5
1651	187	15	2025-12-02 20:39:59	Delivered	Card	Irbid	3	0
1652	426	3	2026-06-08 17:49:22	Delivered	Cash	Amman	2	0
1653	199	11	2026-05-16 22:38:21	Delivered	Cash	Zarqa	2.5	5
1654	471	9	2025-12-05 14:44:48	Cancelled	Card	Amman	2	0
1655	85	14	2026-09-21 10:10:05	Delivered	Card	Amman	2	0
1656	127	13	2025-12-28 12:00:48	Delivered	Transfer	Amman	2	0
1657	53	3	2026-01-26 10:00:57	Delivered	Card	Amman	2	0
1658	453	8	2026-09-28 12:27:39	Cancelled	Card	Riyadh	15	0
1659	396	15	2026-01-03 14:29:56	Delivered	Transfer	Amman	2	10
1660	55	1	2026-04-10 10:46:07	Delivered	Cash	Amman	2	0
1661	110	3	2026-02-02 22:45:00	Delivered	Card	Amman	2	5
1662	417	5	2026-09-19 20:10:00	Shipped	Transfer	Amman	2	15
1663	449	6	2026-07-14 10:04:02	Delivered	Card	Amman	2	10
1664	63	12	2026-03-22 13:18:56	Delivered	Card	Amman	2	0
1665	104	9	2026-10-03 16:10:50	Cancelled	Transfer	Irbid	3	0
1666	169	6	2026-06-22 11:05:33	Delivered	Cash	Amman	2	10
1667	232	1	2025-11-30 21:30:54	Shipped	Card	Karak	4.5	0
1668	303	11	2026-05-24 13:29:24	Delivered	Card	Amman	2	5
1669	459	12	2026-05-03 20:52:16	Delivered	Cash	Irbid	3	0
1670	140	12	2026-08-25 18:44:22	Delivered	Transfer	Madaba	3	0
1671	401	15	2026-06-08 20:22:46	Delivered	Cash	Riyadh	15	0
1672	456	14	2026-01-12 10:26:55	Delivered	Card	Amman	2	0
1673	38	12	2025-12-03 21:33:52	Delivered	Card	Zarqa	2.5	0
1674	35	14	2026-01-22 13:37:27	Delivered	Transfer	Zarqa	2.5	0
1675	111	4	2025-12-24 16:32:25	Delivered	Transfer	Amman	2	5
1676	340	13	2025-11-14 21:59:34	Delivered	Cash	Amman	2	0
1677	34	7	2026-01-18 19:16:01	Delivered	Cash	Amman	2	0
1678	432	5	2025-11-06 10:01:17	Delivered	Card	Zarqa	2.5	0
1679	206	1	2025-12-04 20:01:18	Delivered	Cash	Zarqa	2.5	0
1680	481	15	2026-06-22 10:03:46	Delivered	Cash	Amman	2	0
1681	231	8	2026-10-03 14:50:49	Delivered	Card	Amman	2	10
1682	229	3	2026-06-05 15:58:23	Cancelled	Card	Madaba	3	0
1683	265	1	2026-08-21 15:41:40	Delivered	Card	Zarqa	2.5	0
1684	163	12	2026-09-12 16:51:53	Delivered	Card	Amman	2	5
1685	385	8	2026-01-11 18:50:06	Delivered	Cash	Irbid	3	0
1686	269	14	2026-06-11 14:46:08	Delivered	Transfer	Amman	2	0
1687	5	7	2025-11-28 18:04:49	Delivered	Card	Amman	2	0
1688	104	12	2026-04-13 22:48:54	Delivered	Transfer	Irbid	3	5
1689	61	2	2025-12-25 08:47:02	Delivered	Card	Aqaba	5	15
1690	373	11	2025-12-05 20:11:18	Delivered	Card	Madaba	3	0
1691	205	2	2026-02-11 12:17:09	Cancelled	Cash	Madaba	3	10
1692	385	5	2026-04-19 13:29:49	Delivered	Cash	Irbid	3	5
1693	181	14	2026-06-05 17:39:55	Delivered	Card	Amman	2	5
1694	122	10	2026-02-25 09:51:29	Delivered	Card	Amman	2	15
1695	134	2	2026-07-29 22:59:43	Delivered	Card	Amman	2	20
1696	464	3	2026-10-19 13:06:32	Shipped	Card	Salt	3	0
1697	232	6	2025-11-15 20:50:44	Delivered	Cash	Karak	4.5	10
1698	452	12	2026-09-24 14:00:31	Delivered	Card	Amman	2	0
1699	279	6	2026-10-09 20:27:07	Delivered	Transfer	Zarqa	2.5	0
1700	130	5	2026-04-18 15:48:49	Shipped	Transfer	Salt	3	0
1701	288	3	2026-10-03 08:11:51	Delivered	Card	Salt	3	0
1702	83	1	2026-07-24 08:59:51	Delivered	Card	Zarqa	2.5	0
1703	409	2	2026-02-17 20:50:52	Delivered	Cash	Karak	4.5	5
1704	192	1	2026-08-28 12:27:18	Delivered	Cash	Salt	3	0
1705	401	15	2026-02-15 17:14:50	Cancelled	Card	Riyadh	15	0
1706	47	14	2026-01-02 21:16:01	Delivered	Cash	Amman	2	20
1707	492	7	2026-02-22 18:47:16	Delivered	Cash	Karak	4.5	15
1708	352	2	2026-04-01 18:25:49	Delivered	Cash	Amman	2	10
1709	231	13	2026-08-21 18:59:15	Delivered	Card	Amman	2	10
1710	170	3	2026-07-16 22:07:11	Delivered	Cash	Dubai	15	5
1711	66	5	2025-12-25 10:54:09	Cancelled	Cash	Salt	3	0
1712	336	2	2025-11-21 22:24:21	Delivered	Cash	Amman	2	0
1713	352	11	2026-01-07 17:10:02	Delivered	Card	Amman	2	0
1714	490	13	2026-01-09 22:57:26	Delivered	Cash	Amman	2	0
1715	108	15	2026-08-26 20:08:45	Delivered	Card	Amman	2	5
1716	184	10	2026-07-09 10:04:16	Delivered	Cash	Amman	2	20
1717	466	7	2026-04-25 15:04:23	Cancelled	Cash	Amman	2	0
1718	33	1	2026-06-21 18:51:36	Shipped	Card	Riyadh	15	10
1719	129	12	2025-12-14 16:21:03	Cancelled	Card	Amman	2	0
1720	234	3	2026-01-28 18:40:30	Delivered	Card	Karak	4.5	0
1721	381	15	2026-05-02 09:52:20	Delivered	Transfer	Amman	2	0
1722	94	13	2026-02-17 22:35:33	Delivered	Transfer	Zarqa	2.5	10
1723	81	8	2026-03-24 11:59:01	Delivered	Card	Amman	2	0
1724	163	2	2026-09-17 08:37:21	Delivered	Cash	Amman	2	0
1725	49	15	2026-01-03 19:08:02	Delivered	Cash	Amman	2	0
1726	429	12	2026-03-27 20:56:58	Cancelled	Card	Irbid	3	0
1727	339	11	2026-10-22 16:47:53	Delivered	Transfer	Amman	2	0
1728	371	3	2025-11-28 20:59:27	Delivered	Card	Amman	2	15
1729	150	14	2026-06-21 09:10:17	Delivered	Cash	Irbid	3	5
1730	492	7	2026-06-13 12:28:00	Delivered	Card	Karak	4.5	0
1731	194	2	2026-08-24 14:57:44	Cancelled	Cash	Aqaba	5	20
1732	383	15	2025-12-31 14:57:30	Shipped	Cash	Irbid	3	0
1733	51	6	2026-02-28 12:11:21	Delivered	Cash	Amman	2	0
1734	22	15	2026-02-14 22:58:17	Delivered	Cash	Salt	3	0
1735	153	7	2026-10-24 22:43:38	Cancelled	Card	Salt	3	0
1736	116	2	2026-06-16 08:50:17	Delivered	Transfer	Amman	2	0
1737	278	4	2025-12-13 18:52:54	Cancelled	Transfer	Aqaba	5	0
1738	416	2	2026-04-16 13:53:32	Delivered	Cash	Amman	2	5
1739	49	4	2026-09-06 15:11:26	Delivered	Card	Amman	2	0
1740	406	11	2026-01-21 17:50:01	Delivered	Cash	Amman	2	10
1741	128	13	2026-10-24 20:22:26	New	Cash	Amman	2	10
1742	4	14	2026-04-11 17:53:14	Delivered	Card	Jerash	3.5	5
1743	406	1	2026-06-10 21:16:30	Cancelled	Card	Amman	2	0
1744	35	8	2026-05-06 17:39:34	Delivered	Card	Zarqa	2.5	0
1745	207	3	2026-09-07 21:34:29	Delivered	Card	Karak	4.5	5
1746	218	4	2026-10-16 10:51:55	Delivered	Cash	Irbid	3	0
1747	113	8	2025-12-29 09:58:07	Delivered	Card	Amman	2	0
1748	245	2	2026-10-04 12:22:09	Delivered	Cash	Karak	4.5	0
1749	229	15	2025-12-16 13:22:25	Cancelled	Card	Madaba	3	10
1750	353	15	2026-10-07 12:04:29	Shipped	Cash	Doha	16	0
1751	214	10	2026-10-20 15:26:45	Cancelled	Card	Amman	2	10
1752	22	2	2025-11-03 22:52:54	Delivered	Card	Salt	3	0
1753	460	1	2026-06-16 20:23:40	Delivered	Cash	Zarqa	2.5	0
1754	46	3	2026-04-22 11:40:50	Delivered	Card	Amman	2	0
1755	58	11	2026-07-24 09:17:00	Delivered	Cash	Zarqa	2.5	15
1756	30	5	2026-06-03 11:48:22	Delivered	Cash	Amman	2	15
1757	231	2	2026-01-11 08:19:59	Delivered	Transfer	Amman	2	0
1758	241	7	2026-05-01 15:25:04	Delivered	Card	Amman	2	0
1759	232	14	2025-12-20 14:26:27	Delivered	Cash	Karak	4.5	0
1760	34	14	2025-12-01 09:13:56	Delivered	Card	Amman	2	0
1761	445	3	2026-07-17 12:51:28	Delivered	Transfer	Amman	2	0
1762	69	5	2026-06-15 11:36:44	Delivered	Card	Amman	2	0
1763	193	13	2026-03-29 21:10:47	Delivered	Card	Dubai	15	0
1764	352	15	2026-09-20 18:09:10	Cancelled	Card	Amman	2	0
1765	151	12	2026-07-05 17:58:13	Delivered	Cash	Zarqa	2.5	0
1766	164	5	2026-06-06 15:59:28	Cancelled	Card	Amman	2	0
1767	263	2	2025-12-04 19:26:47	Delivered	Cash	Amman	2	0
1768	172	1	2026-08-17 17:26:20	Delivered	Card	Amman	2	0
1769	361	3	2026-07-23 10:05:00	Delivered	Transfer	Amman	2	0
1770	59	15	2026-08-14 08:17:04	Delivered	Cash	Aqaba	5	0
1771	86	10	2026-08-14 08:39:49	Delivered	Cash	Amman	2	10
1772	469	13	2026-09-24 10:35:16	Delivered	Card	Salt	3	0
1773	140	15	2026-07-14 18:39:01	Delivered	Card	Madaba	3	0
1774	146	15	2026-08-15 22:43:52	Delivered	Card	Zarqa	2.5	0
1775	160	6	2026-09-21 17:30:50	Delivered	Card	Amman	2	0
1776	127	4	2026-01-30 18:43:15	Delivered	Transfer	Amman	2	0
1777	189	8	2026-08-07 14:55:32	Delivered	Card	Amman	2	5
1778	309	1	2026-04-15 09:14:42	Delivered	Card	Zarqa	2.5	0
1779	195	2	2026-10-04 15:26:37	Delivered	Transfer	Amman	2	10
1780	273	13	2026-08-22 18:56:10	Delivered	Cash	Zarqa	2.5	0
1781	47	6	2026-01-17 22:12:15	Delivered	Card	Amman	2	0
1782	85	15	2026-04-11 10:15:07	Delivered	Card	Amman	2	0
1783	450	6	2026-05-12 20:29:31	Delivered	Card	Irbid	3	0
1784	288	14	2025-12-11 14:55:21	Delivered	Transfer	Salt	3	0
1785	148	10	2026-10-22 17:07:07	New	Transfer	Amman	2	0
1786	422	1	2026-09-26 11:42:46	Delivered	Transfer	Amman	2	15
1787	50	6	2026-03-29 14:42:43	Delivered	Card	Amman	2	5
1788	64	11	2026-04-29 15:24:10	Delivered	Cash	Amman	2	0
1789	165	6	2026-03-29 22:47:13	Delivered	Card	Amman	2	0
1790	477	14	2026-02-20 09:21:12	Delivered	Card	Aqaba	5	0
1791	306	3	2026-04-03 18:51:59	Cancelled	Transfer	Irbid	3	0
1792	35	8	2026-10-07 15:20:50	Delivered	Card	Zarqa	2.5	0
1793	108	12	2026-09-16 14:28:39	Delivered	Card	Amman	2	5
1794	222	9	2026-06-21 15:15:59	Delivered	Card	Jerash	3.5	0
1795	74	8	2026-02-07 14:57:12	Delivered	Cash	Amman	2	0
1796	200	14	2025-12-03 15:40:45	Delivered	Card	Amman	2	0
1797	459	14	2026-08-12 11:40:42	Delivered	Card	Irbid	3	0
1798	145	8	2026-04-02 09:15:34	Shipped	Card	Zarqa	2.5	10
1799	246	14	2026-10-22 15:26:57	New	Cash	Amman	2	0
1800	231	4	2025-11-21 10:42:13	Delivered	Transfer	Amman	2	15
1801	231	15	2026-01-09 11:46:09	Delivered	Card	Amman	2	0
1802	235	15	2026-05-18 16:31:11	Cancelled	Card	Amman	2	10
1803	77	6	2026-03-11 21:39:15	Delivered	Card	Karak	4.5	5
1804	194	12	2026-10-13 19:15:38	Delivered	Card	Aqaba	5	0
1805	428	7	2025-11-02 18:10:03	Delivered	Cash	Zarqa	2.5	0
1806	85	9	2026-10-09 14:10:51	Cancelled	Cash	Amman	2	0
1807	174	14	2025-12-31 22:41:19	Delivered	Transfer	Madaba	3	0
1808	125	2	2026-08-18 18:18:10	Delivered	Card	Amman	2	5
1809	111	15	2025-12-27 09:10:39	Delivered	Card	Amman	2	5
1810	84	10	2026-06-14 13:13:41	Cancelled	Transfer	Riyadh	15	0
1811	149	14	2026-01-01 18:04:51	Delivered	Card	Aqaba	5	0
1812	13	4	2026-07-16 12:25:19	Cancelled	Card	Irbid	3	0
1813	126	2	2026-08-02 14:47:47	Delivered	Cash	Irbid	3	5
1814	189	6	2025-11-05 21:49:17	Delivered	Cash	Amman	2	0
1815	90	15	2026-06-01 22:16:48	Delivered	Card	Amman	2	0
1816	466	10	2025-12-01 22:05:16	Delivered	Cash	Amman	2	0
1817	439	5	2026-05-29 08:41:04	Delivered	Cash	Dubai	15	0
1818	352	3	2026-09-04 13:42:30	Delivered	Card	Amman	2	0
1819	409	1	2026-09-25 21:13:24	Delivered	Cash	Karak	4.5	0
1820	357	3	2026-08-02 08:49:17	Delivered	Cash	Madaba	3	0
1821	354	15	2026-10-05 13:19:43	Shipped	Cash	Irbid	3	0
1822	184	2	2026-10-02 09:33:01	Cancelled	Cash	Amman	2	0
1823	317	10	2026-04-14 11:21:10	Delivered	Card	Salt	3	0
1824	382	9	2026-04-15 11:31:56	Delivered	Card	Amman	2	5
1825	414	11	2026-06-22 17:54:40	Delivered	Transfer	Riyadh	15	5
1826	424	8	2026-06-08 10:13:50	Delivered	Card	Amman	2	0
1827	39	14	2026-01-05 14:36:47	Delivered	Cash	Madaba	3	0
1828	472	7	2026-07-05 11:21:10	Delivered	Cash	Amman	2	5
1829	445	7	2025-12-10 17:31:33	Delivered	Card	Amman	2	0
1830	239	11	2026-05-16 11:12:53	Delivered	Cash	Jerash	3.5	5
1831	217	2	2026-10-07 08:40:38	New	Card	Amman	2	0
1832	241	14	2026-05-31 15:50:29	Delivered	Cash	Amman	2	15
1833	308	13	2026-02-28 22:32:07	Delivered	Card	Zarqa	2.5	0
1834	98	4	2025-11-26 19:48:08	Delivered	Card	Amman	2	10
1835	147	1	2026-10-02 13:47:50	Delivered	Card	Zarqa	2.5	0
1836	221	13	2025-12-25 09:47:52	Delivered	Card	Riyadh	15	0
1837	417	7	2026-08-24 08:11:37	Delivered	Cash	Amman	2	0
1838	108	3	2026-07-08 11:29:29	Delivered	Card	Amman	2	0
1839	144	10	2026-10-07 09:24:43	Shipped	Cash	Amman	2	5
1840	67	14	2026-08-27 12:04:23	Delivered	Transfer	Amman	2	10
1841	292	11	2026-07-08 13:48:02	Delivered	Card	Irbid	3	15
1842	348	14	2025-11-30 12:42:04	Delivered	Cash	Amman	2	0
1843	339	8	2025-12-25 11:42:19	Delivered	Card	Amman	2	5
1844	86	12	2026-07-16 18:55:12	Cancelled	Card	Amman	2	0
1845	469	6	2026-07-22 19:29:07	Delivered	Card	Salt	3	0
1846	368	6	2026-05-18 18:00:21	Delivered	Cash	Irbid	3	0
1847	179	10	2025-12-09 13:25:38	Delivered	Cash	Amman	2	0
1848	190	8	2026-07-07 16:30:36	Delivered	Card	Aqaba	5	0
1849	29	9	2026-01-22 08:16:45	Delivered	Transfer	Aqaba	5	0
1850	354	2	2026-07-19 14:13:06	Delivered	Transfer	Irbid	3	10
1851	419	13	2026-06-03 11:51:24	Delivered	Cash	Amman	2	0
1852	361	12	2026-07-10 14:39:46	Delivered	Card	Amman	2	5
1853	489	3	2025-11-19 19:10:30	Delivered	Cash	Amman	2	5
1854	391	1	2026-05-31 16:32:44	Delivered	Cash	Amman	2	20
1855	339	9	2026-08-26 18:26:08	Delivered	Cash	Amman	2	0
1856	375	10	2026-09-16 17:01:51	Cancelled	Card	Amman	2	0
1857	239	5	2026-07-18 11:10:26	Cancelled	Card	Jerash	3.5	0
1858	299	11	2025-11-16 15:23:13	Delivered	Card	Amman	2	0
1859	57	2	2026-10-19 19:21:26	Shipped	Card	Amman	2	0
1860	198	10	2026-01-17 21:39:18	Delivered	Card	Amman	2	0
1861	222	6	2026-05-31 09:15:25	Delivered	Card	Jerash	3.5	0
1862	480	11	2026-05-18 17:41:20	Delivered	Card	Amman	2	5
1863	425	15	2026-06-13 13:29:30	Delivered	Transfer	Amman	2	0
1864	444	10	2025-11-18 17:54:05	Delivered	Card	Amman	2	5
1865	371	5	2026-02-05 08:59:07	Delivered	Cash	Amman	2	0
1866	351	2	2026-07-11 22:28:08	Delivered	Transfer	Zarqa	2.5	10
1867	223	8	2025-11-09 15:14:18	Delivered	Transfer	Amman	2	0
1868	423	13	2026-08-29 15:02:20	Delivered	Cash	Salt	3	0
1869	473	8	2026-04-24 14:57:35	Delivered	Transfer	Amman	2	5
1870	217	2	2026-01-03 10:21:13	Shipped	Card	Amman	2	0
1871	280	6	2026-08-13 08:54:05	Delivered	Transfer	Madaba	3	0
1872	27	7	2025-11-18 16:32:20	Delivered	Card	Aqaba	5	0
1873	200	5	2026-08-21 17:40:02	Delivered	Cash	Amman	2	0
1874	261	11	2026-01-13 08:22:18	Delivered	Card	Irbid	3	0
1875	9	5	2026-05-28 17:18:04	Delivered	Card	Amman	2	0
1876	342	3	2026-06-28 14:02:40	Delivered	Card	Aqaba	5	0
1877	97	7	2026-10-07 11:36:39	Cancelled	Cash	Irbid	3	0
1878	263	11	2026-07-20 11:10:44	Delivered	Card	Amman	2	10
1879	273	7	2026-09-06 21:55:06	Delivered	Card	Zarqa	2.5	0
1880	376	7	2026-09-18 10:33:28	Delivered	Cash	Amman	2	0
1881	82	12	2026-09-02 22:11:24	Delivered	Card	Amman	2	0
1882	47	7	2026-04-08 15:22:48	Delivered	Cash	Amman	2	5
1883	64	13	2026-06-03 17:36:03	Delivered	Card	Amman	2	0
1884	217	7	2026-06-04 08:41:23	Delivered	Transfer	Amman	2	20
1885	360	1	2025-12-05 11:16:27	Delivered	Card	Amman	2	0
1886	269	12	2026-04-27 17:56:23	Delivered	Card	Amman	2	0
1887	319	13	2026-10-19 16:00:52	Shipped	Transfer	Amman	2	20
1888	76	15	2026-10-19 18:24:37	New	Cash	Amman	2	0
1889	497	7	2026-06-29 15:48:55	Delivered	Cash	Amman	2	20
1890	350	15	2026-01-11 19:00:55	Cancelled	Card	Amman	2	0
1891	164	14	2026-03-23 16:39:10	Delivered	Transfer	Amman	2	10
1892	108	3	2026-07-29 11:57:58	Delivered	Card	Amman	2	0
1893	173	11	2025-12-22 20:32:37	Delivered	Cash	Amman	2	0
1894	139	8	2026-09-17 15:24:03	Delivered	Transfer	Amman	2	0
1895	271	7	2026-07-22 20:41:40	Delivered	Transfer	Madaba	3	0
1896	425	15	2026-06-23 09:30:10	Delivered	Cash	Amman	2	5
1897	147	8	2025-11-26 20:18:50	Cancelled	Card	Zarqa	2.5	0
1898	499	2	2025-11-18 09:03:45	Cancelled	Card	Amman	2	5
1899	150	10	2025-12-08 08:34:40	Delivered	Transfer	Irbid	3	15
1900	253	7	2026-07-28 08:24:46	Shipped	Cash	Zarqa	2.5	0
1901	60	8	2026-04-09 08:26:24	Delivered	Cash	Amman	2	20
1902	382	1	2026-08-20 12:47:16	Delivered	Cash	Amman	2	0
1903	468	6	2025-11-16 14:28:06	Delivered	Transfer	Irbid	3	0
1904	434	1	2026-10-22 20:48:37	New	Card	Amman	2	0
1905	291	9	2026-09-06 09:54:28	Cancelled	Cash	Amman	2	5
1906	28	10	2026-09-25 19:08:17	Delivered	Cash	Amman	2	0
1907	370	6	2026-05-07 20:10:31	Delivered	Cash	Madaba	3	20
1908	239	3	2026-05-21 11:38:37	Delivered	Card	Jerash	3.5	5
1909	293	12	2025-11-24 20:01:21	Cancelled	Cash	Aqaba	5	0
1910	231	4	2026-01-27 17:03:30	Delivered	Card	Amman	2	0
1911	470	11	2026-05-03 19:16:22	Delivered	Card	Aqaba	5	0
1912	4	14	2026-01-09 14:46:03	Delivered	Card	Jerash	3.5	0
1913	92	14	2026-07-23 16:40:09	Delivered	Card	Amman	2	0
1914	51	15	2025-11-10 17:49:45	Delivered	Card	Amman	2	0
1915	363	3	2026-06-07 15:33:04	Delivered	Transfer	Irbid	3	0
1916	126	10	2026-09-22 17:14:00	Delivered	Transfer	Irbid	3	0
1917	197	9	2026-07-26 13:12:11	Delivered	Card	Riyadh	15	0
1918	491	14	2026-07-30 11:43:55	Delivered	Cash	Amman	2	5
1919	285	11	2026-06-19 14:06:49	Cancelled	Card	Amman	2	0
1920	270	5	2026-10-24 08:33:55	Shipped	Cash	Zarqa	2.5	0
1921	286	4	2025-12-22 16:29:11	Delivered	Card	Amman	2	0
1922	276	13	2026-09-22 22:07:09	Delivered	Card	Amman	2	0
1923	291	14	2026-04-15 15:48:35	Delivered	Card	Amman	2	10
1924	32	6	2026-05-27 16:18:06	Delivered	Transfer	Salt	3	5
1925	97	13	2026-10-21 17:25:31	New	Card	Irbid	3	0
1926	47	13	2026-04-06 08:47:46	Delivered	Card	Amman	2	0
1927	22	3	2026-09-07 17:26:33	Delivered	Card	Salt	3	0
1928	465	12	2026-03-17 17:45:31	Delivered	Cash	Amman	2	10
1929	224	15	2026-08-02 21:29:53	Delivered	Card	Madaba	3	5
1930	354	9	2026-07-25 19:51:31	Delivered	Cash	Irbid	3	0
1931	168	11	2025-12-01 09:12:57	Delivered	Transfer	Amman	2	0
1932	285	5	2026-10-19 15:27:13	Shipped	Card	Amman	2	5
1933	100	6	2026-07-15 15:58:46	Delivered	Transfer	Jerash	3.5	0
1934	108	2	2026-02-08 12:26:17	Cancelled	Card	Amman	2	10
1935	74	11	2026-10-01 11:27:39	Delivered	Cash	Amman	2	5
1936	437	11	2026-06-30 21:08:09	Delivered	Transfer	Karak	4.5	5
1937	136	10	2025-11-03 19:40:11	Delivered	Card	Amman	2	0
1938	231	15	2026-10-07 16:56:04	Delivered	Cash	Amman	2	0
1939	459	6	2026-08-14 13:21:53	Delivered	Cash	Irbid	3	0
1940	492	6	2025-11-05 10:39:23	Delivered	Card	Karak	4.5	5
1941	425	5	2026-10-04 14:41:11	Cancelled	Card	Amman	2	0
1942	186	13	2026-04-20 13:04:23	Delivered	Transfer	Madaba	3	10
1943	259	3	2026-08-29 09:53:11	Delivered	Card	Amman	2	0
1944	93	2	2026-03-18 09:25:17	Delivered	Cash	Amman	2	0
1945	364	2	2026-07-20 08:06:17	Delivered	Card	Irbid	3	0
1946	486	12	2026-03-09 20:50:19	Delivered	Transfer	Amman	2	5
1947	5	10	2025-11-08 08:20:32	Delivered	Transfer	Amman	2	0
1948	163	1	2026-07-14 19:07:44	Delivered	Card	Amman	2	15
1949	294	2	2026-06-03 09:49:15	Shipped	Card	Amman	2	0
1950	414	12	2026-04-01 09:09:45	Delivered	Card	Riyadh	15	10
1951	424	2	2026-05-19 17:09:00	Delivered	Transfer	Amman	2	5
1952	463	14	2026-09-20 08:18:36	Delivered	Cash	Amman	2	15
1953	22	5	2026-05-17 19:45:59	Delivered	Card	Salt	3	0
1954	188	14	2025-12-19 14:06:57	Delivered	Card	Amman	2	10
1955	248	5	2026-08-23 22:02:33	Delivered	Transfer	Amman	2	0
1956	56	3	2026-01-28 17:24:23	Delivered	Card	Amman	2	10
1957	208	4	2026-03-01 10:30:21	Delivered	Card	Salt	3	0
1958	417	2	2025-11-17 20:59:52	Delivered	Card	Amman	2	0
1959	174	5	2025-11-10 14:42:48	Delivered	Cash	Madaba	3	0
1960	322	4	2026-06-13 08:47:13	Delivered	Card	Amman	2	10
1961	23	11	2026-06-06 15:47:16	Delivered	Cash	Irbid	3	0
1962	195	13	2026-10-17 16:28:30	Shipped	Card	Amman	2	0
1963	65	2	2026-04-16 11:39:08	Delivered	Transfer	Irbid	3	0
1964	22	2	2025-12-25 16:33:56	Delivered	Transfer	Salt	3	0
1965	183	8	2026-07-30 21:25:45	Delivered	Transfer	Madaba	3	10
1966	394	9	2026-03-27 22:44:40	Delivered	Card	Amman	2	0
1967	85	15	2026-05-26 18:40:03	Delivered	Cash	Amman	2	0
1968	323	13	2026-07-27 09:33:48	Delivered	Cash	Riyadh	15	0
1969	487	15	2026-07-29 13:47:28	Delivered	Cash	Zarqa	2.5	0
1970	241	9	2026-06-05 18:12:32	Cancelled	Transfer	Amman	2	0
1971	393	1	2025-11-11 19:41:07	Delivered	Card	Irbid	3	0
1972	378	13	2025-11-22 14:28:06	Delivered	Transfer	Amman	2	0
1973	240	14	2026-05-11 18:11:30	Delivered	Cash	Irbid	3	20
1974	142	9	2026-07-09 08:22:07	Delivered	Cash	Zarqa	2.5	0
1975	98	11	2026-03-01 14:29:23	Delivered	Card	Amman	2	0
1976	298	11	2026-04-19 22:30:04	Delivered	Cash	Amman	2	0
1977	416	2	2026-03-20 20:54:57	Cancelled	Cash	Amman	2	15
1978	360	14	2026-02-20 20:12:24	Cancelled	Card	Amman	2	5
1979	368	5	2026-10-05 16:44:14	Shipped	Card	Irbid	3	0
1980	110	11	2026-08-21 21:58:28	Delivered	Cash	Amman	2	0
1981	500	2	2025-12-02 11:24:09	Delivered	Transfer	Amman	2	0
1982	231	2	2026-09-28 12:53:58	Delivered	Card	Amman	2	0
1983	115	3	2026-06-01 10:30:59	Delivered	Transfer	Aqaba	5	0
1984	354	6	2026-07-22 10:44:37	Cancelled	Card	Irbid	3	15
1985	409	12	2026-07-03 18:08:36	Delivered	Transfer	Karak	4.5	0
1986	405	14	2026-06-04 09:15:27	Delivered	Cash	Salt	3	0
1987	31	11	2026-08-30 14:48:05	Delivered	Transfer	Zarqa	2.5	0
1988	271	1	2026-09-09 08:55:57	Delivered	Card	Madaba	3	5
1989	171	6	2026-01-13 15:33:39	Delivered	Transfer	Amman	2	0
1990	341	2	2026-04-14 18:09:57	Delivered	Cash	Amman	2	15
1991	368	2	2026-04-23 18:00:20	Delivered	Card	Irbid	3	0
1992	292	6	2026-06-17 20:46:35	Cancelled	Transfer	Irbid	3	5
1993	223	14	2026-08-21 11:12:30	Delivered	Cash	Amman	2	10
1994	165	8	2026-02-01 12:13:35	Cancelled	Cash	Amman	2	0
1995	5	10	2026-09-21 15:08:48	Delivered	Transfer	Amman	2	0
1996	110	5	2026-05-29 17:34:48	Delivered	Cash	Amman	2	0
1997	98	5	2026-06-14 16:22:33	Delivered	Card	Amman	2	0
1998	51	5	2025-12-28 17:34:16	Cancelled	Card	Amman	2	0
1999	280	3	2026-02-22 12:30:30	Delivered	Card	Madaba	3	0
2000	462	5	2025-12-12 20:36:53	Delivered	Card	Zarqa	2.5	10
2001	320	6	2025-11-15 13:37:00	Delivered	Cash	Irbid	3	0
2002	357	6	2025-12-05 12:19:59	Delivered	Transfer	Madaba	3	5
2003	459	14	2026-05-28 11:23:56	Delivered	Card	Irbid	3	15
2004	270	11	2026-10-23 20:10:32	New	Card	Zarqa	2.5	10
2005	326	7	2026-08-10 19:50:30	Shipped	Transfer	Aqaba	5	0
2006	206	15	2026-08-19 17:31:32	Delivered	Transfer	Zarqa	2.5	5
2007	357	11	2025-11-14 08:59:28	Delivered	Card	Madaba	3	0
2008	137	6	2026-06-30 17:19:42	Delivered	Card	Aqaba	5	0
2009	391	14	2026-01-24 18:20:35	Delivered	Card	Amman	2	10
2010	345	7	2025-11-02 19:25:21	Delivered	Card	Amman	2	0
2011	204	5	2026-06-01 09:49:08	Delivered	Card	Karak	4.5	0
2012	49	4	2026-08-21 09:14:30	Delivered	Transfer	Amman	2	0
2013	179	3	2026-02-19 16:16:43	Cancelled	Transfer	Amman	2	5
2014	22	7	2026-05-24 13:59:22	Delivered	Cash	Salt	3	10
2015	239	11	2026-10-04 08:18:02	Delivered	Transfer	Jerash	3.5	0
2016	401	12	2026-07-29 11:21:31	Delivered	Card	Riyadh	15	0
2017	50	15	2026-05-10 08:50:29	Delivered	Cash	Amman	2	0
2018	315	7	2026-06-12 18:18:01	Delivered	Card	Amman	2	0
2019	58	1	2026-09-23 21:57:36	Delivered	Card	Zarqa	2.5	0
2020	108	14	2026-07-25 11:25:18	Delivered	Cash	Amman	2	0
2021	337	14	2026-03-14 18:55:50	Delivered	Card	Riyadh	15	5
2022	294	14	2026-10-12 19:55:57	Shipped	Card	Amman	2	5
2023	181	8	2026-06-13 17:32:28	Delivered	Cash	Amman	2	0
2024	140	2	2026-09-05 10:35:06	Delivered	Cash	Madaba	3	0
2025	167	6	2026-06-04 15:25:37	Delivered	Card	Amman	2	0
2026	132	13	2025-11-20 18:36:41	Delivered	Cash	Madaba	3	10
2027	20	12	2026-03-23 21:05:16	Delivered	Card	Amman	2	10
2028	49	12	2026-02-03 12:22:43	Delivered	Cash	Amman	2	10
2029	407	2	2026-08-13 17:32:31	Delivered	Card	Amman	2	5
2030	235	2	2026-07-03 20:31:18	Delivered	Card	Amman	2	10
2031	170	12	2026-06-10 11:09:52	Cancelled	Transfer	Dubai	15	0
2032	165	15	2025-11-05 13:17:59	Delivered	Card	Amman	2	0
2033	220	11	2026-06-30 14:12:13	Delivered	Cash	Irbid	3	0
2034	74	15	2026-03-07 22:26:08	Delivered	Card	Amman	2	0
2035	188	3	2026-06-17 15:48:18	Delivered	Card	Amman	2	0
2036	243	14	2026-07-23 12:45:52	Delivered	Transfer	Irbid	3	0
2037	18	14	2026-03-10 22:45:45	Delivered	Card	Amman	2	0
2038	275	15	2026-08-30 11:06:41	Delivered	Transfer	Zarqa	2.5	5
2039	116	8	2026-01-09 21:07:55	Delivered	Transfer	Amman	2	5
2040	172	2	2026-03-06 09:55:20	Delivered	Card	Amman	2	5
2041	354	15	2026-09-01 14:02:09	Delivered	Cash	Irbid	3	0
2042	388	13	2026-10-23 22:27:41	New	Cash	Aqaba	5	0
2043	244	1	2026-09-30 10:45:39	Cancelled	Card	Salt	3	0
2044	181	15	2026-08-01 16:05:48	Delivered	Card	Amman	2	0
2045	492	3	2025-11-28 15:05:59	Delivered	Cash	Karak	4.5	0
2046	362	3	2026-05-20 20:02:30	Delivered	Card	Riyadh	15	0
2047	227	3	2026-07-26 21:33:39	Delivered	Card	Irbid	3	0
2048	342	11	2026-04-17 09:18:37	Delivered	Card	Aqaba	5	15
2049	147	10	2026-09-04 16:03:03	Delivered	Transfer	Zarqa	2.5	0
2050	325	8	2026-10-09 21:58:21	Shipped	Card	Karak	4.5	0
2051	352	6	2025-11-02 11:15:07	Delivered	Card	Amman	2	0
2052	493	15	2026-02-15 08:54:59	Delivered	Transfer	Karak	4.5	0
2053	189	9	2026-02-25 14:06:18	Delivered	Cash	Amman	2	0
2054	299	6	2026-08-26 15:58:47	Delivered	Cash	Amman	2	0
2055	421	6	2026-04-20 15:51:51	Delivered	Transfer	Aqaba	5	20
2056	218	3	2026-06-24 09:15:41	Cancelled	Cash	Irbid	3	15
2057	155	6	2026-08-23 12:37:10	Cancelled	Card	Amman	2	0
2058	233	11	2026-07-14 10:08:45	Delivered	Transfer	Irbid	3	10
2059	261	9	2026-07-27 19:07:25	Delivered	Cash	Irbid	3	0
2060	486	2	2026-06-14 22:43:59	Delivered	Card	Amman	2	10
2061	4	8	2026-03-11 09:41:50	Delivered	Transfer	Jerash	3.5	0
2062	20	2	2025-12-24 15:13:34	Delivered	Transfer	Amman	2	0
2063	212	11	2025-11-07 17:04:42	Delivered	Card	Zarqa	2.5	0
2064	425	11	2026-04-28 21:17:13	Delivered	Cash	Amman	2	0
2065	458	14	2026-07-29 11:53:03	Delivered	Transfer	Irbid	3	0
2066	123	10	2026-03-26 20:38:51	Delivered	Cash	Amman	2	0
2067	68	3	2026-07-12 12:20:12	Delivered	Transfer	Amman	2	5
2068	136	15	2025-12-20 11:30:59	Delivered	Card	Amman	2	0
2069	342	5	2026-09-24 14:36:53	Delivered	Card	Aqaba	5	0
2070	131	11	2026-03-26 21:31:15	Delivered	Card	Salt	3	0
2071	46	14	2026-06-07 13:09:53	Cancelled	Cash	Amman	2	5
2072	39	7	2025-12-30 17:25:35	Delivered	Card	Madaba	3	5
2073	391	8	2026-05-01 13:30:58	Delivered	Card	Amman	2	0
2074	448	14	2026-03-28 18:06:05	Delivered	Cash	Salt	3	0
2075	448	6	2025-11-14 16:47:47	Delivered	Card	Salt	3	0
2076	231	13	2026-08-26 10:56:35	Delivered	Cash	Amman	2	0
2077	62	6	2025-11-02 19:53:13	Delivered	Card	Dubai	15	0
2078	90	5	2026-01-29 19:31:12	Delivered	Card	Amman	2	0
2079	87	11	2026-06-13 22:30:16	Delivered	Card	Zarqa	2.5	0
2080	455	12	2025-11-02 17:23:22	Delivered	Card	Aqaba	5	0
2081	167	11	2026-01-16 19:40:06	Delivered	Transfer	Amman	2	0
2082	331	7	2026-09-22 18:13:03	Delivered	Cash	Amman	2	15
2083	441	14	2026-01-27 21:46:08	Delivered	Transfer	Karak	4.5	0
2084	376	1	2026-09-27 21:53:06	Delivered	Card	Amman	2	0
2085	405	10	2026-08-11 14:41:03	Delivered	Transfer	Salt	3	0
2086	465	12	2026-08-06 19:38:34	Delivered	Cash	Amman	2	0
2087	271	9	2026-07-12 11:28:03	Delivered	Card	Madaba	3	0
2088	241	11	2025-11-08 22:14:58	Delivered	Card	Amman	2	0
2089	336	12	2026-07-20 16:51:11	Delivered	Card	Amman	2	0
2090	482	6	2026-07-22 13:14:29	Delivered	Card	Irbid	3	0
2091	342	12	2026-07-11 22:42:44	Delivered	Cash	Aqaba	5	0
2092	242	8	2025-12-29 12:43:03	Delivered	Cash	Aqaba	5	0
2093	62	1	2025-11-27 12:58:23	Delivered	Cash	Dubai	15	0
2094	143	6	2026-04-02 12:59:30	Delivered	Card	Amman	2	0
2095	188	15	2026-06-14 09:08:01	Delivered	Transfer	Amman	2	5
2096	332	5	2026-10-19 11:20:44	New	Transfer	Zarqa	2.5	0
2097	396	15	2026-03-15 14:20:45	Delivered	Card	Amman	2	0
2098	499	6	2025-11-18 12:03:59	Cancelled	Cash	Amman	2	10
2099	241	6	2026-03-24 20:11:03	Delivered	Card	Amman	2	0
2100	36	7	2026-01-28 18:34:03	Delivered	Card	Amman	2	10
2101	446	4	2025-11-20 19:26:16	Delivered	Card	Irbid	3	0
2102	221	10	2026-01-27 08:18:57	Delivered	Transfer	Riyadh	15	0
2103	486	2	2026-07-30 15:38:21	Delivered	Card	Amman	2	0
2104	146	14	2025-12-26 08:28:55	Delivered	Card	Zarqa	2.5	0
2105	487	2	2026-10-07 11:52:49	Cancelled	Cash	Zarqa	2.5	15
2106	54	6	2026-06-23 08:10:23	Delivered	Card	Salt	3	0
2107	176	5	2026-09-26 22:48:11	Delivered	Transfer	Amman	2	0
2108	73	14	2026-09-13 19:20:36	Delivered	Transfer	Amman	2	0
2109	331	6	2026-05-16 20:55:34	Delivered	Transfer	Amman	2	5
2110	421	7	2026-07-16 08:41:30	Delivered	Card	Aqaba	5	0
2111	264	2	2026-05-26 21:09:22	Delivered	Card	Amman	2	0
2112	222	10	2026-06-23 19:25:48	Delivered	Card	Jerash	3.5	0
2113	226	6	2026-08-24 22:54:00	Delivered	Card	Amman	2	0
2114	241	7	2026-10-05 12:50:28	Shipped	Transfer	Amman	2	0
2115	232	6	2025-11-29 13:47:01	Delivered	Transfer	Karak	4.5	0
2116	346	15	2026-08-03 20:20:08	Delivered	Cash	Aqaba	5	0
2117	371	3	2026-05-29 21:21:44	Delivered	Card	Amman	2	20
2118	101	2	2025-11-06 10:30:59	Delivered	Card	Amman	2	0
2119	250	14	2026-10-25 19:35:37	Cancelled	Transfer	Amman	2	5
2120	404	11	2026-08-04 18:11:49	Delivered	Cash	Amman	2	0
2121	346	2	2025-11-24 15:38:53	Delivered	Card	Aqaba	5	0
2122	498	1	2026-08-28 11:43:27	Delivered	Transfer	Aqaba	5	0
2123	47	7	2026-09-07 14:39:30	Delivered	Card	Amman	2	0
2124	370	3	2026-08-24 11:49:30	Delivered	Transfer	Madaba	3	0
2125	305	14	2025-12-31 10:36:54	Delivered	Cash	Amman	2	0
2126	298	15	2026-01-26 22:22:37	Delivered	Card	Amman	2	0
2127	370	11	2025-12-01 17:24:27	Delivered	Cash	Madaba	3	0
2128	445	4	2026-07-30 14:15:30	Delivered	Card	Amman	2	0
2129	37	1	2026-06-21 21:04:25	Delivered	Transfer	Amman	2	0
2130	341	12	2026-07-20 15:09:25	Cancelled	Card	Amman	2	0
2131	223	15	2026-07-18 12:31:50	Delivered	Cash	Amman	2	0
2132	309	5	2026-05-15 21:47:18	Delivered	Cash	Zarqa	2.5	0
2133	36	12	2026-01-15 09:36:04	Delivered	Cash	Amman	2	5
2134	213	13	2026-08-02 09:18:39	Delivered	Cash	Jerash	3.5	0
2135	37	14	2025-12-29 16:19:23	Delivered	Transfer	Amman	2	0
2136	348	2	2025-12-04 19:29:17	Delivered	Transfer	Amman	2	0
2137	100	1	2026-04-20 17:30:51	Delivered	Transfer	Jerash	3.5	10
2138	83	15	2026-01-20 20:35:39	Delivered	Cash	Zarqa	2.5	5
2139	295	15	2026-05-26 22:41:20	Delivered	Cash	Amman	2	0
2140	390	15	2026-04-05 09:57:20	Delivered	Card	Madaba	3	0
2141	464	12	2026-09-18 21:09:30	Delivered	Card	Salt	3	5
2142	499	8	2026-09-07 08:54:20	Delivered	Transfer	Amman	2	0
2143	81	14	2026-04-08 12:48:03	Delivered	Card	Amman	2	0
2144	442	5	2026-07-24 20:31:06	Delivered	Card	Salt	3	5
2145	473	8	2026-08-18 20:55:21	Delivered	Card	Amman	2	0
2146	369	6	2026-07-11 08:33:34	Delivered	Cash	Irbid	3	0
2147	208	7	2026-01-30 12:56:39	Cancelled	Cash	Salt	3	0
2148	331	14	2025-12-11 08:02:27	Delivered	Cash	Amman	2	0
2149	193	13	2025-12-24 13:16:07	Cancelled	Cash	Dubai	15	0
2150	274	8	2026-01-31 13:23:29	Delivered	Card	Zarqa	2.5	0
2151	274	15	2026-02-28 21:07:16	Delivered	Card	Zarqa	2.5	0
2152	174	15	2026-07-07 11:27:53	Delivered	Card	Madaba	3	0
2153	269	13	2026-04-12 20:10:21	Delivered	Cash	Amman	2	0
2154	22	6	2026-05-03 18:02:50	Delivered	Card	Salt	3	5
2155	445	12	2026-09-15 09:25:28	Cancelled	Card	Amman	2	0
2156	60	15	2026-05-04 21:24:32	Delivered	Transfer	Amman	2	0
2157	400	13	2025-11-11 12:01:39	Delivered	Card	Amman	2	0
2158	371	8	2025-11-27 14:24:20	Delivered	Transfer	Amman	2	15
2159	280	13	2025-12-05 12:27:03	Delivered	Transfer	Madaba	3	5
2160	342	14	2026-06-29 20:00:18	Delivered	Transfer	Aqaba	5	0
2161	229	1	2026-03-15 11:00:43	Cancelled	Transfer	Madaba	3	5
2162	100	5	2026-07-13 08:34:18	Delivered	Card	Jerash	3.5	0
2163	8	6	2026-10-22 16:23:04	New	Cash	Salt	3	0
2164	220	6	2026-07-20 20:49:22	Delivered	Cash	Irbid	3	10
2165	137	4	2026-06-02 19:59:52	Delivered	Transfer	Aqaba	5	20
2166	448	3	2026-08-26 11:32:29	Delivered	Card	Salt	3	0
2167	181	2	2025-11-27 11:26:51	Delivered	Cash	Amman	2	5
2168	142	3	2026-03-21 13:34:52	Delivered	Card	Zarqa	2.5	0
2169	296	1	2026-03-24 14:35:48	Delivered	Card	Amman	2	0
2170	391	6	2025-12-26 17:35:37	Delivered	Cash	Amman	2	20
2171	48	12	2026-08-19 20:09:20	Delivered	Card	Amman	2	0
2172	468	3	2026-06-08 15:02:51	Delivered	Cash	Irbid	3	0
2173	476	8	2026-02-12 08:22:13	Cancelled	Card	Irbid	3	10
2174	303	11	2026-08-25 12:29:31	Delivered	Card	Amman	2	0
2175	231	8	2026-10-18 18:41:04	Cancelled	Card	Amman	2	0
2176	31	6	2026-01-21 08:19:46	Cancelled	Card	Zarqa	2.5	0
2177	383	11	2026-10-13 10:10:40	Delivered	Card	Irbid	3	0
2178	125	4	2025-11-03 22:54:22	Cancelled	Transfer	Amman	2	20
2179	265	15	2026-02-07 22:50:20	Delivered	Card	Zarqa	2.5	5
2180	35	7	2026-07-17 14:45:27	Delivered	Cash	Zarqa	2.5	15
2181	421	11	2026-02-17 10:59:41	Delivered	Transfer	Aqaba	5	0
2182	263	5	2025-11-12 22:05:21	Delivered	Card	Amman	2	0
2183	52	10	2026-07-03 14:08:17	Delivered	Transfer	Karak	4.5	0
2184	237	15	2026-10-04 16:19:52	Delivered	Card	Irbid	3	5
2185	203	11	2026-05-17 17:39:44	Delivered	Transfer	Amman	2	0
2186	144	10	2026-04-16 20:27:25	Delivered	Card	Amman	2	0
2187	219	3	2025-11-13 20:16:06	Delivered	Card	Karak	4.5	15
2188	302	11	2026-08-14 13:41:56	Delivered	Card	Salt	3	0
2189	287	6	2026-05-30 11:40:23	Delivered	Cash	Amman	2	0
2190	135	2	2025-11-19 21:05:00	Delivered	Card	Madaba	3	10
2191	22	2	2025-12-20 16:55:17	Delivered	Card	Salt	3	0
2192	400	6	2025-11-03 13:11:52	Delivered	Card	Amman	2	0
2193	49	15	2026-06-18 16:43:42	Delivered	Transfer	Amman	2	5
2194	320	15	2026-05-03 08:26:17	Delivered	Transfer	Irbid	3	10
2195	145	15	2026-10-10 10:58:27	Shipped	Cash	Zarqa	2.5	0
2196	424	11	2025-12-11 14:00:10	Delivered	Transfer	Amman	2	0
2197	243	1	2026-06-09 19:11:03	Delivered	Cash	Irbid	3	0
2198	129	2	2026-02-27 18:15:40	Cancelled	Transfer	Amman	2	0
2199	146	11	2026-10-14 14:58:58	Shipped	Cash	Zarqa	2.5	5
2200	239	1	2026-07-20 20:18:06	Delivered	Card	Jerash	3.5	10
2201	78	2	2026-08-13 14:40:16	Delivered	Cash	Amman	2	0
2202	24	6	2026-02-01 17:04:00	Delivered	Card	Salt	3	0
2203	168	3	2026-05-13 09:41:09	Shipped	Cash	Amman	2	0
2204	254	4	2025-11-11 18:13:04	Cancelled	Cash	Riyadh	15	0
2205	308	8	2026-09-28 19:46:53	Delivered	Cash	Zarqa	2.5	0
2206	47	15	2026-10-04 13:16:16	Delivered	Card	Amman	2	0
2207	223	15	2026-09-15 18:46:01	Delivered	Card	Amman	2	0
2208	492	8	2026-01-06 15:09:00	Cancelled	Card	Karak	4.5	0
2209	246	10	2026-10-06 19:41:12	Shipped	Transfer	Amman	2	0
2210	434	15	2026-08-28 11:32:58	Delivered	Transfer	Amman	2	0
2211	286	14	2026-01-24 12:28:54	Delivered	Transfer	Amman	2	15
2212	482	13	2025-12-07 15:36:49	Delivered	Cash	Irbid	3	0
2213	47	1	2026-06-26 18:03:09	Delivered	Cash	Amman	2	0
2214	406	12	2026-07-26 20:55:56	Delivered	Card	Amman	2	0
2215	187	15	2026-09-03 19:35:29	Delivered	Card	Irbid	3	5
2216	92	13	2025-12-10 13:10:42	Delivered	Card	Amman	2	0
2217	431	2	2026-06-20 17:17:51	Delivered	Card	Zarqa	2.5	0
2218	274	8	2025-11-04 22:45:53	Delivered	Transfer	Zarqa	2.5	0
2219	318	2	2026-09-20 18:28:03	Delivered	Card	Amman	2	0
2220	236	7	2026-10-17 12:53:47	Delivered	Transfer	Irbid	3	0
2221	379	6	2025-11-01 14:41:23	Delivered	Cash	Amman	2	0
2222	292	1	2026-07-03 12:05:48	Delivered	Card	Irbid	3	0
2223	374	7	2026-02-04 19:31:40	Delivered	Cash	Riyadh	15	0
2224	383	1	2026-04-01 17:00:31	Delivered	Transfer	Irbid	3	0
2225	435	6	2026-07-04 21:03:27	Delivered	Cash	Amman	2	0
2226	427	9	2026-06-22 14:43:12	Delivered	Cash	Amman	2	0
2227	211	3	2025-12-06 10:38:55	Cancelled	Card	Amman	2	5
2228	456	15	2026-01-18 11:29:22	Delivered	Card	Amman	2	0
2229	348	14	2025-11-07 08:36:45	Delivered	Cash	Amman	2	5
2230	397	1	2026-05-26 21:09:46	Delivered	Cash	Dubai	15	0
2231	227	3	2026-06-04 08:36:17	Delivered	Transfer	Irbid	3	0
2232	110	10	2026-08-03 11:07:56	Delivered	Card	Amman	2	0
2233	399	12	2025-11-14 15:38:03	Delivered	Cash	Amman	2	0
2234	310	1	2026-10-18 20:53:34	Shipped	Card	Amman	2	20
2235	319	14	2026-10-18 15:48:29	Shipped	Cash	Amman	2	20
2236	258	11	2026-07-24 12:43:00	Delivered	Card	Amman	2	0
2237	259	3	2026-05-31 13:37:35	Delivered	Cash	Amman	2	0
2238	323	15	2025-12-22 17:53:22	Cancelled	Cash	Riyadh	15	0
2239	417	1	2026-01-14 20:31:44	Delivered	Cash	Amman	2	0
2240	364	2	2026-03-16 12:16:34	Delivered	Card	Irbid	3	0
2241	48	4	2026-09-15 22:23:23	Delivered	Transfer	Amman	2	0
2242	243	11	2026-02-27 22:10:52	Delivered	Card	Irbid	3	0
2243	154	6	2026-06-12 08:31:12	Cancelled	Cash	Madaba	3	5
2244	305	6	2026-03-30 21:43:34	Delivered	Card	Amman	2	0
2245	354	13	2026-09-04 08:23:22	Delivered	Cash	Irbid	3	0
2246	205	14	2026-08-24 08:04:05	Delivered	Card	Madaba	3	0
2247	425	2	2026-08-26 18:26:13	Delivered	Transfer	Amman	2	20
2248	424	15	2026-03-08 16:59:37	Delivered	Card	Amman	2	5
2249	413	8	2026-06-20 13:54:12	Delivered	Card	Karak	4.5	0
2250	415	6	2026-10-13 10:37:36	Shipped	Cash	Aqaba	5	0
2251	22	5	2026-06-10 20:41:12	Delivered	Cash	Salt	3	15
2252	185	3	2026-08-26 19:24:00	Delivered	Card	Irbid	3	5
2253	35	11	2026-02-18 16:33:34	Delivered	Transfer	Zarqa	2.5	0
2254	460	8	2026-07-07 08:15:49	Cancelled	Card	Zarqa	2.5	0
2255	421	8	2026-01-28 20:45:45	Delivered	Card	Aqaba	5	10
2256	348	12	2025-11-24 15:36:31	Delivered	Card	Amman	2	5
2257	482	3	2025-12-04 21:47:30	Delivered	Cash	Irbid	3	15
2258	49	5	2025-12-07 09:28:50	Delivered	Card	Amman	2	10
2259	150	6	2026-01-25 11:01:54	Delivered	Cash	Irbid	3	0
2260	11	1	2025-12-06 18:53:11	Delivered	Card	Jerash	3.5	0
2261	445	12	2025-12-17 12:00:04	Cancelled	Card	Amman	2	0
2262	317	1	2026-03-25 19:45:36	Cancelled	Card	Salt	3	10
2263	20	14	2026-08-23 09:31:15	Delivered	Card	Amman	2	5
2264	469	14	2026-10-23 08:30:19	New	Cash	Salt	3	0
2265	173	8	2026-03-23 17:06:37	Delivered	Card	Amman	2	0
2266	46	6	2026-04-08 11:41:07	Delivered	Transfer	Amman	2	5
2267	492	6	2026-05-04 18:46:45	Cancelled	Card	Karak	4.5	0
2268	460	6	2026-05-21 10:00:06	Delivered	Card	Zarqa	2.5	0
2269	377	9	2026-02-20 13:07:58	Shipped	Cash	Irbid	3	5
2270	340	7	2026-07-22 12:12:46	Delivered	Card	Amman	2	10
2271	38	5	2025-11-16 14:50:43	Delivered	Card	Zarqa	2.5	0
2272	353	5	2026-09-20 22:37:59	Delivered	Cash	Doha	16	10
2273	278	7	2025-11-27 18:39:57	Delivered	Card	Aqaba	5	0
2274	119	2	2026-06-18 17:16:13	Delivered	Transfer	Dubai	15	0
2275	124	7	2026-06-09 15:02:09	Delivered	Card	Aqaba	5	0
2276	174	3	2026-04-21 22:12:42	Delivered	Card	Madaba	3	0
2277	227	2	2025-11-19 16:17:35	Delivered	Cash	Irbid	3	0
2278	446	6	2026-08-06 17:27:41	Delivered	Transfer	Irbid	3	0
2279	500	5	2026-05-12 16:52:22	Delivered	Cash	Amman	2	0
2280	435	6	2026-04-06 21:36:37	Delivered	Transfer	Amman	2	10
2281	314	11	2026-09-16 16:43:54	Delivered	Cash	Amman	2	0
2282	280	13	2026-08-19 13:11:33	Delivered	Card	Madaba	3	10
2283	108	12	2026-02-01 22:33:18	Delivered	Card	Amman	2	0
2284	55	7	2025-11-09 21:31:56	Delivered	Card	Amman	2	20
2285	469	4	2026-08-18 14:37:07	Cancelled	Card	Salt	3	0
2286	381	10	2026-09-08 20:23:26	Delivered	Card	Amman	2	0
2287	108	3	2026-09-05 12:14:31	Delivered	Transfer	Amman	2	0
2288	400	3	2025-12-26 12:04:43	Delivered	Transfer	Amman	2	0
2289	403	6	2026-08-30 18:47:27	Delivered	Card	Amman	2	0
2290	126	3	2026-05-03 11:28:16	Delivered	Cash	Irbid	3	0
2291	92	13	2025-12-09 21:43:30	Delivered	Card	Amman	2	0
2292	231	14	2026-01-27 11:16:29	Delivered	Card	Amman	2	5
2293	494	10	2025-12-03 20:25:32	Delivered	Card	Amman	2	0
2294	126	7	2026-10-09 09:19:35	Shipped	Card	Irbid	3	10
2295	251	6	2026-09-14 18:08:18	Delivered	Card	Amman	2	0
2296	256	3	2026-02-06 10:48:09	Delivered	Card	Irbid	3	0
2297	450	2	2026-07-23 11:17:36	Delivered	Cash	Irbid	3	0
2298	466	13	2026-07-02 22:44:10	Delivered	Card	Amman	2	0
2299	266	6	2025-11-18 09:12:25	Delivered	Card	Irbid	3	0
2300	259	1	2026-05-26 16:31:19	Delivered	Cash	Amman	2	10
2301	292	4	2026-06-02 09:11:33	Delivered	Card	Irbid	3	0
2302	324	5	2026-09-13 14:36:22	Delivered	Transfer	Jerash	3.5	0
2303	208	13	2026-10-14 14:51:56	Shipped	Card	Salt	3	0
2304	189	9	2025-11-20 12:45:04	Delivered	Transfer	Amman	2	0
2305	97	6	2026-10-14 16:28:19	Shipped	Cash	Irbid	3	0
2306	397	12	2026-10-22 14:01:45	New	Card	Dubai	15	0
2307	277	11	2026-08-26 13:49:30	Delivered	Card	Zarqa	2.5	0
2308	352	12	2026-10-12 19:53:53	Delivered	Transfer	Amman	2	0
2309	354	6	2026-09-23 10:44:39	Delivered	Cash	Irbid	3	0
2310	308	3	2026-08-11 10:17:17	Delivered	Transfer	Zarqa	2.5	0
2311	354	5	2026-08-16 14:13:48	Delivered	Cash	Irbid	3	5
2312	5	12	2026-05-12 21:07:00	Delivered	Cash	Amman	2	10
2313	109	9	2026-09-15 10:43:30	Delivered	Cash	Amman	2	10
2314	175	9	2026-04-13 16:24:13	Delivered	Transfer	Madaba	3	0
2315	238	9	2026-07-26 20:53:18	Delivered	Cash	Amman	2	0
2316	431	13	2026-09-20 09:28:24	Delivered	Cash	Zarqa	2.5	0
2317	45	13	2025-12-14 11:48:44	Cancelled	Transfer	Amman	2	20
2318	124	7	2025-11-09 11:17:49	Shipped	Card	Aqaba	5	0
2319	219	15	2026-05-24 08:34:45	Delivered	Transfer	Karak	4.5	0
2320	469	6	2026-09-19 13:06:08	Delivered	Transfer	Salt	3	10
2321	299	13	2026-10-19 11:04:43	Delivered	Cash	Amman	2	10
2322	296	14	2025-11-21 13:25:24	Delivered	Card	Amman	2	0
2323	489	13	2026-06-15 18:43:23	Delivered	Cash	Amman	2	0
2324	365	2	2026-01-07 17:24:30	Delivered	Card	Amman	2	0
2325	13	5	2026-01-23 17:56:44	Delivered	Card	Irbid	3	5
2326	283	8	2026-03-08 14:24:31	Delivered	Card	Madaba	3	0
2327	54	10	2026-10-21 17:02:47	Shipped	Card	Salt	3	0
2328	355	7	2026-07-04 09:03:38	Delivered	Card	Madaba	3	0
2329	45	1	2026-09-11 09:59:16	Delivered	Card	Amman	2	0
2330	303	8	2025-12-29 08:35:41	Delivered	Card	Amman	2	0
2331	313	15	2026-04-15 15:53:39	Cancelled	Card	Amman	2	5
2332	201	7	2026-08-04 15:47:48	Delivered	Card	Madaba	3	0
2333	265	2	2026-03-04 11:09:47	Delivered	Card	Zarqa	2.5	0
2334	130	5	2026-07-08 20:20:14	Delivered	Transfer	Salt	3	0
2335	48	11	2025-12-26 14:10:03	Cancelled	Transfer	Amman	2	5
2336	171	7	2026-05-17 12:40:22	Delivered	Card	Amman	2	0
2337	477	11	2026-10-14 15:20:32	Shipped	Cash	Aqaba	5	0
2338	93	10	2026-03-04 21:21:27	Cancelled	Transfer	Amman	2	0
2339	445	2	2026-05-06 14:18:04	Delivered	Cash	Amman	2	0
2340	177	13	2026-06-03 19:04:08	Delivered	Cash	Amman	2	5
2341	84	13	2026-03-14 08:04:55	Delivered	Card	Riyadh	15	0
2342	484	12	2026-10-05 16:42:55	Delivered	Cash	Amman	2	0
2343	121	12	2025-11-23 12:39:05	Delivered	Cash	Amman	2	0
2344	469	6	2026-10-20 19:22:04	New	Cash	Salt	3	0
2345	229	2	2026-09-24 13:15:50	Delivered	Card	Madaba	3	0
2346	127	1	2026-01-05 19:20:16	Delivered	Transfer	Amman	2	5
2347	9	12	2026-06-22 17:01:54	Delivered	Card	Amman	2	5
2348	442	6	2026-01-12 13:43:23	Delivered	Cash	Salt	3	15
2349	299	15	2026-03-29 08:37:43	Delivered	Card	Amman	2	0
2350	428	12	2026-10-15 14:48:50	Shipped	Transfer	Zarqa	2.5	5
2351	250	9	2026-09-19 21:21:03	Delivered	Cash	Amman	2	0
2352	445	15	2026-03-28 08:40:25	Delivered	Cash	Amman	2	20
2353	386	2	2025-11-07 11:40:06	Delivered	Card	Riyadh	15	0
2354	487	2	2026-07-24 17:51:40	Delivered	Card	Zarqa	2.5	20
2355	104	11	2026-02-02 14:23:08	Shipped	Card	Irbid	3	0
2356	360	3	2025-12-11 16:14:11	Delivered	Card	Amman	2	0
2357	474	11	2026-08-09 20:18:09	Delivered	Cash	Doha	16	0
2358	235	15	2026-03-28 20:25:03	Delivered	Cash	Amman	2	10
2359	22	7	2026-06-24 17:01:32	Delivered	Transfer	Salt	3	10
2360	269	3	2026-06-22 13:28:37	Delivered	Card	Amman	2	0
2361	416	14	2025-11-11 20:39:45	Delivered	Cash	Amman	2	10
2362	380	14	2026-08-05 13:53:13	Delivered	Cash	Irbid	3	0
2363	193	11	2026-06-28 12:28:22	Delivered	Card	Dubai	15	5
2364	65	3	2026-09-21 11:53:51	Delivered	Card	Irbid	3	15
2365	8	3	2026-10-20 14:56:44	New	Card	Salt	3	0
2366	231	6	2026-07-06 09:08:28	Delivered	Cash	Amman	2	0
2367	460	14	2026-06-17 10:59:26	Delivered	Card	Zarqa	2.5	0
2368	129	10	2026-04-07 15:56:15	Delivered	Cash	Amman	2	0
2369	87	14	2026-01-28 15:59:24	Delivered	Card	Zarqa	2.5	0
2370	313	11	2026-05-17 19:10:42	Delivered	Card	Amman	2	0
2371	168	3	2025-12-20 14:46:42	Delivered	Cash	Amman	2	0
2372	314	6	2026-09-24 20:32:49	Delivered	Transfer	Amman	2	20
2373	42	1	2026-09-11 18:53:50	Cancelled	Transfer	Riyadh	15	0
2374	124	7	2026-02-11 17:13:26	Delivered	Cash	Aqaba	5	20
2375	135	7	2026-01-14 19:16:06	Delivered	Cash	Madaba	3	5
2376	59	7	2026-03-21 16:15:46	Delivered	Card	Aqaba	5	15
2377	22	7	2026-04-09 16:50:09	Delivered	Transfer	Salt	3	0
2378	194	7	2026-05-26 08:16:51	Delivered	Transfer	Aqaba	5	0
2379	471	7	2025-12-29 10:04:30	Delivered	Cash	Amman	2	0
2380	417	11	2025-11-04 13:51:56	Delivered	Card	Amman	2	15
2381	271	12	2026-07-31 15:27:02	Delivered	Cash	Madaba	3	0
2382	57	14	2026-08-05 14:55:00	Delivered	Transfer	Amman	2	0
2383	329	3	2025-11-17 12:43:49	Delivered	Card	Amman	2	0
2384	148	2	2026-08-21 22:45:00	Delivered	Card	Amman	2	0
2385	299	15	2026-08-30 15:18:17	Delivered	Cash	Amman	2	10
2386	487	1	2026-10-19 19:10:10	Shipped	Card	Zarqa	2.5	10
2387	347	10	2026-03-06 12:20:08	Delivered	Card	Amman	2	15
2388	86	8	2026-05-31 08:35:00	Delivered	Card	Amman	2	0
2389	158	12	2026-02-08 10:34:25	Cancelled	Card	Karak	4.5	5
2390	229	9	2025-12-02 16:04:57	Delivered	Cash	Madaba	3	0
2391	425	14	2026-10-04 17:35:03	Delivered	Card	Amman	2	0
2392	333	9	2026-05-29 16:49:54	Delivered	Card	Zarqa	2.5	0
2393	127	12	2026-04-15 09:03:39	Delivered	Cash	Amman	2	0
2394	325	2	2026-09-14 11:41:33	Delivered	Card	Karak	4.5	0
2395	241	5	2026-02-15 18:09:37	Delivered	Card	Amman	2	0
2396	410	11	2026-09-29 14:29:36	Delivered	Card	Amman	2	0
2397	38	8	2025-12-07 17:07:30	Delivered	Cash	Zarqa	2.5	0
2398	436	6	2026-06-04 22:49:33	Cancelled	Card	Irbid	3	0
2399	398	12	2025-12-12 15:18:55	Delivered	Card	Zarqa	2.5	0
2400	212	12	2025-11-13 16:17:27	Delivered	Cash	Zarqa	2.5	0
2401	342	1	2025-11-03 22:22:07	Delivered	Transfer	Aqaba	5	0
2402	419	14	2026-08-29 12:29:24	Delivered	Cash	Amman	2	0
2403	300	11	2026-10-20 20:43:03	New	Card	Irbid	3	0
2404	446	12	2026-01-08 10:10:12	Delivered	Card	Irbid	3	10
2405	424	2	2026-05-13 15:23:46	Delivered	Card	Amman	2	0
2406	252	4	2025-12-28 08:03:11	Delivered	Card	Amman	2	0
2407	167	1	2026-08-27 18:32:18	Delivered	Transfer	Amman	2	0
2408	189	2	2026-02-09 14:38:58	Delivered	Cash	Amman	2	0
2409	167	11	2026-08-16 10:36:33	Cancelled	Cash	Amman	2	15
2410	231	11	2026-06-25 09:33:00	Cancelled	Card	Amman	2	0
2411	311	2	2025-11-02 16:21:38	Delivered	Cash	Amman	2	0
2412	145	8	2026-07-04 16:34:37	Delivered	Cash	Zarqa	2.5	0
2413	400	8	2026-05-16 19:20:33	Delivered	Cash	Amman	2	5
2414	280	1	2025-12-10 08:55:20	Delivered	Transfer	Madaba	3	0
2415	472	10	2026-06-05 13:36:55	Delivered	Card	Amman	2	0
2416	100	5	2026-09-13 19:15:22	Delivered	Cash	Jerash	3.5	0
2417	484	2	2026-09-03 13:53:31	Delivered	Card	Amman	2	0
2418	96	10	2026-07-12 10:13:06	Delivered	Transfer	Amman	2	0
2419	129	15	2026-02-15 14:00:11	Delivered	Card	Amman	2	20
2420	244	2	2026-01-27 09:23:46	Delivered	Card	Salt	3	15
2421	235	5	2026-09-01 14:59:32	Delivered	Card	Amman	2	0
2422	354	4	2026-08-18 18:30:09	Cancelled	Transfer	Irbid	3	15
2423	78	9	2026-05-28 15:02:48	Delivered	Transfer	Amman	2	20
2424	200	9	2026-07-19 16:04:33	Delivered	Transfer	Amman	2	0
2425	421	6	2026-07-27 17:47:08	Delivered	Card	Aqaba	5	0
2426	9	10	2026-07-28 14:22:50	Delivered	Card	Amman	2	15
2427	197	3	2026-08-30 20:47:45	Delivered	Cash	Riyadh	15	0
2428	344	7	2026-08-21 08:52:27	Delivered	Transfer	Madaba	3	5
2429	489	3	2026-01-18 09:08:52	Delivered	Card	Amman	2	10
2430	73	11	2026-04-17 10:14:44	Delivered	Cash	Amman	2	0
2431	271	9	2026-09-24 18:15:21	Delivered	Card	Madaba	3	0
2432	132	5	2026-10-23 14:47:31	Shipped	Transfer	Madaba	3	0
2433	1	3	2026-07-22 08:25:15	Cancelled	Cash	Zarqa	2.5	0
2434	213	12	2026-10-14 09:31:47	New	Card	Jerash	3.5	0
2435	92	3	2026-07-16 12:27:10	Delivered	Transfer	Amman	2	15
2436	15	5	2026-01-14 08:49:37	Cancelled	Transfer	Dubai	15	10
2437	293	8	2026-01-19 13:24:28	Delivered	Transfer	Aqaba	5	0
2438	305	3	2026-02-05 15:17:07	Delivered	Cash	Amman	2	5
2439	391	4	2025-12-11 20:59:39	Delivered	Cash	Amman	2	0
2440	165	2	2026-07-19 10:22:51	Cancelled	Cash	Amman	2	0
2441	212	5	2025-12-06 17:52:19	Delivered	Card	Zarqa	2.5	0
2442	324	11	2026-08-04 18:49:24	Delivered	Cash	Jerash	3.5	10
2443	48	6	2025-12-27 08:57:48	Cancelled	Card	Amman	2	0
2444	144	5	2025-12-21 14:52:17	Delivered	Card	Amman	2	5
2445	105	14	2025-12-01 22:57:53	Delivered	Card	Karak	4.5	0
2446	16	6	2026-05-06 09:47:11	Delivered	Card	Zarqa	2.5	5
2447	231	3	2026-06-11 18:42:24	Delivered	Card	Amman	2	15
2448	16	2	2026-07-27 08:46:04	Delivered	Cash	Zarqa	2.5	10
2449	49	5	2026-07-19 19:37:41	Delivered	Card	Amman	2	10
2450	84	7	2025-11-16 17:13:01	Delivered	Cash	Riyadh	15	0
2451	35	8	2026-04-28 08:13:05	Delivered	Card	Zarqa	2.5	0
2452	126	1	2026-05-17 13:59:04	Delivered	Card	Irbid	3	0
2453	269	11	2026-04-18 13:07:07	Delivered	Cash	Amman	2	5
2454	428	15	2026-04-16 12:44:55	Delivered	Cash	Zarqa	2.5	0
2455	271	1	2026-08-08 19:47:11	Delivered	Card	Madaba	3	5
2456	204	10	2025-12-21 22:59:37	Delivered	Cash	Karak	4.5	0
2457	303	15	2026-07-17 21:46:55	Delivered	Cash	Amman	2	5
2458	87	11	2026-07-25 22:19:46	Delivered	Transfer	Zarqa	2.5	0
2459	69	11	2026-06-07 10:30:15	Delivered	Card	Amman	2	10
2460	232	10	2026-03-19 19:27:31	Delivered	Cash	Karak	4.5	0
2461	118	11	2025-11-28 20:14:40	Delivered	Transfer	Amman	2	0
2462	219	7	2025-12-13 14:41:10	Delivered	Transfer	Karak	4.5	0
2463	339	12	2026-07-03 15:13:48	Delivered	Card	Amman	2	10
2464	487	7	2026-07-20 19:25:41	Shipped	Card	Zarqa	2.5	0
2465	163	10	2026-07-16 08:35:13	Delivered	Cash	Amman	2	0
2466	140	2	2025-12-10 19:18:49	Delivered	Cash	Madaba	3	0
2467	22	12	2026-05-24 09:48:40	Delivered	Transfer	Salt	3	0
2468	419	2	2026-01-16 12:36:53	Cancelled	Cash	Amman	2	0
2469	131	5	2026-07-11 21:12:47	Cancelled	Card	Salt	3	0
2470	116	7	2026-08-14 22:12:37	Delivered	Cash	Amman	2	0
2471	446	15	2026-03-08 19:31:18	Delivered	Card	Irbid	3	0
2472	412	1	2025-11-14 16:05:54	Delivered	Card	Zarqa	2.5	5
2473	456	6	2026-05-27 18:39:01	Delivered	Card	Amman	2	0
2474	125	11	2026-09-03 11:50:37	Delivered	Transfer	Amman	2	0
2475	344	1	2026-06-27 22:28:08	Delivered	Cash	Madaba	3	0
2476	292	15	2026-05-16 20:25:57	Delivered	Card	Irbid	3	0
2477	265	13	2026-01-30 12:35:28	Delivered	Cash	Zarqa	2.5	0
2478	20	7	2025-12-02 15:21:14	Delivered	Cash	Amman	2	0
2479	119	10	2026-08-21 10:18:59	Delivered	Card	Dubai	15	5
2480	475	13	2025-12-11 20:57:10	Delivered	Card	Aqaba	5	5
2481	249	12	2026-10-16 18:10:45	Delivered	Transfer	Irbid	3	0
2482	312	8	2025-11-10 22:36:35	Delivered	Transfer	Irbid	3	5
2483	371	15	2026-07-26 12:18:38	Delivered	Cash	Amman	2	5
2484	469	2	2026-07-16 15:57:38	Delivered	Cash	Salt	3	0
2485	131	11	2026-04-13 17:33:09	Delivered	Cash	Salt	3	0
2486	278	2	2025-12-26 15:48:57	Delivered	Card	Aqaba	5	0
2487	223	12	2026-06-08 21:21:21	Delivered	Cash	Amman	2	5
2488	30	1	2026-05-18 15:13:13	Shipped	Cash	Amman	2	0
2489	46	11	2026-06-11 10:39:20	Delivered	Card	Amman	2	0
2490	35	7	2026-07-29 15:43:23	Delivered	Cash	Zarqa	2.5	0
2491	296	9	2026-04-06 19:03:03	Delivered	Cash	Amman	2	0
2492	276	5	2026-10-07 13:16:00	Delivered	Transfer	Amman	2	5
2493	264	12	2026-09-21 21:22:51	Delivered	Transfer	Amman	2	0
2494	191	1	2026-06-21 12:21:43	Delivered	Card	Amman	2	0
2495	470	5	2026-06-16 21:37:16	Delivered	Transfer	Aqaba	5	0
2496	352	12	2025-11-06 16:46:41	Delivered	Transfer	Amman	2	0
2497	68	8	2026-07-24 21:56:22	Delivered	Cash	Amman	2	20
2498	271	3	2026-08-08 21:11:51	Delivered	Transfer	Madaba	3	5
2499	22	11	2026-06-20 22:57:53	Delivered	Card	Salt	3	0
2500	163	8	2026-08-31 22:25:10	Delivered	Card	Amman	2	0
2501	94	11	2026-04-07 18:13:57	Delivered	Cash	Zarqa	2.5	0
2502	218	5	2026-07-10 19:04:32	Delivered	Card	Irbid	3	0
2503	489	14	2026-08-10 08:43:29	Delivered	Cash	Amman	2	0
2504	499	12	2026-09-02 08:50:39	Delivered	Cash	Amman	2	0
2505	237	15	2026-10-25 09:22:56	New	Transfer	Irbid	3	15
2506	219	2	2026-06-30 18:38:12	Delivered	Cash	Karak	4.5	10
2507	482	3	2026-03-06 22:47:47	Delivered	Card	Irbid	3	0
2508	228	14	2026-09-02 17:37:42	Delivered	Card	Aqaba	5	5
2509	265	5	2026-01-04 11:11:02	Delivered	Transfer	Zarqa	2.5	0
2510	390	3	2026-06-30 16:43:51	Shipped	Card	Madaba	3	0
2511	287	13	2025-12-30 14:59:12	Delivered	Transfer	Amman	2	5
2512	65	2	2026-08-25 17:39:55	Delivered	Card	Irbid	3	0
2513	217	12	2026-10-06 22:10:03	Shipped	Card	Amman	2	0
2514	296	12	2025-11-21 22:00:49	Delivered	Transfer	Amman	2	0
2515	259	14	2025-12-11 20:12:07	Delivered	Cash	Amman	2	0
2516	87	10	2025-12-26 13:17:36	Delivered	Card	Zarqa	2.5	0
2517	22	5	2025-12-05 12:04:31	Delivered	Card	Salt	3	0
2518	441	6	2025-12-09 16:00:06	Delivered	Transfer	Karak	4.5	0
2519	303	15	2026-02-15 08:54:37	Delivered	Card	Amman	2	0
2520	269	5	2026-10-10 17:31:02	Delivered	Transfer	Amman	2	0
2521	283	12	2026-04-23 12:02:53	Delivered	Transfer	Madaba	3	5
2522	178	9	2026-10-24 08:15:32	Shipped	Card	Irbid	3	5
2523	183	1	2025-11-22 11:38:16	Delivered	Transfer	Madaba	3	0
2524	414	15	2026-05-05 20:12:38	Delivered	Cash	Riyadh	15	0
2525	343	7	2026-07-24 19:03:29	Delivered	Card	Irbid	3	5
2526	345	9	2025-12-31 08:20:03	Delivered	Cash	Amman	2	10
2527	21	12	2026-03-29 13:19:46	Delivered	Card	Dubai	15	5
2528	289	9	2026-10-14 13:20:56	Delivered	Cash	Aqaba	5	10
2529	376	11	2026-10-16 22:53:03	Shipped	Cash	Amman	2	0
2530	49	1	2026-04-07 11:10:16	Delivered	Card	Amman	2	0
2531	354	1	2026-08-25 22:44:54	Delivered	Cash	Irbid	3	5
2532	229	14	2026-05-15 13:40:24	Delivered	Cash	Madaba	3	0
2533	113	12	2026-05-12 10:11:51	Delivered	Cash	Amman	2	0
2534	8	15	2026-09-11 17:48:57	Cancelled	Cash	Salt	3	0
2535	42	1	2026-10-05 15:18:59	Delivered	Transfer	Riyadh	15	0
2536	354	2	2026-09-03 14:16:15	Delivered	Cash	Irbid	3	0
2537	83	2	2026-08-01 10:01:57	Delivered	Transfer	Zarqa	2.5	20
2538	115	8	2026-03-15 12:40:21	Delivered	Cash	Aqaba	5	20
2539	184	14	2026-05-10 11:03:56	Delivered	Cash	Amman	2	0
2540	416	11	2026-02-03 11:29:41	Delivered	Card	Amman	2	15
2541	12	6	2026-10-05 08:47:19	Shipped	Transfer	Amman	2	0
2542	339	1	2026-06-12 12:04:04	Delivered	Card	Amman	2	0
2543	349	1	2026-05-26 17:26:32	Delivered	Cash	Zarqa	2.5	0
2544	488	3	2026-03-25 19:23:59	Delivered	Card	Amman	2	10
2545	108	10	2026-03-03 09:27:25	Delivered	Card	Amman	2	0
2546	22	14	2025-12-29 16:51:45	Delivered	Card	Salt	3	0
2547	243	3	2026-06-11 22:59:33	Delivered	Cash	Irbid	3	0
2548	364	8	2026-02-14 20:17:29	Delivered	Transfer	Irbid	3	0
2549	33	3	2026-07-13 18:19:17	Delivered	Card	Riyadh	15	0
2550	412	6	2026-05-27 08:18:19	Delivered	Transfer	Zarqa	2.5	0
2551	263	7	2026-07-09 18:14:18	Delivered	Card	Amman	2	0
2552	454	13	2025-12-24 15:20:54	Delivered	Card	Riyadh	15	0
2553	299	10	2025-12-02 15:41:03	Delivered	Card	Amman	2	15
2554	49	2	2026-03-15 15:11:22	Delivered	Cash	Amman	2	0
2555	25	14	2026-05-07 18:58:40	Delivered	Cash	Riyadh	15	0
2556	459	12	2026-03-19 12:09:32	Delivered	Cash	Irbid	3	0
2557	283	15	2026-01-27 14:21:10	Delivered	Transfer	Madaba	3	0
2558	206	15	2026-02-27 13:02:03	Delivered	Transfer	Zarqa	2.5	5
2559	93	1	2026-01-31 19:00:27	Delivered	Transfer	Amman	2	0
2560	118	5	2026-10-09 11:25:16	Shipped	Cash	Amman	2	5
2561	142	2	2026-09-17 11:11:06	Delivered	Transfer	Zarqa	2.5	0
2562	86	2	2026-08-23 13:33:27	Delivered	Cash	Amman	2	5
2563	412	7	2026-03-27 20:43:02	Cancelled	Cash	Zarqa	2.5	0
2564	158	3	2026-07-18 19:25:31	Cancelled	Card	Karak	4.5	0
2565	376	11	2026-10-25 09:04:51	New	Cash	Amman	2	15
2566	465	5	2026-01-24 15:31:21	Delivered	Card	Amman	2	0
2567	271	3	2026-08-21 21:07:59	Cancelled	Cash	Madaba	3	5
2568	283	2	2026-02-03 22:56:19	Delivered	Card	Madaba	3	10
2569	124	8	2025-12-13 08:48:50	Delivered	Transfer	Aqaba	5	0
2570	207	5	2026-01-26 15:52:11	Shipped	Card	Karak	4.5	5
2571	241	2	2025-12-07 09:52:31	Delivered	Cash	Amman	2	5
2572	473	4	2026-01-14 21:38:09	Cancelled	Cash	Amman	2	0
2573	192	4	2026-07-09 18:31:10	Delivered	Transfer	Salt	3	0
2574	109	3	2026-10-06 16:12:46	Cancelled	Card	Amman	2	0
2575	12	1	2025-11-12 13:26:21	Delivered	Cash	Amman	2	0
2576	109	3	2026-02-22 09:16:09	Delivered	Card	Amman	2	0
2577	493	8	2026-07-16 21:36:20	Delivered	Card	Karak	4.5	10
2578	438	3	2026-10-15 20:19:01	Shipped	Transfer	Amman	2	0
2579	250	10	2026-06-27 16:46:03	Delivered	Cash	Amman	2	5
2580	240	11	2026-06-19 15:14:51	Delivered	Card	Irbid	3	0
2581	87	6	2026-06-15 09:05:45	Delivered	Card	Zarqa	2.5	5
2582	389	1	2025-12-25 17:27:27	Delivered	Card	Amman	2	0
2583	456	15	2026-07-04 18:05:32	Delivered	Cash	Amman	2	0
2584	352	1	2026-08-03 14:21:59	Delivered	Card	Amman	2	0
2585	288	1	2026-09-02 21:26:37	Delivered	Cash	Salt	3	0
2586	424	11	2026-03-01 08:47:17	Delivered	Transfer	Amman	2	0
2587	53	3	2026-06-28 12:45:57	Delivered	Cash	Amman	2	0
2588	91	1	2026-07-22 19:55:51	Delivered	Cash	Amman	2	0
2589	85	8	2026-10-23 11:46:35	New	Cash	Amman	2	0
2590	478	15	2025-12-15 13:41:27	Delivered	Card	Aqaba	5	20
2591	448	7	2026-05-14 20:12:48	Delivered	Cash	Salt	3	0
2592	319	9	2026-10-04 09:31:51	Delivered	Cash	Amman	2	0
2593	165	12	2025-12-31 14:36:43	Shipped	Card	Amman	2	0
2594	139	7	2026-09-06 22:19:20	Delivered	Cash	Amman	2	0
2595	424	4	2025-12-12 14:52:00	Delivered	Card	Amman	2	0
2596	84	1	2026-06-21 21:49:38	Delivered	Card	Riyadh	15	0
2597	128	2	2026-09-13 11:04:39	Delivered	Card	Amman	2	0
2598	319	1	2026-10-16 09:28:21	Delivered	Card	Amman	2	0
2599	359	6	2026-03-20 17:55:29	Delivered	Cash	Amman	2	0
2600	307	5	2026-05-20 18:46:03	Delivered	Cash	Amman	2	0
2601	216	6	2026-07-24 21:55:19	Delivered	Card	Riyadh	15	0
2602	116	3	2026-05-05 14:45:51	Delivered	Cash	Amman	2	0
2603	465	12	2025-11-25 17:33:39	Delivered	Cash	Amman	2	0
2604	70	3	2026-04-20 18:17:07	Delivered	Transfer	Amman	2	0
2605	439	2	2026-09-13 21:24:09	Delivered	Transfer	Dubai	15	0
2606	231	15	2025-11-11 12:58:29	Delivered	Card	Amman	2	0
2607	195	5	2026-09-12 21:58:06	Delivered	Card	Amman	2	10
2608	72	12	2026-08-28 17:09:52	Delivered	Cash	Amman	2	0
2609	389	7	2025-12-18 12:57:43	Delivered	Card	Amman	2	0
2610	448	5	2026-06-01 17:58:02	Delivered	Cash	Salt	3	0
2611	213	12	2026-04-24 20:50:16	Delivered	Transfer	Jerash	3.5	0
2612	498	15	2025-12-31 18:30:47	Cancelled	Cash	Aqaba	5	5
2613	417	2	2026-06-21 19:52:09	Delivered	Transfer	Amman	2	0
2614	335	13	2025-12-29 18:51:52	Delivered	Transfer	Amman	2	0
2615	338	7	2026-05-02 22:20:15	Delivered	Cash	Zarqa	2.5	0
2616	138	9	2026-06-20 16:25:15	Delivered	Card	Amman	2	0
2617	123	10	2026-08-18 11:04:30	Delivered	Cash	Amman	2	0
2618	319	3	2026-09-29 21:45:30	Delivered	Card	Amman	2	0
2619	110	1	2026-08-13 13:46:21	Delivered	Cash	Amman	2	15
2620	243	12	2026-03-11 12:03:23	Delivered	Card	Irbid	3	10
2621	13	3	2026-02-15 19:17:06	Delivered	Card	Irbid	3	0
2622	443	15	2026-06-21 13:52:53	Delivered	Transfer	Amman	2	0
2623	98	7	2025-11-12 10:22:06	Delivered	Transfer	Amman	2	0
2624	209	11	2025-12-21 11:19:23	Delivered	Card	Riyadh	15	0
2625	19	6	2026-09-13 12:04:48	Delivered	Cash	Amman	2	0
2626	469	8	2026-10-20 16:27:58	New	Card	Salt	3	0
2627	25	14	2026-06-26 20:37:26	Cancelled	Cash	Riyadh	15	0
2628	248	10	2025-11-02 10:27:16	Delivered	Card	Amman	2	0
2629	192	1	2026-07-18 21:53:11	Delivered	Cash	Salt	3	0
2630	160	3	2025-12-27 20:52:14	Delivered	Transfer	Amman	2	5
2631	47	2	2026-03-31 12:37:54	Delivered	Card	Amman	2	0
2632	358	8	2026-08-07 22:40:55	Delivered	Card	Amman	2	0
2633	327	9	2026-06-06 08:36:44	Delivered	Card	Amman	2	0
2634	213	2	2026-06-04 08:36:34	Delivered	Transfer	Jerash	3.5	0
2635	48	11	2026-10-02 18:17:03	Delivered	Card	Amman	2	0
2636	128	14	2026-03-22 12:10:01	Delivered	Transfer	Amman	2	10
2637	151	5	2026-08-19 15:35:28	Delivered	Card	Zarqa	2.5	0
2638	284	15	2026-06-23 15:48:29	Shipped	Transfer	Karak	4.5	10
2639	46	13	2026-10-10 12:07:13	Shipped	Cash	Amman	2	0
2640	175	10	2026-01-21 19:03:44	Delivered	Cash	Madaba	3	0
2641	447	3	2026-09-03 22:01:54	Delivered	Card	Salt	3	0
2642	330	9	2025-11-14 20:55:16	Delivered	Card	Zarqa	2.5	0
2643	96	10	2026-07-03 21:32:44	Delivered	Cash	Amman	2	5
2644	333	10	2026-10-15 19:14:14	Shipped	Transfer	Zarqa	2.5	15
2645	375	4	2026-04-05 15:49:38	Delivered	Card	Amman	2	5
2646	83	5	2025-11-26 10:11:56	Delivered	Cash	Zarqa	2.5	5
2647	255	2	2026-08-15 22:16:37	Delivered	Card	Aqaba	5	5
2648	60	11	2025-12-20 19:07:34	Delivered	Transfer	Amman	2	0
2649	20	5	2025-12-01 19:42:30	Delivered	Transfer	Amman	2	0
2650	51	14	2026-05-29 20:10:03	Delivered	Transfer	Amman	2	0
2651	26	1	2026-04-07 10:06:52	Delivered	Transfer	Dubai	15	0
2652	71	5	2026-08-22 20:44:15	Cancelled	Card	Amman	2	0
2653	270	14	2026-10-24 17:08:52	Shipped	Card	Zarqa	2.5	0
2654	131	11	2026-09-01 13:18:29	Delivered	Card	Salt	3	0
2655	206	2	2026-08-19 08:16:52	Delivered	Cash	Zarqa	2.5	0
2656	362	8	2026-01-21 19:56:32	Delivered	Card	Riyadh	15	0
2657	108	3	2026-01-17 09:30:59	Delivered	Cash	Amman	2	0
2658	474	7	2026-04-24 11:39:13	Delivered	Transfer	Doha	16	5
2659	87	3	2026-07-02 11:55:54	Delivered	Card	Zarqa	2.5	10
2660	427	11	2026-04-23 17:58:59	Delivered	Card	Amman	2	0
2661	163	15	2026-09-15 18:29:23	Delivered	Transfer	Amman	2	5
2662	30	8	2026-08-03 16:36:45	Delivered	Card	Amman	2	0
2663	245	3	2026-09-17 20:41:00	Delivered	Card	Karak	4.5	0
2664	134	10	2026-10-13 09:49:38	Delivered	Cash	Amman	2	10
2665	305	3	2025-12-12 20:29:14	Delivered	Cash	Amman	2	0
2666	245	12	2026-09-08 15:32:15	Delivered	Transfer	Karak	4.5	0
2667	330	3	2026-06-30 12:18:41	Delivered	Cash	Zarqa	2.5	0
2668	41	6	2026-10-17 16:36:22	Delivered	Transfer	Amman	2	0
2669	130	11	2025-11-11 15:28:24	Delivered	Cash	Salt	3	0
2670	13	6	2025-11-18 14:55:26	Delivered	Transfer	Irbid	3	0
2671	406	8	2025-12-17 16:17:51	Cancelled	Transfer	Amman	2	0
2672	400	2	2026-08-02 14:12:54	Delivered	Transfer	Amman	2	0
2673	354	1	2026-07-24 10:14:28	Delivered	Card	Irbid	3	0
2674	285	13	2026-04-16 22:51:25	Delivered	Card	Amman	2	0
2675	45	6	2026-05-09 17:53:03	Delivered	Card	Amman	2	5
2676	239	13	2025-12-08 18:28:37	Delivered	Transfer	Jerash	3.5	0
2677	82	3	2025-11-23 20:27:16	Cancelled	Cash	Amman	2	0
2678	308	13	2026-08-21 18:12:18	Delivered	Card	Zarqa	2.5	10
2679	166	15	2026-04-25 22:36:38	Delivered	Cash	Doha	16	5
2680	303	13	2025-12-02 14:53:35	Delivered	Cash	Amman	2	0
2681	317	12	2026-06-18 17:28:36	Delivered	Card	Salt	3	0
2682	155	1	2026-09-15 15:56:43	Delivered	Card	Amman	2	15
2683	376	8	2026-09-18 16:06:21	Delivered	Card	Amman	2	0
2684	207	7	2025-12-07 18:36:39	Delivered	Cash	Karak	4.5	0
2685	90	1	2025-12-08 16:54:31	Delivered	Cash	Amman	2	0
2686	137	9	2026-08-13 09:39:30	Delivered	Transfer	Aqaba	5	0
2687	282	14	2026-02-22 19:49:49	Delivered	Cash	Amman	2	0
2688	241	10	2026-09-13 16:16:26	Delivered	Card	Amman	2	0
2689	283	15	2026-03-20 17:10:31	Delivered	Cash	Madaba	3	0
2690	223	8	2026-03-30 17:44:29	Delivered	Cash	Amman	2	0
2691	390	1	2026-06-21 15:03:53	Delivered	Cash	Madaba	3	0
2692	47	8	2025-11-19 21:04:48	Cancelled	Cash	Amman	2	0
2693	421	2	2025-11-21 09:18:39	Delivered	Transfer	Aqaba	5	5
2694	250	14	2026-09-26 15:09:06	Delivered	Cash	Amman	2	5
2695	40	13	2026-07-24 20:09:58	Delivered	Card	Amman	2	0
2696	443	3	2026-03-31 12:41:49	Delivered	Transfer	Amman	2	0
2697	422	11	2026-10-25 08:09:01	New	Card	Amman	2	0
2698	227	12	2026-06-25 16:56:10	Delivered	Card	Irbid	3	0
2699	451	6	2026-10-05 19:37:58	Delivered	Card	Irbid	3	10
2700	297	7	2026-09-23 20:45:31	Delivered	Transfer	Amman	2	0
2701	165	10	2026-06-25 09:15:44	Delivered	Cash	Amman	2	0
2702	318	15	2026-03-23 21:29:49	Delivered	Card	Amman	2	5
2703	89	3	2025-11-16 10:41:06	Delivered	Card	Irbid	3	5
2704	101	6	2026-03-08 13:46:15	Delivered	Card	Amman	2	0
2705	380	1	2026-09-08 17:57:40	Delivered	Card	Irbid	3	0
2706	36	14	2026-07-17 15:00:06	Cancelled	Cash	Amman	2	0
2707	76	6	2025-12-08 16:29:56	Delivered	Cash	Amman	2	5
2708	319	13	2026-09-25 15:52:47	Delivered	Cash	Amman	2	10
2709	276	3	2026-06-30 18:37:54	Delivered	Cash	Amman	2	0
2710	161	9	2026-09-21 15:41:26	Delivered	Transfer	Irbid	3	0
2711	194	5	2026-06-16 11:44:41	Delivered	Cash	Aqaba	5	0
2712	485	13	2026-06-10 12:08:37	Delivered	Card	Amman	2	5
2713	438	8	2026-09-17 12:45:46	Delivered	Card	Amman	2	0
2714	329	6	2026-03-13 20:37:18	Delivered	Card	Amman	2	15
2715	71	2	2025-11-11 12:40:37	Delivered	Card	Amman	2	10
2716	325	15	2026-10-14 19:39:34	Delivered	Transfer	Karak	4.5	0
2717	358	6	2025-11-05 18:40:57	Delivered	Card	Amman	2	0
2718	177	2	2026-03-15 21:31:42	Delivered	Transfer	Amman	2	0
2719	362	3	2025-12-30 13:07:31	Delivered	Card	Riyadh	15	0
2720	108	2	2026-04-25 19:42:32	Delivered	Cash	Amman	2	0
2721	100	2	2026-06-13 11:43:49	Delivered	Cash	Jerash	3.5	0
2722	72	7	2026-10-08 09:20:14	Delivered	Cash	Amman	2	0
2723	307	15	2025-12-24 18:08:46	Delivered	Card	Amman	2	0
2724	98	5	2025-12-13 14:48:40	Delivered	Transfer	Amman	2	0
2725	370	9	2026-05-29 11:43:23	Delivered	Transfer	Madaba	3	0
2726	31	7	2026-06-14 11:51:39	Delivered	Card	Zarqa	2.5	0
2727	465	13	2026-02-10 15:41:18	Delivered	Card	Amman	2	15
2728	247	3	2025-12-20 11:48:11	Cancelled	Card	Amman	2	10
2729	88	15	2026-04-22 19:24:27	Delivered	Card	Amman	2	0
2730	216	14	2025-11-28 17:26:23	Delivered	Cash	Riyadh	15	0
2731	93	13	2026-06-12 16:54:13	Delivered	Card	Amman	2	0
2732	264	10	2026-07-24 11:45:43	Delivered	Card	Amman	2	0
2733	58	7	2026-09-06 09:54:33	Cancelled	Card	Zarqa	2.5	0
2734	151	6	2026-01-04 10:19:38	Delivered	Card	Zarqa	2.5	0
2735	417	3	2026-06-12 19:05:31	Cancelled	Cash	Amman	2	10
2736	389	1	2026-04-26 11:31:27	Delivered	Transfer	Amman	2	10
2737	382	2	2025-12-27 17:07:29	Delivered	Cash	Amman	2	0
2738	362	3	2026-02-08 11:50:21	Delivered	Card	Riyadh	15	5
2739	482	11	2026-06-14 12:41:47	Delivered	Cash	Irbid	3	0
2740	277	8	2026-01-30 10:57:21	Cancelled	Transfer	Zarqa	2.5	15
2741	29	6	2025-12-04 11:19:48	Delivered	Card	Aqaba	5	0
2742	217	8	2026-02-21 20:17:18	Delivered	Cash	Amman	2	0
2743	418	6	2026-10-25 21:53:05	New	Card	Amman	2	10
2744	186	13	2026-06-19 19:49:02	Cancelled	Card	Madaba	3	10
2745	370	11	2025-12-28 19:03:57	Delivered	Transfer	Madaba	3	0
2746	460	14	2026-07-09 08:27:25	Delivered	Card	Zarqa	2.5	0
2747	42	6	2026-08-13 18:55:39	Delivered	Card	Riyadh	15	15
2748	474	8	2026-07-11 14:25:33	Delivered	Card	Doha	16	0
2749	403	4	2026-06-28 08:56:20	Cancelled	Cash	Amman	2	5
2750	422	10	2026-10-20 13:11:53	Shipped	Card	Amman	2	0
2751	26	2	2026-06-24 14:34:28	Delivered	Card	Dubai	15	0
2752	144	14	2026-05-16 09:17:46	Delivered	Cash	Amman	2	0
2753	354	15	2026-09-02 22:04:11	Cancelled	Cash	Irbid	3	5
2754	132	14	2026-10-13 11:25:45	Delivered	Card	Madaba	3	5
2755	69	9	2025-12-03 18:28:07	Delivered	Card	Amman	2	10
2756	47	2	2025-12-24 15:57:17	Delivered	Card	Amman	2	10
2757	291	10	2026-10-11 22:26:44	Shipped	Cash	Amman	2	0
2758	25	12	2026-06-06 19:34:57	Delivered	Card	Riyadh	15	10
2759	243	1	2026-08-30 21:48:31	Delivered	Cash	Irbid	3	0
2760	474	8	2025-11-01 08:14:38	Delivered	Card	Doha	16	0
2761	375	10	2026-10-24 18:46:52	Delivered	Card	Amman	2	0
2762	201	15	2026-08-20 18:13:30	Delivered	Card	Madaba	3	0
2763	101	15	2026-08-24 19:26:18	Delivered	Cash	Amman	2	0
2764	122	13	2026-01-10 14:19:48	Delivered	Card	Amman	2	0
2765	362	11	2026-09-26 09:18:49	Delivered	Card	Riyadh	15	0
2766	30	11	2026-04-28 16:49:54	Delivered	Card	Amman	2	0
2767	305	13	2026-02-12 11:46:12	Delivered	Card	Amman	2	0
2768	48	8	2026-05-13 19:09:15	Delivered	Transfer	Amman	2	0
2769	287	6	2026-07-26 16:16:59	Cancelled	Card	Amman	2	15
2770	204	6	2026-09-20 16:05:57	Delivered	Card	Karak	4.5	20
2771	265	5	2025-12-05 08:22:41	Delivered	Card	Zarqa	2.5	15
2772	132	11	2026-10-09 12:08:24	Delivered	Cash	Madaba	3	0
2773	129	2	2026-09-07 16:52:26	Delivered	Cash	Amman	2	0
2774	331	11	2026-07-26 08:29:08	Delivered	Cash	Amman	2	0
2775	468	7	2025-12-04 17:01:19	Delivered	Cash	Irbid	3	5
2776	193	7	2025-12-02 19:58:36	Delivered	Cash	Dubai	15	0
2777	494	2	2026-03-04 08:00:09	Delivered	Card	Amman	2	5
2778	219	2	2026-08-16 16:44:02	Cancelled	Card	Karak	4.5	10
2779	35	10	2025-11-20 21:00:03	Delivered	Card	Zarqa	2.5	0
2780	467	2	2026-08-19 17:57:42	Delivered	Cash	Dubai	15	0
2781	329	4	2026-06-17 17:12:13	Cancelled	Cash	Amman	2	0
2782	99	8	2025-12-28 09:51:08	Delivered	Cash	Zarqa	2.5	5
2783	287	2	2026-09-04 16:09:04	Delivered	Card	Amman	2	20
2784	286	6	2026-03-01 18:11:35	Delivered	Cash	Amman	2	0
2785	90	11	2025-12-25 10:41:26	Delivered	Card	Amman	2	5
2786	295	7	2026-03-04 21:27:22	Shipped	Card	Amman	2	0
2787	229	1	2026-07-30 13:25:24	Delivered	Card	Madaba	3	5
2788	173	12	2025-12-20 22:58:49	Delivered	Transfer	Amman	2	0
2789	418	14	2026-06-04 13:39:01	Delivered	Card	Amman	2	0
2790	466	14	2026-04-07 11:29:09	Cancelled	Cash	Amman	2	0
2791	10	8	2026-01-03 15:27:58	Delivered	Transfer	Irbid	3	5
2792	81	11	2025-12-22 18:37:03	Delivered	Card	Amman	2	0
2793	474	5	2026-03-08 22:34:15	Delivered	Transfer	Doha	16	0
2794	93	7	2026-02-01 12:40:09	Delivered	Card	Amman	2	10
2795	464	11	2025-11-21 19:23:58	Delivered	Transfer	Salt	3	0
2796	180	8	2025-11-28 21:20:17	Delivered	Card	Irbid	3	5
2797	23	15	2026-07-05 22:45:51	Delivered	Transfer	Irbid	3	5
2798	420	10	2026-04-01 14:05:56	Delivered	Cash	Irbid	3	0
2799	104	10	2026-07-13 13:38:39	Cancelled	Cash	Irbid	3	0
2800	108	15	2026-10-19 14:11:11	Delivered	Card	Amman	2	0
2801	271	11	2026-07-29 19:21:34	Cancelled	Card	Madaba	3	0
2802	449	7	2026-01-23 12:30:12	Delivered	Transfer	Amman	2	5
2803	49	14	2026-05-14 19:55:26	Delivered	Cash	Amman	2	0
2804	148	1	2026-10-22 16:28:19	New	Card	Amman	2	0
2805	241	1	2026-05-28 15:37:36	Delivered	Cash	Amman	2	10
2806	36	7	2026-03-16 13:59:08	Delivered	Cash	Amman	2	0
2807	339	15	2025-11-25 18:42:24	Delivered	Cash	Amman	2	0
2808	143	14	2025-12-10 15:14:12	Delivered	Card	Amman	2	0
2809	308	15	2026-10-06 13:30:41	Delivered	Transfer	Zarqa	2.5	0
2810	265	15	2026-02-05 21:13:24	Delivered	Card	Zarqa	2.5	0
2811	186	15	2026-07-20 10:54:29	Delivered	Card	Madaba	3	0
2812	188	11	2026-03-09 11:01:42	Delivered	Cash	Amman	2	5
2813	40	10	2026-07-21 11:03:01	Delivered	Card	Amman	2	5
2814	98	4	2026-07-13 14:39:54	Delivered	Cash	Amman	2	10
2815	122	12	2026-02-28 13:53:09	Delivered	Card	Amman	2	0
2816	482	2	2026-08-16 11:49:19	Delivered	Card	Irbid	3	0
2817	31	4	2025-11-14 17:45:29	Delivered	Cash	Zarqa	2.5	0
2818	425	11	2026-06-22 09:38:39	Delivered	Card	Amman	2	0
2819	217	3	2025-11-22 16:48:41	Delivered	Cash	Amman	2	0
2820	465	5	2026-04-03 22:35:36	Delivered	Card	Amman	2	0
2821	176	14	2025-12-23 21:49:51	Delivered	Card	Amman	2	20
2822	214	2	2026-10-01 09:47:00	Delivered	Cash	Amman	2	0
2823	86	5	2026-04-04 16:13:52	Delivered	Card	Amman	2	0
2824	96	1	2026-10-21 10:23:55	New	Transfer	Amman	2	15
2825	120	2	2025-12-23 15:49:20	Delivered	Card	Amman	2	0
2826	77	2	2025-12-23 11:37:21	Cancelled	Cash	Karak	4.5	5
2827	206	2	2026-01-05 12:20:12	Cancelled	Card	Zarqa	2.5	0
2828	432	2	2026-07-11 20:02:49	Delivered	Cash	Zarqa	2.5	0
2829	84	10	2026-10-18 13:22:50	Delivered	Cash	Riyadh	15	0
2830	42	11	2026-08-25 17:29:15	Delivered	Cash	Riyadh	15	0
2831	278	14	2026-06-29 20:10:40	Delivered	Transfer	Aqaba	5	0
2832	9	1	2026-09-28 17:05:38	Delivered	Card	Amman	2	0
2833	280	2	2026-07-15 09:11:15	Cancelled	Card	Madaba	3	0
2834	243	15	2026-06-14 14:57:13	Cancelled	Cash	Irbid	3	0
2835	204	13	2026-06-11 20:56:59	Delivered	Transfer	Karak	4.5	0
2836	170	13	2026-01-07 17:16:53	Delivered	Transfer	Dubai	15	5
2837	244	12	2026-10-06 11:43:03	New	Card	Salt	3	0
2838	287	5	2026-04-19 17:28:38	Delivered	Card	Amman	2	0
2839	271	14	2026-07-05 18:48:00	Delivered	Cash	Madaba	3	0
2840	291	6	2026-06-05 12:47:06	Delivered	Cash	Amman	2	0
2841	458	5	2026-06-01 22:11:10	Delivered	Cash	Irbid	3	0
2842	298	15	2026-06-30 12:08:16	Delivered	Card	Amman	2	5
2843	283	13	2026-07-29 13:48:40	Delivered	Transfer	Madaba	3	0
2844	380	8	2026-06-28 12:56:10	Delivered	Card	Irbid	3	0
2845	48	3	2026-10-18 09:04:30	Delivered	Cash	Amman	2	0
2846	264	15	2026-03-18 18:15:29	Delivered	Card	Amman	2	0
2847	20	15	2025-12-29 11:14:01	Delivered	Cash	Amman	2	15
2848	34	8	2026-03-01 09:22:05	Delivered	Card	Amman	2	20
2849	327	6	2026-06-03 09:15:04	Delivered	Cash	Amman	2	10
2850	40	3	2026-04-04 10:32:48	Delivered	Transfer	Amman	2	0
2851	203	3	2026-06-13 16:15:41	Delivered	Card	Amman	2	0
2852	153	14	2026-02-12 12:29:32	Delivered	Card	Salt	3	0
2853	283	15	2026-05-15 08:43:22	Delivered	Card	Madaba	3	0
2854	148	12	2026-08-29 15:26:32	Delivered	Card	Amman	2	0
2855	254	3	2026-02-08 20:05:44	Delivered	Card	Riyadh	15	5
2856	53	2	2026-08-18 12:54:38	Delivered	Card	Amman	2	0
2857	70	15	2025-11-15 16:56:11	Delivered	Card	Amman	2	0
2858	228	1	2026-09-03 16:32:21	Delivered	Card	Aqaba	5	0
2859	482	14	2025-12-07 08:08:30	Delivered	Card	Irbid	3	10
2860	72	4	2026-08-13 10:12:02	Delivered	Card	Amman	2	0
2861	34	9	2026-10-24 11:40:48	Cancelled	Card	Amman	2	0
2862	115	12	2025-11-04 19:18:11	Delivered	Transfer	Aqaba	5	5
2863	94	11	2026-06-03 08:24:33	Delivered	Transfer	Zarqa	2.5	0
2864	292	1	2026-06-13 10:53:37	Delivered	Cash	Irbid	3	0
2865	287	6	2026-08-09 09:44:40	Delivered	Transfer	Amman	2	0
2866	25	13	2026-03-25 21:55:10	Delivered	Card	Riyadh	15	0
2867	49	15	2026-05-29 14:37:13	Cancelled	Transfer	Amman	2	0
2868	492	4	2025-12-29 18:41:27	Delivered	Cash	Karak	4.5	0
2869	357	14	2026-09-04 19:20:08	Delivered	Card	Madaba	3	0
2870	256	6	2025-12-31 20:49:17	Delivered	Card	Irbid	3	5
2871	471	11	2026-07-25 22:54:43	Cancelled	Transfer	Amman	2	0
2872	294	5	2026-09-03 16:37:00	Delivered	Cash	Amman	2	0
2873	404	2	2026-05-24 14:25:03	Delivered	Card	Amman	2	0
2874	422	1	2026-10-12 15:42:57	Delivered	Transfer	Amman	2	0
2875	101	14	2025-12-11 21:32:11	Delivered	Cash	Amman	2	5
2876	370	12	2025-11-11 17:28:26	Delivered	Cash	Madaba	3	0
2877	44	6	2026-09-29 08:13:01	Delivered	Card	Amman	2	0
2878	268	2	2026-06-20 08:59:38	Delivered	Cash	Amman	2	0
2879	119	5	2026-03-12 13:28:09	Delivered	Card	Dubai	15	0
2880	289	5	2026-05-28 18:17:37	Delivered	Cash	Aqaba	5	5
2881	15	8	2026-06-13 20:24:27	Shipped	Card	Dubai	15	5
2882	391	15	2026-08-22 13:32:16	Delivered	Card	Amman	2	5
2883	176	5	2026-06-22 22:51:10	Delivered	Transfer	Amman	2	0
2884	487	11	2026-07-30 22:31:01	Delivered	Cash	Zarqa	2.5	0
2885	445	7	2026-02-02 21:21:08	Delivered	Cash	Amman	2	5
2886	256	8	2025-12-04 18:48:42	Delivered	Transfer	Irbid	3	5
2887	55	8	2026-10-20 19:15:14	Cancelled	Transfer	Amman	2	0
2888	469	11	2026-09-05 12:53:47	Cancelled	Card	Salt	3	0
2889	127	9	2026-02-07 21:04:49	Delivered	Cash	Amman	2	5
2890	474	7	2025-12-11 11:24:28	Delivered	Cash	Doha	16	10
2891	344	10	2026-09-15 21:17:45	Delivered	Transfer	Madaba	3	0
2892	393	7	2026-06-30 08:50:34	Delivered	Transfer	Irbid	3	0
2893	476	15	2026-08-02 21:58:24	Delivered	Card	Irbid	3	10
2894	286	2	2026-07-28 15:58:17	Delivered	Transfer	Amman	2	0
2895	391	12	2026-04-08 22:47:11	Delivered	Cash	Amman	2	10
2896	239	5	2026-02-25 16:42:36	Delivered	Card	Jerash	3.5	0
2897	31	6	2025-11-22 17:20:18	Cancelled	Card	Zarqa	2.5	0
2898	410	9	2026-07-06 14:04:29	Delivered	Cash	Amman	2	5
2899	487	15	2026-08-24 14:08:04	Delivered	Card	Zarqa	2.5	0
2900	165	2	2025-11-12 08:48:16	Delivered	Card	Amman	2	10
2901	219	3	2026-02-04 09:28:20	Delivered	Transfer	Karak	4.5	0
2902	364	14	2026-10-07 08:42:53	Delivered	Cash	Irbid	3	20
2903	212	8	2026-07-02 12:59:24	Delivered	Cash	Zarqa	2.5	0
2904	445	13	2026-06-14 21:40:59	Delivered	Card	Amman	2	0
2905	288	11	2026-03-22 17:15:16	Delivered	Transfer	Salt	3	0
2906	242	6	2026-02-15 09:35:29	Delivered	Cash	Aqaba	5	0
2907	241	11	2026-04-03 14:49:12	Delivered	Cash	Amman	2	15
2908	425	14	2026-05-24 21:36:26	Cancelled	Card	Amman	2	0
2909	84	5	2025-11-05 19:01:42	Delivered	Card	Riyadh	15	0
2910	123	12	2026-06-24 16:46:25	Delivered	Cash	Amman	2	0
2911	108	10	2026-09-28 17:32:41	Delivered	Card	Amman	2	10
2912	389	3	2025-12-23 20:49:47	Delivered	Card	Amman	2	0
2913	479	6	2026-06-03 19:42:59	Delivered	Card	Jerash	3.5	0
2914	86	1	2026-06-26 09:13:41	Delivered	Cash	Amman	2	5
2915	159	3	2026-06-17 11:18:43	Delivered	Cash	Amman	2	10
2916	318	4	2026-07-24 20:46:16	Delivered	Card	Amman	2	0
2917	253	7	2026-04-21 15:06:57	Delivered	Card	Zarqa	2.5	0
2918	355	5	2026-09-05 14:59:52	Delivered	Card	Madaba	3	20
2919	85	4	2026-05-07 12:24:58	Cancelled	Cash	Amman	2	0
2920	287	1	2026-01-28 17:15:43	Delivered	Card	Amman	2	0
2921	35	2	2026-10-02 10:41:43	Delivered	Card	Zarqa	2.5	0
2922	241	6	2025-11-01 21:57:28	Delivered	Card	Amman	2	5
2923	14	4	2026-03-04 21:29:32	Delivered	Card	Dubai	15	15
2924	404	12	2026-03-05 14:56:30	Delivered	Card	Amman	2	0
2925	375	2	2026-08-23 10:17:13	Delivered	Card	Amman	2	0
2926	247	7	2026-07-25 17:10:44	Delivered	Cash	Amman	2	0
2927	87	13	2026-04-03 19:52:21	Delivered	Card	Zarqa	2.5	0
2928	51	10	2025-11-22 10:24:51	Delivered	Transfer	Amman	2	10
2929	352	11	2025-11-07 08:12:54	Delivered	Card	Amman	2	0
2930	242	1	2025-12-07 14:19:11	Delivered	Cash	Aqaba	5	5
2931	145	11	2026-07-11 18:39:52	Delivered	Cash	Zarqa	2.5	5
2932	367	1	2026-08-17 10:12:37	Delivered	Cash	Dubai	15	0
2933	4	2	2025-11-23 08:34:55	Delivered	Cash	Jerash	3.5	0
2934	283	14	2026-01-21 14:04:54	Delivered	Cash	Madaba	3	0
2935	281	13	2025-12-22 22:31:12	Delivered	Card	Amman	2	0
2936	385	4	2026-03-25 22:12:07	Delivered	Transfer	Irbid	3	0
2937	218	10	2026-05-23 14:24:29	Delivered	Card	Irbid	3	5
2938	5	3	2025-11-03 21:00:53	Delivered	Transfer	Amman	2	0
2939	47	3	2026-07-02 20:11:12	Cancelled	Transfer	Amman	2	15
2940	78	1	2026-09-23 11:46:15	Delivered	Cash	Amman	2	0
2941	36	15	2026-02-05 22:22:38	Delivered	Card	Amman	2	0
2942	478	6	2026-04-04 17:05:18	Delivered	Card	Aqaba	5	0
2943	239	3	2026-07-14 15:21:06	Cancelled	Card	Jerash	3.5	5
2944	191	2	2026-09-23 09:42:12	Delivered	Card	Amman	2	5
2945	229	14	2025-12-04 20:28:15	Delivered	Card	Madaba	3	0
2946	280	8	2026-01-03 17:14:05	Delivered	Transfer	Madaba	3	0
2947	219	1	2025-11-12 16:27:39	Delivered	Transfer	Karak	4.5	0
2948	351	13	2026-07-05 14:19:14	Delivered	Cash	Zarqa	2.5	0
2949	492	11	2026-01-08 17:26:37	Delivered	Cash	Karak	4.5	0
2950	336	14	2026-01-26 14:51:52	Delivered	Card	Amman	2	0
2951	354	9	2026-07-23 13:53:14	Delivered	Card	Irbid	3	15
2952	403	14	2026-08-16 11:18:03	Delivered	Card	Amman	2	0
2953	4	7	2026-03-26 08:58:31	Cancelled	Card	Jerash	3.5	0
2954	392	1	2025-11-15 22:52:05	Delivered	Transfer	Aqaba	5	0
2955	322	14	2026-04-30 18:40:35	Cancelled	Card	Amman	2	0
2956	475	15	2026-04-15 16:46:58	Delivered	Card	Aqaba	5	0
2957	366	5	2026-04-07 14:21:39	Delivered	Transfer	Amman	2	15
2958	303	14	2025-11-08 20:14:14	Cancelled	Transfer	Amman	2	0
2959	271	2	2026-07-09 14:26:43	Delivered	Card	Madaba	3	0
2960	214	8	2026-09-21 22:57:50	Delivered	Card	Amman	2	10
2961	392	12	2026-09-17 08:57:29	Delivered	Card	Aqaba	5	0
2962	111	3	2026-06-28 19:05:59	Delivered	Card	Amman	2	0
2963	201	4	2026-07-23 15:56:13	Delivered	Cash	Madaba	3	0
2964	292	10	2026-04-27 20:55:52	Delivered	Cash	Irbid	3	0
2965	389	6	2025-11-06 11:43:42	Delivered	Cash	Amman	2	5
2966	147	6	2026-06-21 16:56:18	Delivered	Cash	Zarqa	2.5	5
2967	487	11	2026-08-16 22:09:40	Delivered	Card	Zarqa	2.5	0
2968	278	2	2026-07-11 22:45:15	Delivered	Transfer	Aqaba	5	0
2969	231	10	2025-11-04 13:45:39	Delivered	Card	Amman	2	0
2970	197	15	2026-04-10 22:19:24	Delivered	Cash	Riyadh	15	0
2971	121	2	2025-12-16 21:22:23	Delivered	Transfer	Amman	2	15
2972	308	6	2026-07-27 14:12:01	Delivered	Cash	Zarqa	2.5	0
2973	225	14	2026-03-31 13:11:57	Delivered	Cash	Amman	2	20
2974	238	5	2026-07-18 21:54:13	Delivered	Cash	Amman	2	0
2975	462	2	2026-08-20 12:12:22	Delivered	Card	Zarqa	2.5	0
2976	386	10	2026-02-13 15:05:03	Delivered	Card	Riyadh	15	10
2977	353	1	2026-10-13 20:10:41	Delivered	Card	Doha	16	20
2978	60	15	2026-08-10 15:47:50	Delivered	Transfer	Amman	2	0
2979	445	3	2026-06-07 11:48:34	Delivered	Transfer	Amman	2	0
2980	283	1	2026-09-15 09:43:45	Delivered	Card	Madaba	3	0
2981	116	7	2026-02-16 09:57:23	Delivered	Card	Amman	2	0
2982	499	11	2026-10-21 12:06:17	Shipped	Cash	Amman	2	10
2983	58	3	2026-08-05 10:52:58	Delivered	Cash	Zarqa	2.5	0
2984	65	7	2026-01-23 10:08:16	Delivered	Card	Irbid	3	10
2985	469	10	2026-10-21 21:34:17	New	Cash	Salt	3	0
2986	165	3	2026-08-28 19:02:24	Delivered	Cash	Amman	2	0
2987	131	12	2026-05-11 17:23:20	Cancelled	Card	Salt	3	0
2988	15	11	2026-06-08 13:50:45	Delivered	Transfer	Dubai	15	0
2989	135	7	2026-07-02 16:16:37	Cancelled	Cash	Madaba	3	15
2990	251	8	2025-11-11 18:32:54	Delivered	Transfer	Amman	2	0
2991	313	3	2025-11-03 20:37:17	Delivered	Cash	Amman	2	0
2992	59	11	2026-10-02 13:05:01	Delivered	Cash	Aqaba	5	0
2993	81	1	2025-11-18 21:10:19	Delivered	Card	Amman	2	0
2994	49	3	2025-12-25 08:57:24	Delivered	Card	Amman	2	0
2995	51	7	2026-05-03 10:08:41	Cancelled	Card	Amman	2	0
2996	496	8	2026-04-10 12:53:58	Delivered	Card	Irbid	3	0
2997	299	3	2026-06-07 16:44:13	Delivered	Cash	Amman	2	0
2998	153	11	2026-09-28 17:19:28	Delivered	Cash	Salt	3	0
2999	350	14	2025-11-25 11:14:25	Delivered	Card	Amman	2	0
3000	323	11	2026-06-11 21:59:07	Shipped	Card	Riyadh	15	0
3001	68	10	2025-12-30 22:44:33	Delivered	Cash	Amman	2	0
3002	213	14	2026-08-30 11:05:13	Delivered	Cash	Jerash	3.5	5
3003	447	5	2025-12-26 14:15:35	Delivered	Cash	Salt	3	0
3004	410	2	2026-07-15 16:38:40	Delivered	Card	Amman	2	0
3005	135	10	2026-03-03 16:57:50	Delivered	Cash	Madaba	3	0
3006	22	10	2025-12-06 08:26:37	Delivered	Cash	Salt	3	0
3007	90	5	2026-05-23 20:10:24	Delivered	Card	Amman	2	10
3008	328	2	2026-06-09 16:07:03	Delivered	Card	Irbid	3	0
3009	496	3	2026-08-27 21:01:34	Delivered	Card	Irbid	3	0
3010	295	12	2025-12-14 21:53:46	Delivered	Cash	Amman	2	10
3011	111	1	2025-12-01 15:02:40	Delivered	Card	Amman	2	0
3012	462	11	2026-08-06 18:47:45	Delivered	Cash	Zarqa	2.5	0
3013	248	11	2026-03-17 12:24:29	Delivered	Transfer	Amman	2	0
3014	86	7	2026-03-12 13:34:19	Delivered	Card	Amman	2	5
3015	426	5	2026-10-24 21:04:53	Shipped	Card	Amman	2	0
3016	147	14	2026-08-20 18:47:59	Delivered	Card	Zarqa	2.5	0
3017	229	14	2026-05-26 14:31:22	Delivered	Card	Madaba	3	0
3018	277	7	2025-12-23 12:23:48	Delivered	Card	Zarqa	2.5	0
3019	360	12	2025-11-25 17:08:09	Delivered	Card	Amman	2	0
3020	165	7	2026-07-17 22:13:08	Delivered	Cash	Amman	2	0
3021	423	11	2025-11-03 21:35:08	Delivered	Transfer	Salt	3	0
3022	146	3	2026-06-21 22:49:45	Delivered	Cash	Zarqa	2.5	0
3023	163	14	2026-10-05 16:16:34	New	Cash	Amman	2	0
3024	437	6	2026-08-28 13:33:29	Delivered	Cash	Karak	4.5	0
3025	22	13	2025-11-02 10:55:05	Delivered	Transfer	Salt	3	0
3026	400	14	2026-05-08 09:34:34	Delivered	Cash	Amman	2	0
3027	444	3	2026-06-12 22:37:48	Delivered	Cash	Amman	2	0
3028	344	6	2026-07-04 09:40:28	Delivered	Transfer	Madaba	3	0
3029	201	13	2026-07-29 11:42:46	Delivered	Transfer	Madaba	3	0
3030	33	1	2026-04-12 17:10:28	Delivered	Card	Riyadh	15	0
3031	121	12	2025-11-25 19:44:50	Delivered	Card	Amman	2	5
3032	193	9	2025-11-25 10:41:59	Delivered	Transfer	Dubai	15	10
3033	296	11	2026-02-16 18:11:08	Delivered	Card	Amman	2	10
3034	243	7	2026-07-26 19:45:27	Delivered	Card	Irbid	3	0
3035	214	3	2026-08-13 18:49:18	Delivered	Card	Amman	2	0
3036	271	5	2026-07-15 10:10:13	Delivered	Cash	Madaba	3	0
3037	394	10	2026-08-02 13:50:42	Delivered	Transfer	Amman	2	0
3038	354	3	2026-09-17 11:50:37	Delivered	Card	Irbid	3	0
3039	418	7	2026-07-16 08:52:26	Delivered	Transfer	Amman	2	0
3040	24	2	2026-07-04 11:36:07	Delivered	Card	Salt	3	0
3041	151	5	2026-06-15 16:19:34	Delivered	Cash	Zarqa	2.5	0
3042	487	15	2026-08-26 18:26:10	Delivered	Card	Zarqa	2.5	0
3043	480	6	2026-04-06 13:26:55	Delivered	Card	Amman	2	10
3044	188	13	2026-02-17 12:20:20	Delivered	Cash	Amman	2	0
3045	142	4	2026-03-24 10:03:22	Cancelled	Card	Zarqa	2.5	0
3046	402	13	2026-09-21 20:37:28	Delivered	Transfer	Amman	2	0
3047	226	15	2025-12-01 08:42:00	Delivered	Card	Amman	2	0
3048	297	5	2026-08-30 09:09:05	Delivered	Cash	Amman	2	0
3049	218	7	2026-05-02 17:14:29	Delivered	Cash	Irbid	3	0
3050	255	5	2026-02-02 17:46:16	Cancelled	Transfer	Aqaba	5	0
3051	151	11	2026-02-25 14:51:59	Delivered	Card	Zarqa	2.5	10
3052	406	12	2026-05-20 10:09:35	Delivered	Card	Amman	2	15
3053	249	15	2026-08-29 08:25:40	Delivered	Transfer	Irbid	3	5
3054	331	14	2026-06-06 12:55:48	Delivered	Transfer	Amman	2	0
3055	449	6	2025-11-24 18:56:52	Delivered	Cash	Amman	2	0
3056	22	1	2026-03-15 17:06:22	Delivered	Card	Salt	3	0
3057	246	13	2025-12-24 18:32:55	Delivered	Card	Amman	2	5
3058	294	6	2026-07-15 20:37:02	Delivered	Card	Amman	2	0
3059	110	12	2025-11-06 19:59:37	Delivered	Card	Amman	2	0
3060	242	5	2026-06-22 14:21:15	Delivered	Card	Aqaba	5	0
3061	63	8	2025-12-07 09:27:33	Delivered	Cash	Amman	2	0
3062	153	13	2026-01-28 09:01:10	Delivered	Card	Salt	3	0
3063	34	2	2025-12-10 09:47:08	Delivered	Card	Amman	2	0
3064	342	2	2026-08-19 17:55:51	Delivered	Card	Aqaba	5	0
3065	5	11	2025-11-13 08:37:11	Delivered	Card	Amman	2	0
3066	129	14	2026-10-13 15:03:11	Delivered	Card	Amman	2	10
3067	2	12	2026-10-24 15:09:08	Shipped	Card	Madaba	3	5
3068	473	3	2025-11-24 17:57:41	Delivered	Card	Amman	2	20
3069	478	8	2026-08-13 08:59:59	Delivered	Card	Aqaba	5	0
3070	130	15	2026-04-01 22:43:56	Delivered	Card	Salt	3	0
3071	199	12	2026-09-23 20:27:01	Cancelled	Transfer	Zarqa	2.5	0
3072	295	2	2026-08-02 18:30:46	Delivered	Cash	Amman	2	0
3073	86	1	2026-01-27 16:35:06	Delivered	Card	Amman	2	0
3074	108	14	2026-09-15 12:16:08	Delivered	Transfer	Amman	2	10
3075	144	8	2026-06-23 17:36:28	Delivered	Cash	Amman	2	0
3076	112	11	2026-02-25 20:44:20	Delivered	Cash	Amman	2	5
3077	225	8	2026-01-19 19:03:55	Delivered	Card	Amman	2	0
3078	229	11	2025-11-17 12:32:55	Delivered	Card	Madaba	3	5
3079	446	4	2025-11-27 08:53:41	Delivered	Card	Irbid	3	0
3080	171	12	2026-07-24 15:05:46	Delivered	Card	Amman	2	0
3081	138	14	2026-10-12 14:38:46	Delivered	Card	Amman	2	0
3082	342	1	2025-11-23 18:25:09	Delivered	Card	Aqaba	5	0
3083	229	7	2026-06-07 15:45:15	Cancelled	Cash	Madaba	3	0
3084	229	7	2026-03-31 13:07:02	Cancelled	Cash	Madaba	3	0
3085	241	3	2026-07-10 21:47:45	Delivered	Transfer	Amman	2	20
3086	391	12	2025-11-10 11:39:40	Delivered	Cash	Amman	2	15
3087	127	10	2026-07-22 22:46:34	Delivered	Card	Amman	2	0
3088	196	15	2026-08-23 08:26:11	Delivered	Transfer	Amman	2	0
3089	238	14	2026-06-28 19:39:34	Delivered	Transfer	Amman	2	0
3090	39	3	2025-12-25 18:10:28	Delivered	Cash	Madaba	3	0
3091	22	1	2026-07-12 16:19:11	Delivered	Cash	Salt	3	5
3092	385	5	2026-03-07 21:07:44	Delivered	Card	Irbid	3	0
3093	222	6	2025-12-27 16:44:17	Delivered	Card	Jerash	3.5	0
3094	221	11	2025-12-02 20:34:14	Delivered	Transfer	Riyadh	15	5
3095	391	3	2026-09-11 09:48:31	Delivered	Card	Amman	2	0
3096	18	15	2026-09-29 22:07:53	Delivered	Card	Amman	2	0
3097	459	3	2026-02-04 19:32:05	Delivered	Card	Irbid	3	0
3098	473	5	2026-06-16 15:45:38	Delivered	Card	Amman	2	5
3099	56	10	2025-11-03 14:07:13	Delivered	Card	Amman	2	0
3100	85	5	2026-03-19 09:10:57	Delivered	Transfer	Amman	2	5
3101	371	15	2025-12-23 11:20:26	Delivered	Card	Amman	2	0
3102	86	6	2026-07-15 19:57:06	Cancelled	Card	Amman	2	0
3103	35	15	2026-01-20 18:07:09	Delivered	Card	Zarqa	2.5	0
3104	102	11	2026-09-27 11:31:26	Cancelled	Transfer	Zarqa	2.5	0
3105	296	13	2026-05-14 17:54:06	Delivered	Cash	Amman	2	0
3106	391	6	2026-04-22 17:16:02	Delivered	Cash	Amman	2	0
3107	442	11	2025-11-25 13:55:11	Delivered	Transfer	Salt	3	0
3108	404	5	2026-10-05 20:11:30	Delivered	Cash	Amman	2	5
3109	157	7	2026-06-08 15:09:15	Delivered	Card	Irbid	3	0
3110	203	10	2026-08-06 14:11:25	Delivered	Cash	Amman	2	0
3111	82	1	2025-12-28 12:34:00	Delivered	Card	Amman	2	5
3112	296	12	2026-09-10 13:01:42	Delivered	Cash	Amman	2	0
3113	39	7	2026-07-08 22:32:40	Delivered	Cash	Madaba	3	0
3114	19	11	2025-11-30 20:54:16	Delivered	Cash	Amman	2	0
3115	436	15	2025-11-18 21:16:20	Delivered	Cash	Irbid	3	10
3116	249	15	2026-05-14 15:37:38	Delivered	Transfer	Irbid	3	10
3117	449	13	2026-08-11 18:19:45	Delivered	Cash	Amman	2	0
3118	426	6	2026-08-21 09:46:52	Delivered	Card	Amman	2	0
3119	492	2	2026-01-22 22:48:39	Delivered	Cash	Karak	4.5	0
3120	198	15	2025-12-23 20:49:17	Cancelled	Cash	Amman	2	20
3121	100	5	2026-07-08 20:14:14	Delivered	Cash	Jerash	3.5	0
3122	367	7	2026-09-25 13:13:16	Delivered	Card	Dubai	15	0
3123	198	6	2025-12-17 08:32:45	Delivered	Cash	Amman	2	0
3124	469	14	2026-08-03 20:05:09	Delivered	Cash	Salt	3	15
3125	35	6	2026-08-31 14:47:25	Cancelled	Cash	Zarqa	2.5	0
3126	22	1	2026-06-13 22:58:18	Delivered	Cash	Salt	3	20
3127	482	10	2026-02-22 13:54:43	Delivered	Card	Irbid	3	0
3128	229	6	2025-12-24 14:17:35	Delivered	Card	Madaba	3	0
3129	441	8	2026-09-28 16:25:02	Delivered	Card	Karak	4.5	15
3130	398	2	2025-12-12 18:37:45	Delivered	Cash	Zarqa	2.5	10
3131	128	4	2026-10-12 20:39:55	Delivered	Card	Amman	2	0
3132	35	7	2026-01-10 20:13:32	Delivered	Card	Zarqa	2.5	0
3133	400	6	2025-11-04 14:34:31	Delivered	Cash	Amman	2	10
3134	257	13	2026-01-12 17:03:47	Delivered	Cash	Zarqa	2.5	0
3135	348	1	2026-09-27 17:53:02	Delivered	Card	Amman	2	0
3136	331	5	2026-04-20 22:23:40	Delivered	Card	Amman	2	0
3137	440	12	2026-01-27 11:34:10	Delivered	Cash	Amman	2	0
3138	215	11	2026-02-15 11:29:15	Cancelled	Cash	Aqaba	5	15
3139	16	14	2026-07-30 17:20:47	Delivered	Card	Zarqa	2.5	0
3140	11	8	2026-03-19 08:23:48	Delivered	Transfer	Jerash	3.5	0
3141	464	8	2026-05-26 18:33:25	Delivered	Cash	Salt	3	0
3142	168	5	2026-04-21 14:53:49	Cancelled	Cash	Amman	2	0
3143	352	14	2026-06-14 12:08:54	Delivered	Cash	Amman	2	0
3144	129	12	2026-08-08 19:18:11	Delivered	Card	Amman	2	0
3145	138	3	2026-03-06 19:13:24	Delivered	Cash	Amman	2	0
3146	103	14	2026-06-11 16:22:32	Delivered	Card	Dubai	15	0
3147	241	15	2026-09-22 11:45:31	Delivered	Transfer	Amman	2	15
3148	204	5	2026-06-28 17:01:29	Delivered	Cash	Karak	4.5	15
3149	401	10	2026-09-17 16:33:25	Delivered	Card	Riyadh	15	0
3150	241	13	2026-07-16 10:37:29	Cancelled	Card	Amman	2	10
3151	122	12	2025-12-01 13:40:56	Cancelled	Card	Amman	2	5
3152	360	9	2025-12-05 22:19:45	Delivered	Cash	Amman	2	0
3153	471	6	2026-10-23 11:08:21	Cancelled	Transfer	Amman	2	0
3154	97	5	2026-10-07 17:48:52	Shipped	Card	Irbid	3	15
3155	63	6	2025-12-11 18:41:17	Delivered	Card	Amman	2	0
3156	358	14	2025-11-09 17:34:31	Delivered	Cash	Amman	2	0
3157	49	7	2025-12-25 09:09:22	Delivered	Transfer	Amman	2	0
3158	12	4	2026-04-25 08:28:57	Delivered	Transfer	Amman	2	0
3159	205	15	2026-02-26 12:56:21	Cancelled	Card	Madaba	3	0
3160	257	12	2026-04-18 08:11:08	Delivered	Transfer	Zarqa	2.5	0
3161	371	12	2026-07-07 10:28:37	Delivered	Transfer	Amman	2	0
3162	400	12	2025-11-20 15:19:41	Delivered	Cash	Amman	2	5
3163	355	7	2025-12-23 18:33:16	Delivered	Card	Madaba	3	0
3164	281	15	2026-06-22 12:33:26	Delivered	Transfer	Amman	2	0
3165	14	9	2026-02-02 15:16:41	Delivered	Cash	Dubai	15	0
3166	356	10	2026-01-11 20:05:54	Delivered	Cash	Irbid	3	5
3167	60	3	2025-11-25 18:52:34	Delivered	Cash	Amman	2	10
3168	271	6	2026-08-20 17:17:40	Delivered	Cash	Madaba	3	0
3169	439	5	2026-10-12 11:45:41	Cancelled	Cash	Dubai	15	0
3170	288	11	2026-01-19 09:32:41	Delivered	Cash	Salt	3	15
3171	300	5	2026-01-26 19:07:24	Delivered	Card	Irbid	3	0
3172	445	15	2026-06-08 12:31:25	Delivered	Transfer	Amman	2	0
3173	230	6	2026-02-24 11:32:15	Delivered	Cash	Riyadh	15	0
3174	423	14	2025-12-26 16:09:09	Delivered	Transfer	Salt	3	0
3175	143	9	2025-12-20 15:51:37	Delivered	Card	Amman	2	0
3176	330	2	2026-09-10 22:14:05	Delivered	Card	Zarqa	2.5	0
3177	461	2	2026-02-11 15:04:34	Delivered	Card	Irbid	3	0
3178	338	6	2026-07-17 15:43:03	Delivered	Card	Zarqa	2.5	0
3179	423	14	2026-07-05 14:05:19	Delivered	Cash	Salt	3	0
3180	342	1	2026-07-15 20:58:13	Delivered	Cash	Aqaba	5	5
3181	289	14	2026-01-31 08:53:48	Delivered	Cash	Aqaba	5	0
3182	394	2	2026-09-24 10:25:49	Cancelled	Cash	Amman	2	0
3183	227	14	2025-11-10 13:17:42	Delivered	Cash	Irbid	3	5
3184	265	13	2026-07-07 17:42:05	Delivered	Cash	Zarqa	2.5	5
3185	133	8	2026-05-14 17:57:41	Delivered	Card	Amman	2	0
3186	354	8	2026-08-13 09:15:54	Cancelled	Transfer	Irbid	3	0
3187	181	7	2026-04-04 08:47:51	Delivered	Card	Amman	2	0
3188	448	8	2026-04-30 08:07:27	Delivered	Card	Salt	3	5
3189	145	3	2026-06-19 20:13:39	Delivered	Card	Zarqa	2.5	0
3190	266	7	2026-06-19 08:43:13	Delivered	Card	Irbid	3	0
3191	207	6	2026-04-04 13:27:24	Delivered	Card	Karak	4.5	0
3192	86	3	2025-11-30 17:47:36	Delivered	Cash	Amman	2	0
3193	371	9	2026-01-29 13:49:28	Delivered	Transfer	Amman	2	0
3194	309	1	2026-09-13 08:04:14	Delivered	Cash	Zarqa	2.5	10
3195	206	12	2026-06-05 17:15:34	Delivered	Card	Zarqa	2.5	0
3196	31	14	2026-07-14 09:38:18	Cancelled	Card	Zarqa	2.5	10
3197	137	15	2026-06-08 22:50:37	Delivered	Cash	Aqaba	5	0
3198	325	13	2026-08-31 20:02:43	Delivered	Card	Karak	4.5	10
3199	424	1	2026-07-13 19:28:33	Delivered	Card	Amman	2	5
3200	97	5	2026-10-05 13:15:31	Delivered	Card	Irbid	3	0
3201	101	1	2026-01-06 18:12:05	Delivered	Card	Amman	2	0
3202	452	6	2025-11-15 21:09:54	Delivered	Cash	Amman	2	0
3203	74	13	2026-08-14 22:04:35	Delivered	Card	Amman	2	10
3204	354	11	2026-07-20 20:37:31	Delivered	Card	Irbid	3	0
3205	22	3	2025-11-15 10:22:58	Delivered	Cash	Salt	3	0
3206	420	8	2025-12-31 10:57:50	Delivered	Transfer	Irbid	3	0
3207	56	8	2025-11-26 15:13:53	Delivered	Card	Amman	2	0
3208	260	9	2026-03-11 11:14:43	Delivered	Cash	Irbid	3	0
3209	400	13	2025-11-13 15:19:42	Delivered	Card	Amman	2	0
3210	406	6	2026-02-12 14:54:02	Delivered	Cash	Amman	2	0
3211	334	3	2026-06-20 18:26:40	Delivered	Transfer	Karak	4.5	0
3212	39	14	2025-12-31 16:22:15	Delivered	Card	Madaba	3	0
3213	130	4	2025-12-03 18:54:49	Delivered	Transfer	Salt	3	0
3214	438	12	2026-10-16 21:54:22	Delivered	Cash	Amman	2	0
3215	440	15	2026-01-18 13:04:13	Delivered	Card	Amman	2	0
3216	470	12	2026-05-26 09:40:10	Delivered	Cash	Aqaba	5	0
3217	47	14	2025-11-16 20:46:14	Delivered	Card	Amman	2	0
3218	151	13	2025-12-23 13:08:52	Shipped	Card	Zarqa	2.5	5
3219	352	3	2026-08-04 11:21:02	Delivered	Card	Amman	2	15
3220	242	2	2026-09-27 19:33:46	Delivered	Cash	Aqaba	5	0
3221	86	5	2026-09-22 10:55:34	Delivered	Card	Amman	2	0
3222	429	13	2026-01-17 13:53:05	Delivered	Card	Irbid	3	0
3223	311	14	2026-08-12 22:36:35	Cancelled	Card	Amman	2	0
3224	456	10	2026-02-14 12:40:59	Delivered	Cash	Amman	2	0
3225	51	13	2026-04-03 13:23:36	Delivered	Cash	Amman	2	10
3226	448	8	2025-11-11 10:57:14	Delivered	Card	Salt	3	0
3227	266	8	2025-11-15 20:53:52	Delivered	Cash	Irbid	3	0
3228	405	14	2026-06-01 22:40:45	Cancelled	Card	Salt	3	0
3229	65	5	2026-10-22 10:24:22	New	Cash	Irbid	3	0
3230	391	3	2026-03-10 16:33:45	Delivered	Card	Amman	2	10
3231	473	1	2025-12-04 21:55:09	Delivered	Cash	Amman	2	0
3232	168	14	2026-06-13 19:15:30	Delivered	Cash	Amman	2	0
3233	334	2	2026-08-13 15:58:16	Delivered	Card	Karak	4.5	15
3234	122	15	2026-08-31 20:53:58	Delivered	Cash	Amman	2	0
3235	288	3	2026-09-06 13:01:31	Delivered	Cash	Salt	3	10
3236	47	10	2026-05-21 15:03:41	Cancelled	Cash	Amman	2	0
3237	269	6	2026-06-28 11:04:03	Delivered	Cash	Amman	2	20
3238	96	8	2026-05-21 13:09:06	Delivered	Cash	Amman	2	0
3239	97	6	2026-10-13 20:50:38	New	Card	Irbid	3	5
3240	364	7	2026-03-30 20:26:08	Delivered	Cash	Irbid	3	0
3241	44	3	2026-10-21 09:26:24	New	Cash	Amman	2	5
3242	404	5	2026-04-02 15:47:11	Delivered	Cash	Amman	2	0
3243	330	9	2025-11-26 11:02:02	Shipped	Transfer	Zarqa	2.5	0
3244	98	2	2026-09-18 14:14:39	Delivered	Transfer	Amman	2	0
3245	156	13	2026-10-18 08:22:54	Shipped	Card	Riyadh	15	0
3246	400	7	2025-11-02 12:28:39	Delivered	Card	Amman	2	10
3247	383	12	2026-09-30 21:26:55	Delivered	Transfer	Irbid	3	15
3248	444	3	2026-07-09 14:14:39	Delivered	Card	Amman	2	0
3249	5	8	2026-08-14 19:12:32	Delivered	Cash	Amman	2	0
3250	464	15	2026-10-03 19:34:43	Delivered	Cash	Salt	3	0
3251	82	3	2026-09-25 22:59:35	Delivered	Transfer	Amman	2	0
3252	348	6	2026-04-16 19:52:23	Delivered	Transfer	Amman	2	10
3253	96	10	2026-08-20 18:46:33	Delivered	Card	Amman	2	0
3254	226	15	2026-04-01 11:53:20	Delivered	Transfer	Amman	2	0
3255	232	6	2025-11-25 10:27:17	Delivered	Cash	Karak	4.5	0
3256	269	1	2026-07-23 19:07:46	Cancelled	Cash	Amman	2	0
3257	344	4	2026-06-09 10:13:32	Delivered	Cash	Madaba	3	0
3258	69	9	2025-11-12 12:52:41	Delivered	Cash	Amman	2	10
3259	47	5	2026-05-19 19:39:35	Delivered	Card	Amman	2	0
3260	487	14	2026-08-03 19:42:46	Delivered	Cash	Zarqa	2.5	0
3261	404	9	2025-11-11 17:46:47	Delivered	Cash	Amman	2	5
3262	49	15	2026-10-04 14:34:39	Delivered	Card	Amman	2	10
3263	323	3	2026-06-24 15:39:50	Delivered	Card	Riyadh	15	5
3264	416	9	2026-04-24 20:16:11	Shipped	Card	Amman	2	0
3265	473	15	2025-11-02 12:57:05	Delivered	Cash	Amman	2	0
3266	189	3	2026-08-07 19:58:44	Delivered	Card	Amman	2	0
3267	220	3	2026-03-25 13:54:57	Delivered	Cash	Irbid	3	5
3268	85	3	2026-04-26 19:37:29	Delivered	Transfer	Amman	2	5
3269	259	1	2026-03-19 15:09:31	Delivered	Card	Amman	2	10
3270	416	2	2025-11-29 16:41:48	Delivered	Card	Amman	2	0
3271	441	11	2025-11-16 13:50:44	Delivered	Card	Karak	4.5	20
3272	88	10	2026-03-21 10:36:23	Delivered	Card	Amman	2	20
3273	52	15	2025-11-21 10:30:32	Delivered	Card	Karak	4.5	0
3274	367	14	2026-07-21 08:59:26	Delivered	Transfer	Dubai	15	5
3275	410	13	2026-07-19 14:54:07	Delivered	Card	Amman	2	0
3276	414	1	2026-09-27 16:43:53	Delivered	Cash	Riyadh	15	0
3277	344	5	2026-05-03 13:02:51	Delivered	Card	Madaba	3	10
3278	235	10	2026-08-01 17:37:36	Delivered	Card	Amman	2	10
3279	318	15	2026-10-25 13:43:41	New	Card	Amman	2	0
3280	231	3	2026-02-08 22:32:56	Delivered	Cash	Amman	2	0
3281	231	3	2025-12-02 17:31:37	Delivered	Cash	Amman	2	5
3282	316	6	2026-02-23 11:58:15	Delivered	Card	Zarqa	2.5	0
3283	10	2	2025-12-11 15:17:11	Delivered	Transfer	Irbid	3	0
3284	348	14	2025-11-10 09:24:53	Delivered	Card	Amman	2	0
3285	194	4	2026-06-17 15:11:03	Delivered	Cash	Aqaba	5	0
3286	48	14	2025-12-09 13:27:45	Shipped	Cash	Amman	2	0
3287	175	15	2025-11-17 17:01:16	Delivered	Card	Madaba	3	0
3288	247	1	2026-10-10 11:13:48	New	Cash	Amman	2	5
3289	331	5	2025-11-01 15:52:02	Delivered	Cash	Amman	2	0
3290	126	11	2026-07-20 20:14:05	Delivered	Card	Irbid	3	0
3291	205	11	2026-10-20 18:46:19	Cancelled	Card	Madaba	3	0
3292	63	11	2025-11-03 09:33:25	Delivered	Card	Amman	2	0
3293	336	9	2026-01-25 22:54:56	Delivered	Cash	Amman	2	15
3294	468	5	2026-02-03 14:10:05	Delivered	Card	Irbid	3	0
3295	149	5	2026-01-19 21:25:03	Delivered	Cash	Aqaba	5	5
3296	239	12	2026-07-29 12:30:24	Delivered	Card	Jerash	3.5	0
3297	147	7	2026-10-21 21:34:42	New	Transfer	Zarqa	2.5	5
3298	489	9	2026-01-21 19:37:39	Cancelled	Card	Amman	2	0
3299	352	12	2026-01-02 15:22:25	Cancelled	Cash	Amman	2	0
3300	194	7	2026-03-17 08:24:54	Delivered	Transfer	Aqaba	5	0
3301	13	7	2026-03-15 20:08:32	Delivered	Card	Irbid	3	5
3302	63	2	2025-11-09 10:42:15	Delivered	Transfer	Amman	2	0
3303	63	1	2026-02-12 21:14:23	Delivered	Card	Amman	2	0
3304	104	13	2026-08-10 17:59:23	Delivered	Cash	Irbid	3	10
3305	368	6	2025-11-12 18:24:48	Delivered	Card	Irbid	3	0
3306	412	6	2025-11-29 09:26:34	Delivered	Card	Zarqa	2.5	0
3307	47	15	2026-07-05 20:59:57	Cancelled	Card	Amman	2	0
3308	387	10	2026-04-11 11:14:24	Delivered	Card	Aqaba	5	0
3309	217	6	2026-06-27 20:17:51	Delivered	Card	Amman	2	10
3310	280	5	2025-12-31 22:00:38	Shipped	Cash	Madaba	3	0
3311	234	14	2026-08-06 17:24:54	Delivered	Card	Karak	4.5	0
3312	15	15	2026-06-22 19:45:44	Delivered	Card	Dubai	15	0
3313	388	5	2026-01-18 12:55:23	Delivered	Card	Aqaba	5	0
3314	337	9	2026-07-26 21:19:23	Delivered	Transfer	Riyadh	15	15
3315	322	2	2026-03-20 14:05:12	Delivered	Card	Amman	2	0
3316	101	10	2025-12-17 18:49:39	Delivered	Cash	Amman	2	5
3317	38	2	2026-07-05 11:17:02	Delivered	Card	Zarqa	2.5	10
3318	134	2	2026-03-24 08:09:07	Delivered	Card	Amman	2	5
3319	211	11	2026-07-04 20:29:50	Shipped	Transfer	Amman	2	0
3320	98	5	2026-07-10 17:26:50	Delivered	Card	Amman	2	0
3321	226	5	2026-06-05 13:27:37	Delivered	Card	Amman	2	5
3322	139	1	2026-05-15 08:31:43	Delivered	Card	Amman	2	0
3323	455	8	2025-11-26 13:23:30	Delivered	Card	Aqaba	5	10
3324	57	11	2025-11-27 14:59:50	Delivered	Transfer	Amman	2	0
3325	319	2	2026-09-29 08:13:58	Delivered	Card	Amman	2	20
3326	396	3	2026-09-09 09:05:27	Delivered	Cash	Amman	2	0
3327	47	3	2026-10-10 16:52:43	Delivered	Card	Amman	2	5
3328	430	2	2025-11-20 21:04:43	Delivered	Transfer	Madaba	3	5
3329	263	12	2025-12-07 14:00:48	Delivered	Cash	Amman	2	0
3330	182	3	2026-05-17 17:25:11	Delivered	Transfer	Amman	2	0
3331	341	2	2026-08-28 14:05:02	Delivered	Cash	Amman	2	0
3332	347	8	2026-10-04 09:39:14	Delivered	Transfer	Amman	2	0
3333	299	15	2025-12-13 11:00:17	Delivered	Cash	Amman	2	0
3334	272	5	2026-06-25 14:31:59	Delivered	Cash	Amman	2	0
3335	423	14	2026-04-09 09:43:36	Delivered	Transfer	Salt	3	0
3336	345	6	2026-03-19 21:16:01	Delivered	Transfer	Amman	2	10
3337	189	6	2026-08-10 16:10:22	Delivered	Card	Amman	2	0
3338	239	8	2026-03-24 19:03:49	Delivered	Cash	Jerash	3.5	0
3339	243	14	2026-02-23 11:33:45	Delivered	Cash	Irbid	3	0
3340	149	11	2025-11-14 10:50:56	Delivered	Card	Aqaba	5	0
3341	371	2	2025-12-07 22:53:04	Delivered	Cash	Amman	2	20
3342	189	12	2026-10-20 21:31:03	New	Cash	Amman	2	5
3343	87	9	2026-08-24 19:14:40	Delivered	Card	Zarqa	2.5	10
3344	421	3	2025-12-17 19:56:33	Delivered	Card	Aqaba	5	0
3345	258	15	2026-04-30 22:29:04	Delivered	Card	Amman	2	0
3346	308	10	2026-06-23 15:56:29	Delivered	Card	Zarqa	2.5	5
3347	291	1	2026-04-01 16:20:54	Delivered	Cash	Amman	2	5
3348	54	4	2026-08-26 12:10:42	Delivered	Cash	Salt	3	0
3349	262	1	2026-09-10 21:06:28	Delivered	Card	Aqaba	5	0
3350	435	9	2026-09-01 18:52:25	Delivered	Card	Amman	2	0
3351	271	2	2026-10-03 14:34:14	Delivered	Card	Madaba	3	0
3352	239	11	2026-03-26 20:12:05	Delivered	Transfer	Jerash	3.5	10
3353	111	10	2025-11-13 14:04:54	Delivered	Cash	Amman	2	0
3354	421	15	2026-06-26 11:03:24	Delivered	Transfer	Aqaba	5	10
3355	489	6	2025-12-29 11:04:57	Delivered	Card	Amman	2	10
3356	281	13	2026-04-29 14:39:31	Delivered	Card	Amman	2	0
3357	53	12	2026-07-21 12:09:29	Delivered	Card	Amman	2	0
3358	498	15	2026-07-25 21:13:17	Delivered	Card	Aqaba	5	5
3359	295	9	2026-04-03 11:10:32	Delivered	Cash	Amman	2	0
3360	356	15	2025-11-09 08:44:01	Delivered	Card	Irbid	3	0
3361	409	12	2025-12-06 22:54:15	Cancelled	Transfer	Karak	4.5	5
3362	22	13	2026-09-26 15:15:22	Delivered	Card	Salt	3	0
3363	263	3	2026-05-01 22:58:14	Delivered	Card	Amman	2	10
3364	451	2	2026-07-10 17:42:08	Shipped	Transfer	Irbid	3	0
3365	168	7	2026-09-25 12:29:55	Delivered	Cash	Amman	2	0
3366	293	8	2026-06-23 22:45:28	Delivered	Cash	Aqaba	5	0
3367	414	3	2026-05-05 17:20:16	Delivered	Transfer	Riyadh	15	0
3368	357	3	2026-03-20 14:42:25	Delivered	Cash	Madaba	3	0
3369	401	2	2025-12-16 08:48:00	Delivered	Cash	Riyadh	15	0
3370	144	8	2026-05-30 14:41:15	Delivered	Card	Amman	2	5
3371	465	6	2026-05-08 11:23:15	Cancelled	Cash	Amman	2	5
3372	144	15	2026-06-28 08:39:31	Delivered	Card	Amman	2	0
3373	463	7	2025-11-30 16:38:51	Delivered	Card	Amman	2	0
3374	376	5	2026-09-09 08:02:05	Delivered	Cash	Amman	2	0
3375	403	12	2026-07-12 10:47:06	Delivered	Cash	Amman	2	0
3376	63	12	2025-12-14 16:41:23	Delivered	Card	Amman	2	0
3377	229	8	2026-04-11 18:13:24	Delivered	Card	Madaba	3	0
3378	174	5	2026-01-23 13:55:15	Delivered	Card	Madaba	3	0
3379	116	3	2025-11-28 16:31:08	Cancelled	Transfer	Amman	2	0
3380	467	11	2026-04-02 10:23:47	Delivered	Card	Dubai	15	0
3381	479	8	2026-08-21 21:27:12	Delivered	Cash	Jerash	3.5	0
3382	191	6	2026-03-03 21:55:58	Delivered	Card	Amman	2	0
3383	171	6	2026-07-28 12:01:11	Delivered	Card	Amman	2	0
3384	293	8	2025-11-11 11:27:36	Delivered	Cash	Aqaba	5	0
3385	371	6	2026-07-25 18:53:49	Delivered	Card	Amman	2	0
3386	93	5	2026-09-05 14:55:03	Delivered	Card	Amman	2	0
3387	493	9	2026-02-17 10:43:04	Delivered	Cash	Karak	4.5	15
3388	467	15	2026-08-08 08:28:47	Delivered	Card	Dubai	15	10
3389	472	15	2026-07-19 12:59:12	Delivered	Card	Amman	2	0
3390	49	6	2026-03-18 12:12:38	Delivered	Card	Amman	2	0
3391	133	6	2026-08-31 11:54:31	Delivered	Card	Amman	2	0
3392	108	11	2026-03-29 22:46:38	Delivered	Transfer	Amman	2	10
3393	170	2	2026-05-30 08:22:06	Delivered	Card	Dubai	15	10
3394	145	10	2026-05-30 20:45:00	Delivered	Card	Zarqa	2.5	0
3395	130	14	2025-12-23 13:42:37	Delivered	Transfer	Salt	3	0
3396	174	14	2026-02-27 13:26:22	Delivered	Card	Madaba	3	15
3397	35	1	2025-12-01 21:52:48	Delivered	Cash	Zarqa	2.5	0
3398	490	12	2026-06-30 12:19:07	Delivered	Cash	Amman	2	0
3399	500	12	2026-01-16 19:39:16	Delivered	Cash	Amman	2	10
3400	49	14	2025-12-06 16:18:48	Delivered	Card	Amman	2	10
3401	343	11	2026-01-04 17:19:05	Delivered	Card	Irbid	3	0
3402	260	14	2025-11-24 22:32:10	Delivered	Transfer	Irbid	3	0
3403	401	6	2026-03-31 15:16:36	Delivered	Cash	Riyadh	15	0
3404	312	8	2025-12-18 20:37:22	Cancelled	Cash	Irbid	3	0
3405	352	6	2026-01-28 12:36:43	Delivered	Cash	Amman	2	0
3406	131	2	2025-11-28 11:03:32	Delivered	Cash	Salt	3	0
3407	54	1	2026-06-15 11:48:41	Delivered	Cash	Salt	3	20
3408	212	3	2026-04-30 18:59:05	Delivered	Card	Zarqa	2.5	0
3409	50	15	2026-01-31 15:58:53	Delivered	Transfer	Amman	2	0
3410	392	1	2025-12-21 08:50:21	Delivered	Card	Aqaba	5	5
3411	197	7	2025-12-25 17:02:55	Delivered	Card	Riyadh	15	0
3412	231	11	2025-12-10 22:16:44	Delivered	Card	Amman	2	0
3413	271	15	2026-08-11 14:35:11	Delivered	Transfer	Madaba	3	10
3414	143	11	2025-12-01 21:21:58	Delivered	Card	Amman	2	15
3415	44	15	2026-09-29 18:50:49	Delivered	Card	Amman	2	0
3416	449	6	2026-05-30 15:42:06	Delivered	Cash	Amman	2	0
3417	342	10	2026-08-14 18:49:42	Delivered	Card	Aqaba	5	15
3418	139	15	2025-12-04 10:46:17	Cancelled	Cash	Amman	2	0
3419	268	9	2026-07-31 14:52:03	Delivered	Transfer	Amman	2	10
3420	499	12	2026-05-02 14:10:07	Delivered	Card	Amman	2	0
3421	62	11	2025-11-21 15:23:17	Cancelled	Card	Dubai	15	0
3422	336	1	2026-06-30 13:50:52	Delivered	Card	Amman	2	5
3423	64	5	2026-03-14 21:28:59	Cancelled	Card	Amman	2	0
3424	437	1	2026-02-17 17:33:49	Cancelled	Card	Karak	4.5	0
3425	394	1	2025-11-02 22:28:30	Delivered	Card	Amman	2	10
3426	116	2	2025-11-23 10:39:36	Delivered	Cash	Amman	2	0
3427	336	2	2026-03-15 08:50:37	Delivered	Transfer	Amman	2	10
3428	145	10	2025-11-13 20:35:08	Cancelled	Card	Zarqa	2.5	0
3429	342	3	2026-04-03 15:16:34	Cancelled	Cash	Aqaba	5	0
3430	349	8	2026-07-07 14:23:52	Delivered	Transfer	Zarqa	2.5	10
3431	73	2	2026-10-13 21:07:53	Shipped	Card	Amman	2	0
3432	45	6	2026-08-15 10:46:01	Delivered	Cash	Amman	2	0
3433	142	5	2026-08-16 14:54:33	Delivered	Transfer	Zarqa	2.5	5
3434	63	8	2026-07-10 09:33:55	Delivered	Card	Amman	2	0
3435	336	2	2026-10-15 12:44:09	Cancelled	Cash	Amman	2	0
3436	412	9	2025-11-06 11:33:51	Delivered	Cash	Zarqa	2.5	0
3437	373	14	2026-06-04 12:03:50	Delivered	Transfer	Madaba	3	5
3438	449	10	2026-10-22 12:26:58	New	Cash	Amman	2	0
3439	231	15	2026-06-03 18:27:31	Delivered	Transfer	Amman	2	15
3440	478	7	2025-11-07 12:49:09	Delivered	Card	Aqaba	5	5
3441	60	3	2026-04-06 08:01:18	Delivered	Transfer	Amman	2	0
3442	308	1	2026-05-08 09:48:18	Delivered	Card	Zarqa	2.5	0
3443	120	10	2025-11-09 15:22:02	Cancelled	Cash	Amman	2	15
3444	490	15	2025-11-20 19:38:56	Delivered	Cash	Amman	2	5
3445	348	14	2025-12-20 22:36:22	Delivered	Card	Amman	2	0
3446	221	13	2026-06-10 13:58:51	Delivered	Cash	Riyadh	15	0
3447	70	5	2026-05-01 11:25:04	Cancelled	Transfer	Amman	2	5
3448	328	1	2026-04-23 21:54:34	Delivered	Transfer	Irbid	3	10
3449	84	1	2026-05-11 21:48:56	Delivered	Cash	Riyadh	15	0
3450	450	11	2026-04-27 12:45:42	Delivered	Cash	Irbid	3	0
3451	187	2	2025-12-10 12:26:46	Delivered	Cash	Irbid	3	20
3452	215	14	2025-12-02 12:33:06	Cancelled	Cash	Aqaba	5	0
3453	333	12	2026-05-17 10:21:20	Delivered	Card	Zarqa	2.5	0
3454	464	1	2025-11-03 11:02:44	Delivered	Transfer	Salt	3	0
3455	344	8	2026-05-23 16:36:29	Delivered	Cash	Madaba	3	0
3456	108	12	2026-05-17 15:10:32	Delivered	Transfer	Amman	2	0
3457	401	5	2025-11-08 10:35:42	Delivered	Card	Riyadh	15	0
3458	292	14	2026-01-19 19:18:59	Delivered	Card	Irbid	3	0
3459	414	3	2026-10-04 14:44:09	Cancelled	Card	Riyadh	15	0
3460	464	13	2026-07-16 15:17:22	Delivered	Card	Salt	3	0
3461	147	5	2026-07-23 18:11:38	Delivered	Transfer	Zarqa	2.5	0
3462	318	5	2026-10-20 21:46:14	New	Card	Amman	2	0
3463	432	11	2025-11-23 09:51:16	Delivered	Card	Zarqa	2.5	15
3464	234	8	2026-01-13 21:34:08	Delivered	Card	Karak	4.5	10
3465	401	3	2025-11-15 13:39:59	Delivered	Card	Riyadh	15	15
3466	403	6	2026-10-18 14:48:46	Shipped	Cash	Amman	2	0
3467	329	12	2026-01-23 14:50:32	Delivered	Cash	Amman	2	15
3468	318	9	2026-05-08 12:02:23	Delivered	Cash	Amman	2	10
3469	492	3	2026-09-16 16:20:49	Cancelled	Cash	Karak	4.5	0
3470	460	15	2026-07-27 21:02:20	Delivered	Card	Zarqa	2.5	0
3471	49	7	2026-09-04 19:56:43	Delivered	Cash	Amman	2	0
3472	313	6	2026-06-14 21:47:22	Cancelled	Transfer	Amman	2	5
3473	318	5	2026-08-23 16:47:24	Delivered	Card	Amman	2	0
3474	430	7	2026-06-07 08:08:24	Delivered	Cash	Madaba	3	0
3475	86	3	2026-07-18 15:24:46	Delivered	Cash	Amman	2	0
3476	228	11	2026-03-01 15:05:37	Delivered	Card	Aqaba	5	0
3477	300	11	2026-01-02 18:16:03	Delivered	Card	Irbid	3	0
3478	487	3	2026-07-28 21:54:21	Delivered	Transfer	Zarqa	2.5	0
3479	50	3	2025-12-30 18:57:14	Delivered	Cash	Amman	2	0
3480	68	9	2026-02-14 20:49:03	Delivered	Card	Amman	2	0
3481	439	11	2026-05-03 08:27:03	Cancelled	Cash	Dubai	15	0
3482	85	5	2026-09-02 21:44:47	Delivered	Cash	Amman	2	0
3483	280	14	2026-02-28 09:29:12	Delivered	Card	Madaba	3	0
3484	469	7	2026-07-24 16:52:59	Delivered	Card	Salt	3	0
3485	205	15	2026-09-14 14:01:45	Cancelled	Transfer	Madaba	3	0
3486	86	13	2026-09-20 19:16:55	Delivered	Card	Amman	2	20
3487	348	10	2026-04-08 21:53:32	Delivered	Card	Amman	2	5
3488	406	5	2026-07-01 20:19:41	Delivered	Card	Amman	2	0
3489	251	13	2026-06-16 17:04:02	Delivered	Transfer	Amman	2	5
3490	49	11	2026-03-26 16:41:41	Delivered	Cash	Amman	2	0
3491	459	2	2025-12-03 20:21:04	Cancelled	Card	Irbid	3	0
3492	469	3	2026-07-23 13:05:19	Delivered	Transfer	Salt	3	0
3493	234	14	2026-06-04 20:06:19	Delivered	Cash	Karak	4.5	0
3494	287	6	2026-10-17 21:48:17	Shipped	Card	Amman	2	0
3495	231	15	2025-12-07 17:46:02	Delivered	Card	Amman	2	0
3496	288	6	2026-02-15 16:20:07	Delivered	Cash	Salt	3	0
3497	49	7	2026-07-17 20:59:47	Delivered	Transfer	Amman	2	5
3498	464	12	2026-04-12 18:43:43	Delivered	Cash	Salt	3	0
3499	446	13	2026-08-28 08:57:52	Cancelled	Cash	Irbid	3	0
3500	57	14	2026-08-09 15:07:09	Delivered	Card	Amman	2	5
3501	108	3	2026-04-01 21:03:41	Delivered	Card	Amman	2	5
3502	328	8	2026-10-05 16:33:36	Delivered	Card	Irbid	3	5
3503	339	2	2026-02-26 08:58:17	Delivered	Card	Amman	2	20
3504	134	12	2026-06-01 08:54:49	Delivered	Transfer	Amman	2	0
3505	371	9	2025-12-19 08:03:14	Delivered	Cash	Amman	2	10
3506	399	1	2026-10-11 13:55:43	Shipped	Transfer	Amman	2	5
3507	47	13	2026-07-13 22:32:32	Delivered	Cash	Amman	2	15
3508	437	15	2026-01-14 21:38:27	Delivered	Transfer	Karak	4.5	0
3509	353	9	2026-08-30 14:57:31	Delivered	Transfer	Doha	16	0
3510	65	9	2025-12-18 16:26:30	Delivered	Card	Irbid	3	10
3511	441	9	2026-03-13 11:14:08	Delivered	Card	Karak	4.5	5
3512	10	15	2025-11-19 11:56:24	Cancelled	Card	Irbid	3	0
3513	322	8	2026-06-09 16:50:05	Cancelled	Card	Amman	2	10
3514	15	9	2025-12-03 18:58:59	Delivered	Card	Dubai	15	10
3515	143	6	2025-11-09 16:04:35	Delivered	Cash	Amman	2	0
3516	342	3	2026-01-06 13:52:45	Delivered	Card	Aqaba	5	5
3517	342	8	2025-11-20 18:10:52	Cancelled	Card	Aqaba	5	5
3518	461	2	2026-09-26 16:37:54	Delivered	Card	Irbid	3	15
3519	92	3	2026-05-17 12:44:05	Delivered	Cash	Amman	2	0
3520	402	14	2026-07-17 21:59:04	Delivered	Card	Amman	2	5
3521	218	1	2026-02-14 19:12:59	Delivered	Card	Irbid	3	5
3522	435	12	2026-06-04 19:39:03	Delivered	Cash	Amman	2	0
3523	291	9	2026-08-09 18:46:03	Delivered	Cash	Amman	2	0
3524	12	9	2025-11-10 21:57:32	Delivered	Card	Amman	2	0
3525	456	8	2026-06-04 16:15:56	Cancelled	Card	Amman	2	0
3526	219	5	2025-11-19 16:31:36	Delivered	Card	Karak	4.5	0
3527	473	9	2026-08-26 20:30:01	Cancelled	Transfer	Amman	2	10
3528	274	14	2025-12-17 14:34:36	Delivered	Cash	Zarqa	2.5	0
3529	377	12	2026-08-15 16:46:06	Delivered	Transfer	Irbid	3	0
3530	83	8	2026-06-02 12:22:43	Delivered	Cash	Zarqa	2.5	15
3531	204	6	2025-12-15 12:19:42	Delivered	Card	Karak	4.5	15
3532	354	4	2026-09-16 15:02:24	Delivered	Cash	Irbid	3	0
3533	7	12	2026-04-29 21:22:11	Delivered	Card	Irbid	3	20
3534	219	11	2026-03-19 20:18:34	Delivered	Card	Karak	4.5	5
3535	261	11	2026-01-06 11:50:27	Delivered	Card	Irbid	3	10
3536	349	4	2025-11-18 12:27:28	Delivered	Cash	Zarqa	2.5	15
3537	500	8	2025-12-16 15:46:08	Cancelled	Cash	Amman	2	15
3538	11	5	2026-01-14 09:52:43	Delivered	Card	Jerash	3.5	0
3539	233	6	2026-07-22 12:26:09	Cancelled	Cash	Irbid	3	0
3540	22	7	2026-07-19 12:36:28	Delivered	Cash	Salt	3	0
3541	231	12	2026-09-28 22:50:47	Cancelled	Card	Amman	2	0
3542	124	13	2026-02-28 19:06:34	Delivered	Card	Aqaba	5	0
3543	108	15	2026-08-31 15:07:19	Delivered	Card	Amman	2	0
3544	116	5	2026-06-06 09:43:09	Delivered	Cash	Amman	2	5
3545	342	4	2026-06-20 19:01:17	Delivered	Card	Aqaba	5	10
3546	464	5	2025-11-17 10:56:32	Delivered	Cash	Salt	3	0
3547	293	11	2026-07-25 15:26:45	Delivered	Card	Aqaba	5	0
3548	340	14	2026-02-08 19:02:55	Delivered	Card	Amman	2	0
3549	314	3	2026-09-11 22:46:36	Delivered	Transfer	Amman	2	0
3550	90	6	2026-01-06 16:47:12	Delivered	Card	Amman	2	5
3551	92	6	2026-01-31 18:58:47	Delivered	Card	Amman	2	0
3552	419	7	2025-12-05 22:23:36	Delivered	Cash	Amman	2	0
3553	433	2	2026-04-12 16:42:32	Delivered	Transfer	Amman	2	0
3554	380	10	2026-06-10 16:43:56	Delivered	Cash	Irbid	3	15
3555	157	1	2025-11-03 10:09:17	Delivered	Cash	Irbid	3	15
3556	440	6	2025-11-09 16:19:00	Delivered	Transfer	Amman	2	0
3557	386	2	2025-11-04 19:46:33	Delivered	Transfer	Riyadh	15	0
3558	329	1	2026-07-07 09:37:12	Delivered	Card	Amman	2	0
3559	31	12	2025-11-14 10:12:56	Delivered	Card	Zarqa	2.5	0
3560	134	11	2026-02-04 13:02:11	Delivered	Card	Amman	2	5
3561	484	11	2026-08-11 15:32:41	Delivered	Cash	Amman	2	10
3562	241	14	2026-03-04 09:38:52	Delivered	Card	Amman	2	0
3563	404	15	2026-10-20 08:05:42	New	Cash	Amman	2	15
3564	260	11	2025-11-15 18:22:24	Cancelled	Cash	Irbid	3	0
3565	488	1	2026-09-09 13:40:46	Delivered	Transfer	Amman	2	0
3566	354	7	2026-10-23 21:04:57	Cancelled	Transfer	Irbid	3	10
3567	116	7	2026-01-24 18:37:29	Delivered	Cash	Amman	2	0
3568	62	1	2026-10-22 19:22:18	New	Card	Dubai	15	0
3569	369	10	2026-01-06 20:34:16	Delivered	Cash	Irbid	3	0
3570	87	6	2026-06-13 12:57:30	Cancelled	Card	Zarqa	2.5	0
3571	148	13	2026-08-19 13:14:12	Delivered	Cash	Amman	2	0
3572	472	4	2026-07-16 10:02:41	Delivered	Card	Amman	2	0
3573	401	13	2026-06-12 17:52:23	Delivered	Card	Riyadh	15	0
3574	10	12	2026-05-10 13:17:38	Delivered	Cash	Irbid	3	10
3575	59	8	2026-08-28 17:40:36	Delivered	Card	Aqaba	5	10
3576	151	7	2026-09-28 17:50:55	Delivered	Card	Zarqa	2.5	0
3577	274	15	2026-01-26 22:04:00	Shipped	Card	Zarqa	2.5	0
3578	437	15	2026-07-17 22:18:24	Delivered	Transfer	Karak	4.5	0
3579	1	9	2026-09-15 18:52:12	Delivered	Transfer	Zarqa	2.5	0
3580	163	6	2026-07-28 11:46:43	Delivered	Cash	Amman	2	5
3581	174	1	2026-10-18 13:57:29	Delivered	Cash	Madaba	3	0
3582	40	3	2026-06-05 14:29:36	Delivered	Transfer	Amman	2	0
3583	248	15	2026-04-11 14:11:45	Delivered	Card	Amman	2	0
3584	208	12	2025-11-29 15:34:27	Delivered	Cash	Salt	3	0
3585	269	5	2026-08-30 18:25:06	Delivered	Cash	Amman	2	5
3586	453	14	2026-04-06 21:01:13	Delivered	Cash	Riyadh	15	0
3587	86	3	2026-07-14 17:40:09	Delivered	Card	Amman	2	15
3588	467	15	2026-10-08 13:45:28	Delivered	Card	Dubai	15	0
3589	233	2	2025-12-31 08:57:10	Delivered	Card	Irbid	3	5
3590	163	7	2026-09-05 19:16:38	Shipped	Cash	Amman	2	5
3591	115	4	2026-07-24 08:31:00	Delivered	Cash	Aqaba	5	0
3592	417	8	2025-11-21 13:05:38	Delivered	Card	Amman	2	0
3593	209	8	2026-08-20 08:53:12	Delivered	Transfer	Riyadh	15	0
3594	329	2	2025-11-15 08:51:18	Delivered	Card	Amman	2	0
3595	156	13	2026-10-08 17:59:26	Delivered	Card	Riyadh	15	15
3596	280	14	2025-11-25 18:30:57	Delivered	Card	Madaba	3	5
3597	81	10	2026-08-30 15:04:52	Delivered	Card	Amman	2	0
3598	441	3	2026-09-13 21:47:28	Cancelled	Cash	Karak	4.5	0
3599	257	3	2026-04-01 18:25:27	Delivered	Card	Zarqa	2.5	0
3600	196	1	2026-09-19 17:48:40	Delivered	Card	Amman	2	10
3601	72	4	2026-08-31 13:25:11	Delivered	Transfer	Amman	2	0
3602	266	2	2025-11-02 10:33:39	Delivered	Card	Irbid	3	0
3603	146	14	2026-10-19 20:14:57	Delivered	Card	Zarqa	2.5	0
3604	231	3	2026-03-16 22:20:51	Delivered	Card	Amman	2	0
3605	98	11	2026-05-19 18:05:01	Delivered	Transfer	Amman	2	0
3606	447	15	2026-07-13 16:18:28	Delivered	Card	Salt	3	0
3607	358	15	2025-11-05 12:57:35	Delivered	Cash	Amman	2	0
3608	317	13	2026-07-12 16:28:14	Delivered	Card	Salt	3	0
3609	469	12	2026-09-03 17:13:03	Shipped	Cash	Salt	3	0
3610	257	12	2026-01-25 15:01:18	Delivered	Cash	Zarqa	2.5	0
3611	269	3	2026-07-20 10:06:03	Delivered	Card	Amman	2	0
3612	293	13	2026-02-27 09:33:48	Delivered	Transfer	Aqaba	5	0
3613	228	3	2026-06-05 08:55:48	Delivered	Cash	Aqaba	5	0
3614	466	11	2026-09-20 20:13:50	Delivered	Cash	Amman	2	5
3615	223	4	2026-09-19 19:24:31	Delivered	Transfer	Amman	2	15
3616	398	8	2026-04-08 20:08:37	Delivered	Transfer	Zarqa	2.5	0
3617	155	11	2026-06-20 16:36:12	Delivered	Cash	Amman	2	10
3618	357	5	2026-05-14 22:17:54	Delivered	Card	Madaba	3	0
3619	380	2	2026-09-20 13:25:26	Delivered	Transfer	Irbid	3	10
3620	243	7	2026-07-29 11:21:30	Delivered	Card	Irbid	3	0
3621	152	15	2026-06-21 22:17:30	Delivered	Transfer	Amman	2	0
3622	254	15	2026-10-20 19:26:09	Shipped	Transfer	Riyadh	15	0
3623	6	7	2026-09-05 19:38:32	Delivered	Transfer	Salt	3	0
3624	365	12	2025-12-21 10:22:36	Delivered	Transfer	Amman	2	10
3625	495	5	2026-06-15 09:24:12	Delivered	Transfer	Amman	2	0
3626	195	3	2026-10-14 16:47:36	Delivered	Cash	Amman	2	5
3627	337	9	2026-02-24 16:57:46	Delivered	Cash	Riyadh	15	0
3628	468	14	2026-07-19 20:59:35	Delivered	Cash	Irbid	3	5
3629	338	9	2026-06-10 11:48:33	Delivered	Cash	Zarqa	2.5	15
3630	97	1	2026-10-01 10:25:42	Delivered	Cash	Irbid	3	0
3631	379	6	2026-01-14 12:08:50	Delivered	Card	Amman	2	0
3632	353	13	2026-07-03 14:05:51	Delivered	Cash	Doha	16	0
3633	136	14	2026-05-10 09:40:42	Delivered	Card	Amman	2	0
3634	462	14	2026-06-06 13:16:23	Cancelled	Transfer	Zarqa	2.5	0
3635	442	8	2026-07-06 13:14:58	Delivered	Card	Salt	3	20
3636	397	2	2026-10-21 09:23:35	Shipped	Card	Dubai	15	0
3637	28	14	2026-09-13 17:23:30	Delivered	Transfer	Amman	2	10
3638	283	6	2026-06-04 18:21:57	Delivered	Card	Madaba	3	5
3639	440	13	2026-04-04 11:37:05	Delivered	Card	Amman	2	0
3640	224	14	2026-10-14 22:15:07	Shipped	Card	Madaba	3	20
3641	201	2	2026-09-19 11:24:08	Delivered	Transfer	Madaba	3	0
3642	49	8	2026-08-10 09:37:25	Delivered	Cash	Amman	2	0
3643	340	15	2026-03-08 22:46:18	Delivered	Transfer	Amman	2	0
3644	56	2	2026-07-25 09:46:13	Delivered	Card	Amman	2	0
3645	421	1	2026-04-13 20:13:56	Delivered	Transfer	Aqaba	5	0
3646	142	7	2026-05-20 10:18:07	Cancelled	Transfer	Zarqa	2.5	0
3647	234	12	2026-08-10 17:26:31	Delivered	Card	Karak	4.5	10
3648	370	6	2026-04-05 17:18:08	Delivered	Card	Madaba	3	0
3649	285	15	2026-04-26 10:16:19	Delivered	Card	Amman	2	0
3650	440	8	2025-12-01 20:09:22	Delivered	Cash	Amman	2	0
3651	12	8	2026-06-11 08:04:13	Shipped	Card	Amman	2	0
3652	303	10	2026-03-15 08:21:46	Cancelled	Card	Amman	2	0
3653	114	14	2026-04-19 20:10:29	Cancelled	Cash	Amman	2	0
3654	241	3	2025-12-24 17:40:23	Delivered	Transfer	Amman	2	0
3655	138	9	2025-12-03 11:47:15	Delivered	Cash	Amman	2	0
3656	2	9	2026-08-31 21:06:54	Delivered	Card	Madaba	3	0
3657	318	14	2026-04-02 15:21:44	Cancelled	Transfer	Amman	2	0
3658	93	3	2025-11-04 21:39:13	Cancelled	Card	Amman	2	0
3659	307	11	2026-07-15 20:05:37	Delivered	Card	Amman	2	0
3660	4	14	2026-06-12 17:55:41	Delivered	Card	Jerash	3.5	0
3661	82	7	2026-06-09 20:33:05	Delivered	Cash	Amman	2	15
3662	264	5	2026-04-06 13:44:14	Delivered	Card	Amman	2	0
3663	462	1	2026-07-04 16:52:59	Delivered	Transfer	Zarqa	2.5	0
3664	47	15	2025-12-10 20:40:17	Delivered	Cash	Amman	2	0
3665	51	15	2026-07-17 20:23:40	Delivered	Cash	Amman	2	10
3666	489	8	2026-07-16 20:59:21	Delivered	Card	Amman	2	5
3667	277	8	2026-06-13 09:18:38	Cancelled	Transfer	Zarqa	2.5	0
3668	150	15	2026-05-29 17:22:35	Delivered	Card	Irbid	3	0
3669	492	12	2025-11-29 20:14:43	Delivered	Card	Karak	4.5	0
3670	424	11	2026-07-06 13:46:26	Delivered	Transfer	Amman	2	0
3671	177	7	2026-05-18 09:06:34	Delivered	Cash	Amman	2	20
3672	59	15	2026-08-02 21:51:45	Delivered	Cash	Aqaba	5	5
3673	350	1	2026-04-28 14:33:09	Delivered	Card	Amman	2	15
3674	187	8	2025-12-30 14:38:00	Delivered	Cash	Irbid	3	5
3675	485	4	2025-12-21 22:19:15	Delivered	Card	Amman	2	0
3676	296	3	2026-04-26 19:33:06	Delivered	Transfer	Amman	2	0
3677	144	14	2026-01-12 13:57:11	Delivered	Card	Amman	2	0
3678	484	3	2026-10-02 20:25:01	Delivered	Cash	Amman	2	10
3679	79	7	2026-03-04 08:59:49	Delivered	Transfer	Amman	2	0
3680	317	11	2025-11-14 20:17:26	Delivered	Cash	Salt	3	10
3681	360	10	2026-07-17 20:38:29	Delivered	Cash	Amman	2	0
3682	205	7	2026-02-23 10:12:31	Delivered	Cash	Madaba	3	0
3683	93	14	2025-11-29 17:10:21	Delivered	Transfer	Amman	2	0
3684	150	12	2026-01-27 11:49:28	Cancelled	Card	Irbid	3	5
3685	486	8	2025-11-16 12:35:32	Delivered	Card	Amman	2	0
3686	492	3	2025-12-26 20:09:25	Cancelled	Card	Karak	4.5	15
3687	390	10	2026-06-18 08:51:01	Delivered	Cash	Madaba	3	0
3688	49	8	2025-11-05 18:35:05	Delivered	Cash	Amman	2	0
3689	49	14	2026-05-29 16:05:33	Delivered	Transfer	Amman	2	5
3690	344	13	2026-06-19 12:36:12	Delivered	Card	Madaba	3	0
3691	129	11	2026-02-15 10:56:33	Delivered	Transfer	Amman	2	0
3692	97	6	2026-09-21 19:13:35	Delivered	Transfer	Irbid	3	0
3693	404	4	2026-08-27 17:29:41	Delivered	Transfer	Amman	2	0
3694	59	8	2026-06-13 22:07:58	Delivered	Card	Aqaba	5	0
3695	51	14	2025-11-05 12:26:27	Delivered	Card	Amman	2	0
3696	40	3	2025-12-02 15:17:37	Cancelled	Cash	Amman	2	0
3697	447	11	2026-10-09 18:15:59	New	Card	Salt	3	0
3698	219	12	2026-01-30 08:31:51	Cancelled	Card	Karak	4.5	0
3699	89	5	2026-05-31 21:37:18	Delivered	Cash	Irbid	3	0
3700	158	6	2025-12-29 17:58:21	Cancelled	Card	Karak	4.5	15
3701	46	14	2026-07-14 09:24:37	Delivered	Cash	Amman	2	0
3702	233	2	2025-12-30 08:28:14	Cancelled	Card	Irbid	3	0
3703	486	9	2026-02-10 17:36:36	Delivered	Card	Amman	2	5
3704	263	3	2025-12-30 18:48:45	Delivered	Card	Amman	2	0
3705	213	4	2026-10-21 11:34:50	New	Cash	Jerash	3.5	5
3706	342	6	2026-01-26 13:02:35	Delivered	Card	Aqaba	5	0
3707	488	13	2026-09-11 09:30:22	Cancelled	Cash	Amman	2	20
3708	294	15	2026-07-24 16:07:18	Delivered	Transfer	Amman	2	0
3709	268	8	2026-10-14 09:58:09	Cancelled	Cash	Amman	2	10
3710	388	12	2026-03-10 10:24:10	Delivered	Cash	Aqaba	5	0
3711	356	14	2026-02-18 15:08:37	Delivered	Cash	Irbid	3	0
3712	104	11	2026-03-01 14:02:49	Cancelled	Cash	Irbid	3	0
3713	469	13	2026-09-19 18:17:42	Cancelled	Cash	Salt	3	0
3714	352	2	2026-01-13 22:55:42	Delivered	Transfer	Amman	2	0
3715	20	7	2025-11-14 17:11:39	Delivered	Card	Amman	2	10
3716	360	10	2026-04-09 19:19:09	Delivered	Card	Amman	2	15
3717	397	11	2026-08-15 15:43:22	Delivered	Card	Dubai	15	10
3718	433	4	2026-06-05 09:09:55	Cancelled	Transfer	Amman	2	0
3719	49	3	2026-07-04 17:41:05	Delivered	Cash	Amman	2	10
3720	327	5	2026-06-19 09:13:21	Delivered	Card	Amman	2	0
3721	60	3	2025-12-13 15:14:52	Delivered	Cash	Amman	2	0
3722	1	15	2026-07-26 17:26:51	Delivered	Card	Zarqa	2.5	0
3723	473	15	2026-08-22 17:48:21	Delivered	Cash	Amman	2	0
3724	151	10	2026-08-19 22:28:23	Delivered	Card	Zarqa	2.5	0
3725	387	15	2026-02-12 17:44:25	Cancelled	Cash	Aqaba	5	0
3726	163	4	2026-10-13 21:44:49	Shipped	Card	Amman	2	0
3727	291	3	2026-03-29 08:18:29	Delivered	Card	Amman	2	5
3728	115	11	2025-11-11 11:35:33	Delivered	Cash	Aqaba	5	5
3729	441	2	2026-01-14 14:07:27	Delivered	Card	Karak	4.5	0
3730	354	1	2026-08-08 21:47:52	Delivered	Transfer	Irbid	3	5
3731	349	14	2026-08-25 21:29:53	Delivered	Card	Zarqa	2.5	10
3732	146	10	2026-02-11 19:54:50	Cancelled	Cash	Zarqa	2.5	10
3733	239	6	2026-10-22 18:22:00	New	Cash	Jerash	3.5	0
3734	456	13	2026-03-13 09:31:59	Cancelled	Card	Amman	2	0
3735	198	6	2026-06-12 15:47:50	Delivered	Card	Amman	2	15
3736	330	10	2026-07-05 12:33:15	Delivered	Card	Zarqa	2.5	0
3737	275	11	2026-02-02 18:13:59	Shipped	Transfer	Zarqa	2.5	10
3738	66	13	2026-04-04 09:16:40	Delivered	Cash	Salt	3	0
3739	220	3	2026-06-04 20:25:06	Delivered	Transfer	Irbid	3	0
3740	147	11	2026-09-12 16:59:36	Cancelled	Card	Zarqa	2.5	0
3741	218	14	2026-09-11 10:52:53	Delivered	Card	Irbid	3	0
3742	334	13	2026-10-25 10:17:31	Cancelled	Card	Karak	4.5	0
3743	86	15	2026-01-21 15:44:19	Delivered	Cash	Amman	2	5
3744	232	3	2026-03-05 20:28:42	Delivered	Cash	Karak	4.5	0
3745	357	3	2026-10-12 11:31:08	Shipped	Card	Madaba	3	15
3746	403	9	2026-10-04 14:50:31	Delivered	Transfer	Amman	2	5
3747	22	14	2026-02-06 22:50:31	Delivered	Card	Salt	3	0
3748	93	6	2026-03-07 12:03:54	Delivered	Cash	Amman	2	15
3749	35	6	2026-08-01 12:47:34	Delivered	Transfer	Zarqa	2.5	0
3750	354	5	2026-08-28 13:05:08	Shipped	Transfer	Irbid	3	10
3751	110	1	2026-06-19 20:48:33	Delivered	Cash	Amman	2	0
3752	312	3	2026-05-24 11:32:55	Delivered	Transfer	Irbid	3	10
3753	315	14	2025-11-17 15:15:57	Delivered	Cash	Amman	2	0
3754	218	9	2026-01-12 17:48:15	Delivered	Cash	Irbid	3	20
3755	209	14	2026-01-28 13:21:58	Delivered	Transfer	Riyadh	15	0
3756	208	14	2026-03-17 18:05:45	Delivered	Cash	Salt	3	0
3757	94	1	2026-05-21 13:50:50	Delivered	Card	Zarqa	2.5	0
3758	205	7	2026-02-28 22:39:06	Delivered	Card	Madaba	3	0
3759	445	15	2026-10-20 08:42:46	Cancelled	Cash	Amman	2	0
3760	272	10	2026-07-18 15:03:26	Delivered	Transfer	Amman	2	0
3761	309	5	2026-10-22 20:41:28	New	Card	Zarqa	2.5	0
3762	147	14	2026-05-30 14:37:22	Delivered	Cash	Zarqa	2.5	5
3763	464	6	2026-10-06 12:24:37	Shipped	Cash	Salt	3	0
3764	126	13	2026-07-13 13:43:35	Cancelled	Card	Irbid	3	0
3765	22	9	2026-04-27 22:46:32	Delivered	Cash	Salt	3	0
3766	144	3	2026-04-12 15:32:04	Delivered	Cash	Amman	2	10
3767	271	15	2026-08-12 10:59:39	Delivered	Cash	Madaba	3	0
3768	315	12	2025-11-05 17:46:40	Delivered	Card	Amman	2	15
3769	80	14	2026-07-22 21:41:04	Cancelled	Card	Riyadh	15	0
3770	124	1	2026-07-29 21:17:11	Delivered	Cash	Aqaba	5	0
3771	367	2	2026-08-06 17:09:52	Delivered	Card	Dubai	15	10
3772	321	9	2025-11-17 10:04:32	Cancelled	Transfer	Amman	2	0
3773	243	3	2026-07-27 10:51:29	Delivered	Card	Irbid	3	0
3774	47	12	2025-12-08 17:33:07	Cancelled	Transfer	Amman	2	0
3775	468	10	2025-11-27 22:18:43	Cancelled	Cash	Irbid	3	0
3776	409	2	2026-01-03 13:29:02	Delivered	Cash	Karak	4.5	0
3777	223	7	2026-10-24 13:22:42	Delivered	Cash	Amman	2	0
3778	69	6	2026-07-07 21:37:51	Delivered	Cash	Amman	2	0
3779	263	2	2026-03-20 14:06:13	Delivered	Cash	Amman	2	0
3780	45	9	2025-11-30 12:45:21	Delivered	Card	Amman	2	0
3781	271	13	2026-07-14 14:11:52	Delivered	Card	Madaba	3	0
3782	371	15	2025-11-19 13:04:44	Delivered	Cash	Amman	2	5
3783	87	14	2025-12-03 21:45:19	Delivered	Transfer	Zarqa	2.5	15
3784	303	1	2026-06-16 10:30:20	Delivered	Card	Amman	2	15
3785	47	4	2026-05-27 20:38:52	Delivered	Card	Amman	2	0
3786	81	5	2026-07-30 20:46:55	Delivered	Transfer	Amman	2	0
3787	472	10	2025-12-08 22:47:37	Delivered	Cash	Amman	2	5
3788	420	11	2026-10-10 12:07:19	Shipped	Card	Irbid	3	0
3789	311	9	2025-12-20 22:32:12	Delivered	Transfer	Amman	2	0
3790	35	7	2026-06-01 17:14:50	Delivered	Card	Zarqa	2.5	0
3791	231	3	2025-12-31 19:57:31	Delivered	Card	Amman	2	5
3792	90	2	2026-05-07 19:29:12	Delivered	Cash	Amman	2	0
3793	477	8	2026-05-04 11:07:13	Delivered	Transfer	Aqaba	5	0
3794	352	11	2026-06-09 16:18:24	Delivered	Transfer	Amman	2	0
3795	435	10	2025-11-24 09:32:30	Delivered	Cash	Amman	2	15
3796	35	15	2026-01-23 19:00:29	Delivered	Transfer	Zarqa	2.5	0
3797	382	10	2026-01-27 10:41:32	Shipped	Card	Amman	2	15
3798	235	6	2026-07-04 20:48:49	Delivered	Transfer	Amman	2	0
3799	185	13	2026-05-25 09:48:17	Delivered	Cash	Irbid	3	0
3800	459	13	2026-01-10 18:46:59	Delivered	Cash	Irbid	3	0
3801	230	9	2025-12-26 15:13:53	Delivered	Cash	Riyadh	15	10
3802	45	6	2026-06-18 12:00:20	Delivered	Transfer	Amman	2	0
3803	233	8	2025-12-25 17:43:54	Cancelled	Card	Irbid	3	10
3804	373	10	2026-07-11 09:46:09	Delivered	Cash	Madaba	3	5
3805	100	1	2026-07-03 21:17:10	Delivered	Transfer	Jerash	3.5	0
3806	108	3	2026-03-26 21:52:19	Shipped	Card	Amman	2	5
3807	330	15	2026-07-07 18:17:15	Delivered	Card	Zarqa	2.5	5
3808	348	15	2026-07-26 18:20:24	Delivered	Cash	Amman	2	5
3809	170	13	2026-06-23 17:03:04	Delivered	Cash	Dubai	15	0
3810	482	3	2026-09-25 11:43:50	Delivered	Cash	Irbid	3	0
3811	6	15	2026-09-04 12:57:24	Cancelled	Cash	Salt	3	0
3812	26	1	2026-03-27 08:30:40	Delivered	Cash	Dubai	15	0
3813	59	5	2025-12-20 15:44:17	Delivered	Transfer	Aqaba	5	20
3814	122	2	2026-08-23 11:55:49	Delivered	Card	Amman	2	0
3815	37	3	2025-12-09 21:27:03	Delivered	Cash	Amman	2	0
3816	452	5	2025-12-20 20:34:42	Delivered	Card	Amman	2	0
3817	186	11	2026-05-19 10:42:52	Cancelled	Transfer	Madaba	3	0
3818	235	13	2026-07-21 12:17:19	Cancelled	Card	Amman	2	0
3819	250	3	2026-10-02 19:33:48	Delivered	Card	Amman	2	0
3820	289	15	2026-04-21 13:13:40	Delivered	Cash	Aqaba	5	10
3821	462	8	2025-11-23 20:39:00	Delivered	Cash	Zarqa	2.5	0
3822	59	14	2026-01-24 10:50:24	Cancelled	Cash	Aqaba	5	10
3823	323	8	2025-12-04 12:58:22	Delivered	Card	Riyadh	15	0
3824	347	12	2026-01-19 13:45:56	Delivered	Card	Amman	2	0
3825	46	2	2026-02-12 21:49:35	Delivered	Cash	Amman	2	0
3826	303	9	2026-05-08 16:21:48	Shipped	Transfer	Amman	2	20
3827	206	11	2026-07-09 08:22:26	Delivered	Cash	Zarqa	2.5	15
3828	85	12	2026-08-22 19:20:46	Delivered	Card	Amman	2	0
3829	379	3	2026-02-13 18:40:54	Delivered	Card	Amman	2	20
3830	347	6	2026-07-13 18:20:28	Cancelled	Card	Amman	2	0
3831	135	12	2026-06-02 14:54:45	Delivered	Transfer	Madaba	3	0
3832	356	6	2025-11-15 17:39:49	Shipped	Cash	Irbid	3	0
3833	163	8	2026-07-22 09:23:54	Delivered	Transfer	Amman	2	0
3834	240	9	2026-10-10 17:47:26	Shipped	Transfer	Irbid	3	5
3835	332	12	2026-10-02 18:09:57	Delivered	Card	Zarqa	2.5	0
3836	46	6	2025-12-10 08:14:41	Delivered	Card	Amman	2	0
3837	135	6	2026-05-11 11:25:57	Delivered	Card	Madaba	3	10
3838	327	2	2026-05-14 18:05:04	Delivered	Card	Amman	2	5
3839	351	7	2025-11-14 08:48:46	Delivered	Cash	Zarqa	2.5	0
3840	116	5	2025-12-02 18:09:57	Delivered	Card	Amman	2	0
3841	49	2	2026-07-06 10:50:04	Delivered	Card	Amman	2	5
3842	308	14	2026-08-04 09:01:51	Delivered	Card	Zarqa	2.5	5
3843	183	10	2026-06-19 11:29:46	Delivered	Cash	Madaba	3	0
3844	34	15	2025-11-15 09:09:04	Delivered	Cash	Amman	2	0
3845	421	4	2025-11-30 15:45:17	Delivered	Cash	Aqaba	5	0
3846	35	2	2026-09-16 18:00:30	Delivered	Cash	Zarqa	2.5	0
3847	319	9	2026-10-12 16:07:48	Delivered	Cash	Amman	2	0
3848	378	7	2025-11-15 16:37:58	Delivered	Card	Amman	2	0
3849	134	10	2025-11-22 13:16:43	Cancelled	Transfer	Amman	2	0
3850	289	12	2026-02-04 15:10:19	Delivered	Card	Aqaba	5	0
3851	450	3	2026-05-27 18:17:39	Delivered	Transfer	Irbid	3	0
3852	141	5	2026-04-01 14:48:28	Delivered	Cash	Irbid	3	5
3853	340	6	2026-01-08 13:21:14	Delivered	Card	Amman	2	0
3854	453	5	2026-09-22 20:58:03	Delivered	Card	Riyadh	15	15
3855	434	2	2026-08-12 19:38:48	Delivered	Card	Amman	2	5
3856	463	15	2026-02-04 21:49:27	Delivered	Card	Amman	2	15
3857	47	13	2025-11-16 18:42:38	Delivered	Cash	Amman	2	0
3858	27	9	2026-06-16 21:48:55	Delivered	Card	Aqaba	5	0
3859	442	15	2025-11-30 14:26:26	Delivered	Cash	Salt	3	10
3860	188	15	2026-06-08 12:36:43	Delivered	Card	Amman	2	10
3861	42	14	2026-07-16 17:43:03	Cancelled	Cash	Riyadh	15	0
3862	299	6	2026-09-30 10:28:57	Cancelled	Cash	Amman	2	0
3863	135	3	2026-07-02 22:33:32	Delivered	Cash	Madaba	3	0
3864	243	3	2026-06-18 16:52:42	Cancelled	Cash	Irbid	3	0
3865	446	2	2026-02-06 21:25:59	Delivered	Transfer	Irbid	3	0
3866	93	1	2026-09-12 22:39:47	Delivered	Card	Amman	2	0
3867	146	10	2026-03-19 15:50:31	Delivered	Cash	Zarqa	2.5	5
3868	255	15	2025-11-03 21:33:58	Cancelled	Card	Aqaba	5	0
3869	135	14	2026-07-28 09:30:53	Delivered	Transfer	Madaba	3	5
3870	373	3	2026-02-07 17:44:50	Delivered	Card	Madaba	3	10
3871	116	3	2025-12-29 13:55:58	Delivered	Card	Amman	2	0
3872	107	8	2026-09-19 12:32:43	Delivered	Cash	Amman	2	0
3873	4	1	2025-11-21 12:45:29	Cancelled	Transfer	Jerash	3.5	0
3874	488	6	2025-12-14 22:49:17	Delivered	Transfer	Amman	2	5
3875	268	12	2026-08-21 21:04:03	Cancelled	Card	Amman	2	5
3876	308	14	2026-09-28 21:55:20	Cancelled	Card	Zarqa	2.5	0
3877	52	8	2026-05-05 10:15:15	Cancelled	Transfer	Karak	4.5	0
3878	488	10	2026-02-09 12:20:23	Delivered	Card	Amman	2	0
3879	434	11	2025-11-18 11:37:43	Delivered	Card	Amman	2	5
3880	33	12	2026-09-25 12:09:46	Delivered	Card	Riyadh	15	0
3881	412	11	2025-11-27 17:38:11	Delivered	Card	Zarqa	2.5	10
3882	430	5	2025-12-19 08:32:51	Delivered	Cash	Madaba	3	10
3883	293	11	2026-03-06 12:59:23	Delivered	Card	Aqaba	5	0
3884	477	1	2026-06-20 18:27:21	Delivered	Card	Aqaba	5	0
3885	148	11	2026-07-23 10:05:58	Delivered	Cash	Amman	2	0
3886	480	9	2026-04-14 16:11:00	Delivered	Card	Amman	2	0
3887	389	10	2025-11-02 11:47:32	Delivered	Card	Amman	2	0
3888	282	1	2026-05-09 12:09:22	Delivered	Cash	Amman	2	0
3889	168	14	2026-01-08 17:39:15	Cancelled	Card	Amman	2	0
3890	276	15	2026-06-13 20:53:04	Delivered	Transfer	Amman	2	0
3891	348	12	2025-11-03 09:03:45	Delivered	Card	Amman	2	0
3892	233	7	2026-07-20 12:36:50	Delivered	Cash	Irbid	3	0
3893	176	15	2026-06-15 08:34:21	Delivered	Card	Amman	2	0
3894	285	6	2026-05-12 10:09:45	Delivered	Card	Amman	2	0
3895	2	4	2026-09-12 18:40:10	Delivered	Cash	Madaba	3	0
3896	118	3	2025-12-28 13:09:04	Delivered	Cash	Amman	2	0
3897	86	15	2026-07-03 18:10:21	Delivered	Transfer	Amman	2	0
3898	384	11	2026-07-25 16:49:49	Delivered	Card	Salt	3	0
3899	283	10	2026-10-14 15:44:13	Delivered	Transfer	Madaba	3	15
3900	295	15	2025-12-02 13:45:44	Delivered	Transfer	Amman	2	0
3901	402	11	2026-07-14 21:56:03	Delivered	Card	Amman	2	0
3902	84	3	2025-12-23 15:26:28	Delivered	Card	Riyadh	15	0
3903	2	7	2026-09-12 19:31:46	Delivered	Transfer	Madaba	3	0
3904	379	1	2026-01-17 12:56:17	Delivered	Card	Amman	2	15
3905	158	11	2026-09-20 13:59:28	Delivered	Cash	Karak	4.5	0
3906	22	10	2026-10-07 15:51:46	Delivered	Card	Salt	3	0
3907	235	13	2026-06-19 11:14:22	Delivered	Cash	Amman	2	0
3908	116	1	2026-01-17 08:06:47	Delivered	Cash	Amman	2	0
3909	90	2	2026-09-18 20:31:44	Delivered	Card	Amman	2	0
3910	231	3	2025-11-04 17:47:56	Delivered	Cash	Amman	2	0
3911	48	5	2026-04-18 14:08:12	Delivered	Cash	Amman	2	0
3912	307	8	2026-03-01 11:13:28	Delivered	Card	Amman	2	0
3913	264	8	2026-08-28 19:32:04	Delivered	Cash	Amman	2	15
3914	129	1	2026-04-04 22:11:29	Delivered	Cash	Amman	2	0
3915	139	8	2026-01-11 18:02:17	Cancelled	Transfer	Amman	2	0
3916	223	9	2026-02-18 18:29:31	Delivered	Cash	Amman	2	0
3917	115	5	2025-11-05 15:27:55	Delivered	Cash	Aqaba	5	10
3918	102	15	2026-08-29 19:11:31	Delivered	Transfer	Zarqa	2.5	0
3919	58	10	2026-06-11 21:44:32	Delivered	Transfer	Zarqa	2.5	0
3920	37	15	2026-08-25 15:10:49	Delivered	Card	Amman	2	5
3921	487	5	2026-08-28 21:19:00	Delivered	Transfer	Zarqa	2.5	0
3922	424	11	2026-03-19 13:04:55	Delivered	Transfer	Amman	2	15
3923	359	2	2026-09-11 13:46:36	Delivered	Transfer	Amman	2	10
3924	49	9	2026-06-28 16:04:12	Delivered	Cash	Amman	2	0
3925	148	11	2026-08-11 10:04:48	Delivered	Cash	Amman	2	15
3926	301	11	2026-04-05 22:21:10	Delivered	Card	Amman	2	0
3927	376	8	2026-09-19 18:55:00	Delivered	Card	Amman	2	0
3928	417	13	2026-09-25 10:56:17	Delivered	Cash	Amman	2	0
3929	111	9	2025-11-28 16:20:57	Delivered	Transfer	Amman	2	0
3930	187	2	2026-04-02 14:19:14	Delivered	Cash	Irbid	3	10
3931	163	15	2026-09-14 13:31:07	Delivered	Transfer	Amman	2	10
3932	117	2	2026-09-06 12:33:01	Delivered	Card	Irbid	3	0
3933	422	12	2026-10-11 15:12:27	Delivered	Card	Amman	2	0
3934	54	6	2026-09-01 08:42:19	Delivered	Card	Salt	3	0
3935	284	11	2025-11-14 09:35:50	Delivered	Card	Karak	4.5	0
3936	144	15	2026-02-12 13:48:25	Delivered	Transfer	Amman	2	20
3937	165	11	2026-03-25 22:13:45	Delivered	Card	Amman	2	15
3938	347	14	2026-03-10 20:36:52	Delivered	Card	Amman	2	0
3939	60	12	2025-11-02 20:08:59	Delivered	Cash	Amman	2	5
3940	265	1	2026-07-01 18:11:43	Delivered	Card	Zarqa	2.5	0
3941	458	14	2026-10-20 18:41:29	New	Cash	Irbid	3	0
3942	51	14	2026-08-07 21:54:42	Delivered	Card	Amman	2	0
3943	107	3	2026-09-05 19:18:53	Delivered	Transfer	Amman	2	5
3944	26	2	2026-10-15 15:19:20	Delivered	Card	Dubai	15	0
3945	118	6	2025-12-27 10:47:12	Delivered	Cash	Amman	2	0
3946	331	11	2026-06-07 17:01:51	Delivered	Card	Amman	2	0
3947	35	8	2025-12-13 13:17:00	Delivered	Cash	Zarqa	2.5	0
3948	380	14	2026-08-24 10:33:23	Delivered	Cash	Irbid	3	0
3949	70	6	2026-10-19 21:29:10	Delivered	Transfer	Amman	2	0
3950	259	9	2026-01-12 17:22:59	Delivered	Transfer	Amman	2	0
3951	138	6	2025-11-30 21:12:51	Delivered	Card	Amman	2	5
3952	478	7	2026-07-30 08:04:38	Delivered	Card	Aqaba	5	0
3953	391	14	2026-02-08 19:44:47	Cancelled	Cash	Amman	2	0
3954	144	5	2026-02-09 09:16:56	Delivered	Cash	Amman	2	0
3955	108	6	2026-06-05 15:54:28	Delivered	Cash	Amman	2	0
3956	492	15	2026-07-11 14:30:54	Delivered	Cash	Karak	4.5	0
3957	167	6	2025-12-14 17:42:59	Delivered	Card	Amman	2	0
3958	66	7	2026-10-15 20:45:17	Delivered	Card	Salt	3	10
3959	97	1	2026-09-24 09:14:20	Delivered	Card	Irbid	3	0
3960	421	8	2025-12-05 17:01:24	Delivered	Transfer	Aqaba	5	0
3961	231	15	2026-01-02 13:34:46	Delivered	Card	Amman	2	5
3962	171	7	2026-01-12 12:01:42	Cancelled	Card	Amman	2	0
3963	95	14	2026-07-04 08:51:28	Delivered	Card	Madaba	3	0
3964	90	14	2026-05-08 17:26:16	Delivered	Cash	Amman	2	0
3965	306	1	2026-10-17 10:57:23	Delivered	Card	Irbid	3	0
3966	170	8	2026-09-01 21:06:08	Delivered	Transfer	Dubai	15	0
3967	53	3	2026-02-09 09:02:05	Delivered	Cash	Amman	2	0
3968	155	11	2026-05-16 14:12:50	Delivered	Cash	Amman	2	0
3969	49	12	2026-09-03 15:18:24	Delivered	Card	Amman	2	0
3970	94	3	2026-04-23 19:34:56	Cancelled	Card	Zarqa	2.5	0
3971	275	8	2026-03-30 18:37:59	Delivered	Card	Zarqa	2.5	0
3972	305	5	2026-05-16 20:02:46	Cancelled	Card	Amman	2	0
3973	464	2	2026-07-25 08:21:59	Delivered	Cash	Salt	3	15
3974	68	5	2025-11-26 11:20:37	Delivered	Card	Amman	2	0
3975	9	2	2026-08-19 10:23:00	Cancelled	Card	Amman	2	5
3976	268	13	2026-06-01 13:58:27	Delivered	Card	Amman	2	0
3977	343	1	2025-11-25 17:46:30	Delivered	Card	Irbid	3	0
3978	342	11	2025-12-19 21:14:35	Delivered	Cash	Aqaba	5	20
3979	387	14	2026-06-08 10:37:46	Delivered	Card	Aqaba	5	10
3980	423	15	2026-03-22 14:27:13	Delivered	Card	Salt	3	0
3981	205	14	2026-04-11 09:29:42	Delivered	Card	Madaba	3	0
3982	289	6	2026-06-15 09:44:50	Delivered	Cash	Aqaba	5	0
3983	12	11	2026-05-15 09:14:09	Delivered	Cash	Amman	2	5
3984	108	13	2026-06-25 21:59:12	Delivered	Card	Amman	2	0
3985	390	13	2026-09-10 14:19:21	Delivered	Cash	Madaba	3	10
3986	327	13	2026-05-06 16:47:02	Delivered	Card	Amman	2	0
3987	241	11	2026-02-17 08:27:34	Delivered	Card	Amman	2	0
3988	27	2	2026-06-16 19:19:41	Shipped	Transfer	Aqaba	5	0
3989	115	6	2026-04-04 18:58:01	Delivered	Cash	Aqaba	5	0
3990	22	10	2026-02-08 08:52:01	Cancelled	Transfer	Salt	3	15
3991	66	1	2025-12-23 15:22:51	Delivered	Card	Salt	3	15
3992	69	5	2026-04-16 09:39:54	Delivered	Transfer	Amman	2	0
3993	265	2	2026-06-05 13:24:13	Cancelled	Card	Zarqa	2.5	5
3994	481	15	2026-07-06 17:19:06	Delivered	Cash	Amman	2	5
3995	6	11	2026-10-21 11:06:19	New	Card	Salt	3	0
3996	424	9	2026-09-16 10:42:26	Delivered	Card	Amman	2	0
3997	371	2	2025-12-07 11:07:41	Delivered	Transfer	Amman	2	0
3998	469	14	2026-09-30 12:48:56	Delivered	Transfer	Salt	3	10
3999	342	11	2025-12-13 08:18:39	Cancelled	Cash	Aqaba	5	0
4000	121	14	2025-12-07 18:57:58	Cancelled	Cash	Amman	2	10
4001	49	2	2026-05-04 09:00:03	Cancelled	Cash	Amman	2	15
4002	166	10	2026-01-08 10:30:50	Shipped	Card	Doha	16	10
4003	375	3	2026-09-21 12:33:47	Delivered	Card	Amman	2	0
4004	371	3	2026-02-21 15:22:37	Delivered	Cash	Amman	2	5
4005	43	12	2026-07-09 17:16:24	Delivered	Card	Zarqa	2.5	10
4006	324	11	2026-08-28 08:30:08	Delivered	Card	Jerash	3.5	10
4007	210	7	2026-08-17 14:09:06	Delivered	Cash	Amman	2	0
4008	61	8	2026-05-01 15:24:38	Delivered	Transfer	Aqaba	5	0
4009	244	6	2025-12-09 22:40:17	Delivered	Card	Salt	3	0
4010	229	2	2026-04-08 16:18:06	Delivered	Card	Madaba	3	10
4011	61	11	2026-09-03 10:08:29	Delivered	Cash	Aqaba	5	0
4012	444	2	2026-02-22 14:05:52	Delivered	Transfer	Amman	2	0
4013	257	1	2025-11-06 20:16:54	Delivered	Transfer	Zarqa	2.5	15
4014	209	3	2026-01-06 13:47:26	Delivered	Card	Riyadh	15	0
4015	368	4	2026-08-13 22:48:52	Delivered	Cash	Irbid	3	0
4016	118	7	2026-07-30 21:04:56	Cancelled	Card	Amman	2	15
4017	61	5	2026-06-25 09:48:29	Delivered	Transfer	Aqaba	5	5
4018	321	5	2026-03-16 16:43:35	Delivered	Card	Amman	2	0
4019	416	6	2026-04-19 21:46:59	Delivered	Cash	Amman	2	10
4020	431	10	2026-08-02 19:17:02	Delivered	Transfer	Zarqa	2.5	0
4021	66	15	2026-07-27 22:30:05	Delivered	Card	Salt	3	0
4022	392	8	2026-03-07 15:49:34	Delivered	Transfer	Aqaba	5	0
4023	49	6	2025-12-21 20:45:31	Delivered	Cash	Amman	2	0
4024	115	3	2026-07-23 22:48:10	Cancelled	Card	Aqaba	5	20
4025	227	11	2026-06-13 10:13:27	Delivered	Card	Irbid	3	0
4026	181	2	2026-01-06 19:37:54	Delivered	Cash	Amman	2	0
4027	323	15	2026-10-11 09:07:34	Delivered	Card	Riyadh	15	10
4028	315	1	2026-09-27 18:44:47	Delivered	Transfer	Amman	2	0
4029	7	14	2026-09-14 14:20:30	Delivered	Card	Irbid	3	0
4030	117	1	2026-09-23 08:47:23	Delivered	Cash	Irbid	3	0
4031	227	3	2026-06-30 21:36:27	Delivered	Cash	Irbid	3	5
4032	269	5	2026-05-28 18:28:12	Delivered	Cash	Amman	2	0
4033	47	14	2026-07-24 19:19:29	Delivered	Card	Amman	2	0
4034	482	15	2026-01-14 22:58:54	Delivered	Card	Irbid	3	0
4035	56	1	2025-12-01 18:50:33	Delivered	Card	Amman	2	0
4036	30	1	2026-07-03 22:01:46	Delivered	Card	Amman	2	0
4037	404	5	2026-06-22 14:26:31	Delivered	Card	Amman	2	0
4038	496	4	2026-05-19 16:54:37	Delivered	Cash	Irbid	3	0
4039	354	1	2026-09-15 20:50:43	Delivered	Card	Irbid	3	5
4040	35	14	2026-06-07 15:05:56	Delivered	Cash	Zarqa	2.5	0
4041	68	13	2025-11-16 18:10:38	Delivered	Cash	Amman	2	15
4042	368	12	2025-11-22 14:31:58	Delivered	Card	Irbid	3	0
4043	113	15	2026-03-17 17:38:05	Delivered	Cash	Amman	2	15
4044	374	15	2025-11-19 12:27:53	Delivered	Card	Riyadh	15	0
4045	241	10	2026-03-04 21:10:18	Delivered	Cash	Amman	2	0
4046	116	15	2026-04-05 09:36:08	Delivered	Card	Amman	2	0
4047	231	7	2025-11-27 17:09:16	Delivered	Card	Amman	2	0
4048	344	9	2026-09-04 09:55:29	Delivered	Transfer	Madaba	3	0
4049	196	7	2026-02-20 12:09:35	Cancelled	Transfer	Amman	2	0
4050	418	11	2026-09-11 18:37:44	Delivered	Cash	Amman	2	10
4051	495	6	2026-02-01 17:46:56	Delivered	Card	Amman	2	0
4052	465	2	2026-05-25 16:59:25	Delivered	Transfer	Amman	2	0
4053	424	6	2026-10-13 18:43:48	Delivered	Cash	Amman	2	0
4054	88	14	2026-06-12 16:50:17	Delivered	Card	Amman	2	10
4055	291	11	2026-04-14 18:39:46	Cancelled	Card	Amman	2	10
4056	305	5	2025-12-27 09:26:34	Delivered	Card	Amman	2	0
4057	11	1	2026-02-15 15:56:05	Delivered	Cash	Jerash	3.5	0
4058	472	9	2026-08-24 08:41:20	Cancelled	Card	Amman	2	0
4059	398	3	2026-09-27 17:10:43	Delivered	Card	Zarqa	2.5	15
4060	460	2	2026-07-18 11:25:40	Delivered	Transfer	Zarqa	2.5	10
4061	48	1	2025-11-16 15:58:40	Delivered	Card	Amman	2	0
4062	231	8	2026-04-02 08:49:04	Delivered	Transfer	Amman	2	0
4063	98	1	2026-02-17 13:01:26	Delivered	Cash	Amman	2	5
4064	356	6	2026-07-04 22:53:18	Shipped	Transfer	Irbid	3	0
4065	445	7	2026-03-04 12:42:41	Delivered	Transfer	Amman	2	0
4066	318	1	2026-08-18 10:38:19	Delivered	Card	Amman	2	0
4067	6	15	2026-10-06 15:54:53	Shipped	Card	Salt	3	0
4068	440	5	2025-11-20 22:37:09	Delivered	Cash	Amman	2	0
4069	324	3	2026-07-17 10:39:21	Delivered	Card	Jerash	3.5	0
4070	82	5	2026-06-20 08:01:53	Delivered	Card	Amman	2	0
4071	391	14	2026-03-17 15:18:19	Delivered	Cash	Amman	2	0
4072	207	15	2025-11-08 17:31:24	Delivered	Card	Karak	4.5	0
4073	122	1	2026-08-08 17:06:17	Delivered	Transfer	Amman	2	0
4074	146	9	2025-12-06 08:06:15	Delivered	Card	Zarqa	2.5	0
4075	88	12	2026-03-25 16:44:40	Delivered	Transfer	Amman	2	0
4076	34	15	2025-11-27 12:41:05	Delivered	Transfer	Amman	2	0
4077	257	9	2025-11-08 13:46:02	Delivered	Transfer	Zarqa	2.5	0
4078	174	8	2026-03-16 19:51:04	Delivered	Cash	Madaba	3	0
4079	66	7	2026-10-17 20:11:27	Delivered	Card	Salt	3	0
4080	40	15	2026-07-04 12:44:35	Delivered	Card	Amman	2	0
4081	108	11	2026-02-02 16:18:18	Delivered	Card	Amman	2	0
4082	73	1	2025-12-06 16:29:58	Delivered	Transfer	Amman	2	0
4083	31	8	2026-08-05 21:06:18	Delivered	Card	Zarqa	2.5	0
4084	29	2	2026-09-14 20:35:11	Delivered	Card	Aqaba	5	5
4085	257	5	2026-01-13 22:42:37	Delivered	Card	Zarqa	2.5	0
4086	197	6	2026-06-19 21:41:42	Delivered	Card	Riyadh	15	15
4087	450	7	2026-07-24 08:59:27	Delivered	Card	Irbid	3	0
4088	106	15	2026-04-07 19:25:08	Delivered	Transfer	Amman	2	15
4089	204	6	2026-03-23 11:58:49	Delivered	Transfer	Karak	4.5	0
4090	331	6	2025-12-13 09:51:22	Delivered	Transfer	Amman	2	15
4091	117	8	2026-09-18 22:09:22	Delivered	Card	Irbid	3	15
4092	354	6	2026-09-25 17:18:09	Delivered	Transfer	Irbid	3	10
4093	239	2	2026-09-29 17:53:30	Delivered	Card	Jerash	3.5	0
4094	84	11	2026-02-25 15:41:29	Delivered	Card	Riyadh	15	5
4095	194	7	2026-09-15 10:48:30	Delivered	Transfer	Aqaba	5	0
4096	168	14	2025-12-30 20:38:52	Delivered	Cash	Amman	2	20
4097	113	11	2026-09-29 14:17:42	Delivered	Card	Amman	2	0
4098	368	11	2026-01-21 11:24:52	Delivered	Card	Irbid	3	0
4099	97	3	2026-10-14 20:18:12	New	Transfer	Irbid	3	0
4100	219	15	2026-03-27 15:56:56	Delivered	Transfer	Karak	4.5	0
4101	44	10	2026-10-09 11:14:53	Shipped	Card	Amman	2	20
4102	198	3	2025-11-27 12:18:54	Delivered	Cash	Amman	2	5
4103	187	7	2026-01-18 08:22:18	Delivered	Cash	Irbid	3	0
4104	162	12	2026-06-15 12:18:04	Delivered	Transfer	Amman	2	10
4105	383	8	2026-04-29 14:14:29	Delivered	Cash	Irbid	3	10
4106	347	10	2025-11-28 11:06:00	Delivered	Card	Amman	2	5
4107	4	7	2026-03-15 16:29:07	Cancelled	Cash	Jerash	3.5	15
4108	396	5	2025-11-30 08:02:39	Delivered	Card	Amman	2	0
4109	132	6	2026-09-15 16:53:41	Delivered	Transfer	Madaba	3	10
4110	20	11	2026-02-28 10:58:49	Delivered	Cash	Amman	2	0
4111	149	10	2026-10-14 10:29:44	Delivered	Card	Aqaba	5	0
4112	173	9	2026-06-14 15:46:49	Cancelled	Card	Amman	2	0
4113	406	6	2026-07-16 15:08:00	Cancelled	Card	Amman	2	0
4114	181	4	2026-06-13 20:37:48	Delivered	Card	Amman	2	5
4115	5	1	2026-02-20 20:46:56	Delivered	Cash	Amman	2	0
4116	170	11	2025-11-28 13:44:34	Delivered	Cash	Dubai	15	0
4117	130	15	2025-12-03 15:33:19	Delivered	Card	Salt	3	0
4118	88	6	2026-05-03 17:32:07	Cancelled	Card	Amman	2	0
4119	295	9	2026-10-18 12:48:45	Delivered	Card	Amman	2	0
4120	401	3	2026-08-22 19:47:32	Delivered	Cash	Riyadh	15	5
4121	147	2	2026-02-28 10:20:37	Delivered	Transfer	Zarqa	2.5	0
4122	247	13	2025-12-23 14:09:34	Delivered	Cash	Amman	2	0
4123	18	7	2026-05-14 21:40:22	Delivered	Card	Amman	2	0
4124	249	3	2026-09-13 22:52:20	Cancelled	Transfer	Irbid	3	0
4125	271	6	2026-08-14 18:25:10	Delivered	Transfer	Madaba	3	0
4126	111	13	2026-04-12 17:52:23	Cancelled	Card	Amman	2	10
4127	248	2	2026-02-13 14:14:57	Delivered	Transfer	Amman	2	0
4128	287	5	2025-11-09 17:06:34	Delivered	Card	Amman	2	0
4129	17	5	2026-08-22 21:15:59	Delivered	Transfer	Doha	16	0
4130	392	12	2025-12-20 20:53:43	Delivered	Card	Aqaba	5	10
4131	309	11	2026-05-14 22:20:04	Delivered	Card	Zarqa	2.5	15
4132	122	13	2025-12-24 20:42:13	Delivered	Transfer	Amman	2	0
4133	37	1	2026-07-05 16:45:28	Delivered	Transfer	Amman	2	0
4134	469	9	2026-09-15 09:29:43	Delivered	Card	Salt	3	20
4135	211	2	2025-11-27 15:39:24	Cancelled	Cash	Amman	2	10
4136	248	8	2026-01-21 21:05:32	Delivered	Card	Amman	2	0
4137	123	3	2026-10-09 12:38:30	Shipped	Cash	Amman	2	0
4138	441	10	2026-08-16 19:24:22	Delivered	Transfer	Karak	4.5	0
4139	30	3	2026-05-02 21:55:57	Delivered	Transfer	Amman	2	5
4140	101	4	2026-07-20 20:10:35	Delivered	Card	Amman	2	0
4141	490	1	2026-02-16 09:07:33	Delivered	Cash	Amman	2	5
4142	138	5	2026-09-10 15:01:30	Delivered	Card	Amman	2	0
4143	72	12	2026-08-23 22:06:37	Cancelled	Card	Amman	2	0
4144	144	15	2026-10-13 14:51:27	Delivered	Card	Amman	2	10
4145	403	15	2026-06-22 16:02:09	Cancelled	Cash	Amman	2	0
4146	120	7	2026-03-24 20:22:57	Cancelled	Transfer	Amman	2	0
4147	311	11	2026-09-15 15:31:23	Cancelled	Card	Amman	2	10
4148	245	15	2026-09-24 09:10:00	Delivered	Card	Karak	4.5	5
4149	311	8	2026-03-28 22:02:16	Delivered	Cash	Amman	2	0
4150	240	5	2026-07-12 08:38:01	Delivered	Card	Irbid	3	0
4151	445	12	2025-11-19 13:44:30	Delivered	Card	Amman	2	0
4152	172	14	2026-01-07 08:50:06	Delivered	Card	Amman	2	0
4153	171	3	2025-12-08 20:42:25	Delivered	Transfer	Amman	2	0
4154	232	14	2026-10-24 17:53:44	Shipped	Card	Karak	4.5	15
4155	219	5	2026-01-19 15:31:45	Delivered	Card	Karak	4.5	0
4156	161	15	2026-09-30 12:34:04	Delivered	Card	Irbid	3	0
4157	153	15	2026-08-10 20:28:06	Delivered	Transfer	Salt	3	15
4158	464	7	2026-05-10 12:03:46	Delivered	Cash	Salt	3	5
4159	263	7	2026-01-30 09:09:48	Delivered	Card	Amman	2	0
4160	407	12	2025-12-13 10:53:09	Delivered	Transfer	Amman	2	0
4161	468	2	2026-01-20 16:21:32	Delivered	Card	Irbid	3	0
4162	311	8	2025-12-31 21:34:05	Delivered	Cash	Amman	2	15
4163	90	7	2026-07-04 21:49:20	Delivered	Cash	Amman	2	5
4164	72	8	2026-08-17 22:42:49	Delivered	Transfer	Amman	2	10
4165	330	6	2025-11-26 08:14:39	Delivered	Cash	Zarqa	2.5	0
4166	19	15	2025-12-07 22:31:34	Delivered	Card	Amman	2	0
4167	280	3	2026-07-27 08:40:05	Delivered	Cash	Madaba	3	0
4168	415	7	2026-06-20 17:25:42	Cancelled	Transfer	Aqaba	5	15
4169	24	12	2026-03-17 21:35:43	Delivered	Card	Salt	3	0
4170	128	7	2026-10-22 12:54:22	New	Transfer	Amman	2	5
4171	85	3	2026-10-14 15:15:06	Delivered	Transfer	Amman	2	0
4172	274	15	2026-07-23 21:25:13	Delivered	Card	Zarqa	2.5	0
4173	492	13	2026-08-11 22:44:15	Delivered	Cash	Karak	4.5	0
4174	7	3	2025-11-09 13:05:50	Delivered	Transfer	Irbid	3	10
4175	250	15	2026-07-15 12:00:45	Delivered	Card	Amman	2	0
4176	147	2	2025-12-30 09:49:46	Delivered	Card	Zarqa	2.5	0
4177	13	7	2025-12-19 18:43:39	Delivered	Card	Irbid	3	15
4178	315	15	2026-10-15 14:15:51	Shipped	Card	Amman	2	0
4179	194	2	2026-09-09 09:20:20	Delivered	Card	Aqaba	5	0
4180	51	15	2026-09-21 10:17:50	Delivered	Cash	Amman	2	0
4181	231	14	2026-01-15 15:09:32	Delivered	Card	Amman	2	0
4182	270	12	2026-10-17 09:32:33	Delivered	Cash	Zarqa	2.5	10
4183	486	14	2025-12-27 08:33:10	Delivered	Card	Amman	2	0
4184	326	13	2025-12-28 19:23:36	Cancelled	Cash	Aqaba	5	0
4185	283	1	2026-10-07 15:26:58	Shipped	Card	Madaba	3	0
4186	232	12	2026-10-17 18:15:24	Delivered	Card	Karak	4.5	5
4187	453	11	2026-02-19 14:11:36	Delivered	Cash	Riyadh	15	0
4188	289	14	2026-05-22 10:20:34	Delivered	Cash	Aqaba	5	5
4189	211	10	2025-11-08 17:29:45	Delivered	Transfer	Amman	2	5
4190	486	5	2026-02-27 16:56:32	Delivered	Card	Amman	2	0
4191	223	14	2026-03-21 11:04:45	Delivered	Card	Amman	2	10
4192	315	2	2026-03-16 11:14:19	Cancelled	Transfer	Amman	2	0
4193	436	13	2025-11-12 13:11:25	Cancelled	Card	Irbid	3	0
4194	184	13	2026-09-08 10:30:25	Delivered	Card	Amman	2	0
4195	69	14	2025-12-31 13:30:19	Delivered	Card	Amman	2	0
4196	312	6	2025-11-03 13:17:11	Delivered	Card	Irbid	3	0
4197	26	3	2026-09-18 19:16:36	Delivered	Card	Dubai	15	0
4198	98	5	2026-07-20 15:22:04	Delivered	Card	Amman	2	0
4199	30	9	2026-05-03 09:31:14	Delivered	Cash	Amman	2	0
4200	122	5	2026-05-28 08:44:00	Cancelled	Transfer	Amman	2	0
4201	354	15	2026-08-15 08:56:26	Delivered	Cash	Irbid	3	0
4202	50	7	2026-03-12 21:07:26	Delivered	Cash	Amman	2	10
4203	325	2	2026-09-13 21:57:58	Delivered	Card	Karak	4.5	0
4204	406	7	2026-07-12 14:58:33	Cancelled	Card	Amman	2	15
4205	108	7	2026-02-01 13:45:51	Delivered	Transfer	Amman	2	0
4206	307	14	2026-02-19 11:36:19	Delivered	Card	Amman	2	0
4207	263	9	2025-12-16 16:54:59	Delivered	Transfer	Amman	2	0
4208	303	7	2026-07-08 09:02:58	Delivered	Cash	Amman	2	10
4209	206	12	2025-11-22 08:14:39	Delivered	Card	Zarqa	2.5	0
4210	305	5	2026-03-22 22:32:37	Delivered	Card	Amman	2	0
4211	35	13	2026-06-02 19:18:42	Delivered	Cash	Zarqa	2.5	0
4212	416	2	2026-09-04 09:16:37	Delivered	Card	Amman	2	0
4213	483	10	2026-10-09 12:53:28	Delivered	Card	Amman	2	0
4214	222	14	2026-02-10 15:44:08	Delivered	Cash	Jerash	3.5	0
4215	186	8	2026-06-28 09:31:09	Delivered	Card	Madaba	3	5
4216	318	9	2026-06-08 14:18:16	Delivered	Cash	Amman	2	0
4217	78	15	2026-09-09 20:19:12	Delivered	Card	Amman	2	0
4218	22	12	2026-06-07 16:03:59	Delivered	Cash	Salt	3	15
4219	108	13	2026-01-30 10:33:32	Delivered	Card	Amman	2	0
4220	308	15	2026-10-20 16:01:12	Shipped	Card	Zarqa	2.5	0
4221	455	15	2026-09-08 12:08:42	Delivered	Transfer	Aqaba	5	0
4222	481	10	2026-08-25 12:32:55	Cancelled	Transfer	Amman	2	0
4223	335	11	2025-12-14 20:43:25	Delivered	Card	Amman	2	0
4224	498	1	2025-11-19 13:19:19	Delivered	Cash	Aqaba	5	0
4225	68	8	2025-11-03 11:10:54	Cancelled	Card	Amman	2	0
4226	297	3	2025-12-24 19:52:23	Delivered	Transfer	Amman	2	0
4227	356	10	2026-07-30 11:10:03	Cancelled	Transfer	Irbid	3	0
4228	21	11	2026-06-10 16:17:49	Delivered	Card	Dubai	15	0
4229	238	9	2026-06-15 14:30:14	Delivered	Card	Amman	2	0
4230	260	15	2026-01-20 08:58:59	Delivered	Card	Irbid	3	0
4231	173	15	2026-09-20 14:53:43	Delivered	Card	Amman	2	0
4232	115	5	2026-05-29 18:39:01	Delivered	Cash	Aqaba	5	5
4233	93	5	2026-06-18 20:56:45	Delivered	Card	Amman	2	0
4234	425	7	2026-07-10 20:15:39	Delivered	Cash	Amman	2	5
4235	108	6	2026-01-07 10:13:42	Delivered	Cash	Amman	2	0
4236	160	2	2025-11-20 14:30:45	Delivered	Cash	Amman	2	10
4237	318	7	2026-03-07 16:52:16	Delivered	Card	Amman	2	5
4238	288	7	2025-12-11 09:22:40	Delivered	Card	Salt	3	0
4239	358	1	2025-12-03 18:12:40	Delivered	Card	Amman	2	0
4240	5	15	2025-12-11 10:45:46	Delivered	Cash	Amman	2	5
4241	475	14	2026-04-10 15:50:37	Delivered	Card	Aqaba	5	0
4242	96	2	2026-07-29 17:36:26	Delivered	Card	Amman	2	0
4243	145	3	2026-08-15 16:05:57	Delivered	Cash	Zarqa	2.5	0
4244	486	10	2025-12-04 16:11:53	Delivered	Transfer	Amman	2	0
4245	58	11	2026-09-03 14:22:54	Delivered	Cash	Zarqa	2.5	0
4246	50	5	2026-08-27 21:39:13	Delivered	Cash	Amman	2	10
4247	271	8	2026-10-16 14:46:19	Shipped	Cash	Madaba	3	0
4248	190	3	2026-04-04 11:42:20	Delivered	Card	Aqaba	5	5
4249	455	10	2025-12-04 21:08:46	Delivered	Cash	Aqaba	5	10
4250	446	2	2026-07-13 11:33:15	Delivered	Cash	Irbid	3	0
4251	283	14	2026-04-16 10:30:27	Delivered	Card	Madaba	3	0
4252	205	14	2026-06-17 08:24:16	Cancelled	Card	Madaba	3	5
4253	192	1	2025-11-15 12:24:12	Delivered	Card	Salt	3	15
4254	309	11	2026-06-28 11:13:22	Delivered	Card	Zarqa	2.5	0
4255	194	8	2026-07-28 21:19:15	Delivered	Cash	Aqaba	5	0
4256	84	5	2026-08-06 20:25:24	Delivered	Card	Riyadh	15	0
4257	82	14	2026-07-15 13:07:09	Delivered	Card	Amman	2	0
4258	245	6	2026-09-28 13:26:45	Delivered	Card	Karak	4.5	10
4259	210	11	2026-07-18 17:19:07	Delivered	Cash	Amman	2	5
4260	13	8	2025-11-18 19:19:46	Delivered	Card	Irbid	3	15
4261	458	5	2026-05-02 15:50:09	Delivered	Cash	Irbid	3	0
4262	171	2	2026-07-14 08:23:02	Delivered	Cash	Amman	2	20
4263	200	7	2026-06-14 13:53:23	Delivered	Transfer	Amman	2	5
4264	186	6	2026-06-09 09:05:25	Delivered	Cash	Madaba	3	0
4265	285	12	2025-12-12 18:37:12	Cancelled	Card	Amman	2	0
4266	485	6	2026-02-19 21:49:20	Delivered	Transfer	Amman	2	0
4267	115	5	2026-02-17 09:11:13	Cancelled	Card	Aqaba	5	0
4268	478	1	2026-03-17 08:45:21	Delivered	Card	Aqaba	5	0
4269	428	12	2026-10-09 22:08:14	Shipped	Card	Zarqa	2.5	5
4270	171	10	2026-03-10 14:22:13	Delivered	Card	Amman	2	0
4271	442	8	2025-12-20 14:31:18	Delivered	Card	Salt	3	0
4272	374	15	2025-11-01 18:53:30	Delivered	Card	Riyadh	15	0
4273	477	3	2026-04-16 18:51:44	Delivered	Cash	Aqaba	5	0
4274	493	4	2026-08-03 11:03:38	Cancelled	Transfer	Karak	4.5	0
4275	355	12	2025-11-10 10:59:27	Delivered	Cash	Madaba	3	0
4276	59	7	2025-12-24 21:53:18	Delivered	Cash	Aqaba	5	0
4277	217	5	2026-04-12 08:20:12	Delivered	Card	Amman	2	0
4278	391	10	2026-09-05 12:26:29	Delivered	Card	Amman	2	10
4279	338	6	2025-12-05 11:23:18	Shipped	Card	Zarqa	2.5	0
4280	441	11	2026-07-07 08:58:43	Delivered	Card	Karak	4.5	5
4281	87	5	2026-05-05 13:35:51	Cancelled	Cash	Zarqa	2.5	0
4282	289	1	2025-11-21 22:54:06	Delivered	Card	Aqaba	5	0
4283	214	14	2026-08-04 15:53:55	Delivered	Transfer	Amman	2	0
4284	335	5	2026-01-27 22:25:42	Delivered	Transfer	Amman	2	0
4285	243	5	2026-09-16 12:54:41	Delivered	Cash	Irbid	3	0
4286	383	3	2026-09-22 10:08:25	Delivered	Cash	Irbid	3	0
4287	190	15	2026-08-28 16:09:15	Delivered	Cash	Aqaba	5	0
4288	143	13	2026-07-28 14:12:18	Delivered	Card	Amman	2	0
4289	493	1	2026-05-20 08:25:23	Cancelled	Cash	Karak	4.5	0
4290	234	1	2025-12-27 21:09:05	Delivered	Cash	Karak	4.5	0
4291	313	3	2025-12-14 10:32:37	Delivered	Card	Amman	2	0
4292	415	6	2026-06-09 12:27:50	Delivered	Cash	Aqaba	5	0
4293	111	15	2025-11-18 22:46:48	Delivered	Card	Amman	2	5
4294	217	2	2025-11-11 18:29:01	Delivered	Transfer	Amman	2	0
4295	22	14	2026-06-18 14:10:05	Delivered	Card	Salt	3	15
4296	58	14	2026-09-24 09:29:04	Delivered	Cash	Zarqa	2.5	0
4297	316	1	2026-06-15 19:07:46	Delivered	Card	Zarqa	2.5	0
4298	456	14	2026-05-07 21:05:00	Delivered	Cash	Amman	2	0
4299	100	2	2026-07-21 18:30:19	Delivered	Card	Jerash	3.5	20
4300	371	15	2025-12-17 14:53:43	Delivered	Card	Amman	2	0
4301	186	10	2026-07-21 16:04:31	Delivered	Transfer	Madaba	3	0
4302	365	11	2026-01-26 16:18:51	Delivered	Cash	Amman	2	5
4303	147	15	2026-06-28 18:20:58	Cancelled	Cash	Zarqa	2.5	0
4304	445	12	2026-02-07 19:17:18	Delivered	Cash	Amman	2	0
4305	358	15	2025-11-27 19:47:05	Delivered	Cash	Amman	2	15
4306	103	5	2026-09-18 14:30:56	Delivered	Cash	Dubai	15	10
4307	223	1	2026-05-08 11:50:31	Delivered	Card	Amman	2	20
4308	396	3	2025-12-20 18:59:37	Cancelled	Transfer	Amman	2	0
4309	145	4	2026-05-11 11:48:50	Delivered	Cash	Zarqa	2.5	0
4310	24	3	2025-12-23 19:10:51	Delivered	Cash	Salt	3	15
4311	433	1	2026-05-26 08:35:34	Cancelled	Card	Amman	2	0
4312	144	1	2026-05-31 18:56:51	Delivered	Card	Amman	2	0
4313	354	5	2026-09-17 18:46:21	Delivered	Transfer	Irbid	3	0
4314	183	5	2025-11-25 17:18:05	Delivered	Card	Madaba	3	0
4315	497	5	2026-06-10 18:21:14	Delivered	Card	Amman	2	5
4316	313	3	2026-05-26 10:40:19	Delivered	Cash	Amman	2	0
4317	353	3	2026-08-29 19:50:39	Delivered	Transfer	Doha	16	0
4318	92	15	2026-09-26 15:49:17	Delivered	Cash	Amman	2	0
4319	382	15	2026-06-16 09:51:44	Delivered	Card	Amman	2	0
4320	391	1	2025-11-12 08:34:31	Delivered	Transfer	Amman	2	0
4321	489	14	2025-12-03 16:20:29	Delivered	Cash	Amman	2	0
4322	476	1	2025-12-16 18:40:24	Shipped	Card	Irbid	3	0
4323	1	15	2026-06-25 21:11:33	Delivered	Card	Zarqa	2.5	0
4324	75	2	2026-09-02 16:11:52	Cancelled	Transfer	Amman	2	5
4325	262	6	2026-06-17 19:18:07	Cancelled	Transfer	Aqaba	5	0
4326	62	14	2026-07-07 20:22:21	Delivered	Cash	Dubai	15	10
4327	465	3	2026-04-26 09:34:36	Cancelled	Transfer	Amman	2	20
4328	337	5	2026-08-15 15:06:38	Delivered	Card	Riyadh	15	0
4329	47	13	2026-06-20 21:46:08	Delivered	Cash	Amman	2	0
4330	115	9	2026-08-16 22:30:16	Delivered	Transfer	Aqaba	5	0
4331	422	1	2026-10-15 19:48:27	Delivered	Card	Amman	2	5
4332	354	13	2026-08-27 15:38:51	Delivered	Transfer	Irbid	3	0
4333	352	1	2025-12-07 15:01:28	Delivered	Transfer	Amman	2	0
4334	316	11	2026-06-09 20:24:33	Delivered	Cash	Zarqa	2.5	0
4335	395	14	2026-08-05 08:41:03	Delivered	Transfer	Aqaba	5	0
4336	444	3	2026-09-07 08:51:19	Delivered	Card	Amman	2	0
4337	312	11	2025-11-18 17:43:18	Delivered	Transfer	Irbid	3	0
4338	322	4	2026-07-24 08:30:52	Delivered	Card	Amman	2	0
4339	229	7	2026-07-04 09:40:26	Cancelled	Cash	Madaba	3	5
4340	324	6	2026-06-30 19:06:31	Delivered	Transfer	Jerash	3.5	0
4341	51	6	2026-05-07 08:58:05	Delivered	Card	Amman	2	0
4342	160	2	2025-12-17 10:33:40	Delivered	Cash	Amman	2	10
4343	47	13	2025-12-15 17:47:45	Delivered	Cash	Amman	2	0
4344	305	9	2026-01-19 19:24:22	Delivered	Transfer	Amman	2	0
4345	322	11	2026-09-13 08:32:15	Delivered	Transfer	Amman	2	0
4346	136	1	2026-02-21 12:37:39	Delivered	Cash	Amman	2	0
4347	16	14	2026-01-01 20:32:44	Delivered	Card	Zarqa	2.5	10
4348	181	6	2025-11-23 16:48:04	Delivered	Card	Amman	2	0
4349	102	11	2026-09-19 10:14:24	Delivered	Cash	Zarqa	2.5	0
4350	180	6	2026-05-04 15:14:57	Delivered	Card	Irbid	3	0
4351	55	12	2026-01-31 21:04:33	Delivered	Transfer	Amman	2	0
4352	429	6	2026-07-02 09:29:40	Delivered	Cash	Irbid	3	0
4353	372	5	2025-11-20 08:57:09	Delivered	Card	Salt	3	0
4354	233	12	2025-12-13 09:13:32	Delivered	Cash	Irbid	3	0
4355	219	12	2026-05-14 16:32:48	Delivered	Card	Karak	4.5	0
4356	204	3	2026-01-29 19:35:01	Delivered	Card	Karak	4.5	0
4357	115	5	2026-03-29 08:51:21	Delivered	Transfer	Aqaba	5	10
4358	426	3	2026-07-31 11:54:53	Delivered	Cash	Amman	2	0
4359	77	8	2025-12-05 09:23:54	Delivered	Card	Karak	4.5	0
4360	282	11	2026-01-27 22:13:37	Delivered	Transfer	Amman	2	0
4361	468	15	2026-05-26 18:42:08	Delivered	Cash	Irbid	3	0
4362	246	14	2025-12-30 19:27:47	Delivered	Cash	Amman	2	0
4363	456	6	2026-05-22 15:19:24	Delivered	Card	Amman	2	0
4364	161	6	2026-09-05 13:42:00	Cancelled	Card	Irbid	3	0
4365	449	14	2026-10-18 22:54:23	Delivered	Cash	Amman	2	0
4366	13	9	2026-04-15 14:44:52	Cancelled	Card	Irbid	3	0
4367	259	14	2026-09-06 21:05:05	Delivered	Card	Amman	2	0
4368	449	11	2026-06-05 19:52:41	Cancelled	Cash	Amman	2	20
4369	408	5	2026-06-26 09:42:28	Delivered	Card	Amman	2	0
4370	115	8	2026-03-10 15:15:03	Delivered	Cash	Aqaba	5	0
4371	348	7	2026-06-09 09:48:07	Delivered	Transfer	Amman	2	0
4372	257	6	2026-01-15 09:50:18	Delivered	Transfer	Zarqa	2.5	0
4373	49	11	2025-12-29 10:58:36	Cancelled	Cash	Amman	2	0
4374	224	12	2026-07-22 17:12:04	Delivered	Card	Madaba	3	10
4375	29	15	2025-12-11 10:20:36	Delivered	Card	Aqaba	5	0
4376	243	8	2026-06-11 21:27:06	Delivered	Transfer	Irbid	3	0
4377	494	11	2026-07-13 18:15:25	Cancelled	Card	Amman	2	5
4378	454	3	2026-04-06 16:43:03	Delivered	Transfer	Riyadh	15	0
4379	88	15	2026-07-07 20:17:28	Delivered	Card	Amman	2	0
4380	134	3	2026-03-13 21:50:14	Delivered	Cash	Amman	2	0
4381	184	15	2026-04-03 18:34:09	Delivered	Card	Amman	2	0
4382	96	15	2026-10-22 12:07:33	Delivered	Cash	Amman	2	0
4383	8	15	2026-07-28 14:08:17	Delivered	Card	Salt	3	15
4384	287	10	2026-06-29 16:20:09	Delivered	Cash	Amman	2	0
4385	342	2	2026-01-20 10:22:31	Cancelled	Card	Aqaba	5	0
4386	328	5	2025-11-22 09:52:54	Delivered	Card	Irbid	3	0
4387	89	7	2026-02-15 09:37:21	Delivered	Transfer	Irbid	3	0
4388	183	15	2026-03-09 16:38:25	Delivered	Card	Madaba	3	0
4389	42	1	2026-10-02 18:59:09	Cancelled	Transfer	Riyadh	15	5
4390	430	14	2026-08-31 10:03:55	Delivered	Card	Madaba	3	0
4391	342	12	2026-05-09 18:03:06	Delivered	Card	Aqaba	5	5
4392	425	10	2026-04-11 21:26:57	Shipped	Cash	Amman	2	0
4393	466	3	2026-05-28 10:36:01	Delivered	Transfer	Amman	2	0
4394	465	3	2025-12-07 13:42:51	Delivered	Transfer	Amman	2	0
4395	12	5	2026-08-31 17:43:01	Delivered	Card	Amman	2	0
4396	321	14	2026-02-19 15:09:01	Delivered	Cash	Amman	2	0
4397	359	9	2026-01-11 22:56:11	Delivered	Card	Amman	2	0
4398	295	7	2026-05-29 08:26:34	Cancelled	Card	Amman	2	0
4399	199	15	2025-12-25 15:16:31	Delivered	Card	Zarqa	2.5	0
4400	312	10	2026-03-25 16:42:50	Delivered	Transfer	Irbid	3	5
4401	350	6	2025-12-23 10:28:50	Cancelled	Card	Amman	2	0
4402	441	14	2026-07-15 17:42:50	Shipped	Card	Karak	4.5	0
4403	492	15	2026-09-21 15:57:24	Delivered	Cash	Karak	4.5	0
4404	219	12	2026-09-07 21:28:45	Delivered	Card	Karak	4.5	0
4405	266	11	2025-11-25 18:05:35	Delivered	Card	Irbid	3	0
4406	425	15	2026-07-05 20:43:10	Delivered	Transfer	Amman	2	0
4407	338	9	2026-02-07 13:56:25	Delivered	Card	Zarqa	2.5	0
4408	40	8	2026-06-25 22:38:00	Cancelled	Transfer	Amman	2	0
4409	110	3	2026-03-30 21:49:07	Cancelled	Cash	Amman	2	0
4410	284	7	2026-01-11 16:55:39	Cancelled	Card	Karak	4.5	0
4411	25	3	2025-11-07 11:10:34	Delivered	Cash	Riyadh	15	0
4412	240	13	2026-07-12 14:02:01	Delivered	Card	Irbid	3	0
4413	433	14	2026-02-15 17:45:38	Delivered	Transfer	Amman	2	10
4414	378	8	2026-09-15 16:10:52	Delivered	Transfer	Amman	2	10
4415	241	6	2026-04-11 12:03:04	Delivered	Cash	Amman	2	0
4416	484	8	2026-09-09 12:33:15	Delivered	Transfer	Amman	2	20
4417	144	2	2026-07-22 18:35:47	Delivered	Transfer	Amman	2	0
4418	340	15	2025-12-05 15:13:43	Delivered	Card	Amman	2	0
4419	384	8	2026-03-24 08:22:10	Delivered	Card	Salt	3	5
4420	53	13	2026-10-21 15:44:24	New	Transfer	Amman	2	0
4421	436	2	2026-06-22 16:50:26	Delivered	Card	Irbid	3	15
4422	380	11	2026-05-19 10:58:03	Delivered	Cash	Irbid	3	0
4423	445	8	2025-12-28 22:00:12	Delivered	Transfer	Amman	2	0
4424	395	15	2026-09-03 12:55:08	Delivered	Transfer	Aqaba	5	0
4425	475	12	2025-12-16 12:10:11	Cancelled	Cash	Aqaba	5	0
4426	233	4	2026-10-23 16:58:30	New	Card	Irbid	3	0
4427	456	5	2026-05-27 15:11:38	Delivered	Cash	Amman	2	0
4428	477	1	2026-10-23 18:03:38	New	Card	Aqaba	5	0
4429	49	1	2026-09-12 13:02:32	Delivered	Cash	Amman	2	0
4430	342	12	2026-09-24 13:05:42	Delivered	Cash	Aqaba	5	5
4431	287	3	2025-12-25 18:57:21	Delivered	Card	Amman	2	0
4432	88	3	2025-12-29 11:54:25	Delivered	Cash	Amman	2	0
4433	95	5	2026-09-30 11:09:37	Delivered	Card	Madaba	3	5
4434	189	14	2026-10-18 16:11:28	Delivered	Transfer	Amman	2	0
4435	277	15	2026-04-03 15:26:02	Delivered	Card	Zarqa	2.5	10
4436	276	3	2026-06-21 18:25:44	Delivered	Transfer	Amman	2	0
4437	368	14	2026-02-19 19:12:04	Delivered	Cash	Irbid	3	5
4438	468	12	2026-09-19 09:57:37	Cancelled	Transfer	Irbid	3	0
4439	330	15	2026-05-21 09:36:43	Cancelled	Cash	Zarqa	2.5	0
4440	469	15	2026-09-03 21:48:47	Cancelled	Cash	Salt	3	0
4441	432	2	2026-02-08 18:07:22	Delivered	Transfer	Zarqa	2.5	0
4442	49	1	2026-08-27 10:58:44	Delivered	Cash	Amman	2	5
4443	290	14	2026-10-10 19:03:25	Shipped	Transfer	Amman	2	0
4444	335	3	2026-09-08 14:51:40	Delivered	Card	Amman	2	10
4445	33	5	2026-01-24 08:53:15	Delivered	Card	Riyadh	15	0
4446	266	1	2026-07-21 16:46:50	Delivered	Cash	Irbid	3	0
4447	240	8	2026-03-05 21:09:40	Delivered	Card	Irbid	3	0
4448	160	12	2026-01-09 12:44:09	Delivered	Card	Amman	2	0
4449	439	11	2026-05-09 12:43:17	Cancelled	Cash	Dubai	15	0
4450	449	12	2026-10-24 09:28:06	New	Cash	Amman	2	10
4451	383	6	2026-06-02 12:35:03	Delivered	Card	Irbid	3	10
4452	116	15	2026-10-12 18:21:26	Cancelled	Card	Amman	2	0
4453	487	5	2026-08-18 08:44:16	Delivered	Card	Zarqa	2.5	5
4454	300	12	2026-06-08 09:18:36	Cancelled	Transfer	Irbid	3	0
4455	366	2	2026-07-30 09:53:12	Delivered	Card	Amman	2	0
4456	98	3	2025-11-08 12:19:26	Delivered	Transfer	Amman	2	0
4457	424	3	2026-07-01 18:25:32	Delivered	Card	Amman	2	0
4458	43	5	2026-09-08 21:26:10	Delivered	Cash	Zarqa	2.5	0
4459	67	8	2026-07-14 11:13:42	Cancelled	Card	Amman	2	5
4460	244	13	2026-01-06 10:21:16	Delivered	Card	Salt	3	0
4461	168	11	2025-11-24 20:14:49	Delivered	Card	Amman	2	0
4462	323	10	2026-09-14 08:30:00	Cancelled	Transfer	Riyadh	15	0
4463	4	8	2026-08-25 11:05:33	Delivered	Cash	Jerash	3.5	0
4464	342	14	2026-08-22 17:07:32	Delivered	Cash	Aqaba	5	0
4465	32	1	2026-07-09 12:57:53	Delivered	Card	Salt	3	0
4466	469	8	2026-09-02 14:35:01	Delivered	Transfer	Salt	3	20
4467	278	15	2026-10-22 17:28:43	Shipped	Card	Aqaba	5	10
4468	487	9	2026-07-22 17:53:18	Delivered	Cash	Zarqa	2.5	5
4469	316	2	2025-11-16 12:21:14	Delivered	Cash	Zarqa	2.5	5
4470	444	15	2026-09-16 11:25:42	Cancelled	Cash	Amman	2	0
4471	319	11	2026-10-07 10:07:01	Delivered	Card	Amman	2	0
4472	158	3	2025-12-22 10:06:37	Delivered	Card	Karak	4.5	0
4473	217	6	2026-01-04 08:19:16	Delivered	Card	Amman	2	10
4474	283	10	2026-10-24 19:39:17	Delivered	Card	Madaba	3	5
4475	499	4	2026-08-22 20:45:41	Delivered	Card	Amman	2	0
4476	289	6	2026-07-10 12:37:57	Cancelled	Card	Aqaba	5	0
4477	235	2	2026-08-21 14:46:35	Delivered	Card	Amman	2	0
4478	243	7	2026-08-25 13:54:19	Delivered	Cash	Irbid	3	5
4479	304	3	2026-07-11 08:11:37	Delivered	Card	Amman	2	15
4480	246	6	2025-12-05 17:29:10	Delivered	Cash	Amman	2	0
4481	271	6	2026-08-28 08:41:03	Delivered	Cash	Madaba	3	0
4482	472	14	2025-11-05 20:29:59	Delivered	Card	Amman	2	20
4483	486	2	2026-06-15 13:11:35	Delivered	Transfer	Amman	2	0
4484	13	7	2026-01-31 20:37:50	Delivered	Cash	Irbid	3	0
4485	179	3	2026-05-28 16:52:32	Delivered	Card	Amman	2	0
4486	306	2	2025-12-10 20:34:00	Delivered	Card	Irbid	3	0
4487	72	11	2026-08-23 15:06:17	Delivered	Transfer	Amman	2	0
4488	475	5	2026-08-26 22:55:29	Delivered	Cash	Aqaba	5	0
4489	274	7	2026-08-27 16:56:12	Delivered	Card	Zarqa	2.5	0
4490	342	10	2026-05-09 17:23:48	Delivered	Card	Aqaba	5	0
4491	227	1	2026-09-19 16:43:46	Cancelled	Cash	Irbid	3	0
4492	132	14	2026-06-13 09:00:26	Delivered	Card	Madaba	3	0
4493	37	14	2026-10-11 08:39:18	New	Card	Amman	2	0
4494	421	5	2026-02-23 16:04:24	Delivered	Cash	Aqaba	5	0
4495	83	4	2025-12-13 13:34:45	Delivered	Card	Zarqa	2.5	5
4496	262	15	2025-11-07 16:21:28	Delivered	Card	Aqaba	5	0
4497	163	15	2026-07-10 16:55:42	Delivered	Cash	Amman	2	10
4498	396	6	2025-11-27 08:25:44	Delivered	Transfer	Amman	2	0
4499	297	15	2026-01-15 13:19:05	Delivered	Card	Amman	2	0
4500	108	1	2026-07-29 22:51:41	Delivered	Card	Amman	2	0
4501	432	8	2025-12-03 21:06:48	Delivered	Transfer	Zarqa	2.5	0
4502	205	9	2026-09-17 10:10:21	Cancelled	Cash	Madaba	3	0
4503	49	2	2025-12-11 15:01:36	Delivered	Cash	Amman	2	5
4504	52	12	2025-11-13 21:18:46	Cancelled	Card	Karak	4.5	5
4505	47	7	2026-09-05 18:49:58	Delivered	Cash	Amman	2	0
4506	56	5	2026-04-11 13:52:23	Shipped	Cash	Amman	2	0
4507	339	12	2026-03-29 10:38:28	Delivered	Cash	Amman	2	0
4508	149	14	2026-02-04 12:33:47	Delivered	Cash	Aqaba	5	0
4509	383	14	2026-01-20 14:05:36	Delivered	Cash	Irbid	3	0
4510	49	2	2026-10-06 19:07:50	Delivered	Transfer	Amman	2	0
4511	130	15	2026-07-21 13:43:15	Cancelled	Transfer	Salt	3	0
4512	459	14	2026-06-03 12:48:15	Delivered	Cash	Irbid	3	5
4513	185	1	2026-09-12 10:41:04	Delivered	Card	Irbid	3	0
4514	46	5	2026-08-12 08:16:01	Delivered	Transfer	Amman	2	0
4515	22	14	2025-12-04 19:16:47	Delivered	Card	Salt	3	0
4516	479	14	2026-01-19 09:32:38	Delivered	Card	Jerash	3.5	0
4517	303	7	2025-11-13 08:20:58	Delivered	Card	Amman	2	5
4518	352	4	2025-11-29 18:14:59	Delivered	Card	Amman	2	0
4519	62	5	2026-06-24 17:45:18	Delivered	Card	Dubai	15	0
4520	296	8	2026-06-12 14:36:06	Delivered	Transfer	Amman	2	15
4521	437	10	2026-05-13 08:11:20	Delivered	Transfer	Karak	4.5	0
4522	354	6	2026-10-08 20:55:04	Delivered	Cash	Irbid	3	0
4523	398	5	2026-02-28 16:22:23	Delivered	Card	Zarqa	2.5	5
4524	46	12	2026-05-03 08:40:58	Delivered	Cash	Amman	2	15
4525	390	15	2025-11-06 15:35:11	Delivered	Card	Madaba	3	20
4526	434	15	2026-09-25 18:02:18	Cancelled	Transfer	Amman	2	0
4527	432	7	2025-11-28 11:00:59	Delivered	Cash	Zarqa	2.5	10
4528	464	13	2025-11-13 11:02:09	Delivered	Cash	Salt	3	0
4529	122	13	2026-03-09 18:29:35	Delivered	Card	Amman	2	10
4530	184	6	2026-10-11 08:28:45	New	Card	Amman	2	0
4531	407	6	2026-08-15 16:20:18	Delivered	Card	Amman	2	10
4532	213	15	2026-09-08 11:25:03	Delivered	Transfer	Jerash	3.5	10
4533	316	9	2025-12-17 17:21:39	Delivered	Cash	Zarqa	2.5	5
4534	492	3	2026-05-16 13:41:06	Delivered	Card	Karak	4.5	0
4535	163	10	2026-09-18 12:46:56	Delivered	Transfer	Amman	2	0
4536	361	5	2026-07-17 09:22:32	Delivered	Cash	Amman	2	0
4537	296	14	2025-12-12 16:00:57	Delivered	Card	Amman	2	15
4538	492	15	2026-09-19 22:33:28	Delivered	Transfer	Karak	4.5	0
4539	97	7	2026-10-16 09:15:25	Delivered	Transfer	Irbid	3	5
4540	354	5	2026-08-03 17:33:20	Delivered	Cash	Irbid	3	0
4541	285	3	2026-01-31 21:29:58	Delivered	Cash	Amman	2	10
4542	138	1	2026-02-22 20:02:10	Delivered	Card	Amman	2	0
4543	411	2	2026-10-22 10:32:19	New	Card	Irbid	3	0
4544	404	10	2026-02-28 14:23:22	Cancelled	Transfer	Amman	2	0
4545	352	7	2025-11-03 10:58:08	Cancelled	Card	Amman	2	0
4546	116	4	2026-10-23 17:32:36	New	Cash	Amman	2	0
4547	13	10	2026-04-24 22:13:58	Delivered	Cash	Irbid	3	0
4548	160	7	2026-10-17 22:20:00	Shipped	Cash	Amman	2	0
4549	434	14	2026-01-22 13:15:32	Delivered	Cash	Amman	2	0
4550	46	12	2026-03-20 14:45:48	Delivered	Cash	Amman	2	5
4551	440	14	2026-06-28 11:49:05	Delivered	Transfer	Amman	2	15
4552	106	12	2026-08-05 12:13:33	Cancelled	Card	Amman	2	10
4553	150	7	2026-05-07 21:29:15	Delivered	Cash	Irbid	3	0
4554	491	12	2026-07-21 14:01:23	Delivered	Card	Amman	2	0
4555	439	1	2026-06-12 16:55:10	Delivered	Card	Dubai	15	0
4556	170	15	2026-06-02 20:09:24	Cancelled	Card	Dubai	15	0
4557	468	1	2025-11-05 15:13:11	Delivered	Cash	Irbid	3	0
4558	246	4	2026-07-11 10:17:49	Delivered	Card	Amman	2	0
4559	145	6	2026-08-13 10:47:50	Cancelled	Card	Zarqa	2.5	0
4560	342	8	2026-08-23 09:15:59	Delivered	Card	Aqaba	5	5
4561	49	5	2026-08-16 09:32:11	Delivered	Transfer	Amman	2	10
4562	339	8	2026-04-20 14:00:11	Delivered	Card	Amman	2	0
4563	231	13	2026-02-24 16:53:21	Delivered	Card	Amman	2	0
4564	177	5	2026-05-28 12:05:21	Delivered	Card	Amman	2	0
4565	469	14	2026-09-17 14:44:20	Delivered	Card	Salt	3	0
4566	213	15	2026-09-03 13:29:17	Delivered	Cash	Jerash	3.5	5
4567	8	4	2026-01-19 15:46:32	Delivered	Cash	Salt	3	5
4568	141	2	2026-06-12 16:50:04	Delivered	Card	Irbid	3	10
4569	64	14	2026-09-04 22:46:59	Cancelled	Card	Amman	2	0
4570	369	11	2026-07-12 17:40:48	Delivered	Cash	Irbid	3	0
4571	391	11	2026-06-29 20:57:36	Delivered	Card	Amman	2	20
4572	119	15	2026-04-26 21:16:26	Delivered	Card	Dubai	15	0
4573	188	14	2026-08-06 21:00:57	Delivered	Card	Amman	2	0
4574	240	12	2026-06-03 16:18:39	Delivered	Cash	Irbid	3	5
4575	223	3	2025-12-05 19:19:08	Delivered	Card	Amman	2	5
4576	179	2	2025-12-27 21:53:42	Shipped	Card	Amman	2	0
4577	24	6	2025-12-16 13:32:59	Delivered	Cash	Salt	3	0
4578	247	11	2026-04-22 09:31:08	Delivered	Card	Amman	2	0
4579	57	1	2026-06-14 22:25:59	Delivered	Card	Amman	2	0
4580	417	12	2026-01-15 12:02:55	Delivered	Card	Amman	2	10
4581	229	1	2026-01-19 20:42:46	Delivered	Card	Madaba	3	5
4582	38	12	2026-08-05 15:32:52	Delivered	Card	Zarqa	2.5	0
4583	250	7	2026-09-09 14:56:11	Cancelled	Cash	Amman	2	5
4584	84	8	2025-11-16 12:50:07	Delivered	Card	Riyadh	15	0
4585	396	5	2025-11-17 10:28:03	Cancelled	Cash	Amman	2	0
4586	263	1	2026-09-20 19:47:30	Delivered	Cash	Amman	2	0
4587	148	2	2026-06-19 18:06:59	Delivered	Card	Amman	2	0
4588	202	14	2026-09-20 19:05:30	Cancelled	Card	Amman	2	0
4589	399	11	2025-11-28 20:45:07	Delivered	Cash	Amman	2	5
4590	372	2	2025-11-29 16:57:12	Delivered	Card	Salt	3	0
4591	290	3	2025-11-29 19:00:55	Delivered	Card	Amman	2	10
4592	44	3	2026-10-01 20:30:09	Delivered	Transfer	Amman	2	0
4593	396	12	2026-09-18 12:57:38	Delivered	Card	Amman	2	0
4594	370	1	2026-06-10 11:07:57	Delivered	Cash	Madaba	3	0
4595	346	1	2026-03-23 10:39:51	Delivered	Card	Aqaba	5	0
4596	388	8	2025-12-13 08:08:31	Delivered	Cash	Aqaba	5	15
4597	452	3	2026-07-10 16:49:29	Delivered	Card	Amman	2	0
4598	478	2	2026-06-11 13:14:39	Delivered	Transfer	Aqaba	5	15
4599	342	1	2025-11-18 09:34:46	Shipped	Card	Aqaba	5	5
4600	223	3	2026-07-23 13:03:02	Cancelled	Card	Amman	2	0
4601	448	8	2026-02-27 17:25:01	Delivered	Card	Salt	3	0
4602	247	13	2026-06-29 19:18:53	Delivered	Card	Amman	2	0
4603	341	15	2025-12-02 21:25:00	Delivered	Transfer	Amman	2	10
4604	392	8	2025-11-28 21:36:48	Delivered	Cash	Aqaba	5	0
4605	104	1	2025-12-21 09:40:56	Delivered	Cash	Irbid	3	0
4606	80	6	2026-03-07 18:13:59	Delivered	Card	Riyadh	15	0
4607	411	14	2026-02-02 09:17:49	Delivered	Card	Irbid	3	0
4608	40	5	2026-06-07 10:30:59	Delivered	Card	Amman	2	10
4609	57	2	2026-02-14 20:07:57	Delivered	Card	Amman	2	0
4610	148	2	2026-10-20 13:28:47	New	Cash	Amman	2	0
4611	57	2	2026-03-21 22:09:46	Delivered	Cash	Amman	2	0
4612	57	2	2026-09-03 19:26:30	Delivered	Cash	Amman	2	0
4613	208	14	2026-02-01 10:40:29	Delivered	Card	Salt	3	0
4614	391	7	2026-09-10 09:43:48	Cancelled	Cash	Amman	2	10
4615	228	5	2026-07-16 15:54:42	Delivered	Card	Aqaba	5	0
4616	390	11	2026-05-16 18:12:56	Cancelled	Card	Madaba	3	10
4617	90	12	2025-12-28 12:51:32	Delivered	Card	Amman	2	0
4618	360	3	2026-02-01 13:36:54	Delivered	Cash	Amman	2	0
4619	215	14	2026-03-09 19:21:47	Delivered	Card	Aqaba	5	0
4620	217	5	2026-10-06 10:35:59	Delivered	Card	Amman	2	0
4621	355	7	2026-01-16 22:41:09	Delivered	Card	Madaba	3	0
4622	292	14	2026-05-18 17:50:45	Shipped	Card	Irbid	3	0
4623	71	11	2026-07-22 22:54:06	Delivered	Card	Amman	2	0
4624	134	6	2026-07-16 17:54:46	Delivered	Card	Amman	2	10
4625	222	15	2026-06-02 21:27:14	Delivered	Cash	Jerash	3.5	0
4626	434	5	2026-01-14 17:21:24	Delivered	Cash	Amman	2	0
4627	102	6	2026-10-14 08:55:00	Delivered	Cash	Zarqa	2.5	10
4628	144	6	2026-01-29 22:01:21	Delivered	Card	Amman	2	15
4629	303	2	2026-10-02 10:50:45	Delivered	Card	Amman	2	10
4630	200	7	2026-02-08 11:38:44	Delivered	Transfer	Amman	2	0
4631	35	12	2026-08-27 16:32:51	Delivered	Cash	Zarqa	2.5	0
4632	86	11	2026-03-17 22:38:43	Delivered	Transfer	Amman	2	0
4633	472	8	2025-12-17 17:53:56	Delivered	Card	Amman	2	10
4634	385	1	2026-10-17 13:52:39	New	Card	Irbid	3	10
4635	350	9	2025-12-04 09:57:00	Delivered	Card	Amman	2	15
4636	436	14	2026-10-21 17:23:49	Cancelled	Card	Irbid	3	0
4637	362	13	2025-12-26 10:48:50	Delivered	Card	Riyadh	15	0
4638	146	2	2025-11-30 16:25:31	Delivered	Card	Zarqa	2.5	15
4639	261	2	2025-11-24 22:59:30	Delivered	Cash	Irbid	3	0
4640	142	15	2026-09-29 16:50:42	Delivered	Cash	Zarqa	2.5	0
4641	246	9	2025-11-24 15:02:16	Shipped	Card	Amman	2	0
4642	174	2	2026-07-31 12:56:12	Cancelled	Cash	Madaba	3	0
4643	88	11	2026-02-17 14:00:26	Shipped	Cash	Amman	2	5
4644	468	6	2026-04-18 19:37:23	Delivered	Card	Irbid	3	0
4645	465	7	2026-08-29 19:11:23	Cancelled	Cash	Amman	2	0
4646	91	14	2026-07-20 12:15:40	Delivered	Card	Amman	2	0
4647	108	2	2026-01-28 13:30:44	Delivered	Cash	Amman	2	0
4648	147	14	2025-11-16 17:21:12	Cancelled	Cash	Zarqa	2.5	0
4649	53	14	2026-01-14 19:04:13	Delivered	Card	Amman	2	0
4650	118	6	2026-05-01 11:16:26	Delivered	Transfer	Amman	2	0
4651	84	6	2025-11-03 16:53:18	Delivered	Card	Riyadh	15	0
4652	481	15	2025-12-08 18:58:41	Delivered	Cash	Amman	2	0
4653	79	14	2026-10-17 16:45:52	Delivered	Card	Amman	2	0
4654	64	14	2025-11-21 21:56:37	Delivered	Cash	Amman	2	15
4655	445	1	2025-12-13 16:54:31	Shipped	Card	Amman	2	15
4656	476	1	2026-08-12 16:55:34	Delivered	Cash	Irbid	3	0
4657	308	1	2026-04-30 10:07:40	Cancelled	Cash	Zarqa	2.5	20
4658	443	8	2026-01-23 09:28:28	Delivered	Cash	Amman	2	0
4659	483	12	2026-10-11 11:28:53	New	Card	Amman	2	0
4660	219	2	2026-02-18 12:07:44	Delivered	Card	Karak	4.5	0
4661	243	15	2026-09-28 20:02:03	Delivered	Card	Irbid	3	0
4662	393	10	2025-11-19 21:56:38	Delivered	Card	Irbid	3	0
4663	317	10	2026-02-10 14:09:43	Delivered	Cash	Salt	3	10
4664	475	6	2026-04-09 18:34:33	Delivered	Card	Aqaba	5	0
4665	5	3	2026-07-12 22:25:47	Delivered	Card	Amman	2	0
4666	401	14	2026-10-18 22:44:33	Delivered	Transfer	Riyadh	15	0
4667	236	5	2026-08-18 08:34:38	Delivered	Card	Irbid	3	0
4668	132	12	2026-02-12 10:13:52	Cancelled	Cash	Madaba	3	0
4669	360	2	2026-03-24 22:47:15	Delivered	Cash	Amman	2	0
4670	181	11	2025-12-29 14:20:45	Delivered	Card	Amman	2	0
4671	92	12	2026-09-15 12:04:30	Cancelled	Card	Amman	2	5
4672	83	6	2025-11-26 13:56:32	Delivered	Card	Zarqa	2.5	0
4673	455	3	2026-06-11 15:07:59	Cancelled	Cash	Aqaba	5	0
4674	75	15	2026-09-25 13:05:13	Cancelled	Cash	Amman	2	0
4675	388	3	2026-03-06 21:11:30	Delivered	Card	Aqaba	5	0
4676	204	3	2026-07-25 12:34:38	Delivered	Cash	Karak	4.5	20
4677	249	2	2026-04-15 10:51:00	Delivered	Cash	Irbid	3	0
4678	13	4	2026-05-14 15:19:31	Delivered	Card	Irbid	3	0
4679	231	12	2026-05-01 21:46:27	Delivered	Transfer	Amman	2	0
4680	371	7	2026-02-06 17:47:08	Delivered	Card	Amman	2	0
4681	208	15	2026-02-24 21:40:11	Delivered	Cash	Salt	3	0
4682	171	12	2026-04-13 13:50:53	Delivered	Card	Amman	2	0
4683	37	15	2025-12-27 20:34:56	Delivered	Card	Amman	2	0
4684	303	8	2026-07-26 19:39:35	Delivered	Card	Amman	2	5
4685	240	7	2026-06-08 17:47:37	Delivered	Card	Irbid	3	0
4686	420	14	2026-10-23 10:01:42	New	Cash	Irbid	3	20
4687	316	5	2026-07-01 18:31:24	Delivered	Cash	Zarqa	2.5	0
4688	69	12	2026-09-06 20:44:02	Delivered	Card	Amman	2	0
4689	35	11	2026-10-06 14:48:45	New	Card	Zarqa	2.5	0
4690	222	11	2026-06-02 09:29:56	Delivered	Transfer	Jerash	3.5	0
4691	35	9	2026-02-25 09:02:59	Delivered	Card	Zarqa	2.5	0
4692	120	4	2026-02-21 20:40:46	Cancelled	Card	Amman	2	0
4693	182	7	2026-08-16 11:52:32	Delivered	Card	Amman	2	0
4694	35	15	2026-07-04 21:19:43	Delivered	Transfer	Zarqa	2.5	10
4695	340	10	2026-02-10 09:28:16	Delivered	Transfer	Amman	2	0
4696	487	12	2026-10-08 20:12:10	Delivered	Card	Zarqa	2.5	0
4697	82	6	2025-11-28 13:04:51	Delivered	Transfer	Amman	2	0
4698	376	15	2026-09-07 11:44:51	Cancelled	Cash	Amman	2	0
4699	58	15	2026-09-14 12:08:32	Delivered	Cash	Zarqa	2.5	5
4700	358	1	2025-11-16 13:13:42	Delivered	Transfer	Amman	2	20
4701	320	2	2026-03-21 12:17:03	Cancelled	Card	Irbid	3	0
4702	263	3	2025-11-24 19:11:55	Delivered	Card	Amman	2	10
4703	350	13	2026-07-24 20:12:12	Delivered	Cash	Amman	2	0
4704	435	11	2026-02-19 20:03:05	Delivered	Transfer	Amman	2	5
4705	497	11	2025-11-28 08:29:33	Delivered	Transfer	Amman	2	0
4706	26	15	2026-05-10 10:50:54	Delivered	Card	Dubai	15	0
4707	166	9	2026-06-25 11:29:02	Cancelled	Card	Doha	16	0
4708	430	10	2025-11-14 13:36:36	Delivered	Card	Madaba	3	0
4709	9	15	2026-05-03 21:06:27	Shipped	Cash	Amman	2	0
4710	49	2	2026-08-21 14:19:47	Delivered	Transfer	Amman	2	0
4711	499	14	2026-02-01 11:26:50	Delivered	Card	Amman	2	0
4712	327	3	2026-09-25 22:28:40	Delivered	Transfer	Amman	2	0
4713	391	7	2026-09-14 22:00:15	Delivered	Card	Amman	2	0
4714	451	12	2026-08-08 13:56:33	Cancelled	Card	Irbid	3	0
4715	349	3	2026-10-02 15:18:56	Delivered	Transfer	Zarqa	2.5	0
4716	48	13	2026-03-10 11:36:39	Delivered	Cash	Amman	2	5
4717	455	12	2026-07-09 14:18:32	Delivered	Cash	Aqaba	5	0
4718	30	1	2026-09-28 22:14:58	Delivered	Cash	Amman	2	15
4719	95	6	2026-06-19 11:53:36	Delivered	Card	Madaba	3	5
4720	435	13	2025-11-22 19:50:54	Delivered	Transfer	Amman	2	5
4721	64	11	2025-11-22 09:12:55	Delivered	Cash	Amman	2	15
4722	350	2	2025-12-19 19:10:52	Delivered	Transfer	Amman	2	15
4723	139	14	2026-05-04 17:37:45	Delivered	Card	Amman	2	0
4724	145	4	2026-04-03 15:23:26	Delivered	Card	Zarqa	2.5	0
4725	52	12	2025-12-17 20:29:46	Delivered	Card	Karak	4.5	0
4726	228	7	2026-08-29 21:28:35	Delivered	Card	Aqaba	5	15
4727	365	11	2026-07-07 11:29:20	Delivered	Transfer	Amman	2	0
4728	278	2	2026-06-10 16:34:30	Delivered	Card	Aqaba	5	10
4729	69	9	2026-06-28 08:27:47	Delivered	Card	Amman	2	0
4730	69	15	2026-06-11 15:21:15	Delivered	Transfer	Amman	2	0
4731	432	3	2026-07-08 13:49:37	Delivered	Card	Zarqa	2.5	10
4732	170	5	2026-06-19 11:00:32	Delivered	Transfer	Dubai	15	0
4733	492	12	2026-07-06 19:35:32	Cancelled	Transfer	Karak	4.5	20
4734	47	6	2026-08-25 19:23:28	Delivered	Card	Amman	2	0
4735	342	13	2026-07-27 19:25:50	Delivered	Transfer	Aqaba	5	15
4736	434	10	2026-06-22 09:29:29	Delivered	Cash	Amman	2	0
4737	432	15	2026-04-11 21:48:27	Delivered	Transfer	Zarqa	2.5	0
4738	11	1	2026-09-27 16:09:51	Delivered	Card	Jerash	3.5	0
4739	67	7	2025-11-01 18:34:07	Cancelled	Card	Amman	2	0
4740	322	8	2026-08-07 13:33:18	Delivered	Cash	Amman	2	0
4741	476	1	2026-01-23 20:32:57	Delivered	Cash	Irbid	3	0
4742	108	5	2026-10-07 13:23:08	Shipped	Cash	Amman	2	0
4743	273	13	2026-10-18 20:03:35	Shipped	Card	Zarqa	2.5	0
4744	60	6	2025-12-16 15:22:41	Delivered	Transfer	Amman	2	0
4745	354	11	2026-08-02 12:40:02	Delivered	Transfer	Irbid	3	0
4746	280	5	2026-08-01 09:06:33	Delivered	Cash	Madaba	3	0
4747	369	9	2025-11-05 16:53:28	Delivered	Card	Irbid	3	0
4748	126	11	2026-05-03 13:05:25	Delivered	Transfer	Irbid	3	0
4749	469	10	2026-07-24 13:28:14	Delivered	Cash	Salt	3	5
4750	270	5	2026-09-22 12:23:01	Cancelled	Cash	Zarqa	2.5	0
4751	486	15	2026-10-20 21:59:35	Cancelled	Card	Amman	2	0
4752	62	10	2026-01-18 10:19:32	Delivered	Transfer	Dubai	15	0
4753	417	1	2026-05-12 22:55:17	Delivered	Card	Amman	2	0
4754	35	14	2026-01-17 18:06:04	Delivered	Card	Zarqa	2.5	5
4755	22	11	2026-04-28 14:17:07	Cancelled	Card	Salt	3	0
4756	306	14	2025-11-20 17:09:11	Delivered	Transfer	Irbid	3	0
4757	318	4	2026-10-16 13:58:10	Delivered	Card	Amman	2	0
4758	53	14	2026-01-07 14:40:50	Delivered	Cash	Amman	2	0
4759	271	5	2026-08-25 11:56:17	Delivered	Transfer	Madaba	3	15
4760	14	10	2026-02-04 21:33:11	Delivered	Cash	Dubai	15	0
4761	5	9	2026-10-19 21:44:20	Shipped	Card	Amman	2	0
4762	500	3	2026-06-05 14:30:57	Delivered	Transfer	Amman	2	0
4763	19	5	2025-12-21 15:02:19	Delivered	Cash	Amman	2	10
4764	430	15	2026-03-10 11:28:19	Delivered	Cash	Madaba	3	0
4765	223	9	2026-03-25 13:39:38	Delivered	Card	Amman	2	0
4766	240	15	2026-04-15 08:33:15	Shipped	Cash	Irbid	3	0
4767	395	12	2026-09-06 18:43:30	Delivered	Transfer	Aqaba	5	0
4768	376	3	2026-09-11 10:15:49	Delivered	Transfer	Amman	2	5
4769	94	5	2026-01-01 21:19:37	Delivered	Card	Zarqa	2.5	0
4770	492	11	2026-09-09 18:54:56	Delivered	Card	Karak	4.5	0
4771	227	12	2026-09-23 09:14:14	Cancelled	Card	Irbid	3	0
4772	144	6	2026-06-17 18:05:21	Delivered	Card	Amman	2	0
4773	485	1	2026-05-14 21:49:24	Delivered	Card	Amman	2	0
4774	202	1	2026-05-07 20:53:21	Delivered	Card	Amman	2	10
4775	128	11	2026-07-23 13:37:27	Delivered	Card	Amman	2	10
4776	49	13	2025-12-10 15:55:07	Cancelled	Transfer	Amman	2	0
4777	348	14	2026-09-26 09:11:07	Delivered	Card	Amman	2	0
4778	134	3	2026-06-07 09:36:08	Delivered	Card	Amman	2	0
4779	487	1	2026-10-05 16:14:54	Shipped	Transfer	Zarqa	2.5	0
4780	473	2	2026-05-03 18:42:27	Cancelled	Card	Amman	2	10
4781	481	1	2026-01-04 21:01:12	Delivered	Card	Amman	2	0
4782	96	6	2026-05-15 15:40:23	Delivered	Card	Amman	2	0
4783	327	5	2026-06-05 18:19:18	Delivered	Card	Amman	2	0
4784	144	15	2026-01-08 20:22:33	Delivered	Card	Amman	2	10
4785	184	5	2026-04-27 21:28:14	Delivered	Card	Amman	2	0
4786	288	12	2025-12-01 21:04:59	Delivered	Cash	Salt	3	0
4787	340	11	2025-11-03 22:32:29	Delivered	Card	Amman	2	0
4788	22	9	2026-09-26 15:12:44	Delivered	Card	Salt	3	0
4789	116	8	2026-05-02 12:51:37	Delivered	Cash	Amman	2	0
4790	418	6	2026-05-20 17:57:32	Delivered	Card	Amman	2	0
4791	107	7	2026-03-07 16:54:27	Delivered	Cash	Amman	2	10
4792	179	3	2026-05-12 18:27:30	Delivered	Card	Amman	2	0
4793	127	1	2025-12-27 13:14:41	Delivered	Cash	Amman	2	0
4794	413	5	2026-07-12 15:12:23	Delivered	Transfer	Karak	4.5	0
4795	178	15	2026-10-02 12:50:49	Delivered	Transfer	Irbid	3	10
4796	296	12	2026-05-14 10:33:36	Delivered	Transfer	Amman	2	10
4797	429	12	2026-04-14 18:12:56	Delivered	Transfer	Irbid	3	0
4798	185	15	2026-08-15 08:50:51	Delivered	Cash	Irbid	3	0
4799	61	14	2026-04-15 13:30:39	Delivered	Transfer	Aqaba	5	0
4800	216	11	2026-06-16 17:18:16	Delivered	Card	Riyadh	15	5
4801	22	14	2026-04-28 09:35:48	Delivered	Card	Salt	3	5
4802	489	12	2025-12-13 16:25:25	Delivered	Cash	Amman	2	0
4803	234	10	2026-07-22 17:00:40	Delivered	Cash	Karak	4.5	0
4804	446	7	2026-06-01 15:05:24	Delivered	Transfer	Irbid	3	0
4805	421	11	2026-07-22 19:07:09	Delivered	Cash	Aqaba	5	10
4806	303	11	2026-03-20 20:24:30	Delivered	Card	Amman	2	0
4807	285	6	2026-06-19 20:15:12	Delivered	Card	Amman	2	0
4808	323	2	2025-12-01 16:27:16	Delivered	Card	Riyadh	15	0
4809	95	7	2026-09-19 12:34:31	Cancelled	Cash	Madaba	3	0
4810	33	2	2026-02-23 15:40:43	Delivered	Transfer	Riyadh	15	0
4811	487	15	2026-10-13 09:43:24	Delivered	Card	Zarqa	2.5	0
4812	92	2	2025-11-03 22:58:38	Delivered	Card	Amman	2	20
4813	124	10	2026-07-29 12:15:03	Delivered	Card	Aqaba	5	0
4814	294	13	2026-09-01 15:32:39	Delivered	Card	Amman	2	0
4815	364	7	2026-04-22 19:46:23	Delivered	Transfer	Irbid	3	0
4816	335	14	2026-07-31 12:31:04	Delivered	Card	Amman	2	0
4817	407	12	2026-07-21 11:36:36	Delivered	Cash	Amman	2	0
4818	342	9	2026-03-14 17:10:58	Cancelled	Transfer	Aqaba	5	10
4819	465	3	2025-12-18 11:32:15	Delivered	Cash	Amman	2	0
4820	300	3	2026-06-21 18:59:19	Delivered	Card	Irbid	3	0
4821	217	6	2026-07-06 18:13:44	Delivered	Card	Amman	2	10
4822	336	10	2026-10-05 21:34:09	Delivered	Card	Amman	2	0
4823	236	15	2026-06-15 19:48:49	Cancelled	Cash	Irbid	3	0
4824	296	14	2026-08-28 10:06:56	Delivered	Cash	Amman	2	0
4825	324	1	2026-09-11 09:58:09	Delivered	Transfer	Jerash	3.5	0
4826	22	12	2026-08-02 09:14:12	Delivered	Card	Salt	3	0
4827	163	1	2026-08-16 19:42:22	Cancelled	Transfer	Amman	2	5
4828	360	11	2026-07-29 15:16:46	Delivered	Card	Amman	2	20
4829	38	12	2025-12-12 17:01:56	Delivered	Card	Zarqa	2.5	0
4830	2	3	2026-01-08 09:00:38	Delivered	Card	Madaba	3	5
4831	471	4	2025-12-08 13:08:35	Delivered	Card	Amman	2	0
4832	211	3	2026-09-12 11:46:03	Delivered	Transfer	Amman	2	0
4833	47	12	2026-04-23 14:22:10	Delivered	Card	Amman	2	0
4834	287	11	2026-06-03 17:08:38	Delivered	Card	Amman	2	0
4835	209	8	2026-01-08 19:47:20	Delivered	Card	Riyadh	15	0
4836	109	6	2026-01-11 16:49:01	Delivered	Card	Amman	2	0
4837	468	3	2025-12-24 19:05:07	Delivered	Card	Irbid	3	10
4838	161	11	2026-09-08 15:19:48	Delivered	Transfer	Irbid	3	0
4839	263	13	2026-07-22 21:22:47	Delivered	Cash	Amman	2	0
4840	104	2	2026-03-25 11:45:58	Delivered	Cash	Irbid	3	5
4841	455	10	2026-08-19 21:40:05	Delivered	Cash	Aqaba	5	0
4842	230	7	2026-06-11 15:57:32	Delivered	Cash	Riyadh	15	0
4843	492	3	2026-06-12 10:47:27	Delivered	Card	Karak	4.5	15
4844	142	6	2026-06-12 10:24:26	Delivered	Card	Zarqa	2.5	0
4845	321	2	2026-03-02 19:51:16	Delivered	Card	Amman	2	0
4846	271	10	2026-08-17 18:24:24	Delivered	Card	Madaba	3	15
4847	355	15	2026-02-24 16:17:04	Delivered	Card	Madaba	3	0
4848	302	11	2026-08-09 14:03:13	Delivered	Transfer	Salt	3	0
4849	239	3	2026-08-10 17:18:57	Delivered	Card	Jerash	3.5	0
4850	499	12	2026-02-03 18:41:52	Delivered	Card	Amman	2	5
4851	128	13	2026-09-29 20:38:39	Delivered	Cash	Amman	2	0
4852	409	1	2025-12-25 09:19:33	Cancelled	Card	Karak	4.5	10
4853	360	13	2026-07-27 12:30:42	Delivered	Card	Amman	2	0
4854	40	13	2026-08-20 10:45:39	Delivered	Card	Amman	2	5
4855	165	6	2026-02-23 15:43:29	Delivered	Card	Amman	2	0
4856	235	14	2026-07-01 19:37:00	Delivered	Cash	Amman	2	5
4857	49	4	2026-10-12 16:16:21	Delivered	Transfer	Amman	2	0
4858	496	11	2026-03-29 16:41:24	Delivered	Card	Irbid	3	0
4859	490	2	2026-01-31 10:03:53	Shipped	Cash	Amman	2	10
4860	65	7	2026-04-07 22:39:16	Delivered	Transfer	Irbid	3	0
4861	64	6	2026-09-25 17:18:17	Shipped	Card	Amman	2	0
4862	304	14	2026-09-12 16:16:27	Delivered	Card	Amman	2	0
4863	242	2	2026-09-18 10:30:14	Delivered	Card	Aqaba	5	0
4864	286	3	2026-02-25 13:42:40	Delivered	Transfer	Amman	2	0
4865	304	11	2026-08-13 14:32:34	Cancelled	Cash	Amman	2	0
4866	365	10	2026-06-21 12:40:35	Shipped	Card	Amman	2	20
4867	171	9	2026-09-26 21:25:30	Delivered	Card	Amman	2	0
4868	88	2	2025-11-16 08:08:38	Delivered	Cash	Amman	2	15
4869	165	13	2026-07-08 21:48:56	Delivered	Card	Amman	2	15
4870	36	7	2026-09-21 22:39:40	Delivered	Cash	Amman	2	0
4871	49	6	2025-12-21 15:24:58	Delivered	Cash	Amman	2	0
4872	296	12	2026-08-06 18:38:54	Delivered	Card	Amman	2	0
4873	1	13	2026-05-30 19:17:08	Delivered	Cash	Zarqa	2.5	0
4874	100	14	2026-08-21 20:43:37	Delivered	Transfer	Jerash	3.5	15
4875	351	10	2026-03-24 09:00:30	Delivered	Card	Zarqa	2.5	0
4876	151	6	2025-11-27 13:45:16	Delivered	Transfer	Zarqa	2.5	0
4877	145	15	2026-05-14 16:39:42	Delivered	Cash	Zarqa	2.5	0
4878	353	15	2026-10-01 14:07:28	Delivered	Card	Doha	16	10
4879	69	15	2026-06-13 13:51:01	Delivered	Card	Amman	2	0
4880	27	4	2025-11-08 15:37:04	Delivered	Card	Aqaba	5	0
4881	83	11	2026-02-15 19:57:49	Delivered	Cash	Zarqa	2.5	0
4882	22	6	2025-11-19 20:58:24	Delivered	Cash	Salt	3	0
4883	60	1	2026-07-28 21:05:19	Delivered	Card	Amman	2	0
4884	415	15	2026-08-29 19:09:08	Delivered	Card	Aqaba	5	0
4885	7	7	2026-10-17 17:57:10	Shipped	Card	Irbid	3	10
4886	407	15	2026-06-30 10:36:51	Delivered	Cash	Amman	2	0
4887	382	7	2026-04-14 08:56:25	Delivered	Transfer	Amman	2	20
4888	231	15	2025-11-14 18:07:07	Delivered	Transfer	Amman	2	10
4889	206	12	2026-09-20 16:13:11	Delivered	Card	Zarqa	2.5	0
4890	154	8	2025-11-27 11:12:10	Delivered	Transfer	Madaba	3	0
4891	369	15	2026-07-10 15:53:55	Delivered	Card	Irbid	3	0
4892	49	13	2026-09-10 10:57:25	Delivered	Cash	Amman	2	5
4893	414	15	2026-07-28 11:13:40	Delivered	Card	Riyadh	15	5
4894	44	14	2026-10-19 16:47:33	Delivered	Card	Amman	2	0
4895	485	3	2026-01-12 16:04:32	Delivered	Cash	Amman	2	0
4896	478	6	2025-12-12 19:57:55	Delivered	Transfer	Aqaba	5	0
4897	241	10	2026-08-07 13:09:15	Delivered	Transfer	Amman	2	0
4898	473	12	2026-02-08 08:21:33	Delivered	Card	Amman	2	5
4899	417	14	2025-12-28 15:11:01	Delivered	Card	Amman	2	0
4900	231	5	2026-10-22 16:57:02	New	Card	Amman	2	5
4901	97	12	2026-09-30 13:25:21	Delivered	Card	Irbid	3	0
4902	119	13	2026-09-13 09:04:02	Delivered	Card	Dubai	15	0
4903	205	12	2026-08-08 16:23:54	Delivered	Transfer	Madaba	3	15
4904	113	2	2026-01-05 11:11:56	Cancelled	Card	Amman	2	5
4905	476	5	2025-12-14 15:57:05	Delivered	Cash	Irbid	3	5
4906	247	2	2026-05-30 18:02:23	Delivered	Card	Amman	2	0
4907	410	14	2026-10-14 14:29:55	Delivered	Card	Amman	2	0
4908	137	10	2026-08-10 16:58:45	Delivered	Card	Aqaba	5	0
4909	38	12	2025-12-11 16:30:13	Delivered	Card	Zarqa	2.5	20
4910	437	14	2026-04-08 20:11:02	Delivered	Cash	Karak	4.5	10
4911	366	7	2026-10-10 11:46:48	Shipped	Transfer	Amman	2	10
4912	469	6	2026-10-23 16:39:00	New	Card	Salt	3	0
4913	227	3	2025-11-19 22:29:46	Delivered	Card	Irbid	3	0
4914	146	5	2026-01-18 10:15:04	Delivered	Cash	Zarqa	2.5	0
4915	168	11	2026-02-02 11:35:04	Delivered	Transfer	Amman	2	0
4916	348	3	2026-05-22 22:22:20	Cancelled	Cash	Amman	2	0
4917	219	5	2026-04-02 09:32:14	Delivered	Transfer	Karak	4.5	0
4918	429	11	2026-07-03 17:47:45	Cancelled	Card	Irbid	3	0
4919	354	13	2026-08-20 22:53:49	Cancelled	Card	Irbid	3	0
4920	94	5	2026-08-17 10:17:39	Delivered	Cash	Zarqa	2.5	10
4921	93	1	2026-06-12 13:23:40	Delivered	Card	Amman	2	0
4922	353	3	2026-10-10 17:30:28	Delivered	Card	Doha	16	0
4923	247	5	2026-03-23 21:05:35	Delivered	Transfer	Amman	2	15
4924	83	11	2026-01-18 08:38:10	Cancelled	Card	Zarqa	2.5	0
4925	34	11	2026-07-27 16:20:34	Delivered	Cash	Amman	2	0
4926	212	15	2026-04-08 17:46:57	Delivered	Card	Zarqa	2.5	0
4927	47	2	2025-12-17 21:54:09	Delivered	Cash	Amman	2	0
4928	173	15	2026-01-12 11:21:31	Delivered	Cash	Amman	2	0
4929	16	5	2025-12-16 20:28:11	Delivered	Cash	Zarqa	2.5	0
4930	33	7	2026-06-30 16:14:49	Delivered	Cash	Riyadh	15	15
4931	329	8	2026-09-24 15:00:49	Cancelled	Card	Amman	2	0
4932	395	7	2026-07-28 20:27:58	Delivered	Transfer	Aqaba	5	5
4933	419	3	2026-01-29 12:47:50	Delivered	Card	Amman	2	0
4934	220	2	2026-09-27 20:00:37	Delivered	Card	Irbid	3	0
4935	293	15	2026-02-11 11:46:31	Delivered	Card	Aqaba	5	0
4936	445	13	2026-08-01 14:51:18	Delivered	Card	Amman	2	0
4937	126	1	2026-03-26 10:43:00	Delivered	Transfer	Irbid	3	0
4938	108	7	2026-04-16 16:48:08	Delivered	Cash	Amman	2	20
4939	221	1	2025-11-21 18:30:52	Delivered	Cash	Riyadh	15	10
4940	466	1	2026-08-25 15:37:06	Delivered	Card	Amman	2	0
4941	174	15	2026-06-30 17:06:17	Delivered	Card	Madaba	3	0
4942	270	7	2026-09-23 17:20:08	Delivered	Cash	Zarqa	2.5	5
4943	417	6	2025-12-13 13:50:59	Delivered	Cash	Amman	2	20
4944	299	1	2026-10-02 14:15:20	Delivered	Card	Amman	2	0
4945	345	12	2026-08-13 19:12:34	Delivered	Cash	Amman	2	0
4946	493	15	2026-03-20 14:25:31	Delivered	Cash	Karak	4.5	0
4947	145	12	2026-02-08 21:07:58	Delivered	Transfer	Zarqa	2.5	10
4948	485	3	2025-12-04 12:59:39	Delivered	Transfer	Amman	2	0
4949	134	6	2026-02-27 10:20:17	Delivered	Cash	Amman	2	0
4950	145	12	2026-09-17 16:45:06	Delivered	Cash	Zarqa	2.5	0
4951	263	2	2026-03-11 14:49:31	Delivered	Card	Amman	2	0
4952	394	11	2026-07-25 18:32:43	Delivered	Card	Amman	2	0
4953	467	2	2025-11-18 10:17:37	Delivered	Cash	Dubai	15	0
4954	378	9	2025-12-15 12:00:05	Delivered	Cash	Amman	2	0
4955	87	3	2026-08-14 22:32:57	Delivered	Card	Zarqa	2.5	5
4956	238	12	2025-12-02 20:05:08	Delivered	Transfer	Amman	2	0
4957	486	7	2025-11-30 22:03:28	Cancelled	Card	Amman	2	0
4958	260	7	2026-08-18 13:47:59	Delivered	Card	Irbid	3	10
4959	345	2	2026-08-06 12:29:57	Delivered	Cash	Amman	2	0
4960	166	3	2026-02-11 21:28:55	Delivered	Transfer	Doha	16	0
4961	480	3	2026-07-23 22:20:54	Cancelled	Card	Amman	2	0
4962	32	10	2026-08-12 12:22:27	Delivered	Card	Salt	3	0
4963	35	5	2026-06-02 08:20:34	Delivered	Cash	Zarqa	2.5	0
4964	455	15	2025-11-27 20:02:46	Delivered	Card	Aqaba	5	0
4965	371	14	2025-11-17 12:15:09	Delivered	Cash	Amman	2	5
4966	313	7	2025-12-06 12:11:08	Delivered	Transfer	Amman	2	0
4967	393	15	2026-10-09 08:28:32	Delivered	Card	Irbid	3	5
4968	281	5	2026-03-16 13:23:43	Delivered	Cash	Amman	2	0
4969	114	9	2026-03-01 14:27:54	Delivered	Card	Amman	2	10
4970	223	13	2026-04-29 19:55:47	Delivered	Card	Amman	2	0
4971	428	9	2025-11-04 22:31:14	Delivered	Cash	Zarqa	2.5	0
4972	424	12	2025-11-18 18:17:47	Delivered	Cash	Amman	2	0
4973	335	7	2026-06-14 11:05:28	Delivered	Card	Amman	2	0
4974	259	8	2026-06-22 19:48:50	Delivered	Cash	Amman	2	0
4975	20	7	2026-04-29 09:24:52	Delivered	Transfer	Amman	2	0
4976	219	1	2026-06-04 22:52:51	Delivered	Card	Karak	4.5	0
4977	6	6	2026-09-10 11:54:49	Delivered	Card	Salt	3	0
4978	46	15	2026-08-29 13:21:09	Delivered	Card	Amman	2	0
4979	293	11	2026-04-15 12:03:20	Delivered	Cash	Aqaba	5	10
4980	249	8	2026-10-03 22:43:09	Delivered	Transfer	Irbid	3	5
4981	155	9	2026-07-28 08:01:58	Delivered	Cash	Amman	2	0
4982	150	2	2025-12-17 11:33:02	Delivered	Card	Irbid	3	0
4983	277	5	2026-01-20 16:11:09	Delivered	Cash	Zarqa	2.5	0
4984	221	13	2025-12-18 22:26:40	Cancelled	Cash	Riyadh	15	0
4985	48	12	2026-10-23 17:19:46	Shipped	Cash	Amman	2	0
4986	74	10	2025-11-09 10:31:18	Delivered	Cash	Amman	2	10
4987	13	15	2025-11-26 08:25:11	Delivered	Transfer	Irbid	3	10
4988	460	8	2026-08-23 09:17:29	Delivered	Cash	Zarqa	2.5	5
4989	100	6	2026-03-06 14:55:52	Delivered	Cash	Jerash	3.5	15
4990	217	15	2025-12-24 11:26:04	Delivered	Cash	Amman	2	0
4991	108	15	2026-08-07 15:40:49	Delivered	Cash	Amman	2	20
4992	352	13	2026-10-15 20:08:44	Cancelled	Card	Amman	2	0
4993	496	3	2026-06-12 19:47:58	Delivered	Transfer	Irbid	3	0
4994	229	7	2026-06-09 12:48:37	Delivered	Card	Madaba	3	0
4995	230	15	2025-12-28 09:47:39	Delivered	Card	Riyadh	15	0
4996	469	8	2026-07-30 16:43:40	Delivered	Card	Salt	3	0
4997	40	1	2026-07-20 17:26:30	Delivered	Cash	Amman	2	20
4998	473	3	2026-10-06 22:48:11	Shipped	Card	Amman	2	0
4999	158	3	2026-07-04 15:45:58	Delivered	Cash	Karak	4.5	20
5000	147	2	2026-07-21 08:23:55	Cancelled	Cash	Zarqa	2.5	0
\.

COPY order_items (id,order_id,product_id,quantity,unit_price) FROM stdin;
1	1	25	2	49.71
2	1	100	5	10.12
3	2	99	4	7.62
4	2	80	1	7.7
5	3	78	1	24.71
6	4	37	2	149.74
7	4	25	1	49.71
8	4	31	2	33.5
9	5	50	2	6.73
10	6	14	2	27.1
11	7	9	1	155.72
12	8	81	1	13.69
13	9	18	1	33.18
14	10	89	1	11.22
15	10	78	2	24.71
16	11	27	4	34.78
17	11	25	3	49.71
18	12	45	5	40.06
19	12	11	1	369.57
20	12	68	1	170.95
21	12	34	1	80.71
22	13	3	1	286.67
23	14	78	2	24.71
24	15	63	3	33.06
25	16	33	2	77.74
26	16	8	1	50.48
27	17	10	4	101.01
28	17	13	3	22.41
29	18	91	1	25.91
30	18	24	1	49.22
31	19	69	1	62.48
32	19	99	2	7.62
33	20	25	2	49.71
34	20	83	1	19.55
35	21	99	1	7.62
36	21	49	3	8.95
37	22	25	2	49.71
38	22	99	1	7.62
39	23	24	2	49.22
40	23	25	1	49.71
41	23	8	4	50.48
42	24	18	1	33.18
43	24	12	2	283.69
44	25	25	2	49.71
45	25	96	1	46.73
46	26	76	2	2.45
47	26	5	1	749.81
48	26	78	2	24.71
49	27	11	1	369.57
50	27	36	1	51.85
51	28	36	2	51.85
52	29	62	2	24.18
53	30	5	2	749.81
54	30	18	2	33.18
55	30	92	1	19.55
56	31	23	1	61.72
57	31	77	1	34.75
58	32	25	5	49.71
59	33	61	1	18.1
60	34	81	1	13.69
61	34	88	1	14.38
62	34	51	1	16.01
63	34	12	1	283.69
64	35	73	1	10.32
65	35	24	2	49.22
66	36	25	1	49.71
67	37	93	2	19.24
68	37	25	1	49.71
69	38	7	3	38.61
70	39	99	3	7.62
71	39	87	2	60.33
72	39	25	1	49.71
73	39	18	1	33.18
74	40	33	1	77.74
75	41	25	1	49.71
76	41	25	2	49.71
77	41	56	4	8.63
78	41	56	2	8.63
79	42	65	1	88.86
80	42	52	2	14.33
81	42	78	3	24.71
82	43	78	4	24.71
83	44	73	1	10.32
84	44	48	1	17.79
85	45	99	1	7.62
86	46	63	3	33.06
87	47	60	1	22.42
88	47	13	1	22.41
89	47	73	3	10.32
90	47	8	4	50.48
91	48	14	2	27.1
92	48	79	1	6.88
93	48	99	2	7.62
94	49	64	1	42.6
95	50	70	3	64.32
96	50	53	1	43.04
97	51	47	1	17.6
98	51	67	2	183.38
99	52	75	1	2.9
100	52	41	2	106.57
101	53	73	1	10.32
102	53	18	1	33.18
103	54	92	1	19.55
104	54	25	4	49.71
105	55	39	2	41.87
106	55	55	1	12.59
107	56	11	1	369.57
108	56	26	4	40.13
109	57	53	2	43.04
110	57	46	2	24.74
111	58	15	1	15.19
112	59	96	1	46.73
113	60	25	1	49.71
114	60	13	1	22.41
115	61	17	1	13.19
116	61	40	1	49.48
117	62	25	4	49.71
118	62	41	2	106.57
119	63	92	1	19.55
120	63	9	2	155.72
121	63	45	1	40.06
122	64	67	2	183.38
123	64	61	2	18.1
124	64	25	2	49.71
125	64	93	3	19.24
126	65	11	3	369.57
127	66	79	1	6.88
128	66	36	1	51.85
129	66	1	2	414.28
130	67	2	1	434.66
131	67	23	1	61.72
132	68	85	1	36.01
133	69	23	1	61.72
134	70	45	2	40.06
135	70	63	1	33.06
136	71	25	1	49.71
137	72	25	1	49.71
138	72	39	1	41.87
139	72	69	3	62.48
140	73	18	1	33.18
141	73	29	1	41.05
142	74	24	1	49.22
143	74	10	1	101.01
144	74	8	1	50.48
145	74	25	4	49.71
146	75	48	1	17.79
147	76	75	2	2.9
148	77	6	5	652.7
149	77	83	3	19.55
150	78	25	1	49.71
151	78	50	1	6.73
152	79	46	2	24.74
153	80	28	1	38.97
154	80	23	1	61.72
155	80	24	2	49.22
156	81	24	1	49.22
157	82	24	1	49.22
158	82	53	2	43.04
159	82	97	1	12.46
160	82	92	3	19.55
161	83	25	1	49.71
162	83	4	2	738.89
163	83	80	4	7.7
164	84	24	2	49.22
165	85	76	1	2.45
166	85	46	4	24.74
167	86	35	2	64.83
168	86	29	2	41.05
169	87	69	1	62.48
170	88	68	3	170.95
171	89	44	1	54.57
172	90	58	2	19.26
173	90	63	4	33.06
174	90	36	5	51.85
175	90	24	4	49.22
176	91	25	1	49.71
177	91	31	3	33.5
178	92	91	1	25.91
179	93	25	1	49.71
180	93	100	1	10.12
181	93	27	1	34.78
182	93	30	2	33.59
183	94	76	1	2.45
184	94	47	1	17.6
185	95	25	3	49.71
186	96	67	1	183.38
187	97	81	1	13.69
188	97	25	1	49.71
189	97	11	2	369.57
190	98	5	2	749.81
191	98	38	1	141.29
192	98	77	2	34.75
193	99	67	1	183.38
194	99	9	1	155.72
195	99	76	5	2.45
196	99	48	1	17.79
197	100	14	1	27.1
198	101	24	4	49.22
199	102	98	2	9.66
200	103	38	1	141.29
201	103	70	1	64.32
202	103	73	1	10.32
203	104	57	1	13.42
204	105	49	4	8.95
205	106	18	3	33.18
206	106	45	5	40.06
207	106	71	1	7.99
208	107	25	1	49.71
209	107	25	3	49.71
210	107	53	1	43.04
211	108	78	4	24.71
212	109	25	3	49.71
213	109	2	3	434.66
214	109	25	1	49.71
215	110	12	2	283.69
216	110	88	4	14.38
217	111	6	1	652.7
218	112	24	1	49.22
219	112	5	2	749.81
220	112	30	1	33.59
221	112	22	1	67.05
222	113	85	1	36.01
223	114	59	1	12.93
224	115	65	1	88.86
225	115	85	4	36.01
226	115	37	1	149.74
227	116	47	1	17.6
228	116	67	1	183.38
229	117	25	3	49.71
230	117	31	5	33.5
231	118	32	1	84.97
232	118	49	4	8.95
233	119	44	2	54.57
234	119	38	3	141.29
235	120	88	1	14.38
236	120	76	2	2.45
237	120	66	1	66.4
238	120	26	1	40.13
239	121	5	2	749.81
240	122	91	1	25.91
241	123	68	4	170.95
242	124	27	2	34.78
243	125	71	2	7.99
244	126	48	1	17.79
245	126	25	3	49.71
246	127	84	2	26.83
247	127	34	1	80.71
248	128	16	2	10.08
249	129	59	1	12.93
250	130	14	2	27.1
251	130	48	1	17.79
252	130	24	2	49.22
253	130	31	1	33.5
254	131	39	2	41.87
255	132	18	1	33.18
256	133	24	1	49.22
257	134	36	1	51.85
258	135	47	1	17.6
259	135	36	1	51.85
260	135	96	1	46.73
261	136	25	1	49.71
262	137	91	1	25.91
263	137	24	3	49.22
264	137	18	5	33.18
265	138	58	1	19.26
266	139	18	1	33.18
267	140	68	2	170.95
268	141	68	1	170.95
269	141	25	4	49.71
270	141	62	2	24.18
271	142	11	1	369.57
272	142	58	4	19.26
273	143	42	1	125.85
274	143	16	2	10.08
275	144	90	1	13.02
276	145	25	1	49.71
277	146	51	2	16.01
278	147	57	1	13.42
279	148	68	1	170.95
280	149	24	1	49.22
281	150	25	1	49.71
282	150	25	2	49.71
283	151	18	1	33.18
284	151	25	2	49.71
285	152	86	1	44.7
286	152	95	1	48.75
287	153	25	2	49.71
288	153	31	1	33.5
289	154	46	1	24.74
290	155	25	3	49.71
291	156	18	2	33.18
292	156	31	4	33.5
293	156	25	1	49.71
294	157	25	2	49.71
295	157	58	1	19.26
296	158	32	1	84.97
297	158	33	1	77.74
298	158	91	2	25.91
299	159	87	2	60.33
300	160	36	2	51.85
301	160	40	3	49.48
302	161	40	2	49.48
303	161	96	1	46.73
304	161	85	2	36.01
305	162	14	1	27.1
306	163	48	1	17.79
307	164	23	1	61.72
308	164	25	1	49.71
309	165	49	1	8.95
310	165	87	5	60.33
311	165	36	2	51.85
312	166	19	2	40.25
313	167	36	5	51.85
314	167	48	1	17.79
315	167	62	1	24.18
316	168	20	1	43.87
317	168	14	4	27.1
318	168	36	2	51.85
319	169	16	3	10.08
320	169	11	2	369.57
321	170	66	1	66.4
322	171	46	3	24.74
323	171	25	2	49.71
324	171	95	2	48.75
325	172	11	1	369.57
326	173	25	2	49.71
327	173	11	3	369.57
328	173	96	1	46.73
329	173	47	3	17.6
330	174	5	1	749.81
331	175	46	2	24.74
332	175	77	3	34.75
333	175	25	1	49.71
334	176	5	1	749.81
335	176	69	3	62.48
336	176	42	3	125.85
337	176	57	2	13.42
338	177	99	1	7.62
339	177	23	1	61.72
340	177	9	1	155.72
341	178	75	1	2.9
342	178	17	1	13.19
343	178	7	1	38.61
344	179	86	3	44.7
345	179	33	1	77.74
346	179	25	2	49.71
347	180	36	1	51.85
348	180	88	3	14.38
349	180	41	1	106.57
350	180	45	1	40.06
351	181	25	1	49.71
352	182	23	1	61.72
353	183	75	2	2.9
354	183	68	1	170.95
355	183	77	1	34.75
356	183	31	2	33.5
357	184	63	2	33.06
358	184	25	5	49.71
359	185	47	1	17.6
360	186	36	5	51.85
361	186	36	3	51.85
362	187	25	3	49.71
363	187	17	2	13.19
364	187	18	2	33.18
365	188	63	1	33.06
366	189	30	2	33.59
367	189	82	1	9.8
368	189	25	2	49.71
369	190	39	2	41.87
370	190	25	1	49.71
371	190	77	1	34.75
372	191	48	2	17.79
373	191	41	1	106.57
374	191	23	2	61.72
375	192	83	1	19.55
376	192	25	1	49.71
377	192	88	2	14.38
378	193	48	1	17.79
379	193	25	1	49.71
380	194	21	1	63.2
381	194	68	2	170.95
382	195	27	1	34.78
383	195	17	2	13.19
384	196	89	4	11.22
385	197	76	1	2.45
386	197	19	1	40.25
387	198	85	2	36.01
388	198	78	1	24.71
389	199	32	3	84.97
390	200	24	4	49.22
391	201	36	1	51.85
392	201	18	1	33.18
393	201	56	5	8.63
394	202	31	4	33.5
395	202	73	1	10.32
396	202	78	2	24.71
397	202	82	1	9.8
398	203	65	1	88.86
399	203	23	3	61.72
400	203	93	3	19.24
401	204	48	2	17.79
402	205	68	1	170.95
403	205	34	1	80.71
404	205	31	1	33.5
405	206	58	1	19.26
406	206	25	1	49.71
407	207	8	1	50.48
408	208	48	1	17.79
409	209	42	5	125.85
410	210	24	2	49.22
411	211	48	1	17.79
412	212	96	2	46.73
413	213	97	1	12.46
414	214	80	1	7.7
415	215	25	1	49.71
416	216	62	1	24.18
417	217	32	5	84.97
418	218	31	1	33.5
419	219	48	2	17.79
420	220	77	1	34.75
421	220	30	1	33.59
422	221	11	2	369.57
423	221	83	1	19.55
424	222	46	2	24.74
425	222	24	2	49.22
426	222	14	1	27.1
427	222	22	2	67.05
428	223	49	4	8.95
429	223	24	1	49.22
430	223	24	1	49.22
431	224	31	1	33.5
432	224	25	2	49.71
433	224	25	1	49.71
434	225	77	2	34.75
435	225	78	2	24.71
436	225	36	2	51.85
437	225	58	2	19.26
438	226	100	4	10.12
439	226	27	1	34.78
440	227	89	2	11.22
441	228	68	2	170.95
442	229	77	1	34.75
443	230	78	1	24.71
444	230	62	4	24.18
445	230	48	4	17.79
446	231	22	1	67.05
447	232	36	3	51.85
448	233	73	1	10.32
449	233	26	1	40.13
450	233	64	1	42.6
451	234	83	1	19.55
452	235	77	1	34.75
453	235	77	1	34.75
454	236	25	4	49.71
455	237	14	1	27.1
456	238	68	1	170.95
457	238	49	2	8.95
458	239	82	2	9.8
459	239	86	1	44.7
460	239	30	2	33.59
461	239	94	1	20.26
462	240	18	1	33.18
463	240	95	5	48.75
464	240	25	2	49.71
465	241	24	1	49.22
466	242	36	1	51.85
467	243	48	1	17.79
468	243	25	2	49.71
469	243	96	1	46.73
470	244	24	1	49.22
471	245	21	2	63.2
472	245	77	1	34.75
473	246	25	1	49.71
474	246	51	2	16.01
475	246	74	1	3.59
476	247	12	1	283.69
477	247	93	2	19.24
478	247	25	1	49.71
479	248	25	1	49.71
480	248	25	3	49.71
481	249	66	1	66.4
482	250	76	3	2.45
483	251	26	5	40.13
484	251	12	4	283.69
485	251	68	1	170.95
486	252	25	2	49.71
487	252	26	1	40.13
488	252	68	1	170.95
489	253	71	2	7.99
490	254	62	3	24.18
491	255	25	1	49.71
492	255	78	5	24.71
493	256	46	1	24.74
494	256	68	2	170.95
495	257	20	2	43.87
496	258	51	1	16.01
497	258	42	1	125.85
498	259	36	1	51.85
499	260	30	1	33.59
500	260	48	1	17.79
501	261	88	1	14.38
502	262	35	2	64.83
503	262	33	1	77.74
504	263	11	2	369.57
505	263	57	1	13.42
506	263	41	1	106.57
507	264	75	3	2.9
508	265	68	2	170.95
509	265	73	2	10.32
510	265	25	2	49.71
511	266	33	2	77.74
512	267	25	4	49.71
513	268	27	2	34.78
514	269	52	2	14.33
515	269	38	1	141.29
516	269	26	4	40.13
517	269	53	3	43.04
518	270	37	2	149.74
519	271	9	2	155.72
520	271	25	1	49.71
521	271	66	2	66.4
522	271	53	1	43.04
523	272	18	1	33.18
524	272	24	1	49.22
525	272	68	1	170.95
526	272	13	3	22.41
527	273	46	2	24.74
528	273	79	1	6.88
529	274	50	1	6.73
530	275	2	3	434.66
531	276	76	1	2.45
532	276	15	1	15.19
533	277	23	1	61.72
534	278	25	1	49.71
535	279	74	5	3.59
536	280	25	2	49.71
537	280	23	1	61.72
538	280	38	3	141.29
539	281	95	2	48.75
540	282	19	1	40.25
541	282	25	1	49.71
542	283	11	2	369.57
543	283	62	1	24.18
544	283	78	4	24.71
545	284	91	1	25.91
546	284	52	1	14.33
547	285	25	1	49.71
548	285	25	1	49.71
549	285	11	1	369.57
550	286	31	1	33.5
551	286	34	3	80.71
552	286	66	2	66.4
553	287	24	2	49.22
554	288	17	1	13.19
555	289	32	3	84.97
556	289	26	1	40.13
557	289	67	2	183.38
558	290	64	1	42.6
559	290	68	1	170.95
560	290	36	2	51.85
561	290	68	1	170.95
562	291	95	1	48.75
563	291	25	1	49.71
564	292	53	1	43.04
565	293	80	2	7.7
566	293	26	1	40.13
567	293	20	1	43.87
568	294	25	1	49.71
569	294	71	1	7.99
570	294	84	1	26.83
571	294	81	4	13.69
572	295	30	3	33.59
573	295	32	3	84.97
574	296	13	1	22.41
575	296	77	2	34.75
576	297	24	1	49.22
577	298	91	1	25.91
578	298	87	1	60.33
579	299	81	5	13.69
580	300	85	1	36.01
581	301	52	5	14.33
582	302	39	1	41.87
583	302	57	2	13.42
584	302	23	2	61.72
585	303	51	3	16.01
586	303	24	4	49.22
587	304	91	1	25.91
588	305	53	1	43.04
589	305	23	3	61.72
590	305	11	5	369.57
591	306	16	1	10.08
592	307	82	4	9.8
593	307	6	3	652.7
594	307	25	2	49.71
595	308	78	1	24.71
596	309	25	2	49.71
597	309	25	1	49.71
598	310	48	2	17.79
599	310	48	3	17.79
600	311	47	2	17.6
601	312	75	2	2.9
602	312	70	2	64.32
603	312	5	2	749.81
604	312	5	4	749.81
605	313	99	1	7.62
606	313	73	1	10.32
607	314	49	2	8.95
608	314	68	1	170.95
609	315	25	1	49.71
610	316	55	3	12.59
611	316	18	1	33.18
612	316	25	1	49.71
613	316	27	3	34.78
614	317	32	3	84.97
615	317	18	1	33.18
616	317	96	3	46.73
617	318	98	2	9.66
618	318	61	5	18.1
619	318	74	1	3.59
620	319	18	5	33.18
621	319	72	1	9.77
622	320	36	2	51.85
623	320	8	2	50.48
624	320	37	1	149.74
625	320	94	1	20.26
626	321	68	1	170.95
627	321	27	2	34.78
628	322	16	5	10.08
629	323	53	1	43.04
630	324	25	1	49.71
631	325	5	2	749.81
632	325	99	1	7.62
633	326	11	1	369.57
634	327	61	3	18.1
635	327	22	1	67.05
636	327	76	1	2.45
637	328	89	4	11.22
638	328	90	1	13.02
639	328	27	1	34.78
640	328	16	2	10.08
641	329	78	2	24.71
642	329	68	2	170.95
643	330	25	1	49.71
644	330	68	1	170.95
645	331	72	1	9.77
646	331	58	1	19.26
647	332	39	3	41.87
648	332	39	2	41.87
649	333	4	4	738.89
650	333	24	2	49.22
651	334	78	1	24.71
652	335	59	1	12.93
653	336	51	1	16.01
654	337	43	1	69.98
655	338	59	1	12.93
656	339	64	1	42.6
657	339	4	1	738.89
658	339	79	1	6.88
659	340	25	2	49.71
660	340	5	1	749.81
661	341	4	2	738.89
662	341	64	1	42.6
663	342	49	2	8.95
664	343	89	1	11.22
665	343	43	1	69.98
666	344	24	1	49.22
667	344	83	1	19.55
668	345	23	3	61.72
669	346	15	2	15.19
670	347	33	2	77.74
671	348	25	1	49.71
672	349	5	4	749.81
673	350	36	2	51.85
674	350	25	1	49.71
675	350	46	4	24.74
676	351	86	5	44.7
677	351	55	1	12.59
678	352	33	2	77.74
679	353	25	1	49.71
680	354	4	3	738.89
681	354	30	1	33.59
682	354	78	1	24.71
683	355	90	1	13.02
684	355	47	1	17.6
685	355	23	1	61.72
686	356	23	1	61.72
687	357	71	3	7.99
688	357	3	1	286.67
689	357	74	3	3.59
690	358	12	1	283.69
691	358	93	1	19.24
692	358	73	1	10.32
693	359	25	2	49.71
694	360	60	2	22.42
695	360	11	1	369.57
696	360	25	5	49.71
697	360	21	2	63.2
698	361	96	1	46.73
699	361	68	1	170.95
700	362	95	2	48.75
701	362	64	1	42.6
702	363	25	1	49.71
703	364	72	1	9.77
704	364	81	1	13.69
705	364	25	1	49.71
706	365	20	3	43.87
707	365	78	1	24.71
708	366	24	4	49.22
709	367	42	1	125.85
710	367	26	2	40.13
711	368	36	1	51.85
712	368	25	2	49.71
713	368	60	4	22.42
714	368	96	2	46.73
715	369	42	1	125.85
716	370	25	2	49.71
717	371	75	1	2.9
718	372	60	3	22.42
719	373	34	1	80.71
720	373	20	1	43.87
721	373	25	4	49.71
722	373	35	1	64.83
723	374	63	2	33.06
724	375	83	1	19.55
725	375	63	1	33.06
726	376	30	2	33.59
727	377	16	4	10.08
728	377	25	1	49.71
729	378	81	1	13.69
730	379	24	1	49.22
731	380	49	1	8.95
732	380	26	1	40.13
733	381	53	1	43.04
734	381	29	1	41.05
735	382	48	1	17.79
736	383	63	1	33.06
737	383	27	2	34.78
738	383	89	1	11.22
739	384	26	2	40.13
740	385	6	1	652.7
741	386	64	1	42.6
742	387	36	1	51.85
743	387	3	3	286.67
744	388	24	3	49.22
745	388	7	1	38.61
746	389	25	3	49.71
747	390	34	1	80.71
748	390	57	3	13.42
749	391	24	2	49.22
750	391	12	1	283.69
751	391	15	1	15.19
752	392	16	2	10.08
753	393	59	2	12.93
754	394	5	1	749.81
755	394	16	1	10.08
756	394	70	1	64.32
757	395	49	4	8.95
758	396	43	1	69.98
759	397	25	3	49.71
760	398	34	2	80.71
761	398	13	2	22.41
762	398	48	2	17.79
763	399	25	1	49.71
764	399	40	1	49.48
765	399	34	3	80.71
766	400	67	2	183.38
767	401	93	1	19.24
768	401	21	1	63.2
769	401	98	2	9.66
770	402	5	1	749.81
771	402	61	1	18.1
772	403	56	1	8.63
773	403	100	1	10.12
774	404	60	1	22.42
775	405	79	3	6.88
776	405	23	1	61.72
777	405	36	1	51.85
778	405	27	2	34.78
779	406	21	2	63.2
780	407	23	2	61.72
781	408	81	2	13.69
782	408	25	1	49.71
783	409	25	1	49.71
784	410	78	2	24.71
785	410	46	2	24.74
786	410	48	2	17.79
787	411	25	1	49.71
788	412	74	2	3.59
789	412	23	2	61.72
790	412	62	2	24.18
791	413	25	3	49.71
792	413	75	1	2.9
793	414	75	1	2.9
794	415	18	1	33.18
795	416	24	3	49.22
796	416	46	1	24.74
797	417	48	2	17.79
798	418	13	3	22.41
799	418	24	1	49.22
800	419	30	1	33.59
801	419	19	3	40.25
802	419	78	2	24.71
803	420	78	2	24.71
804	420	26	2	40.13
805	421	95	2	48.75
806	421	46	2	24.74
807	421	10	2	101.01
808	422	25	4	49.71
809	423	7	1	38.61
810	424	32	3	84.97
811	425	80	2	7.7
812	425	25	1	49.71
813	425	30	1	33.59
814	426	91	1	25.91
815	427	77	2	34.75
816	427	25	1	49.71
817	427	22	1	67.05
818	428	41	5	106.57
819	428	92	1	19.55
820	429	48	1	17.79
821	430	73	2	10.32
822	430	53	1	43.04
823	430	25	1	49.71
824	431	93	3	19.24
825	432	39	1	41.87
826	433	25	1	49.71
827	433	24	1	49.22
828	433	5	1	749.81
829	434	68	1	170.95
830	434	71	2	7.99
831	435	18	4	33.18
832	436	76	1	2.45
833	436	45	1	40.06
834	437	90	1	13.02
835	437	12	1	283.69
836	437	86	2	44.7
837	437	98	3	9.66
838	438	25	3	49.71
839	438	31	1	33.5
840	438	91	1	25.91
841	439	83	1	19.55
842	439	87	4	60.33
843	439	60	1	22.42
844	440	90	1	13.02
845	440	29	1	41.05
846	440	30	5	33.59
847	441	24	1	49.22
848	441	74	1	3.59
849	442	91	2	25.91
850	442	60	1	22.42
851	442	8	1	50.48
852	443	36	1	51.85
853	443	25	3	49.71
854	443	11	2	369.57
855	444	27	1	34.78
856	445	25	1	49.71
857	446	69	2	62.48
858	447	85	2	36.01
859	447	25	1	49.71
860	447	25	1	49.71
861	448	25	5	49.71
862	449	83	1	19.55
863	450	76	1	2.45
864	450	24	1	49.22
865	451	73	1	10.32
866	451	63	1	33.06
867	451	43	2	69.98
868	451	7	1	38.61
869	452	25	1	49.71
870	453	30	1	33.59
871	453	94	2	20.26
872	454	18	2	33.18
873	455	25	1	49.71
874	455	45	1	40.06
875	455	99	3	7.62
876	455	78	1	24.71
877	456	12	2	283.69
878	457	50	1	6.73
879	457	78	2	24.71
880	457	31	3	33.5
881	457	70	1	64.32
882	458	52	1	14.33
883	459	96	3	46.73
884	459	12	3	283.69
885	459	48	2	17.79
886	460	25	1	49.71
887	460	31	1	33.5
888	461	25	1	49.71
889	462	97	2	12.46
890	463	88	1	14.38
891	463	62	4	24.18
892	463	81	1	13.69
893	464	66	1	66.4
894	465	46	2	24.74
895	465	12	1	283.69
896	466	2	1	434.66
897	466	25	2	49.71
898	466	70	1	64.32
899	466	45	1	40.06
900	467	25	3	49.71
901	468	23	2	61.72
902	469	24	4	49.22
903	470	72	3	9.77
904	470	25	1	49.71
905	470	55	2	12.59
906	471	1	1	414.28
907	472	69	1	62.48
908	473	87	1	60.33
909	474	25	2	49.71
910	474	73	2	10.32
911	475	49	5	8.95
912	475	1	4	414.28
913	475	25	2	49.71
914	475	45	2	40.06
915	476	56	5	8.63
916	476	46	1	24.74
917	477	31	2	33.5
918	477	59	1	12.93
919	478	33	1	77.74
920	478	66	1	66.4
921	478	13	1	22.41
922	478	89	1	11.22
923	479	68	1	170.95
924	479	59	1	12.93
925	480	21	2	63.2
926	480	98	2	9.66
927	481	10	1	101.01
928	482	58	3	19.26
929	482	20	1	43.87
930	483	31	2	33.5
931	483	21	2	63.2
932	484	100	1	10.12
933	485	77	1	34.75
934	485	25	2	49.71
935	485	36	1	51.85
936	486	47	2	17.6
937	486	18	1	33.18
938	486	43	1	69.98
939	486	17	4	13.19
940	487	18	1	33.18
941	488	45	2	40.06
942	488	25	1	49.71
943	488	25	3	49.71
944	489	74	2	3.59
945	489	12	1	283.69
946	489	94	1	20.26
947	490	47	1	17.6
948	490	36	4	51.85
949	491	51	1	16.01
950	492	26	1	40.13
951	492	25	1	49.71
952	492	47	2	17.6
953	492	45	1	40.06
954	493	71	4	7.99
955	493	78	1	24.71
956	493	17	1	13.19
957	494	45	1	40.06
958	494	83	1	19.55
959	495	64	1	42.6
960	495	53	2	43.04
961	496	14	5	27.1
962	496	25	1	49.71
963	497	29	1	41.05
964	498	30	1	33.59
965	499	64	1	42.6
966	500	24	5	49.22
967	501	25	1	49.71
968	501	57	1	13.42
969	501	18	2	33.18
970	501	100	1	10.12
971	502	36	1	51.85
972	503	45	3	40.06
973	503	41	1	106.57
974	504	88	3	14.38
975	504	57	1	13.42
976	504	48	1	17.79
977	504	84	1	26.83
978	505	100	1	10.12
979	506	79	1	6.88
980	506	41	1	106.57
981	507	18	2	33.18
982	508	68	1	170.95
983	508	58	1	19.26
984	508	91	1	25.91
985	509	49	1	8.95
986	510	25	1	49.71
987	510	80	4	7.7
988	510	65	1	88.86
989	511	76	1	2.45
990	512	48	2	17.79
991	512	57	5	13.42
992	513	25	2	49.71
993	513	84	2	26.83
994	514	95	1	48.75
995	514	49	1	8.95
996	515	46	5	24.74
997	516	68	3	170.95
998	516	99	3	7.62
999	516	85	5	36.01
1000	517	48	1	17.79
1001	518	4	1	738.89
1002	518	31	2	33.5
1003	518	58	1	19.26
1004	519	48	2	17.79
1005	520	84	1	26.83
1006	521	92	1	19.55
1007	522	50	1	6.73
1008	523	33	1	77.74
1009	523	21	2	63.2
1010	524	99	2	7.62
1011	524	91	1	25.91
1012	524	70	1	64.32
1013	524	91	2	25.91
1014	525	25	5	49.71
1015	526	56	1	8.63
1016	526	36	2	51.85
1017	527	80	1	7.7
1018	527	18	1	33.18
1019	527	39	5	41.87
1020	527	12	1	283.69
1021	528	73	2	10.32
1022	528	21	1	63.2
1023	529	65	1	88.86
1024	529	65	2	88.86
1025	530	68	4	170.95
1026	531	91	1	25.91
1027	531	29	2	41.05
1028	532	56	1	8.63
1029	533	11	2	369.57
1030	534	49	1	8.95
1031	535	55	1	12.59
1032	535	97	2	12.46
1033	535	59	1	12.93
1034	536	34	1	80.71
1035	537	43	5	69.98
1036	537	23	4	61.72
1037	538	78	3	24.71
1038	538	18	1	33.18
1039	539	8	1	50.48
1040	540	25	1	49.71
1041	540	25	4	49.71
1042	540	27	2	34.78
1043	541	88	1	14.38
1044	541	21	2	63.2
1045	542	38	2	141.29
1046	542	27	1	34.78
1047	542	93	1	19.24
1048	542	25	1	49.71
1049	543	49	3	8.95
1050	544	47	1	17.6
1051	544	6	3	652.7
1052	544	24	1	49.22
1053	545	36	3	51.85
1054	545	41	1	106.57
1055	545	31	3	33.5
1056	546	70	1	64.32
1057	547	78	1	24.71
1058	548	25	2	49.71
1059	549	56	1	8.63
1060	549	25	2	49.71
1061	549	96	2	46.73
1062	550	25	1	49.71
1063	550	78	3	24.71
1064	551	99	1	7.62
1065	551	25	1	49.71
1066	551	24	1	49.22
1067	552	49	1	8.95
1068	552	49	2	8.95
1069	553	24	3	49.22
1070	554	49	1	8.95
1071	554	66	3	66.4
1072	555	61	2	18.1
1073	555	22	1	67.05
1074	556	25	2	49.71
1075	556	39	2	41.87
1076	556	56	1	8.63
1077	556	86	2	44.7
1078	557	23	2	61.72
1079	557	64	4	42.6
1080	558	31	1	33.5
1081	559	73	3	10.32
1082	559	43	1	69.98
1083	559	91	1	25.91
1084	559	16	2	10.08
1085	560	94	1	20.26
1086	560	63	1	33.06
1087	561	42	1	125.85
1088	561	15	1	15.19
1089	562	73	1	10.32
1090	563	36	1	51.85
1091	563	80	1	7.7
1092	564	15	1	15.19
1093	564	77	1	34.75
1094	565	12	1	283.69
1095	565	25	3	49.71
1096	566	48	1	17.79
1097	566	28	2	38.97
1098	567	16	2	10.08
1099	568	25	2	49.71
1100	569	68	1	170.95
1101	570	99	1	7.62
1102	570	25	1	49.71
1103	571	74	1	3.59
1104	571	56	2	8.63
1105	572	45	1	40.06
1106	572	27	2	34.78
1107	572	18	3	33.18
1108	572	25	1	49.71
1109	573	9	2	155.72
1110	573	10	2	101.01
1111	574	25	1	49.71
1112	574	80	3	7.7
1113	574	58	2	19.26
1114	574	24	2	49.22
1115	575	26	3	40.13
1116	575	25	1	49.71
1117	576	15	2	15.19
1118	576	69	2	62.48
1119	577	12	1	283.69
1120	577	40	1	49.48
1121	577	40	3	49.48
1122	578	6	1	652.7
1123	579	23	1	61.72
1124	579	16	1	10.08
1125	580	24	2	49.22
1126	580	25	5	49.71
1127	581	5	5	749.81
1128	581	29	1	41.05
1129	582	25	1	49.71
1130	582	69	2	62.48
1131	582	76	2	2.45
1132	583	25	3	49.71
1133	583	76	4	2.45
1134	583	27	2	34.78
1135	584	25	1	49.71
1136	584	26	1	40.13
1137	585	48	1	17.79
1138	585	46	1	24.74
1139	586	36	1	51.85
1140	587	86	1	44.7
1141	587	97	1	12.46
1142	587	26	2	40.13
1143	588	65	1	88.86
1144	588	49	5	8.95
1145	588	90	1	13.02
1146	588	76	3	2.45
1147	589	97	1	12.46
1148	589	91	1	25.91
1149	589	10	1	101.01
1150	589	43	1	69.98
1151	590	56	4	8.63
1152	590	39	1	41.87
1153	590	76	1	2.45
1154	591	36	2	51.85
1155	591	25	2	49.71
1156	591	24	1	49.22
1157	591	87	1	60.33
1158	592	45	1	40.06
1159	592	64	1	42.6
1160	592	71	1	7.99
1161	593	25	1	49.71
1162	593	19	1	40.25
1163	594	17	1	13.19
1164	594	47	2	17.6
1165	595	99	2	7.62
1166	595	33	2	77.74
1167	596	52	1	14.33
1168	596	76	1	2.45
1169	596	30	1	33.59
1170	596	36	1	51.85
1171	597	25	1	49.71
1172	597	18	1	33.18
1173	597	13	1	22.41
1174	597	5	1	749.81
1175	598	43	2	69.98
1176	599	25	1	49.71
1177	600	32	4	84.97
1178	600	26	1	40.13
1179	601	23	3	61.72
1180	601	71	5	7.99
1181	602	27	1	34.78
1182	602	25	5	49.71
1183	603	47	3	17.6
1184	603	25	5	49.71
1185	604	37	1	149.74
1186	604	73	1	10.32
1187	605	25	1	49.71
1188	605	24	2	49.22
1189	605	74	1	3.59
1190	606	8	1	50.48
1191	606	25	2	49.71
1192	606	24	1	49.22
1193	607	83	2	19.55
1194	607	36	1	51.85
1195	608	76	1	2.45
1196	608	73	2	10.32
1197	608	100	1	10.12
1198	609	12	2	283.69
1199	610	78	2	24.71
1200	610	31	1	33.5
1201	610	15	1	15.19
1202	611	42	1	125.85
1203	611	25	3	49.71
1204	611	21	5	63.2
1205	612	98	1	9.66
1206	612	5	4	749.81
1207	612	25	2	49.71
1208	613	99	1	7.62
1209	613	43	2	69.98
1210	613	65	1	88.86
1211	613	91	2	25.91
1212	614	21	1	63.2
1213	615	11	2	369.57
1214	615	95	3	48.75
1215	615	25	2	49.71
1216	616	3	3	286.67
1217	616	80	2	7.7
1218	616	66	1	66.4
1219	617	88	4	14.38
1220	618	61	2	18.1
1221	619	27	2	34.78
1222	619	47	5	17.6
1223	620	25	1	49.71
1224	620	75	3	2.9
1225	621	46	1	24.74
1226	622	16	3	10.08
1227	623	39	2	41.87
1228	623	56	2	8.63
1229	623	73	1	10.32
1230	623	27	1	34.78
1231	624	53	2	43.04
1232	624	12	1	283.69
1233	624	7	1	38.61
1234	624	30	2	33.59
1235	625	23	2	61.72
1236	626	30	1	33.59
1237	626	3	2	286.67
1238	627	49	1	8.95
1239	628	27	1	34.78
1240	628	4	1	738.89
1241	629	25	1	49.71
1242	629	48	1	17.79
1243	630	60	5	22.42
1244	630	35	5	64.83
1245	631	11	1	369.57
1246	632	44	2	54.57
1247	633	36	1	51.85
1248	633	11	1	369.57
1249	634	17	3	13.19
1250	634	18	3	33.18
1251	634	25	3	49.71
1252	635	35	1	64.83
1253	635	18	3	33.18
1254	635	36	1	51.85
1255	635	21	2	63.2
1256	636	18	1	33.18
1257	637	47	5	17.6
1258	638	33	3	77.74
1259	638	18	1	33.18
1260	638	36	3	51.85
1261	639	46	1	24.74
1262	639	25	3	49.71
1263	639	18	2	33.18
1264	640	49	2	8.95
1265	641	7	1	38.61
1266	642	32	1	84.97
1267	642	83	1	19.55
1268	642	81	1	13.69
1269	643	44	1	54.57
1270	644	43	1	69.98
1271	644	8	3	50.48
1272	644	90	2	13.02
1273	644	27	1	34.78
1274	645	86	1	44.7
1275	645	6	2	652.7
1276	645	25	1	49.71
1277	645	99	1	7.62
1278	646	50	1	6.73
1279	647	18	1	33.18
1280	648	25	2	49.71
1281	648	49	1	8.95
1282	649	48	1	17.79
1283	649	5	1	749.81
1284	649	68	1	170.95
1285	650	1	1	414.28
1286	650	91	3	25.91
1287	651	54	3	34.3
1288	652	5	2	749.81
1289	653	37	2	149.74
1290	653	17	3	13.19
1291	653	24	1	49.22
1292	653	78	1	24.71
1293	654	3	1	286.67
1294	655	55	2	12.59
1295	655	71	1	7.99
1296	656	43	4	69.98
1297	656	39	1	41.87
1298	656	19	4	40.25
1299	657	35	2	64.83
1300	657	100	2	10.12
1301	657	99	1	7.62
1302	657	79	3	6.88
1303	658	18	1	33.18
1304	658	41	1	106.57
1305	658	36	1	51.85
1306	659	23	1	61.72
1307	659	95	1	48.75
1308	660	25	1	49.71
1309	661	36	5	51.85
1310	661	21	2	63.2
1311	662	24	1	49.22
1312	662	26	4	40.13
1313	663	40	1	49.48
1314	664	55	1	12.59
1315	665	97	4	12.46
1316	666	25	4	49.71
1317	666	60	1	22.42
1318	667	1	5	414.28
1319	668	53	5	43.04
1320	668	12	2	283.69
1321	669	92	1	19.55
1322	670	25	2	49.71
1323	670	26	3	40.13
1324	671	74	1	3.59
1325	671	9	2	155.72
1326	672	46	1	24.74
1327	672	25	2	49.71
1328	672	21	1	63.2
1329	673	89	2	11.22
1330	673	91	2	25.91
1331	674	48	2	17.79
1332	674	13	2	22.41
1333	674	30	2	33.59
1334	674	64	4	42.6
1335	675	95	3	48.75
1336	675	56	1	8.63
1337	676	42	1	125.85
1338	676	26	2	40.13
1339	676	26	1	40.13
1340	677	51	4	16.01
1341	677	25	1	49.71
1342	677	26	1	40.13
1343	677	79	1	6.88
1344	678	2	1	434.66
1345	678	78	2	24.71
1346	679	25	1	49.71
1347	680	16	3	10.08
1348	681	63	1	33.06
1349	682	25	1	49.71
1350	682	91	1	25.91
1351	683	22	3	67.05
1352	683	38	1	141.29
1353	683	25	2	49.71
1354	684	30	1	33.59
1355	684	66	1	66.4
1356	685	10	3	101.01
1357	686	11	1	369.57
1358	686	36	3	51.85
1359	686	23	1	61.72
1360	687	25	2	49.71
1361	688	17	1	13.19
1362	689	22	1	67.05
1363	689	78	2	24.71
1364	690	7	1	38.61
1365	690	48	2	17.79
1366	690	16	1	10.08
1367	690	20	3	43.87
1368	691	96	2	46.73
1369	692	19	4	40.25
1370	692	89	1	11.22
1371	693	58	3	19.26
1372	693	22	4	67.05
1373	694	73	1	10.32
1374	694	73	1	10.32
1375	694	53	1	43.04
1376	695	3	2	286.67
1377	696	25	1	49.71
1378	696	64	2	42.6
1379	697	11	2	369.57
1380	697	89	1	11.22
1381	697	31	1	33.5
1382	698	74	3	3.59
1383	699	19	1	40.25
1384	699	24	1	49.22
1385	700	31	3	33.5
1386	701	49	2	8.95
1387	701	30	1	33.59
1388	702	16	1	10.08
1389	703	1	1	414.28
1390	703	46	1	24.74
1391	703	25	2	49.71
1392	704	25	2	49.71
1393	705	25	1	49.71
1394	706	8	1	50.48
1395	707	12	1	283.69
1396	708	25	5	49.71
1397	708	68	3	170.95
1398	709	78	2	24.71
1399	709	22	1	67.05
1400	709	48	1	17.79
1401	710	18	2	33.18
1402	710	16	1	10.08
1403	711	48	3	17.79
1404	711	17	1	13.19
1405	712	65	1	88.86
1406	713	91	5	25.91
1407	714	24	3	49.22
1408	715	24	1	49.22
1409	716	5	2	749.81
1410	716	99	2	7.62
1411	716	62	3	24.18
1412	717	25	1	49.71
1413	717	23	1	61.72
1414	718	92	1	19.55
1415	718	25	1	49.71
1416	719	99	1	7.62
1417	719	82	1	9.8
1418	720	3	3	286.67
1419	720	18	1	33.18
1420	720	48	2	17.79
1421	720	25	3	49.71
1422	721	47	2	17.6
1423	721	100	2	10.12
1424	721	12	2	283.69
1425	721	95	2	48.75
1426	722	64	4	42.6
1427	722	77	1	34.75
1428	723	27	2	34.78
1429	724	6	4	652.7
1430	725	25	1	49.71
1431	726	60	5	22.42
1432	727	73	4	10.32
1433	727	48	1	17.79
1434	728	23	1	61.72
1435	728	79	1	6.88
1436	729	66	1	66.4
1437	729	43	1	69.98
1438	729	97	1	12.46
1439	729	33	4	77.74
1440	730	48	3	17.79
1441	731	48	1	17.79
1442	731	24	1	49.22
1443	731	89	1	11.22
1444	731	73	1	10.32
1445	732	47	4	17.6
1446	732	19	1	40.25
1447	733	56	3	8.63
1448	734	64	1	42.6
1449	735	78	1	24.71
1450	736	30	1	33.59
1451	736	29	3	41.05
1452	737	56	1	8.63
1453	737	27	2	34.78
1454	737	38	4	141.29
1455	738	28	1	38.97
1456	738	67	2	183.38
1457	738	64	1	42.6
1458	738	55	1	12.59
1459	739	25	1	49.71
1460	739	39	3	41.87
1461	739	69	2	62.48
1462	739	15	1	15.19
1463	740	58	1	19.26
1464	741	50	1	6.73
1465	742	35	1	64.83
1466	743	24	3	49.22
1467	743	30	2	33.59
1468	743	38	2	141.29
1469	744	20	1	43.87
1470	745	36	2	51.85
1471	746	47	1	17.6
1472	747	42	1	125.85
1473	747	59	1	12.93
1474	748	56	2	8.63
1475	748	2	1	434.66
1476	749	47	1	17.6
1477	749	5	1	749.81
1478	749	71	1	7.99
1479	750	48	1	17.79
1480	751	42	5	125.85
1481	751	25	2	49.71
1482	752	16	3	10.08
1483	752	5	1	749.81
1484	752	95	1	48.75
1485	752	28	2	38.97
1486	753	43	2	69.98
1487	753	82	3	9.8
1488	754	27	2	34.78
1489	755	23	1	61.72
1490	755	44	3	54.57
1491	755	99	1	7.62
1492	756	7	1	38.61
1493	756	25	4	49.71
1494	757	26	2	40.13
1495	757	17	1	13.19
1496	757	25	2	49.71
1497	757	81	1	13.69
1498	758	32	1	84.97
1499	758	37	1	149.74
1500	759	24	1	49.22
1501	759	2	3	434.66
1502	759	96	1	46.73
1503	760	92	4	19.55
1504	760	11	2	369.57
1505	761	45	2	40.06
1506	761	25	1	49.71
1507	762	36	2	51.85
1508	762	34	1	80.71
1509	763	65	3	88.86
1510	763	25	3	49.71
1511	763	78	1	24.71
1512	764	24	1	49.22
1513	764	24	1	49.22
1514	765	42	1	125.85
1515	765	88	1	14.38
1516	766	33	1	77.74
1517	767	14	1	27.1
1518	767	36	1	51.85
1519	768	25	1	49.71
1520	769	36	2	51.85
1521	769	42	1	125.85
1522	770	25	1	49.71
1523	771	87	1	60.33
1524	772	22	1	67.05
1525	772	67	1	183.38
1526	773	47	1	17.6
1527	774	51	1	16.01
1528	774	38	2	141.29
1529	774	78	1	24.71
1530	775	96	2	46.73
1531	775	50	1	6.73
1532	775	14	1	27.1
1533	775	7	1	38.61
1534	776	56	1	8.63
1535	777	16	2	10.08
1536	778	83	1	19.55
1537	779	88	1	14.38
1538	779	59	1	12.93
1539	780	98	3	9.66
1540	780	31	1	33.5
1541	780	94	1	20.26
1542	780	25	2	49.71
1543	781	94	2	20.26
1544	782	25	1	49.71
1545	783	93	2	19.24
1546	783	24	1	49.22
1547	784	98	1	9.66
1548	785	42	2	125.85
1549	785	48	2	17.79
1550	786	49	2	8.95
1551	786	1	1	414.28
1552	786	38	2	141.29
1553	787	69	1	62.48
1554	787	85	1	36.01
1555	787	36	1	51.85
1556	788	76	2	2.45
1557	788	68	1	170.95
1558	788	25	1	49.71
1559	789	36	1	51.85
1560	790	72	5	9.77
1561	791	18	1	33.18
1562	791	25	1	49.71
1563	792	45	1	40.06
1564	793	46	1	24.74
1565	793	27	1	34.78
1566	793	91	1	25.91
1567	794	56	1	8.63
1568	794	14	1	27.1
1569	795	34	2	80.71
1570	795	9	4	155.72
1571	796	30	1	33.59
1572	797	3	2	286.67
1573	797	24	1	49.22
1574	798	83	2	19.55
1575	798	36	1	51.85
1576	799	45	5	40.06
1577	799	11	3	369.57
1578	800	25	1	49.71
1579	801	4	1	738.89
1580	801	66	1	66.4
1581	802	36	1	51.85
1582	802	36	3	51.85
1583	802	63	1	33.06
1584	802	97	1	12.46
1585	803	91	2	25.91
1586	804	9	1	155.72
1587	805	47	1	17.6
1588	805	49	2	8.95
1589	806	27	5	34.78
1590	806	49	3	8.95
1591	806	72	5	9.77
1592	806	25	1	49.71
1593	807	100	1	10.12
1594	808	25	1	49.71
1595	808	63	1	33.06
1596	809	73	1	10.32
1597	810	77	2	34.75
1598	810	92	2	19.55
1599	811	80	1	7.7
1600	811	36	1	51.85
1601	811	25	1	49.71
1602	811	89	3	11.22
1603	812	13	3	22.41
1604	813	74	2	3.59
1605	813	11	1	369.57
1606	814	25	1	49.71
1607	814	33	2	77.74
1608	814	13	2	22.41
1609	815	37	1	149.74
1610	815	25	1	49.71
1611	816	99	2	7.62
1612	816	18	2	33.18
1613	817	85	1	36.01
1614	817	5	1	749.81
1615	818	64	2	42.6
1616	819	65	1	88.86
1617	820	78	1	24.71
1618	820	76	1	2.45
1619	820	49	1	8.95
1620	820	2	1	434.66
1621	821	14	2	27.1
1622	822	78	1	24.71
1623	822	11	4	369.57
1624	822	83	3	19.55
1625	822	30	1	33.59
1626	823	36	1	51.85
1627	823	18	1	33.18
1628	824	25	2	49.71
1629	825	68	1	170.95
1630	825	62	1	24.18
1631	825	23	2	61.72
1632	826	80	3	7.7
1633	826	64	1	42.6
1634	827	23	1	61.72
1635	827	82	1	9.8
1636	827	54	1	34.3
1637	827	74	1	3.59
1638	828	14	2	27.1
1639	828	81	1	13.69
1640	829	12	3	283.69
1641	829	5	1	749.81
1642	829	25	4	49.71
1643	829	75	1	2.9
1644	830	68	3	170.95
1645	830	20	5	43.87
1646	830	25	2	49.71
1647	831	25	1	49.71
1648	832	67	1	183.38
1649	832	71	2	7.99
1650	833	19	3	40.25
1651	833	57	3	13.42
1652	833	48	5	17.79
1653	833	25	1	49.71
1654	834	73	1	10.32
1655	835	23	2	61.72
1656	835	24	1	49.22
1657	835	23	5	61.72
1658	836	5	3	749.81
1659	836	58	1	19.26
1660	837	8	1	50.48
1661	838	85	1	36.01
1662	838	78	2	24.71
1663	838	59	2	12.93
1664	839	48	3	17.79
1665	839	76	1	2.45
1666	839	24	1	49.22
1667	840	25	2	49.71
1668	840	91	3	25.91
1669	840	24	1	49.22
1670	841	76	2	2.45
1671	841	30	4	33.59
1672	842	68	1	170.95
1673	842	13	1	22.41
1674	843	69	1	62.48
1675	843	36	1	51.85
1676	843	25	1	49.71
1677	843	5	1	749.81
1678	844	64	1	42.6
1679	844	36	1	51.85
1680	845	18	1	33.18
1681	845	45	3	40.06
1682	846	79	2	6.88
1683	846	92	1	19.55
1684	846	45	4	40.06
1685	846	36	2	51.85
1686	847	73	1	10.32
1687	847	91	5	25.91
1688	848	92	2	19.55
1689	848	18	1	33.18
1690	849	36	2	51.85
1691	850	18	1	33.18
1692	850	24	1	49.22
1693	851	78	3	24.71
1694	851	53	1	43.04
1695	851	48	5	17.79
1696	852	45	1	40.06
1697	852	22	1	67.05
1698	853	46	1	24.74
1699	853	13	5	22.41
1700	853	25	2	49.71
1701	853	25	3	49.71
1702	854	89	1	11.22
1703	855	26	1	40.13
1704	855	15	3	15.19
1705	855	20	1	43.87
1706	855	33	5	77.74
1707	856	64	3	42.6
1708	857	16	1	10.08
1709	857	25	1	49.71
1710	857	97	2	12.46
1711	858	36	2	51.85
1712	859	25	1	49.71
1713	859	81	1	13.69
1714	860	6	1	652.7
1715	860	86	1	44.7
1716	861	78	1	24.71
1717	862	23	1	61.72
1718	862	78	1	24.71
1719	862	21	1	63.2
1720	863	68	1	170.95
1721	863	83	1	19.55
1722	863	71	2	7.99
1723	864	87	1	60.33
1724	865	24	1	49.22
1725	865	92	3	19.55
1726	866	85	1	36.01
1727	866	34	2	80.71
1728	866	5	2	749.81
1729	867	12	1	283.69
1730	868	79	1	6.88
1731	868	12	1	283.69
1732	868	62	1	24.18
1733	869	83	2	19.55
1734	869	48	5	17.79
1735	869	31	1	33.5
1736	869	81	4	13.69
1737	870	65	1	88.86
1738	870	77	1	34.75
1739	870	97	1	12.46
1740	871	25	4	49.71
1741	871	80	2	7.7
1742	871	25	1	49.71
1743	872	55	2	12.59
1744	872	21	3	63.2
1745	872	25	1	49.71
1746	873	3	1	286.67
1747	874	76	1	2.45
1748	874	47	1	17.6
1749	874	23	1	61.72
1750	875	43	1	69.98
1751	875	21	3	63.2
1752	875	12	4	283.69
1753	876	15	2	15.19
1754	877	47	1	17.6
1755	878	23	1	61.72
1756	878	3	4	286.67
1757	878	49	1	8.95
1758	879	36	1	51.85
1759	879	55	1	12.59
1760	879	25	4	49.71
1761	880	31	1	33.5
1762	881	25	1	49.71
1763	882	76	2	2.45
1764	883	46	1	24.74
1765	883	36	1	51.85
1766	884	92	1	19.55
1767	884	27	1	34.78
1768	885	30	1	33.59
1769	885	24	1	49.22
1770	886	25	1	49.71
1771	886	85	3	36.01
1772	886	18	3	33.18
1773	886	68	1	170.95
1774	887	9	1	155.72
1775	888	30	3	33.59
1776	889	32	1	84.97
1777	889	76	1	2.45
1778	890	70	2	64.32
1779	890	69	1	62.48
1780	891	30	1	33.59
1781	892	100	1	10.12
1782	893	5	1	749.81
1783	893	23	1	61.72
1784	893	11	2	369.57
1785	894	83	1	19.55
1786	895	48	1	17.79
1787	896	5	1	749.81
1788	896	70	2	64.32
1789	897	25	2	49.71
1790	897	39	2	41.87
1791	897	55	1	12.59
1792	897	8	1	50.48
1793	898	25	1	49.71
1794	898	16	3	10.08
1795	898	42	3	125.85
1796	898	68	4	170.95
1797	899	20	2	43.87
1798	899	6	3	652.7
1799	900	77	3	34.75
1800	900	25	4	49.71
1801	900	55	1	12.59
1802	901	30	2	33.59
1803	901	15	2	15.19
1804	902	16	1	10.08
1805	903	82	3	9.8
1806	903	12	1	283.69
1807	904	26	2	40.13
1808	905	68	1	170.95
1809	906	61	3	18.1
1810	906	86	1	44.7
1811	907	17	1	13.19
1812	908	96	3	46.73
1813	908	56	1	8.63
1814	908	68	4	170.95
1815	909	91	2	25.91
1816	909	22	3	67.05
1817	910	48	1	17.79
1818	910	71	1	7.99
1819	911	42	1	125.85
1820	912	60	4	22.42
1821	912	18	2	33.18
1822	912	67	1	183.38
1823	912	73	2	10.32
1824	913	44	1	54.57
1825	913	48	1	17.79
1826	914	62	1	24.18
1827	914	41	1	106.57
1828	915	28	4	38.97
1829	915	46	5	24.74
1830	915	70	4	64.32
1831	915	98	1	9.66
1832	916	30	1	33.59
1833	916	42	2	125.85
1834	917	91	1	25.91
1835	918	36	1	51.85
1836	919	78	2	24.71
1837	919	11	1	369.57
1838	920	45	1	40.06
1839	920	25	1	49.71
1840	921	30	1	33.59
1841	921	68	1	170.95
1842	921	36	1	51.85
1843	922	25	2	49.71
1844	923	25	2	49.71
1845	923	49	2	8.95
1846	923	25	2	49.71
1847	924	25	3	49.71
1848	925	66	1	66.4
1849	925	40	4	49.48
1850	925	44	1	54.57
1851	926	59	2	12.93
1852	927	86	2	44.7
1853	927	78	1	24.71
1854	927	38	5	141.29
1855	927	46	5	24.74
1856	928	84	1	26.83
1857	928	24	1	49.22
1858	929	15	2	15.19
1859	929	5	5	749.81
1860	930	64	4	42.6
1861	931	67	3	183.38
1862	932	45	1	40.06
1863	932	24	1	49.22
1864	933	53	1	43.04
1865	933	78	2	24.71
1866	934	25	1	49.71
1867	935	27	1	34.78
1868	936	25	2	49.71
1869	937	4	2	738.89
1870	938	30	3	33.59
1871	939	30	3	33.59
1872	939	78	1	24.71
1873	939	30	1	33.59
1874	939	25	3	49.71
1875	940	33	2	77.74
1876	941	25	1	49.71
1877	942	75	2	2.9
1878	943	47	1	17.6
1879	943	96	4	46.73
1880	944	97	5	12.46
1881	944	59	3	12.93
1882	944	73	1	10.32
1883	945	76	2	2.45
1884	946	89	1	11.22
1885	946	68	3	170.95
1886	946	91	3	25.91
1887	947	18	1	33.18
1888	948	25	1	49.71
1889	948	25	2	49.71
1890	949	59	1	12.93
1891	949	27	4	34.78
1892	949	33	1	77.74
1893	950	56	1	8.63
1894	951	94	1	20.26
1895	951	25	1	49.71
1896	951	90	1	13.02
1897	951	24	1	49.22
1898	952	52	2	14.33
1899	952	25	1	49.71
1900	952	86	1	44.7
1901	953	90	3	13.02
1902	954	83	2	19.55
1903	954	92	2	19.55
1904	954	25	1	49.71
1905	954	25	1	49.71
1906	955	78	2	24.71
1907	955	11	2	369.57
1908	955	61	1	18.1
1909	956	17	2	13.19
1910	957	25	1	49.71
1911	957	91	1	25.91
1912	957	4	2	738.89
1913	957	23	1	61.72
1914	958	84	2	26.83
1915	959	24	1	49.22
1916	959	45	1	40.06
1917	959	25	1	49.71
1918	959	78	1	24.71
1919	960	68	1	170.95
1920	961	79	1	6.88
1921	961	24	3	49.22
1922	961	8	1	50.48
1923	962	39	4	41.87
1924	962	25	2	49.71
1925	963	25	1	49.71
1926	963	27	1	34.78
1927	964	48	1	17.79
1928	964	25	1	49.71
1929	964	78	1	24.71
1930	965	88	1	14.38
1931	966	81	2	13.69
1932	966	24	2	49.22
1933	967	18	1	33.18
1934	967	99	2	7.62
1935	967	15	1	15.19
1936	968	99	5	7.62
1937	968	3	1	286.67
1938	969	7	1	38.61
1939	969	12	4	283.69
1940	969	48	2	17.79
1941	970	32	1	84.97
1942	971	1	1	414.28
1943	972	25	2	49.71
1944	972	21	3	63.2
1945	973	40	1	49.48
1946	974	30	1	33.59
1947	974	78	4	24.71
1948	975	19	1	40.25
1949	976	49	1	8.95
1950	976	56	2	8.63
1951	976	75	5	2.9
1952	977	80	1	7.7
1953	977	58	3	19.26
1954	977	68	1	170.95
1955	978	27	1	34.78
1956	978	45	1	40.06
1957	978	45	1	40.06
1958	979	91	2	25.91
1959	980	13	2	22.41
1960	980	76	1	2.45
1961	980	76	1	2.45
1962	981	45	3	40.06
1963	982	30	1	33.59
1964	983	25	1	49.71
1965	984	24	1	49.22
1966	984	76	1	2.45
1967	984	25	5	49.71
1968	985	18	2	33.18
1969	985	25	2	49.71
1970	985	25	1	49.71
1971	986	31	4	33.5
1972	987	88	2	14.38
1973	987	61	1	18.1
1974	988	89	2	11.22
1975	988	52	5	14.33
1976	989	31	1	33.5
1977	990	47	1	17.6
1978	990	53	4	43.04
1979	990	36	2	51.85
1980	991	29	2	41.05
1981	991	53	4	43.04
1982	992	76	1	2.45
1983	992	36	1	51.85
1984	993	95	2	48.75
1985	994	35	1	64.83
1986	994	67	5	183.38
1987	995	78	1	24.71
1988	996	85	1	36.01
1989	996	49	1	8.95
1990	997	24	2	49.22
1991	997	25	1	49.71
1992	998	17	1	13.19
1993	998	46	2	24.74
1994	999	78	1	24.71
1995	999	12	2	283.69
1996	1000	96	2	46.73
1997	1000	90	1	13.02
1998	1000	45	1	40.06
1999	1000	23	4	61.72
2000	1001	26	1	40.13
2001	1001	47	1	17.6
2002	1002	58	1	19.26
2003	1003	8	1	50.48
2004	1004	73	1	10.32
2005	1005	78	1	24.71
2006	1005	45	3	40.06
2007	1005	18	1	33.18
2008	1006	8	1	50.48
2009	1006	23	1	61.72
2010	1007	29	1	41.05
2011	1008	78	1	24.71
2012	1009	18	1	33.18
2013	1010	40	4	49.48
2014	1011	23	1	61.72
2015	1012	8	3	50.48
2016	1013	51	1	16.01
2017	1013	49	3	8.95
2018	1014	27	1	34.78
2019	1014	72	3	9.77
2020	1014	39	2	41.87
2021	1015	33	5	77.74
2022	1016	68	3	170.95
2023	1016	47	3	17.6
2024	1017	36	1	51.85
2025	1018	68	1	170.95
2026	1019	11	1	369.57
2027	1019	79	2	6.88
2028	1019	37	1	149.74
2029	1020	36	1	51.85
2030	1021	18	2	33.18
2031	1021	47	1	17.6
2032	1022	18	2	33.18
2033	1023	67	2	183.38
2034	1023	74	2	3.59
2035	1024	87	2	60.33
2036	1024	46	1	24.74
2037	1025	21	2	63.2
2038	1026	24	5	49.22
2039	1027	46	2	24.74
2040	1028	28	5	38.97
2041	1029	30	1	33.59
2042	1029	16	4	10.08
2043	1029	100	2	10.12
2044	1030	20	1	43.87
2045	1031	89	1	11.22
2046	1032	57	4	13.42
2047	1033	12	1	283.69
2048	1034	78	1	24.71
2049	1034	26	3	40.13
2050	1035	16	2	10.08
2051	1035	25	1	49.71
2052	1035	19	1	40.25
2053	1035	82	1	9.8
2054	1036	76	1	2.45
2055	1036	100	1	10.12
2056	1037	41	4	106.57
2057	1037	25	1	49.71
2058	1038	24	1	49.22
2059	1038	38	3	141.29
2060	1038	78	1	24.71
2061	1038	51	1	16.01
2062	1039	12	3	283.69
2063	1039	54	1	34.3
2064	1040	33	3	77.74
2065	1040	82	1	9.8
2066	1040	51	3	16.01
2067	1041	73	1	10.32
2068	1042	25	2	49.71
2069	1042	48	1	17.79
2070	1043	76	4	2.45
2071	1043	25	1	49.71
2072	1044	25	1	49.71
2073	1044	98	2	9.66
2074	1044	36	1	51.85
2075	1044	17	1	13.19
2076	1045	54	1	34.3
2077	1046	24	1	49.22
2078	1046	68	1	170.95
2079	1046	88	2	14.38
2080	1046	96	2	46.73
2081	1047	63	2	33.06
2082	1048	1	1	414.28
2083	1048	96	2	46.73
2084	1048	8	1	50.48
2085	1049	35	1	64.83
2086	1050	86	1	44.7
2087	1051	25	1	49.71
2088	1052	24	1	49.22
2089	1053	25	1	49.71
2090	1053	35	3	64.83
2091	1054	100	1	10.12
2092	1055	7	1	38.61
2093	1056	20	1	43.87
2094	1057	30	2	33.59
2095	1058	37	1	149.74
2096	1058	71	3	7.99
2097	1059	36	1	51.85
2098	1059	48	1	17.79
2099	1060	25	1	49.71
2100	1060	40	1	49.48
2101	1060	96	1	46.73
2102	1061	27	2	34.78
2103	1062	25	2	49.71
2104	1062	60	1	22.42
2105	1062	12	1	283.69
2106	1062	37	5	149.74
2107	1063	45	3	40.06
2108	1063	53	1	43.04
2109	1064	57	1	13.42
2110	1064	27	3	34.78
2111	1065	26	2	40.13
2112	1065	63	2	33.06
2113	1065	26	1	40.13
2114	1066	69	1	62.48
2115	1066	68	2	170.95
2116	1066	60	3	22.42
2117	1067	97	2	12.46
2118	1068	85	4	36.01
2119	1068	18	1	33.18
2120	1068	71	2	7.99
2121	1068	5	1	749.81
2122	1069	36	5	51.85
2123	1069	25	1	49.71
2124	1069	95	4	48.75
2125	1070	77	1	34.75
2126	1070	30	1	33.59
2127	1070	2	1	434.66
2128	1071	17	1	13.19
2129	1071	30	1	33.59
2130	1072	32	2	84.97
2131	1073	56	2	8.63
2132	1073	25	1	49.71
2133	1073	36	2	51.85
2134	1074	18	1	33.18
2135	1074	45	3	40.06
2136	1075	3	1	286.67
2137	1075	50	2	6.73
2138	1075	78	2	24.71
2139	1076	84	2	26.83
2140	1077	34	2	80.71
2141	1077	5	2	749.81
2142	1078	57	2	13.42
2143	1079	49	2	8.95
2144	1080	52	1	14.33
2145	1080	8	4	50.48
2146	1080	65	2	88.86
2147	1081	25	2	49.71
2148	1081	77	1	34.75
2149	1081	51	1	16.01
2150	1082	40	1	49.48
2151	1082	25	1	49.71
2152	1082	78	1	24.71
2153	1082	25	1	49.71
2154	1083	24	2	49.22
2155	1083	32	1	84.97
2156	1084	47	2	17.6
2157	1084	24	1	49.22
2158	1085	32	1	84.97
2159	1085	26	1	40.13
2160	1086	7	2	38.61
2161	1087	86	1	44.7
2162	1088	21	1	63.2
2163	1088	40	4	49.48
2164	1088	31	5	33.5
2165	1089	52	2	14.33
2166	1089	24	3	49.22
2167	1089	78	4	24.71
2168	1090	36	1	51.85
2169	1090	27	1	34.78
2170	1091	25	1	49.71
2171	1092	90	2	13.02
2172	1092	31	1	33.5
2173	1093	6	2	652.7
2174	1093	57	1	13.42
2175	1094	71	2	7.99
2176	1095	59	1	12.93
2177	1096	13	1	22.41
2178	1096	62	4	24.18
2179	1096	30	1	33.59
2180	1097	89	1	11.22
2181	1097	25	1	49.71
2182	1097	63	1	33.06
2183	1098	38	1	141.29
2184	1098	50	3	6.73
2185	1098	57	1	13.42
2186	1099	27	1	34.78
2187	1100	27	1	34.78
2188	1101	16	4	10.08
2189	1101	24	1	49.22
2190	1102	64	3	42.6
2191	1102	25	3	49.71
2192	1103	49	1	8.95
2193	1103	66	1	66.4
2194	1103	25	1	49.71
2195	1104	99	2	7.62
2196	1105	1	1	414.28
2197	1105	63	1	33.06
2198	1106	37	1	149.74
2199	1106	34	1	80.71
2200	1107	25	1	49.71
2201	1107	64	1	42.6
2202	1107	36	1	51.85
2203	1108	31	1	33.5
2204	1108	56	1	8.63
2205	1108	12	2	283.69
2206	1108	83	2	19.55
2207	1109	58	1	19.26
2208	1109	28	4	38.97
2209	1110	47	1	17.6
2210	1110	25	1	49.71
2211	1111	66	1	66.4
2212	1112	47	2	17.6
2213	1112	94	1	20.26
2214	1113	25	1	49.71
2215	1113	63	1	33.06
2216	1113	25	2	49.71
2217	1114	48	1	17.79
2218	1114	14	3	27.1
2219	1114	25	1	49.71
2220	1115	23	2	61.72
2221	1116	62	1	24.18
2222	1117	71	1	7.99
2223	1117	52	1	14.33
2224	1118	25	4	49.71
2225	1119	25	1	49.71
2226	1119	25	2	49.71
2227	1119	24	4	49.22
2228	1120	25	1	49.71
2229	1120	83	1	19.55
2230	1120	74	2	3.59
2231	1120	54	2	34.3
2232	1121	22	1	67.05
2233	1122	34	4	80.71
2234	1122	36	1	51.85
2235	1123	30	1	33.59
2236	1124	46	1	24.74
2237	1125	49	3	8.95
2238	1125	25	1	49.71
2239	1125	64	4	42.6
2240	1126	25	2	49.71
2241	1126	41	1	106.57
2242	1126	42	2	125.85
2243	1127	48	1	17.79
2244	1127	12	2	283.69
2245	1128	78	3	24.71
2246	1129	68	1	170.95
2247	1130	12	3	283.69
2248	1130	25	2	49.71
2249	1131	76	4	2.45
2250	1132	42	2	125.85
2251	1132	94	1	20.26
2252	1132	25	4	49.71
2253	1133	22	2	67.05
2254	1134	25	1	49.71
2255	1134	25	1	49.71
2256	1134	85	1	36.01
2257	1135	20	5	43.87
2258	1135	36	1	51.85
2259	1136	95	3	48.75
2260	1136	87	1	60.33
2261	1136	21	1	63.2
2262	1136	31	2	33.5
2263	1137	11	1	369.57
2264	1137	24	1	49.22
2265	1138	12	3	283.69
2266	1138	9	1	155.72
2267	1138	8	3	50.48
2268	1139	21	1	63.2
2269	1139	28	2	38.97
2270	1139	7	2	38.61
2271	1140	43	2	69.98
2272	1140	25	1	49.71
2273	1141	25	1	49.71
2274	1142	69	2	62.48
2275	1143	43	2	69.98
2276	1144	12	2	283.69
2277	1145	54	1	34.3
2278	1146	25	2	49.71
2279	1147	37	1	149.74
2280	1147	33	2	77.74
2281	1148	68	1	170.95
2282	1148	70	1	64.32
2283	1148	91	1	25.91
2284	1149	24	2	49.22
2285	1149	63	4	33.06
2286	1149	56	5	8.63
2287	1150	25	2	49.71
2288	1151	36	3	51.85
2289	1151	27	1	34.78
2290	1152	89	1	11.22
2291	1152	64	2	42.6
2292	1153	25	1	49.71
2293	1154	47	5	17.6
2294	1154	28	1	38.97
2295	1155	90	1	13.02
2296	1156	55	5	12.59
2297	1156	85	1	36.01
2298	1157	25	3	49.71
2299	1158	85	1	36.01
2300	1158	59	2	12.93
2301	1159	99	1	7.62
2302	1160	36	3	51.85
2303	1161	68	1	170.95
2304	1161	70	1	64.32
2305	1162	66	5	66.4
2306	1163	45	1	40.06
2307	1163	12	1	283.69
2308	1163	70	2	64.32
2309	1164	25	3	49.71
2310	1164	47	1	17.6
2311	1165	25	4	49.71
2312	1165	90	1	13.02
2313	1165	39	1	41.87
2314	1166	97	2	12.46
2315	1166	23	1	61.72
2316	1166	22	1	67.05
2317	1167	25	2	49.71
2318	1167	31	1	33.5
2319	1168	56	2	8.63
2320	1169	12	2	283.69
2321	1169	40	2	49.48
2322	1169	98	1	9.66
2323	1170	51	1	16.01
2324	1171	47	5	17.6
2325	1172	46	1	24.74
2326	1172	43	1	69.98
2327	1172	25	3	49.71
2328	1173	1	1	414.28
2329	1174	24	1	49.22
2330	1175	25	2	49.71
2331	1176	46	4	24.74
2332	1176	41	2	106.57
2333	1176	26	1	40.13
2334	1177	41	1	106.57
2335	1177	68	2	170.95
2336	1177	25	1	49.71
2337	1178	34	1	80.71
2338	1178	47	1	17.6
2339	1179	25	1	49.71
2340	1180	27	3	34.78
2341	1181	25	2	49.71
2342	1181	64	1	42.6
2343	1182	47	4	17.6
2344	1182	36	1	51.85
2345	1182	18	2	33.18
2346	1183	61	1	18.1
2347	1184	25	1	49.71
2348	1185	48	1	17.79
2349	1185	68	2	170.95
2350	1185	38	1	141.29
2351	1185	87	4	60.33
2352	1186	30	1	33.59
2353	1187	24	1	49.22
2354	1188	25	1	49.71
2355	1189	87	4	60.33
2356	1189	48	3	17.79
2357	1190	23	2	61.72
2358	1191	5	3	749.81
2359	1191	30	1	33.59
2360	1191	25	1	49.71
2361	1192	52	1	14.33
2362	1192	78	2	24.71
2363	1192	73	1	10.32
2364	1193	30	1	33.59
2365	1193	94	4	20.26
2366	1194	46	1	24.74
2367	1194	9	1	155.72
2368	1194	25	5	49.71
2369	1195	12	1	283.69
2370	1195	84	1	26.83
2371	1195	68	1	170.95
2372	1195	90	1	13.02
2373	1196	63	2	33.06
2374	1197	48	1	17.79
2375	1197	52	1	14.33
2376	1197	63	2	33.06
2377	1197	59	1	12.93
2378	1198	22	1	67.05
2379	1198	25	1	49.71
2380	1199	25	2	49.71
2381	1199	37	1	149.74
2382	1199	35	3	64.83
2383	1200	24	1	49.22
2384	1200	53	3	43.04
2385	1200	99	1	7.62
2386	1200	67	2	183.38
2387	1201	38	1	141.29
2388	1202	42	1	125.85
2389	1202	51	2	16.01
2390	1203	97	4	12.46
2391	1203	97	2	12.46
2392	1204	42	4	125.85
2393	1205	76	1	2.45
2394	1205	20	2	43.87
2395	1206	25	1	49.71
2396	1207	78	4	24.71
2397	1208	49	3	8.95
2398	1208	30	2	33.59
2399	1208	25	2	49.71
2400	1209	25	1	49.71
2401	1209	30	2	33.59
2402	1209	91	4	25.91
2403	1209	74	1	3.59
2404	1210	66	1	66.4
2405	1211	26	1	40.13
2406	1211	42	2	125.85
2407	1212	25	1	49.71
2408	1212	18	2	33.18
2409	1212	8	1	50.48
2410	1212	18	1	33.18
2411	1213	25	1	49.71
2412	1214	28	3	38.97
2413	1214	7	2	38.61
2414	1214	22	4	67.05
2415	1214	23	1	61.72
2416	1215	27	2	34.78
2417	1216	90	1	13.02
2418	1216	83	1	19.55
2419	1217	13	2	22.41
2420	1218	49	1	8.95
2421	1218	4	1	738.89
2422	1218	68	2	170.95
2423	1219	62	1	24.18
2424	1220	9	2	155.72
2425	1221	73	1	10.32
2426	1221	55	2	12.59
2427	1222	25	4	49.71
2428	1222	30	4	33.59
2429	1223	72	1	9.77
2430	1224	33	2	77.74
2431	1225	11	1	369.57
2432	1225	52	1	14.33
2433	1225	15	1	15.19
2434	1226	10	1	101.01
2435	1226	72	3	9.77
2436	1226	12	2	283.69
2437	1227	26	2	40.13
2438	1228	2	1	434.66
2439	1229	28	2	38.97
2440	1229	14	1	27.1
2441	1230	50	1	6.73
2442	1230	18	2	33.18
2443	1230	68	1	170.95
2444	1230	60	2	22.42
2445	1231	19	1	40.25
2446	1231	66	1	66.4
2447	1231	12	3	283.69
2448	1231	25	1	49.71
2449	1232	26	1	40.13
2450	1232	39	1	41.87
2451	1232	27	1	34.78
2452	1232	48	3	17.79
2453	1233	26	1	40.13
2454	1233	57	1	13.42
2455	1234	36	1	51.85
2456	1234	25	2	49.71
2457	1234	53	2	43.04
2458	1235	93	2	19.24
2459	1235	77	1	34.75
2460	1236	8	1	50.48
2461	1237	36	1	51.85
2462	1237	29	1	41.05
2463	1237	25	2	49.71
2464	1237	65	1	88.86
2465	1238	96	1	46.73
2466	1238	4	2	738.89
2467	1239	72	4	9.77
2468	1240	36	1	51.85
2469	1241	25	1	49.71
2470	1241	45	2	40.06
2471	1241	47	5	17.6
2472	1242	14	1	27.1
2473	1242	25	2	49.71
2474	1242	55	1	12.59
2475	1243	92	1	19.55
2476	1243	57	1	13.42
2477	1244	29	1	41.05
2478	1244	100	2	10.12
2479	1245	42	1	125.85
2480	1246	87	1	60.33
2481	1246	36	1	51.85
2482	1247	83	4	19.55
2483	1247	25	5	49.71
2484	1247	23	2	61.72
2485	1248	46	1	24.74
2486	1248	76	1	2.45
2487	1248	97	1	12.46
2488	1249	39	2	41.87
2489	1250	21	3	63.2
2490	1250	74	1	3.59
2491	1251	68	1	170.95
2492	1252	41	2	106.57
2493	1253	76	2	2.45
2494	1254	91	1	25.91
2495	1254	56	1	8.63
2496	1254	92	1	19.55
2497	1255	23	1	61.72
2498	1256	26	2	40.13
2499	1256	26	1	40.13
2500	1256	54	2	34.3
2501	1257	25	1	49.71
2502	1258	31	1	33.5
2503	1259	73	2	10.32
2504	1259	96	2	46.73
2505	1259	68	2	170.95
2506	1259	24	1	49.22
2507	1260	23	5	61.72
2508	1260	18	1	33.18
2509	1261	82	4	9.8
2510	1262	25	1	49.71
2511	1263	12	1	283.69
2512	1263	34	3	80.71
2513	1264	21	1	63.2
2514	1265	46	1	24.74
2515	1265	24	3	49.22
2516	1265	80	1	7.7
2517	1266	25	1	49.71
2518	1266	87	2	60.33
2519	1266	2	1	434.66
2520	1267	32	1	84.97
2521	1267	27	1	34.78
2522	1267	25	4	49.71
2523	1268	68	1	170.95
2524	1269	32	3	84.97
2525	1269	78	1	24.71
2526	1269	99	1	7.62
2527	1270	25	1	49.71
2528	1270	77	1	34.75
2529	1270	8	4	50.48
2530	1271	35	1	64.83
2531	1271	58	1	19.26
2532	1272	41	4	106.57
2533	1273	54	2	34.3
2534	1274	72	1	9.77
2535	1275	26	2	40.13
2536	1276	23	1	61.72
2537	1276	83	1	19.55
2538	1277	25	3	49.71
2539	1277	45	1	40.06
2540	1277	36	4	51.85
2541	1277	25	1	49.71
2542	1278	97	1	12.46
2543	1279	44	1	54.57
2544	1279	23	1	61.72
2545	1279	48	1	17.79
2546	1279	16	3	10.08
2547	1280	70	2	64.32
2548	1280	43	1	69.98
2549	1280	41	1	106.57
2550	1280	89	1	11.22
2551	1281	56	1	8.63
2552	1281	25	1	49.71
2553	1282	25	1	49.71
2554	1282	91	1	25.91
2555	1283	18	3	33.18
2556	1283	11	3	369.57
2557	1284	34	1	80.71
2558	1284	76	1	2.45
2559	1285	96	1	46.73
2560	1286	61	2	18.1
2561	1287	49	1	8.95
2562	1288	34	1	80.71
2563	1288	25	2	49.71
2564	1288	23	1	61.72
2565	1288	25	1	49.71
2566	1289	53	1	43.04
2567	1289	48	5	17.79
2568	1289	87	1	60.33
2569	1290	47	1	17.6
2570	1290	18	2	33.18
2571	1290	40	1	49.48
2572	1291	36	1	51.85
2573	1291	68	1	170.95
2574	1291	51	1	16.01
2575	1292	85	3	36.01
2576	1293	25	2	49.71
2577	1294	29	2	41.05
2578	1294	96	3	46.73
2579	1294	17	1	13.19
2580	1295	97	4	12.46
2581	1295	57	1	13.42
2582	1295	25	4	49.71
2583	1296	72	3	9.77
2584	1296	51	1	16.01
2585	1297	25	1	49.71
2586	1297	30	2	33.59
2587	1298	36	2	51.85
2588	1298	29	1	41.05
2589	1298	63	1	33.06
2590	1299	18	1	33.18
2591	1300	18	2	33.18
2592	1300	10	1	101.01
2593	1301	48	1	17.79
2594	1301	99	1	7.62
2595	1301	40	2	49.48
2596	1302	25	2	49.71
2597	1303	50	1	6.73
2598	1304	25	3	49.71
2599	1304	36	1	51.85
2600	1304	93	1	19.24
2601	1305	92	1	19.55
2602	1305	11	2	369.57
2603	1306	97	1	12.46
2604	1306	5	2	749.81
2605	1306	24	2	49.22
2606	1306	48	1	17.79
2607	1307	24	4	49.22
2608	1307	50	1	6.73
2609	1308	54	3	34.3
2610	1308	63	1	33.06
2611	1308	18	3	33.18
2612	1309	36	1	51.85
2613	1309	23	1	61.72
2614	1310	48	1	17.79
2615	1310	40	1	49.48
2616	1310	13	2	22.41
2617	1311	99	2	7.62
2618	1311	55	1	12.59
2619	1312	99	1	7.62
2620	1312	56	3	8.63
2621	1312	34	2	80.71
2622	1313	69	2	62.48
2623	1314	30	3	33.59
2624	1314	25	1	49.71
2625	1315	12	1	283.69
2626	1315	31	1	33.5
2627	1315	48	1	17.79
2628	1316	63	1	33.06
2629	1317	23	1	61.72
2630	1318	14	1	27.1
2631	1319	39	2	41.87
2632	1319	6	2	652.7
2633	1319	89	3	11.22
2634	1319	46	1	24.74
2635	1320	25	1	49.71
2636	1320	56	1	8.63
2637	1320	47	1	17.6
2638	1321	30	1	33.59
2639	1321	39	1	41.87
2640	1321	23	1	61.72
2641	1321	48	1	17.79
2642	1322	25	1	49.71
2643	1322	67	1	183.38
2644	1322	78	4	24.71
2645	1323	80	3	7.7
2646	1324	45	2	40.06
2647	1324	36	2	51.85
2648	1325	4	1	738.89
2649	1326	15	1	15.19
2650	1326	60	1	22.42
2651	1326	26	2	40.13
2652	1327	14	2	27.1
2653	1328	79	3	6.88
2654	1329	56	1	8.63
2655	1329	34	1	80.71
2656	1329	30	2	33.59
2657	1330	23	1	61.72
2658	1331	35	1	64.83
2659	1331	24	3	49.22
2660	1331	91	1	25.91
2661	1332	12	3	283.69
2662	1332	29	1	41.05
2663	1333	25	4	49.71
2664	1333	28	1	38.97
2665	1334	6	4	652.7
2666	1335	41	1	106.57
2667	1335	25	1	49.71
2668	1336	33	4	77.74
2669	1336	68	1	170.95
2670	1336	36	2	51.85
2671	1337	99	1	7.62
2672	1337	5	4	749.81
2673	1337	25	1	49.71
2674	1338	64	5	42.6
2675	1338	90	1	13.02
2676	1339	59	2	12.93
2677	1340	24	5	49.22
2678	1340	24	2	49.22
2679	1340	25	1	49.71
2680	1341	42	3	125.85
2681	1342	68	4	170.95
2682	1343	16	2	10.08
2683	1343	27	1	34.78
2684	1344	25	1	49.71
2685	1344	78	1	24.71
2686	1345	49	1	8.95
2687	1346	11	1	369.57
2688	1347	56	1	8.63
2689	1347	47	1	17.6
2690	1347	57	4	13.42
2691	1348	99	3	7.62
2692	1349	5	1	749.81
2693	1349	12	2	283.69
2694	1349	28	1	38.97
2695	1350	32	1	84.97
2696	1350	39	1	41.87
2697	1351	63	2	33.06
2698	1351	55	5	12.59
2699	1352	36	1	51.85
2700	1352	78	2	24.71
2701	1353	15	5	15.19
2702	1353	16	1	10.08
2703	1354	25	1	49.71
2704	1354	57	2	13.42
2705	1354	9	2	155.72
2706	1355	24	1	49.22
2707	1356	25	2	49.71
2708	1357	78	1	24.71
2709	1357	25	2	49.71
2710	1357	52	1	14.33
2711	1357	63	1	33.06
2712	1358	95	1	48.75
2713	1359	28	1	38.97
2714	1360	78	1	24.71
2715	1360	15	3	15.19
2716	1360	58	1	19.26
2717	1360	24	1	49.22
2718	1361	18	1	33.18
2719	1361	77	1	34.75
2720	1362	25	1	49.71
2721	1362	58	1	19.26
2722	1362	94	3	20.26
2723	1363	67	1	183.38
2724	1364	46	3	24.74
2725	1364	15	1	15.19
2726	1364	27	1	34.78
2727	1365	25	1	49.71
2728	1366	45	1	40.06
2729	1366	64	1	42.6
2730	1366	30	1	33.59
2731	1367	96	1	46.73
2732	1367	47	2	17.6
2733	1368	98	4	9.66
2734	1368	25	3	49.71
2735	1369	37	1	149.74
2736	1369	91	2	25.91
2737	1369	57	2	13.42
2738	1370	33	1	77.74
2739	1371	74	1	3.59
2740	1371	73	1	10.32
2741	1371	68	1	170.95
2742	1371	78	1	24.71
2743	1372	12	2	283.69
2744	1372	72	5	9.77
2745	1372	73	1	10.32
2746	1372	62	2	24.18
2747	1373	85	1	36.01
2748	1373	42	1	125.85
2749	1374	26	1	40.13
2750	1374	40	1	49.48
2751	1375	36	1	51.85
2752	1375	14	1	27.1
2753	1375	25	3	49.71
2754	1375	48	2	17.79
2755	1376	24	1	49.22
2756	1376	36	1	51.85
2757	1376	41	1	106.57
2758	1377	70	5	64.32
2759	1377	36	2	51.85
2760	1377	8	4	50.48
2761	1378	76	2	2.45
2762	1378	25	2	49.71
2763	1378	52	1	14.33
2764	1379	90	1	13.02
2765	1379	24	2	49.22
2766	1380	89	1	11.22
2767	1380	94	2	20.26
2768	1381	24	2	49.22
2769	1381	25	2	49.71
2770	1382	9	1	155.72
2771	1382	56	3	8.63
2772	1383	62	1	24.18
2773	1384	12	5	283.69
2774	1385	59	1	12.93
2775	1386	25	1	49.71
2776	1386	34	5	80.71
2777	1386	88	1	14.38
2778	1387	36	1	51.85
2779	1388	19	3	40.25
2780	1389	26	3	40.13
2781	1390	56	4	8.63
2782	1390	24	2	49.22
2783	1391	93	1	19.24
2784	1391	90	1	13.02
2785	1391	93	1	19.24
2786	1392	36	4	51.85
2787	1392	11	1	369.57
2788	1392	15	1	15.19
2789	1392	24	3	49.22
2790	1393	23	1	61.72
2791	1393	58	1	19.26
2792	1394	5	1	749.81
2793	1395	23	2	61.72
2794	1395	25	2	49.71
2795	1395	25	2	49.71
2796	1396	59	2	12.93
2797	1396	95	5	48.75
2798	1397	46	3	24.74
2799	1398	36	1	51.85
2800	1399	25	1	49.71
2801	1400	20	1	43.87
2802	1400	73	1	10.32
2803	1401	40	1	49.48
2804	1402	96	2	46.73
2805	1402	26	1	40.13
2806	1402	36	1	51.85
2807	1402	85	3	36.01
2808	1403	12	2	283.69
2809	1403	98	2	9.66
2810	1403	25	1	49.71
2811	1404	36	2	51.85
2812	1405	26	2	40.13
2813	1405	53	1	43.04
2814	1406	14	2	27.1
2815	1407	61	2	18.1
2816	1407	5	1	749.81
2817	1408	80	5	7.7
2818	1409	25	1	49.71
2819	1410	71	2	7.99
2820	1410	24	1	49.22
2821	1411	73	1	10.32
2822	1412	24	3	49.22
2823	1412	25	1	49.71
2824	1413	26	1	40.13
2825	1414	59	1	12.93
2826	1415	23	1	61.72
2827	1415	91	1	25.91
2828	1415	82	1	9.8
2829	1416	14	2	27.1
2830	1416	96	3	46.73
2831	1417	45	1	40.06
2832	1417	36	2	51.85
2833	1418	85	1	36.01
2834	1418	80	3	7.7
2835	1419	39	3	41.87
2836	1420	24	5	49.22
2837	1420	88	2	14.38
2838	1421	40	1	49.48
2839	1421	19	1	40.25
2840	1421	98	1	9.66
2841	1422	74	1	3.59
2842	1422	18	4	33.18
2843	1423	24	1	49.22
2844	1424	88	2	14.38
2845	1424	87	1	60.33
2846	1424	30	2	33.59
2847	1425	68	1	170.95
2848	1425	27	1	34.78
2849	1426	12	4	283.69
2850	1426	21	3	63.2
2851	1426	57	1	13.42
2852	1427	48	2	17.79
2853	1427	22	1	67.05
2854	1427	20	2	43.87
2855	1427	42	1	125.85
2856	1428	36	2	51.85
2857	1428	68	1	170.95
2858	1428	67	4	183.38
2859	1429	70	1	64.32
2860	1429	18	1	33.18
2861	1429	26	1	40.13
2862	1430	30	2	33.59
2863	1430	24	1	49.22
2864	1430	51	1	16.01
2865	1431	25	1	49.71
2866	1432	90	1	13.02
2867	1433	24	2	49.22
2868	1433	34	4	80.71
2869	1433	35	1	64.83
2870	1434	28	2	38.97
2871	1434	24	1	49.22
2872	1434	72	3	9.77
2873	1435	23	1	61.72
2874	1436	30	1	33.59
2875	1436	57	1	13.42
2876	1437	79	1	6.88
2877	1438	45	1	40.06
2878	1439	26	2	40.13
2879	1440	26	1	40.13
2880	1440	85	1	36.01
2881	1441	25	1	49.71
2882	1441	24	1	49.22
2883	1441	21	1	63.2
2884	1441	66	2	66.4
2885	1442	25	3	49.71
2886	1443	73	2	10.32
2887	1444	23	2	61.72
2888	1444	58	1	19.26
2889	1444	64	1	42.6
2890	1444	21	5	63.2
2891	1445	5	1	749.81
2892	1445	22	2	67.05
2893	1445	76	4	2.45
2894	1446	88	1	14.38
2895	1446	73	2	10.32
2896	1447	66	2	66.4
2897	1447	24	3	49.22
2898	1447	62	1	24.18
2899	1448	21	1	63.2
2900	1449	48	2	17.79
2901	1449	52	2	14.33
2902	1450	39	1	41.87
2903	1450	24	1	49.22
2904	1451	90	3	13.02
2905	1452	68	1	170.95
2906	1452	25	3	49.71
2907	1453	69	1	62.48
2908	1453	76	1	2.45
2909	1454	5	1	749.81
2910	1455	26	2	40.13
2911	1455	9	1	155.72
2912	1456	79	1	6.88
2913	1456	68	1	170.95
2914	1457	25	1	49.71
2915	1457	30	1	33.59
2916	1457	24	1	49.22
2917	1457	5	2	749.81
2918	1458	78	1	24.71
2919	1458	18	3	33.18
2920	1458	25	1	49.71
2921	1459	47	1	17.6
2922	1460	94	1	20.26
2923	1461	92	1	19.55
2924	1461	27	1	34.78
2925	1461	12	1	283.69
2926	1462	39	1	41.87
2927	1463	14	1	27.1
2928	1464	25	1	49.71
2929	1465	25	1	49.71
2930	1465	46	2	24.74
2931	1466	19	1	40.25
2932	1466	41	2	106.57
2933	1467	47	3	17.6
2934	1468	25	1	49.71
2935	1468	11	1	369.57
2936	1468	59	1	12.93
2937	1468	85	2	36.01
2938	1469	46	2	24.74
2939	1469	47	3	17.6
2940	1470	78	1	24.71
2941	1470	25	1	49.71
2942	1470	96	1	46.73
2943	1470	96	2	46.73
2944	1471	23	1	61.72
2945	1472	12	1	283.69
2946	1473	6	1	652.7
2947	1473	100	4	10.12
2948	1473	46	2	24.74
2949	1474	100	3	10.12
2950	1475	17	1	13.19
2951	1475	89	1	11.22
2952	1475	25	1	49.71
2953	1475	35	2	64.83
2954	1476	95	2	48.75
2955	1476	41	2	106.57
2956	1476	11	2	369.57
2957	1476	1	2	414.28
2958	1477	79	1	6.88
2959	1477	68	1	170.95
2960	1477	73	1	10.32
2961	1477	69	3	62.48
2962	1478	36	1	51.85
2963	1478	57	5	13.42
2964	1478	36	1	51.85
2965	1479	96	2	46.73
2966	1480	24	2	49.22
2967	1480	100	1	10.12
2968	1481	67	1	183.38
2969	1481	68	2	170.95
2970	1482	61	1	18.1
2971	1482	74	2	3.59
2972	1482	21	1	63.2
2973	1482	78	2	24.71
2974	1483	80	4	7.7
2975	1483	22	1	67.05
2976	1484	57	1	13.42
2977	1485	25	2	49.71
2978	1486	93	1	19.24
2979	1487	65	1	88.86
2980	1487	12	1	283.69
2981	1487	18	1	33.18
2982	1488	63	1	33.06
2983	1489	25	1	49.71
2984	1490	57	1	13.42
2985	1491	44	2	54.57
2986	1492	58	2	19.26
2987	1492	43	3	69.98
2988	1492	24	1	49.22
2989	1493	41	2	106.57
2990	1494	18	1	33.18
2991	1494	56	1	8.63
2992	1494	24	2	49.22
2993	1495	41	1	106.57
2994	1495	24	2	49.22
2995	1496	56	3	8.63
2996	1496	57	1	13.42
2997	1496	26	1	40.13
2998	1496	12	1	283.69
2999	1497	32	3	84.97
3000	1498	81	3	13.69
3001	1498	47	1	17.6
3002	1499	25	2	49.71
3003	1499	25	2	49.71
3004	1499	99	1	7.62
3005	1500	31	2	33.5
3006	1500	26	1	40.13
3007	1501	24	2	49.22
3008	1501	24	2	49.22
3009	1502	56	1	8.63
3010	1503	97	2	12.46
3011	1503	30	1	33.59
3012	1504	23	1	61.72
3013	1505	25	1	49.71
3014	1505	24	5	49.22
3015	1505	24	1	49.22
3016	1506	25	5	49.71
3017	1507	98	1	9.66
3018	1507	76	1	2.45
3019	1508	79	2	6.88
3020	1509	42	2	125.85
3021	1510	7	1	38.61
3022	1510	25	2	49.71
3023	1511	12	1	283.69
3024	1511	22	3	67.05
3025	1511	7	2	38.61
3026	1512	86	1	44.7
3027	1512	72	1	9.77
3028	1513	40	1	49.48
3029	1513	1	3	414.28
3030	1513	21	1	63.2
3031	1514	12	1	283.69
3032	1514	87	2	60.33
3033	1514	27	4	34.78
3034	1515	25	1	49.71
3035	1516	2	1	434.66
3036	1517	95	1	48.75
3037	1518	45	1	40.06
3038	1519	98	1	9.66
3039	1519	5	1	749.81
3040	1520	7	2	38.61
3041	1520	44	3	54.57
3042	1521	19	1	40.25
3043	1521	25	2	49.71
3044	1522	5	1	749.81
3045	1523	46	1	24.74
3046	1523	25	2	49.71
3047	1524	24	1	49.22
3048	1524	25	1	49.71
3049	1525	76	2	2.45
3050	1526	36	1	51.85
3051	1526	99	1	7.62
3052	1527	25	1	49.71
3053	1527	27	1	34.78
3054	1528	99	2	7.62
3055	1529	27	1	34.78
3056	1529	27	1	34.78
3057	1530	88	5	14.38
3058	1530	57	1	13.42
3059	1531	76	1	2.45
3060	1531	18	1	33.18
3061	1531	91	1	25.91
3062	1532	49	2	8.95
3063	1532	83	1	19.55
3064	1533	63	1	33.06
3065	1534	16	2	10.08
3066	1534	83	4	19.55
3067	1534	47	4	17.6
3068	1535	79	2	6.88
3069	1535	51	3	16.01
3070	1535	36	2	51.85
3071	1535	19	3	40.25
3072	1536	57	2	13.42
3073	1536	12	1	283.69
3074	1537	36	5	51.85
3075	1538	67	1	183.38
3076	1539	25	1	49.71
3077	1539	45	1	40.06
3078	1539	39	1	41.87
3079	1539	2	1	434.66
3080	1540	76	1	2.45
3081	1540	64	1	42.6
3082	1540	49	1	8.95
3083	1541	94	1	20.26
3084	1542	25	2	49.71
3085	1543	76	3	2.45
3086	1544	25	1	49.71
3087	1544	48	1	17.79
3088	1544	66	1	66.4
3089	1545	18	1	33.18
3090	1545	48	1	17.79
3091	1545	25	1	49.71
3092	1546	23	3	61.72
3093	1547	66	4	66.4
3094	1547	24	1	49.22
3095	1547	36	1	51.85
3096	1547	64	1	42.6
3097	1548	26	2	40.13
3098	1548	21	5	63.2
3099	1548	78	1	24.71
3100	1548	96	2	46.73
3101	1549	73	2	10.32
3102	1549	18	1	33.18
3103	1550	21	2	63.2
3104	1550	86	1	44.7
3105	1551	41	2	106.57
3106	1551	47	5	17.6
3107	1551	12	5	283.69
3108	1551	54	5	34.3
3109	1552	68	1	170.95
3110	1553	49	1	8.95
3111	1553	91	1	25.91
3112	1554	37	1	149.74
3113	1555	12	1	283.69
3114	1555	48	2	17.79
3115	1555	24	3	49.22
3116	1556	16	3	10.08
3117	1556	5	1	749.81
3118	1556	24	1	49.22
3119	1557	48	1	17.79
3120	1558	55	1	12.59
3121	1559	23	1	61.72
3122	1560	87	2	60.33
3123	1560	36	2	51.85
3124	1560	68	1	170.95
3125	1561	24	3	49.22
3126	1561	64	3	42.6
3127	1562	6	2	652.7
3128	1562	25	2	49.71
3129	1562	23	1	61.72
3130	1563	27	1	34.78
3131	1564	40	2	49.48
3132	1564	27	2	34.78
3133	1564	76	2	2.45
3134	1565	53	2	43.04
3135	1565	18	1	33.18
3136	1565	25	1	49.71
3137	1566	25	3	49.71
3138	1566	24	3	49.22
3139	1567	64	1	42.6
3140	1568	8	3	50.48
3141	1568	25	1	49.71
3142	1569	25	1	49.71
3143	1570	18	1	33.18
3144	1570	76	2	2.45
3145	1570	36	1	51.85
3146	1571	32	1	84.97
3147	1571	42	2	125.85
3148	1572	24	3	49.22
3149	1573	78	1	24.71
3150	1573	75	1	2.9
3151	1574	48	1	17.79
3152	1574	63	4	33.06
3153	1574	80	2	7.7
3154	1574	17	1	13.19
3155	1575	76	1	2.45
3156	1575	37	5	149.74
3157	1575	42	2	125.85
3158	1576	36	1	51.85
3159	1576	80	2	7.7
3160	1576	59	1	12.93
3161	1577	27	5	34.78
3162	1577	25	4	49.71
3163	1578	47	1	17.6
3164	1578	67	1	183.38
3165	1579	86	2	44.7
3166	1579	48	2	17.79
3167	1580	1	1	414.28
3168	1581	25	1	49.71
3169	1582	82	2	9.8
3170	1583	84	2	26.83
3171	1583	42	2	125.85
3172	1584	18	1	33.18
3173	1585	12	4	283.69
3174	1585	48	1	17.79
3175	1586	14	2	27.1
3176	1586	4	2	738.89
3177	1587	25	2	49.71
3178	1587	6	4	652.7
3179	1588	32	1	84.97
3180	1589	24	1	49.22
3181	1590	25	3	49.71
3182	1590	46	2	24.74
3183	1591	25	1	49.71
3184	1592	74	4	3.59
3185	1593	25	2	49.71
3186	1594	94	2	20.26
3187	1594	24	2	49.22
3188	1594	90	1	13.02
3189	1594	97	2	12.46
3190	1595	30	2	33.59
3191	1596	35	1	64.83
3192	1596	27	1	34.78
3193	1596	7	4	38.61
3194	1597	26	2	40.13
3195	1598	58	2	19.26
3196	1598	62	4	24.18
3197	1598	31	1	33.5
3198	1599	46	2	24.74
3199	1599	42	1	125.85
3200	1599	91	1	25.91
3201	1599	68	1	170.95
3202	1600	12	1	283.69
3203	1600	67	1	183.38
3204	1601	68	2	170.95
3205	1601	48	1	17.79
3206	1601	25	2	49.71
3207	1602	42	2	125.85
3208	1603	32	1	84.97
3209	1604	26	2	40.13
3210	1604	48	1	17.79
3211	1605	56	2	8.63
3212	1606	46	1	24.74
3213	1606	99	2	7.62
3214	1607	25	1	49.71
3215	1608	91	1	25.91
3216	1608	96	4	46.73
3217	1609	19	5	40.25
3218	1610	97	1	12.46
3219	1611	12	1	283.69
3220	1612	24	1	49.22
3221	1613	77	1	34.75
3222	1613	77	1	34.75
3223	1614	25	1	49.71
3224	1615	31	1	33.5
3225	1616	34	5	80.71
3226	1617	78	1	24.71
3227	1618	30	4	33.59
3228	1619	95	4	48.75
3229	1620	78	1	24.71
3230	1620	58	1	19.26
3231	1621	25	1	49.71
3232	1621	47	1	17.6
3233	1621	12	3	283.69
3234	1622	27	1	34.78
3235	1623	44	1	54.57
3236	1623	25	1	49.71
3237	1623	24	1	49.22
3238	1624	36	3	51.85
3239	1625	25	1	49.71
3240	1625	76	1	2.45
3241	1625	60	2	22.42
3242	1625	45	2	40.06
3243	1626	96	2	46.73
3244	1626	25	2	49.71
3245	1626	11	1	369.57
3246	1627	63	1	33.06
3247	1627	25	1	49.71
3248	1628	5	1	749.81
3249	1629	34	2	80.71
3250	1629	76	1	2.45
3251	1629	68	5	170.95
3252	1630	99	3	7.62
3253	1631	18	2	33.18
3254	1632	72	1	9.77
3255	1632	56	1	8.63
3256	1632	60	1	22.42
3257	1633	36	1	51.85
3258	1634	76	3	2.45
3259	1635	71	2	7.99
3260	1635	25	1	49.71
3261	1635	25	1	49.71
3262	1636	39	4	41.87
3263	1636	25	1	49.71
3264	1637	12	1	283.69
3265	1638	47	1	17.6
3266	1638	25	1	49.71
3267	1638	49	1	8.95
3268	1638	45	2	40.06
3269	1639	22	2	67.05
3270	1639	8	2	50.48
3271	1639	25	1	49.71
3272	1640	16	1	10.08
3273	1640	97	3	12.46
3274	1640	18	1	33.18
3275	1641	32	3	84.97
3276	1641	52	1	14.33
3277	1641	25	1	49.71
3278	1642	25	1	49.71
3279	1643	49	1	8.95
3280	1644	23	1	61.72
3281	1645	73	1	10.32
3282	1646	19	4	40.25
3283	1646	1	3	414.28
3284	1646	73	1	10.32
3285	1647	26	5	40.13
3286	1647	25	1	49.71
3287	1648	12	5	283.69
3288	1649	22	1	67.05
3289	1650	25	1	49.71
3290	1651	30	2	33.59
3291	1651	25	2	49.71
3292	1652	12	1	283.69
3293	1652	88	1	14.38
3294	1652	50	1	6.73
3295	1653	25	1	49.71
3296	1653	56	1	8.63
3297	1653	25	3	49.71
3298	1653	18	1	33.18
3299	1654	64	1	42.6
3300	1654	46	2	24.74
3301	1655	46	4	24.74
3302	1656	47	1	17.6
3303	1657	6	1	652.7
3304	1658	44	2	54.57
3305	1658	18	1	33.18
3306	1659	25	2	49.71
3307	1660	83	1	19.55
3308	1660	25	3	49.71
3309	1661	22	1	67.05
3310	1662	20	1	43.87
3311	1662	33	1	77.74
3312	1662	34	1	80.71
3313	1663	25	1	49.71
3314	1664	48	1	17.79
3315	1664	78	2	24.71
3316	1665	49	2	8.95
3317	1665	35	2	64.83
3318	1665	40	1	49.48
3319	1665	99	4	7.62
3320	1666	57	2	13.42
3321	1666	57	2	13.42
3322	1666	25	1	49.71
3323	1667	89	4	11.22
3324	1667	46	2	24.74
3325	1668	91	3	25.91
3326	1669	47	1	17.6
3327	1669	23	3	61.72
3328	1669	23	1	61.72
3329	1669	25	1	49.71
3330	1670	37	1	149.74
3331	1670	56	5	8.63
3332	1671	25	3	49.71
3333	1672	6	2	652.7
3334	1672	83	3	19.55
3335	1672	22	2	67.05
3336	1672	44	1	54.57
3337	1673	57	2	13.42
3338	1673	78	1	24.71
3339	1673	18	3	33.18
3340	1674	48	4	17.79
3341	1675	97	3	12.46
3342	1676	26	1	40.13
3343	1676	6	1	652.7
3344	1677	30	2	33.59
3345	1677	42	2	125.85
3346	1678	25	1	49.71
3347	1679	24	1	49.22
3348	1680	48	1	17.79
3349	1680	68	5	170.95
3350	1681	47	1	17.6
3351	1681	45	3	40.06
3352	1682	24	1	49.22
3353	1683	16	1	10.08
3354	1684	43	3	69.98
3355	1685	46	2	24.74
3356	1686	47	1	17.6
3357	1686	57	1	13.42
3358	1686	5	1	749.81
3359	1687	25	2	49.71
3360	1687	25	1	49.71
3361	1688	35	2	64.83
3362	1688	38	1	141.29
3363	1689	68	1	170.95
3364	1690	85	1	36.01
3365	1690	92	1	19.55
3366	1691	9	1	155.72
3367	1691	45	1	40.06
3368	1691	16	1	10.08
3369	1691	16	1	10.08
3370	1692	25	1	49.71
3371	1693	24	2	49.22
3372	1694	25	3	49.71
3373	1694	21	1	63.2
3374	1695	25	3	49.71
3375	1696	9	1	155.72
3376	1696	25	2	49.71
3377	1696	25	2	49.71
3378	1697	24	1	49.22
3379	1697	25	1	49.71
3380	1698	25	1	49.71
3381	1698	11	2	369.57
3382	1698	25	2	49.71
3383	1699	47	2	17.6
3384	1699	25	1	49.71
3385	1699	73	1	10.32
3386	1700	52	1	14.33
3387	1701	39	2	41.87
3388	1701	93	2	19.24
3389	1701	49	3	8.95
3390	1702	58	3	19.26
3391	1703	36	1	51.85
3392	1703	71	1	7.99
3393	1704	89	1	11.22
3394	1704	45	1	40.06
3395	1704	66	1	66.4
3396	1705	74	1	3.59
3397	1706	48	1	17.79
3398	1706	68	1	170.95
3399	1706	77	2	34.75
3400	1707	91	2	25.91
3401	1708	98	2	9.66
3402	1708	25	2	49.71
3403	1708	48	4	17.79
3404	1709	64	1	42.6
3405	1709	73	2	10.32
3406	1710	64	2	42.6
3407	1711	27	2	34.78
3408	1711	18	1	33.18
3409	1711	36	4	51.85
3410	1711	25	1	49.71
3411	1712	94	5	20.26
3412	1712	25	4	49.71
3413	1713	73	4	10.32
3414	1714	25	4	49.71
3415	1715	12	4	283.69
3416	1715	16	1	10.08
3417	1716	94	2	20.26
3418	1716	72	5	9.77
3419	1717	46	2	24.74
3420	1718	78	4	24.71
3421	1718	14	1	27.1
3422	1719	26	2	40.13
3423	1719	85	1	36.01
3424	1719	19	1	40.25
3425	1719	4	2	738.89
3426	1720	97	1	12.46
3427	1720	25	5	49.71
3428	1720	60	2	22.42
3429	1721	25	1	49.71
3430	1721	33	2	77.74
3431	1722	11	1	369.57
3432	1723	60	1	22.42
3433	1724	32	4	84.97
3434	1724	27	2	34.78
3435	1724	57	1	13.42
3436	1725	25	1	49.71
3437	1725	94	1	20.26
3438	1725	29	1	41.05
3439	1726	45	2	40.06
3440	1727	25	1	49.71
3441	1728	49	2	8.95
3442	1728	34	2	80.71
3443	1729	56	1	8.63
3444	1730	39	1	41.87
3445	1731	95	2	48.75
3446	1731	93	1	19.24
3447	1731	94	5	20.26
3448	1732	71	1	7.99
3449	1733	1	3	414.28
3450	1733	88	3	14.38
3451	1733	24	2	49.22
3452	1734	23	2	61.72
3453	1735	65	3	88.86
3454	1735	31	1	33.5
3455	1735	25	1	49.71
3456	1735	77	2	34.75
3457	1736	93	1	19.24
3458	1737	12	1	283.69
3459	1738	25	1	49.71
3460	1738	36	1	51.85
3461	1738	24	1	49.22
3462	1739	24	1	49.22
3463	1740	60	1	22.42
3464	1741	15	4	15.19
3465	1741	53	1	43.04
3466	1742	32	1	84.97
3467	1743	90	3	13.02
3468	1743	18	1	33.18
3469	1744	36	1	51.85
3470	1744	25	1	49.71
3471	1744	31	2	33.5
3472	1744	45	2	40.06
3473	1745	10	3	101.01
3474	1746	46	3	24.74
3475	1747	42	1	125.85
3476	1748	91	1	25.91
3477	1748	62	1	24.18
3478	1749	24	3	49.22
3479	1749	62	2	24.18
3480	1750	59	2	12.93
3481	1750	68	5	170.95
3482	1750	70	4	64.32
3483	1750	31	1	33.5
3484	1751	25	1	49.71
3485	1751	79	3	6.88
3486	1751	36	2	51.85
3487	1751	23	1	61.72
3488	1752	25	2	49.71
3489	1752	57	1	13.42
3490	1752	2	1	434.66
3491	1752	55	1	12.59
3492	1753	22	1	67.05
3493	1753	99	1	7.62
3494	1753	58	1	19.26
3495	1754	23	1	61.72
3496	1755	42	1	125.85
3497	1755	56	3	8.63
3498	1756	66	1	66.4
3499	1756	23	1	61.72
3500	1757	56	1	8.63
3501	1757	57	2	13.42
3502	1758	46	1	24.74
3503	1759	67	1	183.38
3504	1759	25	1	49.71
3505	1759	8	1	50.48
3506	1760	36	3	51.85
3507	1760	43	2	69.98
3508	1761	48	2	17.79
3509	1761	7	1	38.61
3510	1761	15	2	15.19
3511	1762	23	2	61.72
3512	1763	59	5	12.93
3513	1764	36	1	51.85
3514	1765	86	2	44.7
3515	1765	24	5	49.22
3516	1766	45	1	40.06
3517	1766	36	1	51.85
3518	1767	68	3	170.95
3519	1767	40	1	49.48
3520	1767	64	5	42.6
3521	1767	27	2	34.78
3522	1768	90	2	13.02
3523	1768	34	1	80.71
3524	1768	23	3	61.72
3525	1769	25	1	49.71
3526	1769	48	1	17.79
3527	1769	63	1	33.06
3528	1770	36	1	51.85
3529	1770	24	1	49.22
3530	1771	48	1	17.79
3531	1771	51	1	16.01
3532	1772	23	1	61.72
3533	1772	44	1	54.57
3534	1772	24	5	49.22
3535	1773	98	1	9.66
3536	1774	20	2	43.87
3537	1774	25	2	49.71
3538	1775	70	1	64.32
3539	1775	65	1	88.86
3540	1775	25	4	49.71
3541	1776	7	1	38.61
3542	1777	60	4	22.42
3543	1777	92	2	19.55
3544	1777	21	5	63.2
3545	1778	24	1	49.22
3546	1778	25	1	49.71
3547	1779	36	5	51.85
3548	1779	25	5	49.71
3549	1780	25	1	49.71
3550	1780	49	1	8.95
3551	1781	69	2	62.48
3552	1782	49	2	8.95
3553	1783	2	1	434.66
3554	1784	25	1	49.71
3555	1785	18	1	33.18
3556	1785	96	4	46.73
3557	1786	49	2	8.95
3558	1787	60	1	22.42
3559	1788	13	1	22.41
3560	1789	28	1	38.97
3561	1789	15	1	15.19
3562	1789	89	2	11.22
3563	1790	4	1	738.89
3564	1791	25	1	49.71
3565	1791	48	1	17.79
3566	1792	90	1	13.02
3567	1793	53	1	43.04
3568	1793	55	3	12.59
3569	1793	25	1	49.71
3570	1793	25	2	49.71
3571	1794	87	1	60.33
3572	1794	25	1	49.71
3573	1795	5	1	749.81
3574	1796	8	1	50.48
3575	1797	66	2	66.4
3576	1798	68	3	170.95
3577	1799	13	1	22.41
3578	1799	19	1	40.25
3579	1799	30	1	33.59
3580	1800	38	1	141.29
3581	1801	25	2	49.71
3582	1802	49	1	8.95
3583	1803	25	1	49.71
3584	1803	42	1	125.85
3585	1803	57	1	13.42
3586	1804	97	1	12.46
3587	1805	25	3	49.71
3588	1806	5	1	749.81
3589	1807	25	3	49.71
3590	1808	49	1	8.95
3591	1809	22	1	67.05
3592	1809	27	1	34.78
3593	1810	75	1	2.9
3594	1810	78	1	24.71
3595	1811	86	1	44.7
3596	1811	95	3	48.75
3597	1811	46	1	24.74
3598	1811	66	5	66.4
3599	1812	27	1	34.78
3600	1812	24	1	49.22
3601	1812	76	1	2.45
3602	1813	30	2	33.59
3603	1813	88	2	14.38
3604	1814	1	2	414.28
3605	1815	43	2	69.98
3606	1815	95	1	48.75
3607	1815	24	1	49.22
3608	1816	49	2	8.95
3609	1816	49	3	8.95
3610	1816	68	1	170.95
3611	1817	36	3	51.85
3612	1818	38	2	141.29
3613	1818	5	1	749.81
3614	1818	36	1	51.85
3615	1819	48	2	17.79
3616	1820	31	1	33.5
3617	1820	18	1	33.18
3618	1820	45	1	40.06
3619	1820	50	1	6.73
3620	1821	73	1	10.32
3621	1821	12	1	283.69
3622	1821	27	2	34.78
3623	1822	25	2	49.71
3624	1823	48	1	17.79
3625	1823	34	3	80.71
3626	1823	89	4	11.22
3627	1824	68	1	170.95
3628	1824	21	4	63.2
3629	1824	91	2	25.91
3630	1825	78	2	24.71
3631	1825	51	1	16.01
3632	1825	25	2	49.71
3633	1826	49	1	8.95
3634	1826	76	2	2.45
3635	1826	25	1	49.71
3636	1826	1	2	414.28
3637	1827	62	1	24.18
3638	1828	5	1	749.81
3639	1828	25	1	49.71
3640	1828	73	1	10.32
3641	1829	100	3	10.12
3642	1829	23	1	61.72
3643	1829	39	1	41.87
3644	1829	62	2	24.18
3645	1830	12	2	283.69
3646	1831	20	4	43.87
3647	1832	25	1	49.71
3648	1833	64	1	42.6
3649	1833	8	1	50.48
3650	1833	24	1	49.22
3651	1834	57	5	13.42
3652	1835	73	1	10.32
3653	1836	87	1	60.33
3654	1836	25	5	49.71
3655	1836	65	1	88.86
3656	1836	18	2	33.18
3657	1837	21	1	63.2
3658	1838	68	2	170.95
3659	1838	12	2	283.69
3660	1839	25	3	49.71
3661	1839	54	1	34.3
3662	1840	26	1	40.13
3663	1840	25	1	49.71
3664	1840	3	1	286.67
3665	1841	49	2	8.95
3666	1841	30	1	33.59
3667	1841	52	1	14.33
3668	1842	60	1	22.42
3669	1843	27	1	34.78
3670	1843	36	3	51.85
3671	1843	36	1	51.85
3672	1844	25	1	49.71
3673	1844	25	1	49.71
3674	1844	87	1	60.33
3675	1845	30	5	33.59
3676	1845	85	5	36.01
3677	1845	46	1	24.74
3678	1846	11	1	369.57
3679	1846	25	5	49.71
3680	1846	23	1	61.72
3681	1847	86	1	44.7
3682	1847	66	1	66.4
3683	1847	78	2	24.71
3684	1848	47	4	17.6
3685	1849	76	2	2.45
3686	1849	30	1	33.59
3687	1849	1	1	414.28
3688	1850	100	2	10.12
3689	1851	30	1	33.59
3690	1852	25	1	49.71
3691	1853	33	3	77.74
3692	1854	78	3	24.71
3693	1855	10	1	101.01
3694	1855	54	1	34.3
3695	1856	63	2	33.06
3696	1857	98	1	9.66
3697	1858	62	2	24.18
3698	1859	72	1	9.77
3699	1859	26	1	40.13
3700	1859	45	1	40.06
3701	1860	94	1	20.26
3702	1860	38	1	141.29
3703	1860	1	2	414.28
3704	1861	39	5	41.87
3705	1862	94	2	20.26
3706	1862	46	1	24.74
3707	1862	71	1	7.99
3708	1863	89	1	11.22
3709	1863	32	2	84.97
3710	1863	4	2	738.89
3711	1864	18	1	33.18
3712	1864	60	5	22.42
3713	1865	14	2	27.1
3714	1865	56	1	8.63
3715	1866	62	2	24.18
3716	1866	45	4	40.06
3717	1866	20	2	43.87
3718	1866	47	1	17.6
3719	1867	1	2	414.28
3720	1867	47	2	17.6
3721	1868	64	1	42.6
3722	1869	25	5	49.71
3723	1870	30	1	33.59
3724	1870	99	2	7.62
3725	1870	85	2	36.01
3726	1871	65	1	88.86
3727	1871	11	2	369.57
3728	1872	37	1	149.74
3729	1873	47	1	17.6
3730	1874	25	1	49.71
3731	1874	12	4	283.69
3732	1874	54	1	34.3
3733	1875	6	2	652.7
3734	1875	68	1	170.95
3735	1875	46	2	24.74
3736	1876	100	1	10.12
3737	1877	60	1	22.42
3738	1878	61	1	18.1
3739	1878	68	1	170.95
3740	1878	21	1	63.2
3741	1879	29	1	41.05
3742	1879	11	1	369.57
3743	1879	61	3	18.1
3744	1880	23	2	61.72
3745	1880	3	1	286.67
3746	1880	26	1	40.13
3747	1881	47	1	17.6
3748	1881	93	2	19.24
3749	1882	93	1	19.24
3750	1882	18	3	33.18
3751	1883	76	1	2.45
3752	1883	31	3	33.5
3753	1883	72	1	9.77
3754	1883	25	1	49.71
3755	1884	48	1	17.79
3756	1885	8	4	50.48
3757	1885	25	2	49.71
3758	1885	25	1	49.71
3759	1885	25	1	49.71
3760	1886	83	1	19.55
3761	1887	87	1	60.33
3762	1887	26	2	40.13
3763	1887	67	1	183.38
3764	1888	94	5	20.26
3765	1888	50	1	6.73
3766	1888	58	1	19.26
3767	1889	16	2	10.08
3768	1890	25	2	49.71
3769	1890	87	1	60.33
3770	1891	68	1	170.95
3771	1892	48	1	17.79
3772	1893	25	1	49.71
3773	1893	22	1	67.05
3774	1893	87	1	60.33
3775	1894	47	3	17.6
3776	1895	28	1	38.97
3777	1896	24	3	49.22
3778	1897	100	1	10.12
3779	1897	53	1	43.04
3780	1898	99	5	7.62
3781	1898	41	1	106.57
3782	1899	85	1	36.01
3783	1900	80	3	7.7
3784	1901	24	3	49.22
3785	1901	87	1	60.33
3786	1901	9	1	155.72
3787	1902	58	2	19.26
3788	1902	49	1	8.95
3789	1902	21	2	63.2
3790	1902	5	1	749.81
3791	1903	37	1	149.74
3792	1903	35	2	64.83
3793	1903	25	2	49.71
3794	1904	45	1	40.06
3795	1904	54	1	34.3
3796	1905	31	1	33.5
3797	1905	7	1	38.61
3798	1906	25	5	49.71
3799	1907	39	1	41.87
3800	1907	7	4	38.61
3801	1908	5	1	749.81
3802	1908	5	1	749.81
3803	1908	25	1	49.71
3804	1909	55	1	12.59
3805	1909	5	1	749.81
3806	1909	46	4	24.74
3807	1910	11	1	369.57
3808	1911	27	2	34.78
3809	1911	36	1	51.85
3810	1911	25	1	49.71
3811	1911	26	1	40.13
3812	1912	46	1	24.74
3813	1913	25	1	49.71
3814	1913	47	2	17.6
3815	1914	46	4	24.74
3816	1914	91	1	25.91
3817	1915	25	1	49.71
3818	1916	66	3	66.4
3819	1917	5	1	749.81
3820	1917	49	2	8.95
3821	1917	78	1	24.71
3822	1918	6	5	652.7
3823	1918	35	1	64.83
3824	1918	25	3	49.71
3825	1918	27	3	34.78
3826	1919	24	3	49.22
3827	1920	25	2	49.71
3828	1920	25	1	49.71
3829	1920	36	2	51.85
3830	1920	21	1	63.2
3831	1921	79	1	6.88
3832	1922	96	3	46.73
3833	1923	47	2	17.6
3834	1924	23	2	61.72
3835	1924	10	2	101.01
3836	1924	24	3	49.22
3837	1925	45	4	40.06
3838	1926	79	1	6.88
3839	1927	73	1	10.32
3840	1928	78	4	24.71
3841	1929	36	1	51.85
3842	1929	9	2	155.72
3843	1929	23	2	61.72
3844	1929	60	1	22.42
3845	1930	14	1	27.1
3846	1930	24	1	49.22
3847	1930	10	4	101.01
3848	1931	70	1	64.32
3849	1932	100	1	10.12
3850	1933	6	2	652.7
3851	1933	25	4	49.71
3852	1933	27	5	34.78
3853	1934	36	3	51.85
3854	1935	5	3	749.81
3855	1935	27	1	34.78
3856	1935	25	2	49.71
3857	1936	31	5	33.5
3858	1937	46	1	24.74
3859	1937	24	1	49.22
3860	1938	16	1	10.08
3861	1939	65	2	88.86
3862	1940	17	1	13.19
3863	1941	25	1	49.71
3864	1942	93	1	19.24
3865	1942	48	1	17.79
3866	1943	42	1	125.85
3867	1943	11	5	369.57
3868	1943	30	1	33.59
3869	1944	69	1	62.48
3870	1944	75	1	2.9
3871	1944	57	1	13.42
3872	1944	83	1	19.55
3873	1945	42	1	125.85
3874	1945	78	2	24.71
3875	1946	16	1	10.08
3876	1946	29	1	41.05
3877	1946	68	2	170.95
3878	1947	99	1	7.62
3879	1947	16	1	10.08
3880	1948	94	1	20.26
3881	1949	84	5	26.83
3882	1949	11	4	369.57
3883	1950	20	1	43.87
3884	1951	96	1	46.73
3885	1952	68	1	170.95
3886	1952	14	1	27.1
3887	1953	24	1	49.22
3888	1954	36	1	51.85
3889	1954	28	1	38.97
3890	1954	3	1	286.67
3891	1955	52	1	14.33
3892	1956	18	1	33.18
3893	1956	58	1	19.26
3894	1957	68	1	170.95
3895	1957	25	5	49.71
3896	1958	12	5	283.69
3897	1958	30	2	33.59
3898	1959	13	3	22.41
3899	1960	55	1	12.59
3900	1960	36	2	51.85
3901	1961	12	3	283.69
3902	1961	25	2	49.71
3903	1961	39	1	41.87
3904	1961	36	2	51.85
3905	1962	91	4	25.91
3906	1963	23	1	61.72
3907	1963	25	2	49.71
3908	1964	100	1	10.12
3909	1965	72	2	9.77
3910	1966	48	1	17.79
3911	1966	36	3	51.85
3912	1967	62	2	24.18
3913	1967	36	4	51.85
3914	1967	30	5	33.59
3915	1968	81	3	13.69
3916	1968	25	2	49.71
3917	1968	71	1	7.99
3918	1968	72	1	9.77
3919	1969	25	1	49.71
3920	1970	46	2	24.74
3921	1970	36	1	51.85
3922	1970	12	1	283.69
3923	1971	56	2	8.63
3924	1971	27	1	34.78
3925	1971	25	1	49.71
3926	1972	1	1	414.28
3927	1972	91	1	25.91
3928	1973	95	1	48.75
3929	1973	61	1	18.1
3930	1974	24	4	49.22
3931	1975	72	1	9.77
3932	1975	73	2	10.32
3933	1975	42	1	125.85
3934	1975	7	2	38.61
3935	1976	30	4	33.59
3936	1976	99	2	7.62
3937	1976	36	1	51.85
3938	1976	27	3	34.78
3939	1977	24	1	49.22
3940	1978	25	1	49.71
3941	1978	65	1	88.86
3942	1978	24	2	49.22
3943	1979	30	2	33.59
3944	1979	91	1	25.91
3945	1979	26	1	40.13
3946	1979	60	2	22.42
3947	1980	47	1	17.6
3948	1980	48	1	17.79
3949	1980	84	1	26.83
3950	1981	25	1	49.71
3951	1982	68	3	170.95
3952	1982	58	1	19.26
3953	1982	50	2	6.73
3954	1983	27	1	34.78
3955	1983	60	1	22.42
3956	1983	25	2	49.71
3957	1984	61	1	18.1
3958	1985	39	1	41.87
3959	1986	59	2	12.93
3960	1986	99	1	7.62
3961	1987	20	2	43.87
3962	1987	25	1	49.71
3963	1988	81	1	13.69
3964	1988	90	2	13.02
3965	1989	53	1	43.04
3966	1989	92	1	19.55
3967	1989	55	3	12.59
3968	1989	37	1	149.74
3969	1990	93	2	19.24
3970	1990	8	1	50.48
3971	1990	91	1	25.91
3972	1990	29	1	41.05
3973	1991	76	1	2.45
3974	1991	36	5	51.85
3975	1991	25	1	49.71
3976	1992	68	1	170.95
3977	1993	89	1	11.22
3978	1993	16	4	10.08
3979	1994	21	2	63.2
3980	1995	48	1	17.79
3981	1995	93	1	19.24
3982	1996	25	5	49.71
3983	1996	24	1	49.22
3984	1997	54	1	34.3
3985	1998	89	1	11.22
3986	1999	25	1	49.71
3987	2000	97	1	12.46
3988	2000	23	2	61.72
3989	2001	25	1	49.71
3990	2002	98	1	9.66
3991	2002	24	4	49.22
3992	2003	87	2	60.33
3993	2004	46	2	24.74
3994	2004	25	1	49.71
3995	2005	36	1	51.85
3996	2005	52	1	14.33
3997	2006	58	1	19.26
3998	2006	100	2	10.12
3999	2006	33	1	77.74
4000	2007	34	1	80.71
4001	2008	24	2	49.22
4002	2008	69	2	62.48
4003	2009	6	1	652.7
4004	2009	37	1	149.74
4005	2010	26	2	40.13
4006	2010	66	5	66.4
4007	2011	76	1	2.45
4008	2011	80	1	7.7
4009	2011	25	1	49.71
4010	2012	6	4	652.7
4011	2013	90	1	13.02
4012	2013	21	1	63.2
4013	2013	31	2	33.5
4014	2014	25	3	49.71
4015	2014	25	2	49.71
4016	2014	52	3	14.33
4017	2015	38	1	141.29
4018	2015	49	4	8.95
4019	2016	5	1	749.81
4020	2017	3	2	286.67
4021	2017	31	2	33.5
4022	2018	77	1	34.75
4023	2019	49	1	8.95
4024	2019	53	2	43.04
4025	2019	78	2	24.71
4026	2020	67	1	183.38
4027	2020	41	1	106.57
4028	2021	6	1	652.7
4029	2021	6	1	652.7
4030	2022	21	1	63.2
4031	2022	25	2	49.71
4032	2023	84	5	26.83
4033	2023	95	4	48.75
4034	2023	14	3	27.1
4035	2023	24	2	49.22
4036	2024	100	1	10.12
4037	2024	24	1	49.22
4038	2025	84	1	26.83
4039	2025	37	2	149.74
4040	2025	48	1	17.79
4041	2026	12	1	283.69
4042	2026	37	4	149.74
4043	2027	78	1	24.71
4044	2028	48	2	17.79
4045	2028	26	1	40.13
4046	2029	33	2	77.74
4047	2029	91	2	25.91
4048	2029	25	1	49.71
4049	2030	1	1	414.28
4050	2030	59	1	12.93
4051	2030	23	1	61.72
4052	2031	16	2	10.08
4053	2032	2	1	434.66
4054	2032	43	2	69.98
4055	2033	91	2	25.91
4056	2033	25	1	49.71
4057	2034	25	1	49.71
4058	2034	39	1	41.87
4059	2034	51	1	16.01
4060	2035	72	1	9.77
4061	2035	36	2	51.85
4062	2036	30	1	33.59
4063	2036	38	2	141.29
4064	2037	25	4	49.71
4065	2038	14	1	27.1
4066	2038	43	1	69.98
4067	2039	81	4	13.69
4068	2039	11	1	369.57
4069	2040	30	1	33.59
4070	2041	36	2	51.85
4071	2041	18	4	33.18
4072	2041	95	1	48.75
4073	2042	10	1	101.01
4074	2042	5	1	749.81
4075	2043	23	4	61.72
4076	2043	42	1	125.85
4077	2044	33	1	77.74
4078	2045	94	1	20.26
4079	2045	8	3	50.48
4080	2046	76	3	2.45
4081	2047	91	1	25.91
4082	2047	72	1	9.77
4083	2047	18	1	33.18
4084	2048	36	3	51.85
4085	2048	25	2	49.71
4086	2048	39	1	41.87
4087	2049	68	1	170.95
4088	2049	30	2	33.59
4089	2049	41	1	106.57
4090	2049	25	5	49.71
4091	2050	67	5	183.38
4092	2050	49	1	8.95
4093	2050	23	1	61.72
4094	2051	8	1	50.48
4095	2052	24	5	49.22
4096	2052	67	1	183.38
4097	2053	12	1	283.69
4098	2054	5	1	749.81
4099	2054	85	1	36.01
4100	2055	26	1	40.13
4101	2056	68	1	170.95
4102	2056	13	1	22.41
4103	2057	25	1	49.71
4104	2058	73	2	10.32
4105	2058	21	5	63.2
4106	2059	80	1	7.7
4107	2060	25	2	49.71
4108	2060	89	2	11.22
4109	2060	29	1	41.05
4110	2061	14	2	27.1
4111	2062	35	1	64.83
4112	2062	25	1	49.71
4113	2063	71	2	7.99
4114	2063	62	3	24.18
4115	2063	45	4	40.06
4116	2064	11	1	369.57
4117	2064	83	1	19.55
4118	2064	82	2	9.8
4119	2064	92	1	19.55
4120	2065	12	4	283.69
4121	2066	59	1	12.93
4122	2067	73	1	10.32
4123	2068	84	1	26.83
4124	2068	14	2	27.1
4125	2069	68	1	170.95
4126	2069	3	1	286.67
4127	2070	48	1	17.79
4128	2070	68	1	170.95
4129	2071	73	1	10.32
4130	2071	25	1	49.71
4131	2071	46	1	24.74
4132	2072	46	1	24.74
4133	2073	28	1	38.97
4134	2074	86	3	44.7
4135	2074	73	1	10.32
4136	2074	36	2	51.85
4137	2075	95	3	48.75
4138	2076	25	1	49.71
4139	2077	59	2	12.93
4140	2077	95	1	48.75
4141	2078	23	2	61.72
4142	2078	57	1	13.42
4143	2078	19	2	40.25
4144	2079	18	1	33.18
4145	2079	79	1	6.88
4146	2080	61	1	18.1
4147	2080	25	2	49.71
4148	2080	36	1	51.85
4149	2081	25	1	49.71
4150	2082	22	1	67.05
4151	2082	97	1	12.46
4152	2083	41	1	106.57
4153	2083	61	3	18.1
4154	2083	9	2	155.72
4155	2084	95	1	48.75
4156	2084	49	1	8.95
4157	2084	93	1	19.24
4158	2085	14	1	27.1
4159	2086	25	2	49.71
4160	2086	84	3	26.83
4161	2087	25	1	49.71
4162	2088	25	2	49.71
4163	2089	18	4	33.18
4164	2089	25	1	49.71
4165	2089	97	2	12.46
4166	2090	74	1	3.59
4167	2090	67	1	183.38
4168	2090	4	1	738.89
4169	2091	11	1	369.57
4170	2091	12	1	283.69
4171	2091	96	1	46.73
4172	2092	24	2	49.22
4173	2092	53	1	43.04
4174	2092	13	1	22.41
4175	2093	25	5	49.71
4176	2094	92	3	19.55
4177	2094	47	2	17.6
4178	2094	25	3	49.71
4179	2095	25	1	49.71
4180	2096	68	2	170.95
4181	2096	78	1	24.71
4182	2097	64	1	42.6
4183	2098	59	1	12.93
4184	2099	57	1	13.42
4185	2099	99	1	7.62
4186	2099	83	3	19.55
4187	2100	25	1	49.71
4188	2100	25	1	49.71
4189	2100	98	1	9.66
4190	2101	65	1	88.86
4191	2102	33	1	77.74
4192	2103	73	1	10.32
4193	2103	22	2	67.05
4194	2103	9	2	155.72
4195	2104	58	1	19.26
4196	2104	74	3	3.59
4197	2105	76	2	2.45
4198	2106	26	1	40.13
4199	2107	85	1	36.01
4200	2108	89	5	11.22
4201	2108	5	1	749.81
4202	2109	68	2	170.95
4203	2110	74	3	3.59
4204	2110	36	1	51.85
4205	2111	43	1	69.98
4206	2112	21	3	63.2
4207	2112	17	2	13.19
4208	2112	53	1	43.04
4209	2113	5	1	749.81
4210	2113	53	2	43.04
4211	2114	74	3	3.59
4212	2115	52	2	14.33
4213	2116	91	1	25.91
4214	2116	25	2	49.71
4215	2116	62	2	24.18
4216	2116	27	3	34.78
4217	2117	46	1	24.74
4218	2118	27	1	34.78
4219	2119	31	1	33.5
4220	2119	24	4	49.22
4221	2120	69	5	62.48
4222	2120	74	1	3.59
4223	2121	36	1	51.85
4224	2121	18	1	33.18
4225	2121	30	1	33.59
4226	2122	48	1	17.79
4227	2123	7	1	38.61
4228	2123	23	2	61.72
4229	2124	68	1	170.95
4230	2124	25	2	49.71
4231	2124	12	1	283.69
4232	2125	20	1	43.87
4233	2126	24	3	49.22
4234	2127	25	1	49.71
4235	2127	57	2	13.42
4236	2127	25	3	49.71
4237	2127	67	5	183.38
4238	2128	65	1	88.86
4239	2129	33	2	77.74
4240	2130	65	3	88.86
4241	2130	42	3	125.85
4242	2130	79	1	6.88
4243	2131	61	3	18.1
4244	2131	21	1	63.2
4245	2132	4	1	738.89
4246	2133	9	4	155.72
4247	2134	24	1	49.22
4248	2135	9	1	155.72
4249	2136	73	5	10.32
4250	2136	2	4	434.66
4251	2136	61	2	18.1
4252	2136	100	5	10.12
4253	2137	83	1	19.55
4254	2138	4	1	738.89
4255	2138	11	1	369.57
4256	2138	25	3	49.71
4257	2139	77	3	34.75
4258	2139	12	3	283.69
4259	2139	62	1	24.18
4260	2140	96	3	46.73
4261	2141	90	2	13.02
4262	2142	25	3	49.71
4263	2143	15	2	15.19
4264	2143	36	3	51.85
4265	2144	26	2	40.13
4266	2145	26	4	40.13
4267	2145	84	1	26.83
4268	2145	65	1	88.86
4269	2146	32	1	84.97
4270	2147	46	1	24.74
4271	2147	25	3	49.71
4272	2148	56	1	8.63
4273	2148	67	2	183.38
4274	2149	3	2	286.67
4275	2149	81	1	13.69
4276	2150	31	1	33.5
4277	2150	58	2	19.26
4278	2150	20	3	43.87
4279	2151	35	1	64.83
4280	2152	47	1	17.6
4281	2152	69	1	62.48
4282	2153	4	2	738.89
4283	2154	28	1	38.97
4284	2154	10	4	101.01
4285	2154	90	2	13.02
4286	2155	29	3	41.05
4287	2155	25	3	49.71
4288	2155	89	2	11.22
4289	2155	27	5	34.78
4290	2156	81	1	13.69
4291	2157	53	2	43.04
4292	2157	87	3	60.33
4293	2157	43	1	69.98
4294	2157	84	3	26.83
4295	2158	62	3	24.18
4296	2159	42	2	125.85
4297	2160	67	3	183.38
4298	2160	9	1	155.72
4299	2160	17	2	13.19
4300	2160	47	1	17.6
4301	2161	16	2	10.08
4302	2161	90	1	13.02
4303	2161	36	1	51.85
4304	2162	72	1	9.77
4305	2162	25	1	49.71
4306	2163	36	1	51.85
4307	2164	16	1	10.08
4308	2164	25	1	49.71
4309	2164	25	1	49.71
4310	2165	26	1	40.13
4311	2165	47	4	17.6
4312	2165	24	3	49.22
4313	2166	78	2	24.71
4314	2167	36	2	51.85
4315	2168	31	1	33.5
4316	2168	31	2	33.5
4317	2168	23	2	61.72
4318	2169	25	2	49.71
4319	2170	17	1	13.19
4320	2170	20	3	43.87
4321	2170	25	1	49.71
4322	2171	5	1	749.81
4323	2172	65	2	88.86
4324	2173	97	1	12.46
4325	2173	23	3	61.72
4326	2173	46	1	24.74
4327	2174	18	1	33.18
4328	2174	39	2	41.87
4329	2174	73	3	10.32
4330	2174	30	1	33.59
4331	2175	83	1	19.55
4332	2176	90	1	13.02
4333	2177	2	1	434.66
4334	2177	46	1	24.74
4335	2178	7	3	38.61
4336	2178	92	3	19.55
4337	2179	9	1	155.72
4338	2180	47	2	17.6
4339	2180	25	2	49.71
4340	2181	65	3	88.86
4341	2182	65	1	88.86
4342	2183	15	5	15.19
4343	2184	85	2	36.01
4344	2184	25	1	49.71
4345	2185	86	2	44.7
4346	2186	18	2	33.18
4347	2186	36	1	51.85
4348	2187	56	1	8.63
4349	2187	99	2	7.62
4350	2188	31	1	33.5
4351	2188	24	1	49.22
4352	2189	30	1	33.59
4353	2189	27	3	34.78
4354	2189	48	1	17.79
4355	2190	25	1	49.71
4356	2190	25	2	49.71
4357	2191	68	2	170.95
4358	2192	35	4	64.83
4359	2192	23	1	61.72
4360	2192	95	1	48.75
4361	2192	30	1	33.59
4362	2193	56	1	8.63
4363	2194	25	2	49.71
4364	2195	37	1	149.74
4365	2196	86	1	44.7
4366	2196	63	1	33.06
4367	2196	48	4	17.79
4368	2197	96	2	46.73
4369	2197	78	1	24.71
4370	2197	24	3	49.22
4371	2197	13	4	22.41
4372	2198	52	1	14.33
4373	2199	79	1	6.88
4374	2200	11	1	369.57
4375	2200	47	2	17.6
4376	2201	48	5	17.79
4377	2202	78	1	24.71
4378	2203	81	2	13.69
4379	2204	91	1	25.91
4380	2205	27	2	34.78
4381	2206	97	1	12.46
4382	2206	9	3	155.72
4383	2207	22	1	67.05
4384	2207	54	2	34.3
4385	2208	36	2	51.85
4386	2208	73	3	10.32
4387	2209	15	1	15.19
4388	2209	25	1	49.71
4389	2210	75	2	2.9
4390	2211	25	1	49.71
4391	2212	85	3	36.01
4392	2212	49	1	8.95
4393	2213	30	2	33.59
4394	2213	69	1	62.48
4395	2214	24	3	49.22
4396	2214	8	2	50.48
4397	2214	30	1	33.59
4398	2214	60	1	22.42
4399	2215	37	2	149.74
4400	2215	73	2	10.32
4401	2215	22	4	67.05
4402	2215	57	1	13.42
4403	2216	33	1	77.74
4404	2216	23	1	61.72
4405	2217	96	2	46.73
4406	2218	78	1	24.71
4407	2219	16	1	10.08
4408	2219	23	2	61.72
4409	2220	64	2	42.6
4410	2220	73	5	10.32
4411	2220	63	1	33.06
4412	2221	78	3	24.71
4413	2221	27	2	34.78
4414	2221	83	2	19.55
4415	2222	73	1	10.32
4416	2222	25	2	49.71
4417	2222	25	3	49.71
4418	2223	24	3	49.22
4419	2223	36	3	51.85
4420	2223	73	1	10.32
4421	2224	10	2	101.01
4422	2224	53	1	43.04
4423	2225	9	2	155.72
4424	2225	25	1	49.71
4425	2225	54	2	34.3
4426	2226	49	2	8.95
4427	2226	45	1	40.06
4428	2227	25	1	49.71
4429	2227	78	1	24.71
4430	2228	22	5	67.05
4431	2228	89	1	11.22
4432	2229	25	1	49.71
4433	2229	100	3	10.12
4434	2230	96	1	46.73
4435	2230	42	4	125.85
4436	2230	23	1	61.72
4437	2231	87	1	60.33
4438	2232	25	3	49.71
4439	2233	58	1	19.26
4440	2233	25	2	49.71
4441	2233	24	1	49.22
4442	2234	8	1	50.48
4443	2234	89	1	11.22
4444	2234	95	1	48.75
4445	2234	79	1	6.88
4446	2235	80	1	7.7
4447	2235	96	1	46.73
4448	2236	25	1	49.71
4449	2236	25	1	49.71
4450	2236	24	1	49.22
4451	2236	25	2	49.71
4452	2237	90	1	13.02
4453	2238	6	1	652.7
4454	2238	79	3	6.88
4455	2239	30	1	33.59
4456	2239	49	2	8.95
4457	2240	53	1	43.04
4458	2241	38	1	141.29
4459	2242	60	1	22.42
4460	2243	25	1	49.71
4461	2243	41	5	106.57
4462	2243	25	1	49.71
4463	2244	23	1	61.72
4464	2244	65	1	88.86
4465	2245	61	1	18.1
4466	2246	70	3	64.32
4467	2247	36	1	51.85
4468	2247	79	2	6.88
4469	2248	70	5	64.32
4470	2248	80	1	7.7
4471	2249	16	2	10.08
4472	2250	57	4	13.42
4473	2251	42	1	125.85
4474	2251	19	1	40.25
4475	2252	14	1	27.1
4476	2252	30	1	33.59
4477	2252	3	1	286.67
4478	2253	84	2	26.83
4479	2253	41	1	106.57
4480	2253	5	1	749.81
4481	2253	83	1	19.55
4482	2254	38	1	141.29
4483	2254	69	1	62.48
4484	2255	24	4	49.22
4485	2255	63	1	33.06
4486	2255	89	1	11.22
4487	2256	45	2	40.06
4488	2257	14	1	27.1
4489	2257	27	2	34.78
4490	2257	33	1	77.74
4491	2258	25	1	49.71
4492	2258	12	1	283.69
4493	2259	12	3	283.69
4494	2259	14	2	27.1
4495	2259	24	4	49.22
4496	2260	44	1	54.57
4497	2261	24	1	49.22
4498	2261	91	1	25.91
4499	2261	85	1	36.01
4500	2262	84	1	26.83
4501	2262	25	1	49.71
4502	2263	14	1	27.1
4503	2263	17	2	13.19
4504	2263	33	1	77.74
4505	2263	80	2	7.7
4506	2264	25	1	49.71
4507	2264	8	2	50.48
4508	2265	14	1	27.1
4509	2265	26	1	40.13
4510	2266	25	2	49.71
4511	2267	38	2	141.29
4512	2268	29	1	41.05
4513	2268	48	3	17.79
4514	2269	50	3	6.73
4515	2269	25	1	49.71
4516	2270	46	2	24.74
4517	2270	37	4	149.74
4518	2270	3	3	286.67
4519	2271	72	2	9.77
4520	2272	26	1	40.13
4521	2273	25	4	49.71
4522	2274	91	1	25.91
4523	2274	9	1	155.72
4524	2275	31	1	33.5
4525	2276	23	1	61.72
4526	2277	48	1	17.79
4527	2277	50	1	6.73
4528	2277	68	4	170.95
4529	2278	78	1	24.71
4530	2279	67	1	183.38
4531	2280	21	1	63.2
4532	2280	2	1	434.66
4533	2281	56	2	8.63
4534	2281	68	1	170.95
4535	2281	46	1	24.74
4536	2281	96	3	46.73
4537	2282	25	1	49.71
4538	2282	31	1	33.5
4539	2282	4	2	738.89
4540	2283	18	2	33.18
4541	2283	11	3	369.57
4542	2284	87	1	60.33
4543	2285	52	1	14.33
4544	2286	26	2	40.13
4545	2287	99	1	7.62
4546	2287	29	1	41.05
4547	2288	24	4	49.22
4548	2288	71	1	7.99
4549	2289	73	1	10.32
4550	2290	11	5	369.57
4551	2291	15	5	15.19
4552	2292	25	5	49.71
4553	2293	4	1	738.89
4554	2293	53	3	43.04
4555	2294	86	1	44.7
4556	2294	42	1	125.85
4557	2295	31	1	33.5
4558	2295	25	1	49.71
4559	2295	90	3	13.02
4560	2296	53	1	43.04
4561	2297	64	1	42.6
4562	2297	59	1	12.93
4563	2298	25	1	49.71
4564	2299	88	1	14.38
4565	2300	42	1	125.85
4566	2300	25	1	49.71
4567	2301	25	2	49.71
4568	2301	24	2	49.22
4569	2302	18	4	33.18
4570	2302	70	1	64.32
4571	2303	59	1	12.93
4572	2304	99	3	7.62
4573	2304	20	5	43.87
4574	2305	45	2	40.06
4575	2305	36	1	51.85
4576	2306	11	1	369.57
4577	2307	84	1	26.83
4578	2308	25	1	49.71
4579	2309	90	1	13.02
4580	2309	60	1	22.42
4581	2309	25	3	49.71
4582	2309	87	1	60.33
4583	2310	20	5	43.87
4584	2310	75	1	2.9
4585	2311	64	1	42.6
4586	2311	24	1	49.22
4587	2311	49	1	8.95
4588	2311	85	1	36.01
4589	2312	98	3	9.66
4590	2312	78	2	24.71
4591	2313	91	1	25.91
4592	2314	56	2	8.63
4593	2314	72	1	9.77
4594	2315	26	1	40.13
4595	2315	83	3	19.55
4596	2316	48	2	17.79
4597	2317	25	2	49.71
4598	2318	20	2	43.87
4599	2318	48	2	17.79
4600	2319	25	2	49.71
4601	2319	25	1	49.71
4602	2320	48	3	17.79
4603	2320	20	2	43.87
4604	2320	48	3	17.79
4605	2321	77	2	34.75
4606	2322	26	1	40.13
4607	2323	36	1	51.85
4608	2323	36	1	51.85
4609	2324	47	1	17.6
4610	2324	18	3	33.18
4611	2324	25	1	49.71
4612	2325	78	1	24.71
4613	2326	27	3	34.78
4614	2326	41	1	106.57
4615	2326	30	2	33.59
4616	2326	12	4	283.69
4617	2327	25	1	49.71
4618	2327	35	1	64.83
4619	2327	25	1	49.71
4620	2328	8	1	50.48
4621	2329	83	1	19.55
4622	2329	30	4	33.59
4623	2330	25	1	49.71
4624	2330	47	2	17.6
4625	2330	24	3	49.22
4626	2331	75	3	2.9
4627	2331	12	5	283.69
4628	2331	70	1	64.32
4629	2332	46	1	24.74
4630	2333	5	1	749.81
4631	2333	27	3	34.78
4632	2334	46	1	24.74
4633	2335	49	3	8.95
4634	2335	89	1	11.22
4635	2335	3	1	286.67
4636	2336	48	3	17.79
4637	2336	23	2	61.72
4638	2336	25	3	49.71
4639	2336	4	1	738.89
4640	2337	78	2	24.71
4641	2337	22	1	67.05
4642	2338	25	1	49.71
4643	2338	27	1	34.78
4644	2339	99	3	7.62
4645	2339	56	2	8.63
4646	2339	26	1	40.13
4647	2339	25	5	49.71
4648	2340	98	1	9.66
4649	2341	86	1	44.7
4650	2341	25	1	49.71
4651	2341	25	1	49.71
4652	2341	82	2	9.8
4653	2342	77	1	34.75
4654	2342	94	1	20.26
4655	2343	96	2	46.73
4656	2343	8	1	50.48
4657	2344	13	4	22.41
4658	2344	64	2	42.6
4659	2345	68	2	170.95
4660	2346	24	2	49.22
4661	2346	91	1	25.91
4662	2346	36	1	51.85
4663	2347	23	2	61.72
4664	2348	76	3	2.45
4665	2348	25	1	49.71
4666	2348	27	1	34.78
4667	2348	90	1	13.02
4668	2349	32	4	84.97
4669	2349	72	1	9.77
4670	2350	30	2	33.59
4671	2351	84	2	26.83
4672	2351	17	1	13.19
4673	2352	21	1	63.2
4674	2353	16	1	10.08
4675	2353	68	2	170.95
4676	2354	27	2	34.78
4677	2354	25	1	49.71
4678	2354	5	2	749.81
4679	2355	85	2	36.01
4680	2355	3	1	286.67
4681	2356	36	1	51.85
4682	2356	66	3	66.4
4683	2356	62	1	24.18
4684	2357	78	1	24.71
4685	2358	84	1	26.83
4686	2358	25	1	49.71
4687	2359	64	2	42.6
4688	2359	35	2	64.83
4689	2359	69	1	62.48
4690	2360	64	2	42.6
4691	2360	68	4	170.95
4692	2361	25	2	49.71
4693	2361	29	1	41.05
4694	2362	5	1	749.81
4695	2362	5	1	749.81
4696	2363	12	1	283.69
4697	2363	42	1	125.85
4698	2363	14	3	27.1
4699	2364	94	2	20.26
4700	2364	80	1	7.7
4701	2364	87	2	60.33
4702	2364	68	1	170.95
4703	2365	83	1	19.55
4704	2366	96	3	46.73
4705	2366	81	5	13.69
4706	2366	86	5	44.7
4707	2367	2	1	434.66
4708	2367	30	2	33.59
4709	2368	51	1	16.01
4710	2369	68	2	170.95
4711	2369	47	1	17.6
4712	2370	64	3	42.6
4713	2371	36	1	51.85
4714	2371	48	1	17.79
4715	2372	58	4	19.26
4716	2372	70	1	64.32
4717	2372	45	2	40.06
4718	2373	12	1	283.69
4719	2374	33	2	77.74
4720	2374	68	4	170.95
4721	2375	25	1	49.71
4722	2375	30	1	33.59
4723	2376	78	1	24.71
4724	2377	23	1	61.72
4725	2377	18	2	33.18
4726	2377	78	4	24.71
4727	2378	36	1	51.85
4728	2378	23	2	61.72
4729	2378	25	3	49.71
4730	2378	28	2	38.97
4731	2379	45	1	40.06
4732	2380	30	1	33.59
4733	2380	40	1	49.48
4734	2381	51	3	16.01
4735	2381	17	1	13.19
4736	2382	60	1	22.42
4737	2382	30	3	33.59
4738	2383	21	2	63.2
4739	2384	36	1	51.85
4740	2384	25	2	49.71
4741	2385	23	2	61.72
4742	2386	68	1	170.95
4743	2386	68	1	170.95
4744	2387	90	1	13.02
4745	2387	83	1	19.55
4746	2388	45	1	40.06
4747	2388	60	1	22.42
4748	2389	49	1	8.95
4749	2389	68	1	170.95
4750	2390	48	1	17.79
4751	2390	53	1	43.04
4752	2390	25	1	49.71
4753	2391	49	1	8.95
4754	2391	76	2	2.45
4755	2391	78	4	24.71
4756	2392	69	2	62.48
4757	2392	43	2	69.98
4758	2393	41	1	106.57
4759	2394	25	4	49.71
4760	2395	73	2	10.32
4761	2396	88	2	14.38
4762	2396	65	1	88.86
4763	2397	36	2	51.85
4764	2397	6	1	652.7
4765	2398	54	5	34.3
4766	2398	76	2	2.45
4767	2398	55	1	12.59
4768	2399	18	4	33.18
4769	2400	15	2	15.19
4770	2400	26	1	40.13
4771	2401	59	2	12.93
4772	2402	32	2	84.97
4773	2403	49	2	8.95
4774	2403	38	3	141.29
4775	2404	24	2	49.22
4776	2404	31	2	33.5
4777	2405	82	1	9.8
4778	2405	64	1	42.6
4779	2405	27	5	34.78
4780	2405	37	1	149.74
4781	2406	25	2	49.71
4782	2407	6	2	652.7
4783	2408	16	1	10.08
4784	2409	11	2	369.57
4785	2410	91	1	25.91
4786	2410	8	1	50.48
4787	2411	25	1	49.71
4788	2411	48	5	17.79
4789	2412	89	2	11.22
4790	2413	25	2	49.71
4791	2413	87	1	60.33
4792	2414	78	1	24.71
4793	2415	41	1	106.57
4794	2416	25	2	49.71
4795	2416	22	1	67.05
4796	2416	26	1	40.13
4797	2417	25	1	49.71
4798	2417	14	2	27.1
4799	2418	7	1	38.61
4800	2418	71	3	7.99
4801	2418	27	3	34.78
4802	2419	64	1	42.6
4803	2420	25	3	49.71
4804	2421	21	1	63.2
4805	2421	83	1	19.55
4806	2422	74	3	3.59
4807	2422	7	1	38.61
4808	2422	11	1	369.57
4809	2422	24	1	49.22
4810	2423	25	4	49.71
4811	2424	25	2	49.71
4812	2424	47	1	17.6
4813	2424	82	2	9.8
4814	2425	35	4	64.83
4815	2426	28	1	38.97
4816	2427	4	1	738.89
4817	2428	68	1	170.95
4818	2429	16	1	10.08
4819	2429	69	2	62.48
4820	2429	90	1	13.02
4821	2429	18	2	33.18
4822	2430	42	2	125.85
4823	2431	25	2	49.71
4824	2431	48	5	17.79
4825	2431	16	4	10.08
4826	2431	100	1	10.12
4827	2432	79	3	6.88
4828	2432	35	4	64.83
4829	2432	24	1	49.22
4830	2432	25	2	49.71
4831	2433	16	5	10.08
4832	2434	75	2	2.9
4833	2435	23	2	61.72
4834	2435	12	1	283.69
4835	2435	90	1	13.02
4836	2436	58	5	19.26
4837	2436	25	1	49.71
4838	2436	25	1	49.71
4839	2437	24	3	49.22
4840	2437	52	1	14.33
4841	2438	90	1	13.02
4842	2438	63	1	33.06
4843	2438	52	2	14.33
4844	2439	46	1	24.74
4845	2440	2	1	434.66
4846	2441	68	1	170.95
4847	2441	49	1	8.95
4848	2441	25	1	49.71
4849	2442	55	2	12.59
4850	2442	25	1	49.71
4851	2442	58	3	19.26
4852	2443	18	2	33.18
4853	2443	33	3	77.74
4854	2443	39	2	41.87
4855	2443	91	3	25.91
4856	2444	20	1	43.87
4857	2444	25	2	49.71
4858	2444	24	5	49.22
4859	2444	50	1	6.73
4860	2445	62	1	24.18
4861	2445	16	2	10.08
4862	2445	25	3	49.71
4863	2446	33	1	77.74
4864	2447	36	2	51.85
4865	2448	69	1	62.48
4866	2449	71	1	7.99
4867	2449	21	1	63.2
4868	2450	9	1	155.72
4869	2451	4	1	738.89
4870	2452	35	1	64.83
4871	2453	25	2	49.71
4872	2453	49	1	8.95
4873	2453	6	1	652.7
4874	2454	37	1	149.74
4875	2454	11	1	369.57
4876	2455	48	2	17.79
4877	2456	99	4	7.62
4878	2456	61	1	18.1
4879	2456	9	3	155.72
4880	2457	60	2	22.42
4881	2458	25	2	49.71
4882	2459	85	1	36.01
4883	2459	83	1	19.55
4884	2459	11	2	369.57
4885	2460	11	1	369.57
4886	2460	39	3	41.87
4887	2461	13	1	22.41
4888	2461	47	1	17.6
4889	2461	23	1	61.72
4890	2462	25	1	49.71
4891	2462	18	2	33.18
4892	2462	82	1	9.8
4893	2463	76	2	2.45
4894	2464	53	2	43.04
4895	2465	68	3	170.95
4896	2465	25	5	49.71
4897	2465	26	1	40.13
4898	2466	3	1	286.67
4899	2467	30	1	33.59
4900	2467	48	1	17.79
4901	2468	26	5	40.13
4902	2468	100	2	10.12
4903	2469	18	1	33.18
4904	2469	25	2	49.71
4905	2470	83	1	19.55
4906	2470	25	1	49.71
4907	2470	73	4	10.32
4908	2471	35	1	64.83
4909	2472	19	1	40.25
4910	2473	16	1	10.08
4911	2473	12	1	283.69
4912	2473	83	1	19.55
4913	2474	95	1	48.75
4914	2475	6	2	652.7
4915	2475	5	3	749.81
4916	2475	41	1	106.57
4917	2476	48	5	17.79
4918	2477	78	2	24.71
4919	2477	69	4	62.48
4920	2477	26	2	40.13
4921	2478	42	1	125.85
4922	2479	24	1	49.22
4923	2480	91	1	25.91
4924	2480	12	1	283.69
4925	2480	85	3	36.01
4926	2481	47	2	17.6
4927	2482	93	1	19.24
4928	2483	99	1	7.62
4929	2483	45	3	40.06
4930	2483	80	1	7.7
4931	2484	37	1	149.74
4932	2484	5	1	749.81
4933	2485	24	2	49.22
4934	2486	24	3	49.22
4935	2486	7	1	38.61
4936	2486	25	2	49.71
4937	2486	53	3	43.04
4938	2487	87	2	60.33
4939	2487	85	1	36.01
4940	2488	100	2	10.12
4941	2489	73	1	10.32
4942	2489	60	2	22.42
4943	2489	30	1	33.59
4944	2490	88	1	14.38
4945	2491	87	2	60.33
4946	2491	90	2	13.02
4947	2491	31	1	33.5
4948	2492	16	1	10.08
4949	2493	56	1	8.63
4950	2494	68	5	170.95
4951	2494	25	1	49.71
4952	2494	49	1	8.95
4953	2494	28	1	38.97
4954	2495	38	2	141.29
4955	2496	25	1	49.71
4956	2496	43	4	69.98
4957	2497	24	1	49.22
4958	2497	47	2	17.6
4959	2497	36	2	51.85
4960	2498	42	1	125.85
4961	2498	60	1	22.42
4962	2498	27	2	34.78
4963	2499	14	1	27.1
4964	2499	45	1	40.06
4965	2499	71	1	7.99
4966	2500	66	2	66.4
4967	2501	63	1	33.06
4968	2501	25	2	49.71
4969	2501	28	2	38.97
4970	2502	25	1	49.71
4971	2503	25	2	49.71
4972	2503	25	1	49.71
4973	2504	25	5	49.71
4974	2505	76	1	2.45
4975	2505	33	2	77.74
4976	2506	25	1	49.71
4977	2506	23	1	61.72
4978	2506	25	1	49.71
4979	2506	99	3	7.62
4980	2507	93	2	19.24
4981	2508	24	2	49.22
4982	2508	36	1	51.85
4983	2509	74	3	3.59
4984	2510	77	5	34.75
4985	2510	25	1	49.71
4986	2511	50	1	6.73
4987	2511	62	1	24.18
4988	2512	94	2	20.26
4989	2512	73	1	10.32
4990	2513	18	1	33.18
4991	2514	36	1	51.85
4992	2514	31	5	33.5
4993	2514	10	2	101.01
4994	2514	27	1	34.78
4995	2515	25	1	49.71
4996	2516	68	1	170.95
4997	2516	65	1	88.86
4998	2517	76	5	2.45
4999	2517	25	2	49.71
5000	2517	72	1	9.77
5001	2517	46	1	24.74
5002	2518	30	2	33.59
5003	2518	25	2	49.71
5004	2518	25	3	49.71
5005	2518	23	1	61.72
5006	2519	99	2	7.62
5007	2519	25	1	49.71
5008	2519	69	5	62.48
5009	2520	99	2	7.62
5010	2521	71	1	7.99
5011	2521	88	2	14.38
5012	2522	33	1	77.74
5013	2522	80	5	7.7
5014	2523	48	1	17.79
5015	2523	69	2	62.48
5016	2524	36	2	51.85
5017	2525	5	2	749.81
5018	2526	36	1	51.85
5019	2527	56	1	8.63
5020	2527	14	3	27.1
5021	2528	25	1	49.71
5022	2528	20	5	43.87
5023	2529	37	1	149.74
5024	2530	91	1	25.91
5025	2530	11	1	369.57
5026	2530	76	1	2.45
5027	2531	60	1	22.42
5028	2532	99	1	7.62
5029	2532	38	1	141.29
5030	2533	99	1	7.62
5031	2534	24	1	49.22
5032	2534	94	1	20.26
5033	2535	88	2	14.38
5034	2535	87	2	60.33
5035	2535	67	2	183.38
5036	2535	12	1	283.69
5037	2536	18	2	33.18
5038	2536	36	2	51.85
5039	2537	70	2	64.32
5040	2538	25	2	49.71
5041	2539	11	1	369.57
5042	2540	55	2	12.59
5043	2541	96	4	46.73
5044	2541	60	1	22.42
5045	2542	49	1	8.95
5046	2543	37	1	149.74
5047	2543	93	1	19.24
5048	2543	23	1	61.72
5049	2544	45	3	40.06
5050	2545	82	2	9.8
5051	2546	86	1	44.7
5052	2546	47	4	17.6
5053	2547	64	1	42.6
5054	2547	73	1	10.32
5055	2547	98	2	9.66
5056	2548	53	1	43.04
5057	2549	25	1	49.71
5058	2549	91	1	25.91
5059	2550	41	1	106.57
5060	2551	25	2	49.71
5061	2551	36	1	51.85
5062	2552	50	1	6.73
5063	2552	32	1	84.97
5064	2552	74	2	3.59
5065	2553	5	1	749.81
5066	2554	34	1	80.71
5067	2555	25	1	49.71
5068	2555	89	1	11.22
5069	2556	1	1	414.28
5070	2557	36	1	51.85
5071	2558	63	5	33.06
5072	2559	56	2	8.63
5073	2559	25	1	49.71
5074	2560	73	2	10.32
5075	2560	5	2	749.81
5076	2560	36	2	51.85
5077	2561	26	2	40.13
5078	2562	22	1	67.05
5079	2563	91	2	25.91
5080	2564	27	3	34.78
5081	2564	52	2	14.33
5082	2565	24	1	49.22
5083	2566	50	1	6.73
5084	2566	45	2	40.06
5085	2567	50	1	6.73
5086	2568	25	2	49.71
5087	2568	11	1	369.57
5088	2568	48	1	17.79
5089	2569	35	3	64.83
5090	2569	25	1	49.71
5091	2570	75	1	2.9
5092	2570	43	3	69.98
5093	2570	25	1	49.71
5094	2570	48	1	17.79
5095	2571	22	5	67.05
5096	2571	11	2	369.57
5097	2572	79	5	6.88
5098	2573	76	5	2.45
5099	2573	82	1	9.8
5100	2574	25	2	49.71
5101	2574	23	1	61.72
5102	2575	3	1	286.67
5103	2575	30	3	33.59
5104	2575	25	3	49.71
5105	2575	49	2	8.95
5106	2576	76	1	2.45
5107	2577	64	2	42.6
5108	2577	91	2	25.91
5109	2578	77	2	34.75
5110	2578	14	4	27.1
5111	2578	30	1	33.59
5112	2578	38	2	141.29
5113	2579	100	2	10.12
5114	2579	25	1	49.71
5115	2580	14	1	27.1
5116	2580	25	1	49.71
5117	2580	8	1	50.48
5118	2581	1	1	414.28
5119	2582	78	2	24.71
5120	2582	30	2	33.59
5121	2583	65	1	88.86
5122	2584	55	1	12.59
5123	2584	100	2	10.12
5124	2585	25	2	49.71
5125	2586	30	1	33.59
5126	2587	96	1	46.73
5127	2588	25	1	49.71
5128	2589	25	1	49.71
5129	2590	32	1	84.97
5130	2591	99	1	7.62
5131	2592	89	1	11.22
5132	2593	67	1	183.38
5133	2594	31	2	33.5
5134	2594	30	2	33.59
5135	2595	73	3	10.32
5136	2595	27	1	34.78
5137	2595	37	1	149.74
5138	2596	99	1	7.62
5139	2596	99	3	7.62
5140	2597	50	1	6.73
5141	2597	59	2	12.93
5142	2597	59	1	12.93
5143	2597	25	3	49.71
5144	2598	61	1	18.1
5145	2599	48	1	17.79
5146	2599	25	1	49.71
5147	2600	23	4	61.72
5148	2600	18	2	33.18
5149	2601	15	2	15.19
5150	2601	83	1	19.55
5151	2602	24	2	49.22
5152	2602	23	1	61.72
5153	2602	38	1	141.29
5154	2602	36	1	51.85
5155	2603	71	1	7.99
5156	2603	47	1	17.6
5157	2604	12	3	283.69
5158	2604	61	1	18.1
5159	2604	87	1	60.33
5160	2604	25	3	49.71
5161	2605	25	4	49.71
5162	2606	73	2	10.32
5163	2606	33	3	77.74
5164	2606	36	1	51.85
5165	2606	52	2	14.33
5166	2607	25	3	49.71
5167	2607	14	2	27.1
5168	2607	25	2	49.71
5169	2607	10	1	101.01
5170	2608	58	1	19.26
5171	2609	26	1	40.13
5172	2610	12	1	283.69
5173	2611	67	1	183.38
5174	2612	91	2	25.91
5175	2612	6	2	652.7
5176	2613	56	3	8.63
5177	2613	56	2	8.63
5178	2613	95	1	48.75
5179	2614	89	2	11.22
5180	2614	84	5	26.83
5181	2614	57	4	13.42
5182	2615	54	1	34.3
5183	2616	20	1	43.87
5184	2617	52	2	14.33
5185	2618	25	1	49.71
5186	2618	68	1	170.95
5187	2618	8	1	50.48
5188	2618	25	1	49.71
5189	2619	60	4	22.42
5190	2619	90	2	13.02
5191	2619	57	1	13.42
5192	2619	25	3	49.71
5193	2620	97	2	12.46
5194	2620	21	2	63.2
5195	2621	99	4	7.62
5196	2622	36	2	51.85
5197	2622	36	2	51.85
5198	2623	87	1	60.33
5199	2624	95	4	48.75
5200	2624	28	1	38.97
5201	2624	94	2	20.26
5202	2624	64	3	42.6
5203	2625	68	2	170.95
5204	2625	87	5	60.33
5205	2625	22	5	67.05
5206	2626	57	1	13.42
5207	2626	1	1	414.28
5208	2627	25	1	49.71
5209	2627	100	1	10.12
5210	2628	7	2	38.61
5211	2628	58	1	19.26
5212	2628	2	4	434.66
5213	2629	25	3	49.71
5214	2629	50	1	6.73
5215	2629	52	1	14.33
5216	2630	76	5	2.45
5217	2631	25	1	49.71
5218	2631	74	2	3.59
5219	2632	48	2	17.79
5220	2632	68	1	170.95
5221	2633	25	1	49.71
5222	2633	12	3	283.69
5223	2634	56	2	8.63
5224	2635	25	2	49.71
5225	2635	25	2	49.71
5226	2636	49	4	8.95
5227	2637	84	2	26.83
5228	2638	26	4	40.13
5229	2638	99	2	7.62
5230	2639	45	1	40.06
5231	2639	48	5	17.79
5232	2639	72	2	9.77
5233	2640	54	3	34.3
5234	2640	27	2	34.78
5235	2641	24	3	49.22
5236	2642	71	1	7.99
5237	2643	85	1	36.01
5238	2643	81	1	13.69
5239	2643	40	2	49.48
5240	2644	12	1	283.69
5241	2645	6	1	652.7
5242	2645	11	2	369.57
5243	2646	25	2	49.71
5244	2647	56	1	8.63
5245	2647	49	1	8.95
5246	2647	61	3	18.1
5247	2647	23	1	61.72
5248	2648	13	1	22.41
5249	2648	57	1	13.42
5250	2649	25	1	49.71
5251	2650	36	1	51.85
5252	2650	26	1	40.13
5253	2650	22	1	67.05
5254	2650	94	1	20.26
5255	2651	63	2	33.06
5256	2651	56	1	8.63
5257	2652	25	2	49.71
5258	2653	48	1	17.79
5259	2653	56	2	8.63
5260	2654	77	5	34.75
5261	2655	73	1	10.32
5262	2655	40	2	49.48
5263	2656	4	2	738.89
5264	2657	32	2	84.97
5265	2658	66	5	66.4
5266	2658	25	1	49.71
5267	2658	25	1	49.71
5268	2658	25	2	49.71
5269	2659	25	3	49.71
5270	2659	8	2	50.48
5271	2660	24	1	49.22
5272	2660	13	1	22.41
5273	2661	92	1	19.55
5274	2661	12	2	283.69
5275	2661	73	2	10.32
5276	2661	26	1	40.13
5277	2662	14	4	27.1
5278	2663	99	1	7.62
5279	2663	75	1	2.9
5280	2664	57	1	13.42
5281	2664	25	1	49.71
5282	2664	23	2	61.72
5283	2665	40	2	49.48
5284	2666	87	1	60.33
5285	2667	76	1	2.45
5286	2667	76	1	2.45
5287	2668	42	1	125.85
5288	2669	78	1	24.71
5289	2670	99	5	7.62
5290	2670	24	1	49.22
5291	2670	73	5	10.32
5292	2671	22	1	67.05
5293	2672	41	1	106.57
5294	2672	81	4	13.69
5295	2673	91	2	25.91
5296	2673	21	5	63.2
5297	2674	75	1	2.9
5298	2675	25	3	49.71
5299	2675	24	1	49.22
5300	2675	98	1	9.66
5301	2676	18	2	33.18
5302	2677	25	1	49.71
5303	2678	15	1	15.19
5304	2679	57	1	13.42
5305	2679	23	1	61.72
5306	2679	25	2	49.71
5307	2680	85	5	36.01
5308	2680	52	4	14.33
5309	2680	31	1	33.5
5310	2681	89	2	11.22
5311	2681	53	1	43.04
5312	2681	69	1	62.48
5313	2682	52	1	14.33
5314	2682	73	4	10.32
5315	2683	90	2	13.02
5316	2683	26	1	40.13
5317	2684	82	2	9.8
5318	2685	25	1	49.71
5319	2685	58	1	19.26
5320	2686	24	1	49.22
5321	2686	42	1	125.85
5322	2687	11	1	369.57
5323	2688	36	5	51.85
5324	2688	14	1	27.1
5325	2689	48	2	17.79
5326	2690	28	2	38.97
5327	2690	11	1	369.57
5328	2691	21	1	63.2
5329	2691	77	3	34.75
5330	2691	92	1	19.55
5331	2692	25	2	49.71
5332	2693	78	2	24.71
5333	2693	67	1	183.38
5334	2694	25	1	49.71
5335	2694	76	1	2.45
5336	2694	25	5	49.71
5337	2695	93	2	19.24
5338	2695	97	1	12.46
5339	2696	36	1	51.85
5340	2697	14	1	27.1
5341	2698	10	4	101.01
5342	2699	26	2	40.13
5343	2700	99	5	7.62
5344	2700	51	3	16.01
5345	2700	65	4	88.86
5346	2701	38	2	141.29
5347	2702	31	1	33.5
5348	2702	68	1	170.95
5349	2702	25	1	49.71
5350	2703	46	1	24.74
5351	2703	88	2	14.38
5352	2703	45	5	40.06
5353	2704	68	2	170.95
5354	2705	45	1	40.06
5355	2705	24	2	49.22
5356	2706	42	2	125.85
5357	2706	78	1	24.71
5358	2706	25	2	49.71
5359	2707	86	1	44.7
5360	2708	6	4	652.7
5361	2709	68	2	170.95
5362	2710	23	1	61.72
5363	2711	79	1	6.88
5364	2712	84	1	26.83
5365	2712	23	2	61.72
5366	2712	77	2	34.75
5367	2713	8	1	50.48
5368	2714	76	2	2.45
5369	2714	25	2	49.71
5370	2715	25	1	49.71
5371	2715	24	2	49.22
5372	2716	72	1	9.77
5373	2717	55	3	12.59
5374	2718	63	1	33.06
5375	2719	77	2	34.75
5376	2719	17	1	13.19
5377	2719	31	1	33.5
5378	2720	43	2	69.98
5379	2720	100	1	10.12
5380	2720	20	4	43.87
5381	2721	49	4	8.95
5382	2721	30	1	33.59
5383	2722	92	4	19.55
5384	2722	6	1	652.7
5385	2723	25	1	49.71
5386	2723	25	2	49.71
5387	2724	17	1	13.19
5388	2724	27	2	34.78
5389	2724	72	2	9.77
5390	2725	31	1	33.5
5391	2725	12	2	283.69
5392	2726	25	1	49.71
5393	2727	36	1	51.85
5394	2727	53	1	43.04
5395	2727	30	3	33.59
5396	2728	23	1	61.72
5397	2728	65	1	88.86
5398	2728	38	1	141.29
5399	2729	91	2	25.91
5400	2730	37	3	149.74
5401	2730	53	1	43.04
5402	2730	23	1	61.72
5403	2730	57	3	13.42
5404	2731	45	2	40.06
5405	2731	2	1	434.66
5406	2731	14	2	27.1
5407	2732	47	1	17.6
5408	2732	78	1	24.71
5409	2733	39	5	41.87
5410	2734	14	2	27.1
5411	2735	36	1	51.85
5412	2735	25	1	49.71
5413	2735	18	5	33.18
5414	2736	68	1	170.95
5415	2737	22	1	67.05
5416	2738	48	3	17.79
5417	2739	40	3	49.48
5418	2740	6	2	652.7
5419	2741	30	2	33.59
5420	2742	25	3	49.71
5421	2743	64	5	42.6
5422	2743	92	1	19.55
5423	2744	24	5	49.22
5424	2744	33	2	77.74
5425	2744	35	1	64.83
5426	2745	25	2	49.71
5427	2745	23	2	61.72
5428	2745	15	3	15.19
5429	2746	91	1	25.91
5430	2746	73	1	10.32
5431	2746	87	2	60.33
5432	2746	42	1	125.85
5433	2747	51	2	16.01
5434	2747	25	1	49.71
5435	2747	79	5	6.88
5436	2748	18	1	33.18
5437	2748	23	1	61.72
5438	2749	33	1	77.74
5439	2750	50	2	6.73
5440	2750	80	1	7.7
5441	2750	5	1	749.81
5442	2751	19	4	40.25
5443	2751	91	1	25.91
5444	2752	39	1	41.87
5445	2752	83	2	19.55
5446	2753	6	1	652.7
5447	2753	71	3	7.99
5448	2754	24	3	49.22
5449	2755	11	1	369.57
5450	2756	69	5	62.48
5451	2756	65	1	88.86
5452	2756	46	1	24.74
5453	2756	24	1	49.22
5454	2757	12	1	283.69
5455	2758	24	1	49.22
5456	2758	60	1	22.42
5457	2758	13	3	22.41
5458	2758	36	1	51.85
5459	2759	70	2	64.32
5460	2759	25	1	49.71
5461	2759	39	3	41.87
5462	2760	25	3	49.71
5463	2760	25	2	49.71
5464	2760	66	1	66.4
5465	2761	23	1	61.72
5466	2761	24	2	49.22
5467	2762	79	1	6.88
5468	2763	98	1	9.66
5469	2764	87	1	60.33
5470	2765	25	1	49.71
5471	2765	1	5	414.28
5472	2765	19	2	40.25
5473	2766	48	2	17.79
5474	2766	78	2	24.71
5475	2767	28	2	38.97
5476	2767	42	1	125.85
5477	2767	16	1	10.08
5478	2768	49	1	8.95
5479	2768	97	1	12.46
5480	2768	50	1	6.73
5481	2769	22	4	67.05
5482	2769	71	2	7.99
5483	2769	9	1	155.72
5484	2769	19	2	40.25
5485	2770	43	1	69.98
5486	2770	33	2	77.74
5487	2770	60	1	22.42
5488	2771	46	1	24.74
5489	2771	25	2	49.71
5490	2772	36	1	51.85
5491	2772	25	1	49.71
5492	2773	92	5	19.55
5493	2773	23	1	61.72
5494	2774	59	1	12.93
5495	2774	81	1	13.69
5496	2775	25	3	49.71
5497	2775	93	1	19.24
5498	2776	25	4	49.71
5499	2776	64	1	42.6
5500	2777	36	1	51.85
5501	2777	81	5	13.69
5502	2777	36	3	51.85
5503	2778	48	1	17.79
5504	2779	25	1	49.71
5505	2780	25	1	49.71
5506	2780	17	1	13.19
5507	2780	97	5	12.46
5508	2780	25	2	49.71
5509	2781	88	1	14.38
5510	2782	10	3	101.01
5511	2782	99	2	7.62
5512	2783	48	2	17.79
5513	2783	46	1	24.74
5514	2784	80	2	7.7
5515	2785	30	1	33.59
5516	2785	91	1	25.91
5517	2786	78	1	24.71
5518	2786	94	1	20.26
5519	2787	27	1	34.78
5520	2787	53	1	43.04
5521	2787	49	3	8.95
5522	2788	26	1	40.13
5523	2789	36	3	51.85
5524	2789	24	3	49.22
5525	2790	12	2	283.69
5526	2790	70	2	64.32
5527	2790	91	3	25.91
5528	2791	25	2	49.71
5529	2792	23	2	61.72
5530	2792	45	2	40.06
5531	2793	69	1	62.48
5532	2793	25	1	49.71
5533	2794	30	1	33.59
5534	2794	67	4	183.38
5535	2795	16	1	10.08
5536	2796	43	2	69.98
5537	2797	98	3	9.66
5538	2797	16	2	10.08
5539	2797	78	5	24.71
5540	2798	80	1	7.7
5541	2799	89	2	11.22
5542	2800	42	1	125.85
5543	2800	25	3	49.71
5544	2801	12	1	283.69
5545	2801	57	1	13.42
5546	2802	67	1	183.38
5547	2802	49	3	8.95
5548	2803	41	4	106.57
5549	2803	76	2	2.45
5550	2804	49	1	8.95
5551	2805	25	1	49.71
5552	2805	12	1	283.69
5553	2805	25	1	49.71
5554	2806	31	2	33.5
5555	2807	36	5	51.85
5556	2807	78	1	24.71
5557	2807	76	1	2.45
5558	2807	13	1	22.41
5559	2808	24	1	49.22
5560	2808	36	1	51.85
5561	2809	13	2	22.41
5562	2809	59	1	12.93
5563	2810	12	3	283.69
5564	2810	8	1	50.48
5565	2811	5	4	749.81
5566	2811	72	2	9.77
5567	2812	48	1	17.79
5568	2813	100	1	10.12
5569	2814	7	2	38.61
5570	2815	8	2	50.48
5571	2815	68	3	170.95
5572	2816	31	1	33.5
5573	2816	9	1	155.72
5574	2817	60	1	22.42
5575	2818	97	5	12.46
5576	2818	20	1	43.87
5577	2818	25	3	49.71
5578	2819	36	4	51.85
5579	2820	22	1	67.05
5580	2820	33	1	77.74
5581	2821	23	1	61.72
5582	2822	60	1	22.42
5583	2822	25	1	49.71
5584	2822	70	2	64.32
5585	2823	25	1	49.71
5586	2823	62	1	24.18
5587	2823	31	1	33.5
5588	2824	91	1	25.91
5589	2824	96	1	46.73
5590	2825	73	3	10.32
5591	2826	24	1	49.22
5592	2826	45	4	40.06
5593	2827	49	1	8.95
5594	2828	24	1	49.22
5595	2828	25	1	49.71
5596	2829	65	2	88.86
5597	2830	35	5	64.83
5598	2831	99	2	7.62
5599	2832	99	2	7.62
5600	2832	48	1	17.79
5601	2832	41	1	106.57
5602	2832	46	2	24.74
5603	2833	12	1	283.69
5604	2834	36	1	51.85
5605	2835	27	4	34.78
5606	2836	25	1	49.71
5607	2836	4	1	738.89
5608	2837	89	1	11.22
5609	2838	23	1	61.72
5610	2838	25	1	49.71
5611	2838	66	1	66.4
5612	2838	62	5	24.18
5613	2839	54	3	34.3
5614	2840	61	2	18.1
5615	2840	36	1	51.85
5616	2841	60	2	22.42
5617	2841	22	1	67.05
5618	2842	25	1	49.71
5619	2843	5	1	749.81
5620	2843	53	1	43.04
5621	2843	19	2	40.25
5622	2844	48	3	17.79
5623	2845	25	1	49.71
5624	2845	37	1	149.74
5625	2846	36	1	51.85
5626	2847	74	1	3.59
5627	2847	68	4	170.95
5628	2848	59	1	12.93
5629	2848	30	1	33.59
5630	2848	12	1	283.69
5631	2849	31	1	33.5
5632	2849	28	1	38.97
5633	2849	87	1	60.33
5634	2850	39	1	41.87
5635	2850	23	2	61.72
5636	2850	34	2	80.71
5637	2851	27	1	34.78
5638	2851	31	1	33.5
5639	2851	23	2	61.72
5640	2851	72	2	9.77
5641	2852	23	1	61.72
5642	2853	91	1	25.91
5643	2853	91	2	25.91
5644	2853	23	3	61.72
5645	2853	93	1	19.24
5646	2854	27	2	34.78
5647	2854	90	1	13.02
5648	2855	92	2	19.55
5649	2855	18	1	33.18
5650	2855	35	1	64.83
5651	2856	25	4	49.71
5652	2856	97	2	12.46
5653	2856	73	1	10.32
5654	2857	25	1	49.71
5655	2857	3	4	286.67
5656	2858	82	1	9.8
5657	2858	65	4	88.86
5658	2858	65	3	88.86
5659	2859	49	4	8.95
5660	2859	51	3	16.01
5661	2859	61	3	18.1
5662	2860	43	2	69.98
5663	2861	43	2	69.98
5664	2861	48	1	17.79
5665	2861	99	1	7.62
5666	2862	25	1	49.71
5667	2862	58	2	19.26
5668	2862	26	1	40.13
5669	2863	46	2	24.74
5670	2864	89	1	11.22
5671	2865	1	1	414.28
5672	2866	96	1	46.73
5673	2866	41	5	106.57
5674	2866	53	2	43.04
5675	2867	66	2	66.4
5676	2868	65	1	88.86
5677	2868	56	1	8.63
5678	2868	25	1	49.71
5679	2868	20	1	43.87
5680	2869	31	1	33.5
5681	2870	23	2	61.72
5682	2871	88	3	14.38
5683	2871	8	1	50.48
5684	2872	25	1	49.71
5685	2873	50	2	6.73
5686	2873	81	1	13.69
5687	2874	66	1	66.4
5688	2874	24	1	49.22
5689	2874	49	1	8.95
5690	2875	5	2	749.81
5691	2875	25	2	49.71
5692	2875	42	2	125.85
5693	2876	25	2	49.71
5694	2877	90	1	13.02
5695	2878	11	1	369.57
5696	2878	27	1	34.78
5697	2878	18	2	33.18
5698	2879	71	1	7.99
5699	2879	23	5	61.72
5700	2879	19	2	40.25
5701	2880	23	3	61.72
5702	2881	60	2	22.42
5703	2882	6	3	652.7
5704	2883	25	2	49.71
5705	2883	25	1	49.71
5706	2883	35	1	64.83
5707	2883	69	4	62.48
5708	2884	46	2	24.74
5709	2884	46	1	24.74
5710	2885	99	1	7.62
5711	2885	25	3	49.71
5712	2885	73	1	10.32
5713	2885	25	1	49.71
5714	2886	24	4	49.22
5715	2886	21	2	63.2
5716	2886	56	1	8.63
5717	2887	2	1	434.66
5718	2888	6	1	652.7
5719	2888	25	1	49.71
5720	2888	77	1	34.75
5721	2889	30	1	33.59
5722	2889	68	1	170.95
5723	2889	18	2	33.18
5724	2890	23	1	61.72
5725	2890	89	2	11.22
5726	2891	51	1	16.01
5727	2892	25	3	49.71
5728	2892	42	1	125.85
5729	2893	84	1	26.83
5730	2894	78	3	24.71
5731	2895	27	1	34.78
5732	2896	25	4	49.71
5733	2896	96	1	46.73
5734	2897	56	1	8.63
5735	2897	86	2	44.7
5736	2897	1	2	414.28
5737	2898	78	1	24.71
5738	2899	25	2	49.71
5739	2899	79	5	6.88
5740	2900	57	1	13.42
5741	2900	87	2	60.33
5742	2900	85	1	36.01
5743	2901	25	1	49.71
5744	2901	16	1	10.08
5745	2901	36	1	51.85
5746	2902	70	1	64.32
5747	2903	68	1	170.95
5748	2904	26	3	40.13
5749	2904	25	2	49.71
5750	2905	25	1	49.71
5751	2905	18	2	33.18
5752	2906	46	1	24.74
5753	2907	11	1	369.57
5754	2908	26	2	40.13
5755	2908	71	2	7.99
5756	2909	76	1	2.45
5757	2910	85	2	36.01
5758	2911	39	1	41.87
5759	2911	15	2	15.19
5760	2912	76	1	2.45
5761	2912	59	1	12.93
5762	2912	27	1	34.78
5763	2912	18	5	33.18
5764	2913	91	4	25.91
5765	2913	16	1	10.08
5766	2913	18	4	33.18
5767	2914	8	2	50.48
5768	2914	97	1	12.46
5769	2915	17	2	13.19
5770	2916	27	1	34.78
5771	2916	68	1	170.95
5772	2917	78	1	24.71
5773	2918	18	3	33.18
5774	2918	25	2	49.71
5775	2918	25	3	49.71
5776	2919	18	4	33.18
5777	2920	6	4	652.7
5778	2921	78	2	24.71
5779	2922	20	2	43.87
5780	2923	25	1	49.71
5781	2923	51	1	16.01
5782	2923	10	3	101.01
5783	2924	30	2	33.59
5784	2925	98	4	9.66
5785	2926	69	1	62.48
5786	2926	55	1	12.59
5787	2926	9	1	155.72
5788	2926	49	2	8.95
5789	2927	11	1	369.57
5790	2927	15	3	15.19
5791	2927	59	1	12.93
5792	2927	42	1	125.85
5793	2928	25	1	49.71
5794	2928	25	1	49.71
5795	2929	57	2	13.42
5796	2930	90	1	13.02
5797	2930	78	1	24.71
5798	2930	25	5	49.71
5799	2931	46	1	24.74
5800	2931	50	1	6.73
5801	2932	91	1	25.91
5802	2933	6	2	652.7
5803	2933	47	1	17.6
5804	2933	99	1	7.62
5805	2934	43	1	69.98
5806	2934	36	1	51.85
5807	2935	42	2	125.85
5808	2935	25	2	49.71
5809	2936	86	1	44.7
5810	2936	27	5	34.78
5811	2937	79	1	6.88
5812	2937	21	1	63.2
5813	2938	39	1	41.87
5814	2939	59	1	12.93
5815	2939	31	2	33.5
5816	2940	26	1	40.13
5817	2940	30	3	33.59
5818	2941	25	2	49.71
5819	2941	25	1	49.71
5820	2942	85	1	36.01
5821	2942	25	2	49.71
5822	2942	50	2	6.73
5823	2942	7	1	38.61
5824	2943	45	4	40.06
5825	2943	36	2	51.85
5826	2943	43	1	69.98
5827	2944	25	1	49.71
5828	2944	91	1	25.91
5829	2944	24	4	49.22
5830	2944	66	5	66.4
5831	2945	23	1	61.72
5832	2945	25	2	49.71
5833	2946	36	1	51.85
5834	2946	70	2	64.32
5835	2947	14	3	27.1
5836	2947	79	1	6.88
5837	2947	47	3	17.6
5838	2948	23	1	61.72
5839	2949	44	1	54.57
5840	2949	86	2	44.7
5841	2950	42	1	125.85
5842	2950	3	2	286.67
5843	2950	25	1	49.71
5844	2951	77	4	34.75
5845	2951	33	5	77.74
5846	2951	91	3	25.91
5847	2952	38	4	141.29
5848	2952	12	2	283.69
5849	2952	12	5	283.69
5850	2952	34	1	80.71
5851	2953	25	1	49.71
5852	2953	48	1	17.79
5853	2953	52	1	14.33
5854	2954	25	1	49.71
5855	2954	4	4	738.89
5856	2954	12	2	283.69
5857	2955	18	1	33.18
5858	2955	53	2	43.04
5859	2956	86	2	44.7
5860	2957	48	1	17.79
5861	2957	36	5	51.85
5862	2958	46	1	24.74
5863	2958	74	2	3.59
5864	2959	20	2	43.87
5865	2959	35	1	64.83
5866	2960	55	1	12.59
5867	2960	87	1	60.33
5868	2961	25	1	49.71
5869	2961	78	1	24.71
5870	2962	34	1	80.71
5871	2962	52	1	14.33
5872	2962	91	1	25.91
5873	2963	57	2	13.42
5874	2963	73	1	10.32
5875	2963	84	5	26.83
5876	2964	37	2	149.74
5877	2964	32	2	84.97
5878	2965	12	3	283.69
5879	2966	20	2	43.87
5880	2966	50	3	6.73
5881	2966	26	1	40.13
5882	2967	38	1	141.29
5883	2968	10	3	101.01
5884	2968	11	1	369.57
5885	2969	87	3	60.33
5886	2969	45	2	40.06
5887	2969	5	1	749.81
5888	2970	98	3	9.66
5889	2971	91	1	25.91
5890	2971	48	1	17.79
5891	2971	99	1	7.62
5892	2972	28	1	38.97
5893	2973	25	1	49.71
5894	2974	45	1	40.06
5895	2974	69	1	62.48
5896	2974	76	1	2.45
5897	2975	91	2	25.91
5898	2975	48	1	17.79
5899	2975	65	1	88.86
5900	2976	94	4	20.26
5901	2976	25	2	49.71
5902	2977	25	2	49.71
5903	2977	92	2	19.55
5904	2977	76	3	2.45
5905	2978	98	2	9.66
5906	2978	18	2	33.18
5907	2978	87	1	60.33
5908	2979	25	1	49.71
5909	2980	48	4	17.79
5910	2980	19	1	40.25
5911	2981	18	1	33.18
5912	2981	25	3	49.71
5913	2982	42	2	125.85
5914	2982	22	1	67.05
5915	2983	31	2	33.5
5916	2984	27	2	34.78
5917	2984	20	1	43.87
5918	2984	25	5	49.71
5919	2985	33	1	77.74
5920	2985	25	1	49.71
5921	2986	17	1	13.19
5922	2987	89	1	11.22
5923	2987	18	1	33.18
5924	2988	55	1	12.59
5925	2989	58	2	19.26
5926	2989	2	2	434.66
5927	2989	45	2	40.06
5928	2990	76	1	2.45
5929	2991	24	2	49.22
5930	2991	36	2	51.85
5931	2992	73	3	10.32
5932	2992	78	2	24.71
5933	2993	24	2	49.22
5934	2994	46	2	24.74
5935	2994	76	1	2.45
5936	2994	57	1	13.42
5937	2995	47	2	17.6
5938	2995	96	1	46.73
5939	2995	25	1	49.71
5940	2995	71	1	7.99
5941	2996	73	2	10.32
5942	2996	68	1	170.95
5943	2997	33	4	77.74
5944	2997	31	1	33.5
5945	2998	75	2	2.9
5946	2999	23	1	61.72
5947	2999	95	2	48.75
5948	2999	12	1	283.69
5949	2999	95	4	48.75
5950	3000	15	1	15.19
5951	3001	16	1	10.08
5952	3001	62	1	24.18
5953	3001	47	1	17.6
5954	3002	12	1	283.69
5955	3003	25	4	49.71
5956	3004	79	1	6.88
5957	3004	34	1	80.71
5958	3005	42	2	125.85
5959	3005	5	5	749.81
5960	3005	49	1	8.95
5961	3006	91	5	25.91
5962	3007	7	1	38.61
5963	3008	13	3	22.41
5964	3009	25	1	49.71
5965	3010	25	1	49.71
5966	3010	39	2	41.87
5967	3010	69	1	62.48
5968	3010	45	2	40.06
5969	3011	30	1	33.59
5970	3011	63	1	33.06
5971	3012	83	3	19.55
5972	3012	44	1	54.57
5973	3013	92	3	19.55
5974	3013	25	1	49.71
5975	3013	30	1	33.59
5976	3014	27	1	34.78
5977	3015	25	2	49.71
5978	3016	49	3	8.95
5979	3016	93	2	19.24
5980	3016	73	5	10.32
5981	3016	73	2	10.32
5982	3017	25	3	49.71
5983	3017	68	1	170.95
5984	3017	48	1	17.79
5985	3017	89	1	11.22
5986	3018	57	2	13.42
5987	3019	48	1	17.79
5988	3019	23	1	61.72
5989	3019	12	5	283.69
5990	3020	18	1	33.18
5991	3021	8	1	50.48
5992	3021	88	1	14.38
5993	3021	25	5	49.71
5994	3021	64	1	42.6
5995	3022	60	1	22.42
5996	3022	78	1	24.71
5997	3023	25	3	49.71
5998	3024	24	1	49.22
5999	3024	13	2	22.41
6000	3024	45	2	40.06
6001	3025	96	3	46.73
6002	3025	12	1	283.69
6003	3026	36	2	51.85
6004	3026	48	1	17.79
6005	3027	36	2	51.85
6006	3028	24	1	49.22
6007	3028	91	1	25.91
6008	3028	98	1	9.66
6009	3028	96	1	46.73
6010	3029	48	2	17.79
6011	3030	24	1	49.22
6012	3030	75	1	2.9
6013	3031	100	1	10.12
6014	3031	12	2	283.69
6015	3032	28	1	38.97
6016	3032	5	1	749.81
6017	3033	66	1	66.4
6018	3033	25	1	49.71
6019	3033	25	1	49.71
6020	3033	44	4	54.57
6021	3034	96	4	46.73
6022	3034	45	1	40.06
6023	3035	81	1	13.69
6024	3035	11	1	369.57
6025	3036	35	3	64.83
6026	3037	12	1	283.69
6027	3037	16	1	10.08
6028	3037	18	2	33.18
6029	3037	12	1	283.69
6030	3038	55	1	12.59
6031	3038	68	1	170.95
6032	3038	48	1	17.79
6033	3039	96	1	46.73
6034	3039	5	3	749.81
6035	3039	48	1	17.79
6036	3039	28	1	38.97
6037	3040	45	1	40.06
6038	3040	91	2	25.91
6039	3040	12	3	283.69
6040	3040	24	4	49.22
6041	3041	25	2	49.71
6042	3041	25	1	49.71
6043	3042	36	2	51.85
6044	3043	35	1	64.83
6045	3043	6	1	652.7
6046	3044	87	5	60.33
6047	3045	5	2	749.81
6048	3045	19	4	40.25
6049	3045	19	1	40.25
6050	3046	60	1	22.42
6051	3046	21	2	63.2
6052	3047	25	2	49.71
6053	3047	23	2	61.72
6054	3048	25	5	49.71
6055	3049	24	1	49.22
6056	3050	84	1	26.83
6057	3051	83	1	19.55
6058	3051	1	1	414.28
6059	3051	90	1	13.02
6060	3052	73	3	10.32
6061	3052	51	2	16.01
6062	3053	25	1	49.71
6063	3053	23	1	61.72
6064	3054	36	1	51.85
6065	3054	88	2	14.38
6066	3055	2	4	434.66
6067	3055	46	5	24.74
6068	3055	48	1	17.79
6069	3056	25	2	49.71
6070	3056	41	2	106.57
6071	3056	25	2	49.71
6072	3057	78	1	24.71
6073	3057	60	1	22.42
6074	3057	48	1	17.79
6075	3058	36	1	51.85
6076	3059	54	3	34.3
6077	3059	23	4	61.72
6078	3059	38	1	141.29
6079	3059	83	5	19.55
6080	3060	45	3	40.06
6081	3060	24	1	49.22
6082	3060	26	1	40.13
6083	3060	11	5	369.57
6084	3061	65	1	88.86
6085	3062	25	2	49.71
6086	3063	46	5	24.74
6087	3064	22	1	67.05
6088	3064	59	1	12.93
6089	3064	78	1	24.71
6090	3065	59	1	12.93
6091	3066	28	1	38.97
6092	3066	49	4	8.95
6093	3067	32	1	84.97
6094	3067	83	4	19.55
6095	3068	79	1	6.88
6096	3069	96	2	46.73
6097	3070	12	1	283.69
6098	3070	36	2	51.85
6099	3071	3	2	286.67
6100	3071	3	2	286.67
6101	3072	2	1	434.66
6102	3073	24	5	49.22
6103	3073	22	3	67.05
6104	3074	45	4	40.06
6105	3074	56	1	8.63
6106	3075	91	4	25.91
6107	3076	25	1	49.71
6108	3077	36	1	51.85
6109	3077	25	4	49.71
6110	3078	25	1	49.71
6111	3078	65	2	88.86
6112	3079	31	2	33.5
6113	3080	100	1	10.12
6114	3081	36	2	51.85
6115	3081	41	1	106.57
6116	3082	25	1	49.71
6117	3083	77	1	34.75
6118	3083	15	1	15.19
6119	3083	25	2	49.71
6120	3084	73	2	10.32
6121	3084	46	1	24.74
6122	3085	47	1	17.6
6123	3085	57	2	13.42
6124	3085	98	1	9.66
6125	3085	24	1	49.22
6126	3086	23	1	61.72
6127	3086	24	3	49.22
6128	3086	25	2	49.71
6129	3086	15	4	15.19
6130	3087	46	1	24.74
6131	3087	59	2	12.93
6132	3087	18	3	33.18
6133	3088	87	2	60.33
6134	3088	44	3	54.57
6135	3088	47	4	17.6
6136	3088	68	1	170.95
6137	3089	10	1	101.01
6138	3090	14	1	27.1
6139	3091	90	1	13.02
6140	3091	59	3	12.93
6141	3091	20	2	43.87
6142	3091	78	1	24.71
6143	3092	44	1	54.57
6144	3092	32	1	84.97
6145	3092	47	1	17.6
6146	3093	65	2	88.86
6147	3094	36	1	51.85
6148	3094	25	5	49.71
6149	3095	48	4	17.79
6150	3095	99	4	7.62
6151	3095	12	1	283.69
6152	3096	11	1	369.57
6153	3096	57	1	13.42
6154	3097	25	1	49.71
6155	3097	26	2	40.13
6156	3097	25	5	49.71
6157	3097	69	4	62.48
6158	3098	36	3	51.85
6159	3098	35	1	64.83
6160	3098	90	2	13.02
6161	3099	12	2	283.69
6162	3099	25	2	49.71
6163	3100	25	1	49.71
6164	3100	5	5	749.81
6165	3101	56	2	8.63
6166	3102	23	2	61.72
6167	3103	55	1	12.59
6168	3103	5	5	749.81
6169	3103	36	2	51.85
6170	3103	25	2	49.71
6171	3104	65	1	88.86
6172	3105	99	5	7.62
6173	3105	68	1	170.95
6174	3106	88	3	14.38
6175	3106	59	1	12.93
6176	3107	80	3	7.7
6177	3108	90	2	13.02
6178	3108	25	1	49.71
6179	3108	47	1	17.6
6180	3109	33	3	77.74
6181	3110	79	1	6.88
6182	3110	24	2	49.22
6183	3111	5	2	749.81
6184	3112	25	1	49.71
6185	3112	17	1	13.19
6186	3112	25	1	49.71
6187	3112	62	1	24.18
6188	3113	43	1	69.98
6189	3114	32	1	84.97
6190	3115	48	1	17.79
6191	3115	68	1	170.95
6192	3116	30	2	33.59
6193	3116	49	1	8.95
6194	3117	68	1	170.95
6195	3117	36	3	51.85
6196	3117	89	1	11.22
6197	3117	28	1	38.97
6198	3118	52	3	14.33
6199	3119	74	1	3.59
6200	3119	7	1	38.61
6201	3120	25	2	49.71
6202	3120	80	1	7.7
6203	3121	39	4	41.87
6204	3121	58	1	19.26
6205	3121	91	2	25.91
6206	3122	5	3	749.81
6207	3122	91	1	25.91
6208	3123	47	1	17.6
6209	3123	97	1	12.46
6210	3123	36	1	51.85
6211	3123	30	1	33.59
6212	3124	35	5	64.83
6213	3125	24	1	49.22
6214	3125	76	1	2.45
6215	3125	68	3	170.95
6216	3126	25	1	49.71
6217	3126	67	1	183.38
6218	3126	45	3	40.06
6219	3126	24	4	49.22
6220	3127	11	1	369.57
6221	3127	68	2	170.95
6222	3128	89	1	11.22
6223	3128	63	2	33.06
6224	3129	30	3	33.59
6225	3129	25	1	49.71
6226	3129	56	1	8.63
6227	3130	24	1	49.22
6228	3130	69	1	62.48
6229	3131	25	2	49.71
6230	3132	51	1	16.01
6231	3132	25	1	49.71
6232	3132	18	4	33.18
6233	3133	45	1	40.06
6234	3133	22	2	67.05
6235	3134	25	3	49.71
6236	3135	18	1	33.18
6237	3135	68	5	170.95
6238	3136	60	2	22.42
6239	3136	34	1	80.71
6240	3137	27	2	34.78
6241	3137	80	1	7.7
6242	3138	11	3	369.57
6243	3138	30	1	33.59
6244	3138	25	2	49.71
6245	3139	48	1	17.79
6246	3140	76	1	2.45
6247	3140	47	1	17.6
6248	3140	5	2	749.81
6249	3141	36	1	51.85
6250	3142	5	2	749.81
6251	3142	18	1	33.18
6252	3143	85	1	36.01
6253	3143	39	1	41.87
6254	3144	37	2	149.74
6255	3144	16	1	10.08
6256	3145	24	2	49.22
6257	3145	23	1	61.72
6258	3146	50	1	6.73
6259	3146	96	2	46.73
6260	3146	99	1	7.62
6261	3146	51	2	16.01
6262	3147	56	2	8.63
6263	3147	82	1	9.8
6264	3147	80	4	7.7
6265	3147	41	2	106.57
6266	3148	69	1	62.48
6267	3149	42	1	125.85
6268	3150	52	1	14.33
6269	3150	29	2	41.05
6270	3151	48	1	17.79
6271	3151	25	2	49.71
6272	3152	37	1	149.74
6273	3153	75	3	2.9
6274	3154	97	1	12.46
6275	3155	59	2	12.93
6276	3156	25	2	49.71
6277	3157	25	1	49.71
6278	3157	25	3	49.71
6279	3158	57	2	13.42
6280	3158	50	1	6.73
6281	3159	71	3	7.99
6282	3159	71	3	7.99
6283	3160	45	1	40.06
6284	3161	84	1	26.83
6285	3162	4	1	738.89
6286	3162	25	1	49.71
6287	3163	75	1	2.9
6288	3164	86	1	44.7
6289	3164	86	3	44.7
6290	3164	80	1	7.7
6291	3165	15	4	15.19
6292	3165	84	1	26.83
6293	3166	65	1	88.86
6294	3167	25	1	49.71
6295	3167	8	1	50.48
6296	3167	55	1	12.59
6297	3168	25	1	49.71
6298	3168	47	1	17.6
6299	3169	48	1	17.79
6300	3169	23	3	61.72
6301	3170	25	1	49.71
6302	3170	73	3	10.32
6303	3171	57	1	13.42
6304	3171	47	1	17.6
6305	3171	57	2	13.42
6306	3172	74	2	3.59
6307	3172	97	3	12.46
6308	3173	56	1	8.63
6309	3174	36	1	51.85
6310	3174	46	1	24.74
6311	3174	98	3	9.66
6312	3174	56	1	8.63
6313	3175	26	1	40.13
6314	3175	49	3	8.95
6315	3176	59	3	12.93
6316	3176	25	3	49.71
6317	3177	45	1	40.06
6318	3178	93	1	19.24
6319	3178	68	1	170.95
6320	3179	21	1	63.2
6321	3180	58	1	19.26
6322	3181	54	2	34.3
6323	3182	31	1	33.5
6324	3183	24	1	49.22
6325	3183	78	1	24.71
6326	3184	91	1	25.91
6327	3184	22	1	67.05
6328	3185	25	1	49.71
6329	3186	36	3	51.85
6330	3186	31	3	33.5
6331	3186	39	1	41.87
6332	3187	25	1	49.71
6333	3187	74	1	3.59
6334	3188	72	1	9.77
6335	3188	25	2	49.71
6336	3189	46	1	24.74
6337	3189	65	1	88.86
6338	3190	5	1	749.81
6339	3190	29	1	41.05
6340	3190	18	1	33.18
6341	3191	45	2	40.06
6342	3191	24	2	49.22
6343	3191	73	3	10.32
6344	3191	83	1	19.55
6345	3192	91	2	25.91
6346	3192	37	1	149.74
6347	3193	36	2	51.85
6348	3193	48	1	17.79
6349	3194	63	2	33.06
6350	3194	84	1	26.83
6351	3194	64	1	42.6
6352	3195	58	2	19.26
6353	3195	24	1	49.22
6354	3196	43	1	69.98
6355	3196	53	1	43.04
6356	3196	60	2	22.42
6357	3197	47	4	17.6
6358	3197	25	2	49.71
6359	3197	99	1	7.62
6360	3198	24	2	49.22
6361	3198	18	3	33.18
6362	3199	2	4	434.66
6363	3200	25	1	49.71
6364	3200	68	1	170.95
6365	3201	3	2	286.67
6366	3201	66	1	66.4
6367	3201	47	3	17.6
6368	3202	9	1	155.72
6369	3203	48	1	17.79
6370	3203	36	1	51.85
6371	3203	42	2	125.85
6372	3203	46	1	24.74
6373	3204	96	1	46.73
6374	3205	30	1	33.59
6375	3206	92	3	19.55
6376	3206	25	2	49.71
6377	3206	26	1	40.13
6378	3206	25	2	49.71
6379	3207	90	1	13.02
6380	3207	21	3	63.2
6381	3208	9	1	155.72
6382	3208	36	1	51.85
6383	3208	25	1	49.71
6384	3208	44	1	54.57
6385	3209	39	3	41.87
6386	3210	75	1	2.9
6387	3211	24	3	49.22
6388	3211	56	3	8.63
6389	3211	61	1	18.1
6390	3212	78	2	24.71
6391	3213	76	3	2.45
6392	3214	85	1	36.01
6393	3214	42	1	125.85
6394	3214	44	1	54.57
6395	3215	23	1	61.72
6396	3216	90	1	13.02
6397	3216	2	3	434.66
6398	3216	72	3	9.77
6399	3216	53	2	43.04
6400	3217	64	1	42.6
6401	3217	22	1	67.05
6402	3217	24	2	49.22
6403	3218	20	5	43.87
6404	3218	86	2	44.7
6405	3218	7	1	38.61
6406	3218	47	1	17.6
6407	3219	97	1	12.46
6408	3220	56	2	8.63
6409	3220	21	1	63.2
6410	3221	25	1	49.71
6411	3221	36	2	51.85
6412	3221	23	2	61.72
6413	3222	75	3	2.9
6414	3222	23	2	61.72
6415	3222	3	1	286.67
6416	3223	24	2	49.22
6417	3224	73	2	10.32
6418	3224	24	1	49.22
6419	3225	25	1	49.71
6420	3225	65	1	88.86
6421	3225	91	1	25.91
6422	3225	25	1	49.71
6423	3226	24	1	49.22
6424	3227	18	1	33.18
6425	3228	21	1	63.2
6426	3228	68	2	170.95
6427	3228	36	1	51.85
6428	3228	25	3	49.71
6429	3229	21	2	63.2
6430	3229	25	1	49.71
6431	3229	14	1	27.1
6432	3229	25	1	49.71
6433	3230	7	2	38.61
6434	3230	54	1	34.3
6435	3230	12	3	283.69
6436	3230	87	2	60.33
6437	3231	30	1	33.59
6438	3232	59	1	12.93
6439	3232	50	1	6.73
6440	3232	25	3	49.71
6441	3233	49	1	8.95
6442	3233	25	1	49.71
6443	3233	25	1	49.71
6444	3234	30	3	33.59
6445	3235	30	3	33.59
6446	3235	24	2	49.22
6447	3235	24	1	49.22
6448	3236	22	2	67.05
6449	3237	25	1	49.71
6450	3238	48	3	17.79
6451	3238	71	2	7.99
6452	3238	68	2	170.95
6453	3239	27	3	34.78
6454	3240	52	1	14.33
6455	3240	30	1	33.59
6456	3241	53	4	43.04
6457	3241	99	2	7.62
6458	3242	65	1	88.86
6459	3242	72	1	9.77
6460	3242	14	1	27.1
6461	3242	36	1	51.85
6462	3243	52	3	14.33
6463	3243	45	3	40.06
6464	3243	36	1	51.85
6465	3244	66	1	66.4
6466	3244	52	3	14.33
6467	3244	42	1	125.85
6468	3245	86	1	44.7
6469	3246	24	2	49.22
6470	3247	47	3	17.6
6471	3247	46	1	24.74
6472	3248	4	3	738.89
6473	3248	25	1	49.71
6474	3249	18	1	33.18
6475	3250	31	1	33.5
6476	3251	27	1	34.78
6477	3252	37	1	149.74
6478	3253	48	1	17.79
6479	3254	83	1	19.55
6480	3254	75	1	2.9
6481	3255	35	2	64.83
6482	3255	25	1	49.71
6483	3255	37	3	149.74
6484	3255	12	1	283.69
6485	3256	29	4	41.05
6486	3256	7	1	38.61
6487	3257	14	5	27.1
6488	3257	97	2	12.46
6489	3258	29	1	41.05
6490	3258	20	2	43.87
6491	3259	54	1	34.3
6492	3259	18	4	33.18
6493	3259	75	1	2.9
6494	3260	14	1	27.1
6495	3261	9	1	155.72
6496	3261	9	1	155.72
6497	3262	25	4	49.71
6498	3262	23	1	61.72
6499	3263	63	1	33.06
6500	3264	86	2	44.7
6501	3264	72	1	9.77
6502	3265	59	2	12.93
6503	3265	52	2	14.33
6504	3265	25	1	49.71
6505	3265	72	3	9.77
6506	3266	25	1	49.71
6507	3266	12	3	283.69
6508	3267	25	1	49.71
6509	3268	99	1	7.62
6510	3268	7	1	38.61
6511	3268	62	2	24.18
6512	3269	25	1	49.71
6513	3269	69	1	62.48
6514	3269	63	1	33.06
6515	3270	11	1	369.57
6516	3271	49	1	8.95
6517	3271	30	1	33.59
6518	3272	25	1	49.71
6519	3272	37	2	149.74
6520	3273	30	3	33.59
6521	3273	63	5	33.06
6522	3274	17	1	13.19
6523	3275	33	1	77.74
6524	3276	25	1	49.71
6525	3276	34	1	80.71
6526	3277	78	4	24.71
6527	3277	92	2	19.55
6528	3278	78	1	24.71
6529	3278	18	1	33.18
6530	3278	68	1	170.95
6531	3279	1	2	414.28
6532	3280	94	2	20.26
6533	3281	78	1	24.71
6534	3282	52	5	14.33
6535	3283	77	1	34.75
6536	3283	53	1	43.04
6537	3283	89	2	11.22
6538	3284	57	3	13.42
6539	3284	36	1	51.85
6540	3285	25	4	49.71
6541	3286	28	1	38.97
6542	3287	31	1	33.5
6543	3287	27	1	34.78
6544	3287	48	3	17.79
6545	3288	78	1	24.71
6546	3288	83	3	19.55
6547	3289	9	2	155.72
6548	3289	21	2	63.2
6549	3289	24	2	49.22
6550	3290	39	1	41.87
6551	3290	22	1	67.05
6552	3290	25	1	49.71
6553	3291	25	1	49.71
6554	3291	80	2	7.7
6555	3291	63	2	33.06
6556	3291	53	1	43.04
6557	3292	87	4	60.33
6558	3292	25	1	49.71
6559	3293	41	2	106.57
6560	3293	20	1	43.87
6561	3294	25	1	49.71
6562	3295	25	3	49.71
6563	3295	85	5	36.01
6564	3296	87	1	60.33
6565	3296	69	1	62.48
6566	3296	25	1	49.71
6567	3297	65	1	88.86
6568	3298	55	3	12.59
6569	3298	38	2	141.29
6570	3298	59	1	12.93
6571	3299	77	1	34.75
6572	3299	25	1	49.71
6573	3300	49	2	8.95
6574	3300	68	2	170.95
6575	3300	42	1	125.85
6576	3300	25	4	49.71
6577	3301	36	1	51.85
6578	3301	92	1	19.55
6579	3302	56	1	8.63
6580	3302	75	1	2.9
6581	3302	25	1	49.71
6582	3303	73	3	10.32
6583	3304	76	2	2.45
6584	3305	52	1	14.33
6585	3305	52	2	14.33
6586	3306	48	4	17.79
6587	3306	23	3	61.72
6588	3306	12	2	283.69
6589	3307	27	1	34.78
6590	3308	36	1	51.85
6591	3309	25	1	49.71
6592	3310	31	1	33.5
6593	3310	69	5	62.48
6594	3311	25	1	49.71
6595	3312	86	1	44.7
6596	3312	73	2	10.32
6597	3312	27	1	34.78
6598	3313	23	2	61.72
6599	3313	46	3	24.74
6600	3314	64	2	42.6
6601	3314	23	3	61.72
6602	3314	25	1	49.71
6603	3315	36	5	51.85
6604	3316	27	1	34.78
6605	3316	59	1	12.93
6606	3317	69	3	62.48
6607	3317	16	3	10.08
6608	3318	49	2	8.95
6609	3319	75	1	2.9
6610	3320	17	1	13.19
6611	3321	20	3	43.87
6612	3322	88	1	14.38
6613	3323	23	1	61.72
6614	3324	16	1	10.08
6615	3325	36	4	51.85
6616	3325	11	1	369.57
6617	3325	25	2	49.71
6618	3325	30	5	33.59
6619	3326	24	3	49.22
6620	3327	95	4	48.75
6621	3328	81	4	13.69
6622	3329	99	1	7.62
6623	3330	26	1	40.13
6624	3331	61	5	18.1
6625	3331	35	1	64.83
6626	3331	36	1	51.85
6627	3332	25	1	49.71
6628	3333	69	1	62.48
6629	3333	24	1	49.22
6630	3334	5	1	749.81
6631	3335	23	2	61.72
6632	3336	47	1	17.6
6633	3336	17	1	13.19
6634	3336	48	3	17.79
6635	3337	11	1	369.57
6636	3338	16	4	10.08
6637	3338	91	1	25.91
6638	3339	84	2	26.83
6639	3339	25	1	49.71
6640	3339	24	1	49.22
6641	3339	68	2	170.95
6642	3340	62	2	24.18
6643	3340	94	2	20.26
6644	3341	23	1	61.72
6645	3341	11	1	369.57
6646	3342	13	1	22.41
6647	3342	3	1	286.67
6648	3343	11	1	369.57
6649	3344	36	2	51.85
6650	3345	39	2	41.87
6651	3345	38	1	141.29
6652	3345	48	1	17.79
6653	3346	25	5	49.71
6654	3347	25	1	49.71
6655	3347	52	3	14.33
6656	3348	39	1	41.87
6657	3348	25	1	49.71
6658	3349	25	1	49.71
6659	3349	77	2	34.75
6660	3350	25	3	49.71
6661	3350	97	1	12.46
6662	3350	92	2	19.55
6663	3351	15	3	15.19
6664	3351	55	1	12.59
6665	3351	31	1	33.5
6666	3352	25	2	49.71
6667	3352	27	2	34.78
6668	3352	63	1	33.06
6669	3353	95	3	48.75
6670	3353	25	5	49.71
6671	3353	21	3	63.2
6672	3354	23	2	61.72
6673	3354	69	1	62.48
6674	3355	25	1	49.71
6675	3356	36	1	51.85
6676	3356	8	1	50.48
6677	3356	46	1	24.74
6678	3357	90	1	13.02
6679	3357	24	2	49.22
6680	3358	91	1	25.91
6681	3358	30	1	33.59
6682	3359	11	2	369.57
6683	3359	78	1	24.71
6684	3360	21	1	63.2
6685	3360	31	1	33.5
6686	3360	65	1	88.86
6687	3361	31	1	33.5
6688	3361	9	1	155.72
6689	3361	25	1	49.71
6690	3361	71	1	7.99
6691	3362	77	1	34.75
6692	3362	24	1	49.22
6693	3363	94	3	20.26
6694	3363	24	1	49.22
6695	3364	11	1	369.57
6696	3364	60	1	22.42
6697	3365	98	1	9.66
6698	3366	52	2	14.33
6699	3367	91	1	25.91
6700	3368	67	3	183.38
6701	3369	38	1	141.29
6702	3369	65	1	88.86
6703	3370	55	1	12.59
6704	3371	57	3	13.42
6705	3372	89	2	11.22
6706	3372	26	2	40.13
6707	3372	26	1	40.13
6708	3372	14	1	27.1
6709	3373	56	2	8.63
6710	3374	49	1	8.95
6711	3375	23	1	61.72
6712	3376	25	1	49.71
6713	3376	24	2	49.22
6714	3377	78	1	24.71
6715	3377	67	3	183.38
6716	3378	25	5	49.71
6717	3379	29	1	41.05
6718	3379	78	2	24.71
6719	3380	25	1	49.71
6720	3380	60	2	22.42
6721	3381	85	2	36.01
6722	3381	23	4	61.72
6723	3382	93	1	19.24
6724	3382	24	1	49.22
6725	3383	25	3	49.71
6726	3384	5	1	749.81
6727	3385	47	1	17.6
6728	3386	6	1	652.7
6729	3386	51	1	16.01
6730	3386	100	3	10.12
6731	3387	44	1	54.57
6732	3388	47	1	17.6
6733	3389	24	1	49.22
6734	3389	55	1	12.59
6735	3390	54	1	34.3
6736	3391	69	2	62.48
6737	3391	26	1	40.13
6738	3391	30	3	33.59
6739	3391	6	1	652.7
6740	3392	15	1	15.19
6741	3393	90	4	13.02
6742	3393	12	1	283.69
6743	3393	73	1	10.32
6744	3394	8	3	50.48
6745	3394	52	1	14.33
6746	3395	25	1	49.71
6747	3395	36	2	51.85
6748	3395	12	1	283.69
6749	3395	48	1	17.79
6750	3396	25	2	49.71
6751	3397	74	1	3.59
6752	3397	26	1	40.13
6753	3397	95	5	48.75
6754	3398	97	1	12.46
6755	3399	46	4	24.74
6756	3399	12	1	283.69
6757	3400	11	1	369.57
6758	3400	81	2	13.69
6759	3401	81	1	13.69
6760	3401	85	2	36.01
6761	3402	37	1	149.74
6762	3402	33	2	77.74
6763	3402	25	4	49.71
6764	3403	93	1	19.24
6765	3404	46	1	24.74
6766	3404	5	2	749.81
6767	3404	98	1	9.66
6768	3404	24	1	49.22
6769	3405	55	1	12.59
6770	3405	77	1	34.75
6771	3406	93	2	19.24
6772	3407	35	1	64.83
6773	3407	42	4	125.85
6774	3407	26	2	40.13
6775	3408	24	1	49.22
6776	3409	73	2	10.32
6777	3409	25	4	49.71
6778	3409	46	2	24.74
6779	3409	25	1	49.71
6780	3410	75	1	2.9
6781	3410	55	1	12.59
6782	3411	47	1	17.6
6783	3412	25	1	49.71
6784	3412	57	1	13.42
6785	3413	40	1	49.48
6786	3414	72	2	9.77
6787	3415	8	2	50.48
6788	3415	16	1	10.08
6789	3416	99	5	7.62
6790	3417	51	2	16.01
6791	3417	25	1	49.71
6792	3417	14	1	27.1
6793	3418	91	2	25.91
6794	3418	94	1	20.26
6795	3419	30	4	33.59
6796	3419	95	1	48.75
6797	3419	71	2	7.99
6798	3420	33	1	77.74
6799	3421	4	1	738.89
6800	3422	63	2	33.06
6801	3423	25	1	49.71
6802	3424	59	1	12.93
6803	3425	22	1	67.05
6804	3426	53	1	43.04
6805	3426	6	2	652.7
6806	3427	10	2	101.01
6807	3427	23	4	61.72
6808	3427	14	3	27.1
6809	3427	71	2	7.99
6810	3428	28	1	38.97
6811	3428	45	2	40.06
6812	3428	36	1	51.85
6813	3429	25	3	49.71
6814	3429	2	1	434.66
6815	3429	95	1	48.75
6816	3429	60	3	22.42
6817	3430	30	2	33.59
6818	3430	88	1	14.38
6819	3430	5	1	749.81
6820	3430	56	3	8.63
6821	3431	14	2	27.1
6822	3432	89	1	11.22
6823	3432	25	1	49.71
6824	3432	25	4	49.71
6825	3433	62	1	24.18
6826	3433	69	2	62.48
6827	3433	68	4	170.95
6828	3434	18	1	33.18
6829	3435	36	2	51.85
6830	3436	64	1	42.6
6831	3436	36	1	51.85
6832	3436	86	2	44.7
6833	3437	21	1	63.2
6834	3438	18	4	33.18
6835	3438	27	1	34.78
6836	3438	91	1	25.91
6837	3439	24	2	49.22
6838	3439	14	4	27.1
6839	3439	68	2	170.95
6840	3440	18	2	33.18
6841	3441	78	1	24.71
6842	3442	36	1	51.85
6843	3442	49	2	8.95
6844	3442	5	1	749.81
6845	3442	99	1	7.62
6846	3443	25	4	49.71
6847	3444	46	2	24.74
6848	3444	1	1	414.28
6849	3445	25	2	49.71
6850	3446	69	1	62.48
6851	3446	45	2	40.06
6852	3447	47	3	17.6
6853	3448	30	1	33.59
6854	3448	22	1	67.05
6855	3448	36	1	51.85
6856	3449	28	1	38.97
6857	3449	12	2	283.69
6858	3450	89	3	11.22
6859	3450	97	1	12.46
6860	3450	24	1	49.22
6861	3450	79	1	6.88
6862	3451	46	1	24.74
6863	3452	25	1	49.71
6864	3452	49	1	8.95
6865	3452	33	1	77.74
6866	3452	5	1	749.81
6867	3453	87	3	60.33
6868	3453	12	1	283.69
6869	3453	100	1	10.12
6870	3453	41	2	106.57
6871	3454	56	1	8.63
6872	3454	98	1	9.66
6873	3454	31	1	33.5
6874	3454	13	4	22.41
6875	3455	23	2	61.72
6876	3456	69	3	62.48
6877	3456	26	2	40.13
6878	3457	12	1	283.69
6879	3458	24	2	49.22
6880	3458	48	1	17.79
6881	3459	18	1	33.18
6882	3460	79	2	6.88
6883	3460	53	3	43.04
6884	3460	44	1	54.57
6885	3461	85	1	36.01
6886	3461	17	2	13.19
6887	3461	25	1	49.71
6888	3462	44	5	54.57
6889	3463	48	1	17.79
6890	3464	33	1	77.74
6891	3465	16	1	10.08
6892	3465	76	5	2.45
6893	3466	36	1	51.85
6894	3466	6	1	652.7
6895	3466	80	2	7.7
6896	3467	79	1	6.88
6897	3468	10	4	101.01
6898	3469	72	1	9.77
6899	3469	50	2	6.73
6900	3470	72	2	9.77
6901	3471	24	1	49.22
6902	3471	50	2	6.73
6903	3471	18	1	33.18
6904	3472	48	1	17.79
6905	3473	30	1	33.59
6906	3474	25	5	49.71
6907	3474	25	5	49.71
6908	3474	11	2	369.57
6909	3474	30	1	33.59
6910	3475	82	1	9.8
6911	3476	78	5	24.71
6912	3477	25	2	49.71
6913	3478	93	2	19.24
6914	3478	57	1	13.42
6915	3478	16	2	10.08
6916	3479	51	3	16.01
6917	3479	16	3	10.08
6918	3480	72	4	9.77
6919	3480	79	1	6.88
6920	3480	93	1	19.24
6921	3480	74	1	3.59
6922	3481	13	1	22.41
6923	3482	24	1	49.22
6924	3483	20	1	43.87
6925	3483	62	1	24.18
6926	3484	26	2	40.13
6927	3484	25	2	49.71
6928	3484	36	1	51.85
6929	3485	39	3	41.87
6930	3485	32	5	84.97
6931	3485	78	3	24.71
6932	3486	24	1	49.22
6933	3487	68	1	170.95
6934	3488	19	1	40.25
6935	3488	78	5	24.71
6936	3489	59	2	12.93
6937	3489	36	1	51.85
6938	3490	70	3	64.32
6939	3490	18	1	33.18
6940	3490	18	5	33.18
6941	3491	72	1	9.77
6942	3491	86	1	44.7
6943	3492	42	1	125.85
6944	3493	92	1	19.55
6945	3494	91	1	25.91
6946	3495	21	3	63.2
6947	3496	55	1	12.59
6948	3497	56	2	8.63
6949	3498	87	1	60.33
6950	3498	63	1	33.06
6951	3499	68	1	170.95
6952	3500	23	1	61.72
6953	3500	85	1	36.01
6954	3500	69	1	62.48
6955	3501	27	1	34.78
6956	3502	18	2	33.18
6957	3503	59	2	12.93
6958	3504	29	1	41.05
6959	3504	31	2	33.5
6960	3504	63	1	33.06
6961	3505	73	1	10.32
6962	3505	68	1	170.95
6963	3506	90	2	13.02
6964	3506	64	2	42.6
6965	3507	24	5	49.22
6966	3507	46	2	24.74
6967	3508	84	1	26.83
6968	3508	95	1	48.75
6969	3509	48	3	17.79
6970	3510	73	1	10.32
6971	3510	5	1	749.81
6972	3510	32	1	84.97
6973	3511	45	1	40.06
6974	3512	25	4	49.71
6975	3513	89	1	11.22
6976	3514	12	2	283.69
6977	3514	63	2	33.06
6978	3514	44	1	54.57
6979	3515	68	1	170.95
6980	3515	53	1	43.04
6981	3516	73	1	10.32
6982	3516	35	1	64.83
6983	3517	93	1	19.24
6984	3517	67	1	183.38
6985	3518	99	2	7.62
6986	3519	97	2	12.46
6987	3519	25	2	49.71
6988	3519	18	1	33.18
6989	3520	83	1	19.55
6990	3521	24	1	49.22
6991	3521	56	2	8.63
6992	3522	64	1	42.6
6993	3522	90	1	13.02
6994	3522	16	1	10.08
6995	3523	53	1	43.04
6996	3524	16	1	10.08
6997	3524	24	2	49.22
6998	3525	99	1	7.62
6999	3525	55	3	12.59
7000	3526	54	4	34.3
7001	3526	42	5	125.85
7002	3526	64	1	42.6
7003	3526	25	2	49.71
7004	3527	18	3	33.18
7005	3528	48	1	17.79
7006	3528	85	1	36.01
7007	3529	25	1	49.71
7008	3530	77	2	34.75
7009	3531	59	3	12.93
7010	3532	76	1	2.45
7011	3532	78	2	24.71
7012	3533	56	1	8.63
7013	3534	36	1	51.85
7014	3534	67	1	183.38
7015	3535	36	4	51.85
7016	3535	24	2	49.22
7017	3536	57	1	13.42
7018	3536	25	2	49.71
7019	3537	13	5	22.41
7020	3537	25	2	49.71
7021	3538	26	4	40.13
7022	3538	24	1	49.22
7023	3538	33	4	77.74
7024	3539	12	1	283.69
7025	3539	82	1	9.8
7026	3540	38	3	141.29
7027	3541	66	2	66.4
7028	3541	18	1	33.18
7029	3542	99	1	7.62
7030	3543	67	2	183.38
7031	3543	24	3	49.22
7032	3543	53	2	43.04
7033	3543	5	1	749.81
7034	3544	24	1	49.22
7035	3545	86	1	44.7
7036	3545	27	1	34.78
7037	3546	25	3	49.71
7038	3546	25	1	49.71
7039	3546	1	4	414.28
7040	3546	58	2	19.26
7041	3547	27	1	34.78
7042	3547	24	2	49.22
7043	3548	78	1	24.71
7044	3549	3	4	286.67
7045	3550	25	1	49.71
7046	3550	25	1	49.71
7047	3550	25	2	49.71
7048	3551	41	2	106.57
7049	3551	37	2	149.74
7050	3552	46	1	24.74
7051	3552	25	5	49.71
7052	3553	55	2	12.59
7053	3553	42	3	125.85
7054	3553	76	2	2.45
7055	3553	73	1	10.32
7056	3554	19	1	40.25
7057	3555	24	3	49.22
7058	3555	79	1	6.88
7059	3556	46	3	24.74
7060	3556	25	1	49.71
7061	3556	49	1	8.95
7062	3557	48	1	17.79
7063	3557	49	3	8.95
7064	3557	1	1	414.28
7065	3558	26	1	40.13
7066	3558	84	1	26.83
7067	3558	23	1	61.72
7068	3558	24	2	49.22
7069	3559	51	1	16.01
7070	3559	63	1	33.06
7071	3560	78	1	24.71
7072	3561	43	2	69.98
7073	3561	91	3	25.91
7074	3561	51	3	16.01
7075	3561	62	2	24.18
7076	3562	89	2	11.22
7077	3563	98	3	9.66
7078	3564	50	2	6.73
7079	3564	23	2	61.72
7080	3565	58	1	19.26
7081	3566	25	1	49.71
7082	3567	45	1	40.06
7083	3567	45	1	40.06
7084	3568	72	1	9.77
7085	3568	25	2	49.71
7086	3568	14	2	27.1
7087	3569	52	2	14.33
7088	3570	57	3	13.42
7089	3570	18	1	33.18
7090	3570	28	1	38.97
7091	3571	35	1	64.83
7092	3571	23	1	61.72
7093	3572	25	1	49.71
7094	3573	69	4	62.48
7095	3573	25	3	49.71
7096	3573	68	5	170.95
7097	3574	84	2	26.83
7098	3574	25	3	49.71
7099	3574	25	1	49.71
7100	3575	93	4	19.24
7101	3576	83	1	19.55
7102	3577	14	1	27.1
7103	3578	26	3	40.13
7104	3578	26	1	40.13
7105	3578	49	3	8.95
7106	3579	25	1	49.71
7107	3580	25	1	49.71
7108	3580	27	3	34.78
7109	3580	84	4	26.83
7110	3581	27	1	34.78
7111	3582	52	4	14.33
7112	3582	24	1	49.22
7113	3582	30	4	33.59
7114	3583	25	1	49.71
7115	3583	24	2	49.22
7116	3584	25	1	49.71
7117	3584	91	3	25.91
7118	3584	71	1	7.99
7119	3585	2	1	434.66
7120	3585	94	3	20.26
7121	3586	43	1	69.98
7122	3587	30	1	33.59
7123	3587	48	1	17.79
7124	3587	57	3	13.42
7125	3587	91	4	25.91
7126	3588	73	5	10.32
7127	3589	23	3	61.72
7128	3590	13	2	22.41
7129	3591	36	1	51.85
7130	3591	76	2	2.45
7131	3592	23	5	61.72
7132	3592	45	2	40.06
7133	3593	27	2	34.78
7134	3594	99	1	7.62
7135	3594	73	1	10.32
7136	3595	40	1	49.48
7137	3596	42	5	125.85
7138	3596	71	3	7.99
7139	3597	25	1	49.71
7140	3597	80	1	7.7
7141	3598	25	1	49.71
7142	3598	68	2	170.95
7143	3598	73	1	10.32
7144	3599	30	3	33.59
7145	3599	49	1	8.95
7146	3599	83	5	19.55
7147	3599	25	2	49.71
7148	3600	25	1	49.71
7149	3600	61	1	18.1
7150	3600	16	3	10.08
7151	3601	12	2	283.69
7152	3601	4	5	738.89
7153	3601	36	2	51.85
7154	3601	76	1	2.45
7155	3602	99	1	7.62
7156	3603	36	1	51.85
7157	3603	95	2	48.75
7158	3603	6	2	652.7
7159	3604	11	2	369.57
7160	3604	15	3	15.19
7161	3605	23	1	61.72
7162	3606	23	1	61.72
7163	3606	64	1	42.6
7164	3606	17	1	13.19
7165	3606	39	2	41.87
7166	3607	63	2	33.06
7167	3607	48	1	17.79
7168	3608	90	1	13.02
7169	3609	94	2	20.26
7170	3609	25	1	49.71
7171	3609	97	1	12.46
7172	3609	55	1	12.59
7173	3610	25	2	49.71
7174	3611	72	3	9.77
7175	3612	26	2	40.13
7176	3612	24	2	49.22
7177	3612	55	2	12.59
7178	3613	30	5	33.59
7179	3613	25	3	49.71
7180	3614	86	1	44.7
7181	3615	56	5	8.63
7182	3615	10	2	101.01
7183	3616	2	1	434.66
7184	3617	41	3	106.57
7185	3618	86	2	44.7
7186	3618	68	5	170.95
7187	3619	91	1	25.91
7188	3619	91	1	25.91
7189	3620	5	4	749.81
7190	3620	80	1	7.7
7191	3620	57	1	13.42
7192	3621	62	1	24.18
7193	3622	18	1	33.18
7194	3623	95	1	48.75
7195	3623	23	4	61.72
7196	3624	10	1	101.01
7197	3624	16	2	10.08
7198	3625	29	2	41.05
7199	3625	86	1	44.7
7200	3626	91	2	25.91
7201	3626	6	1	652.7
7202	3626	52	3	14.33
7203	3627	25	3	49.71
7204	3628	89	1	11.22
7205	3628	36	4	51.85
7206	3629	24	2	49.22
7207	3629	18	1	33.18
7208	3629	12	3	283.69
7209	3629	73	2	10.32
7210	3630	46	5	24.74
7211	3631	25	5	49.71
7212	3632	5	1	749.81
7213	3632	7	1	38.61
7214	3633	36	2	51.85
7215	3634	89	1	11.22
7216	3634	7	1	38.61
7217	3635	35	1	64.83
7218	3635	24	1	49.22
7219	3635	14	2	27.1
7220	3636	24	1	49.22
7221	3637	3	1	286.67
7222	3637	4	4	738.89
7223	3637	61	1	18.1
7224	3638	33	1	77.74
7225	3639	73	1	10.32
7226	3640	27	1	34.78
7227	3640	26	1	40.13
7228	3640	61	4	18.1
7229	3640	20	2	43.87
7230	3641	25	1	49.71
7231	3641	37	1	149.74
7232	3641	18	2	33.18
7233	3642	25	1	49.71
7234	3643	25	2	49.71
7235	3644	41	2	106.57
7236	3645	73	1	10.32
7237	3646	73	1	10.32
7238	3646	52	2	14.33
7239	3647	77	4	34.75
7240	3648	27	4	34.78
7241	3649	26	2	40.13
7242	3649	91	1	25.91
7243	3649	84	3	26.83
7244	3649	30	1	33.59
7245	3650	18	1	33.18
7246	3650	4	4	738.89
7247	3650	25	1	49.71
7248	3650	72	2	9.77
7249	3651	75	1	2.9
7250	3651	24	1	49.22
7251	3652	25	1	49.71
7252	3652	36	1	51.85
7253	3652	5	1	749.81
7254	3652	66	2	66.4
7255	3653	99	2	7.62
7256	3654	25	2	49.71
7257	3654	46	1	24.74
7258	3654	47	1	17.6
7259	3654	24	2	49.22
7260	3655	73	1	10.32
7261	3656	84	5	26.83
7262	3656	36	1	51.85
7263	3657	26	3	40.13
7264	3657	25	2	49.71
7265	3658	53	1	43.04
7266	3659	60	2	22.42
7267	3659	22	1	67.05
7268	3659	64	1	42.6
7269	3660	14	3	27.1
7270	3661	25	1	49.71
7271	3661	30	5	33.59
7272	3662	43	1	69.98
7273	3662	23	4	61.72
7274	3663	18	2	33.18
7275	3664	48	2	17.79
7276	3665	25	2	49.71
7277	3665	25	1	49.71
7278	3665	21	3	63.2
7279	3665	9	1	155.72
7280	3666	8	1	50.48
7281	3667	25	1	49.71
7282	3668	11	1	369.57
7283	3668	25	1	49.71
7284	3668	30	1	33.59
7285	3668	89	1	11.22
7286	3669	69	3	62.48
7287	3670	50	2	6.73
7288	3671	34	1	80.71
7289	3671	100	1	10.12
7290	3672	5	1	749.81
7291	3673	3	1	286.67
7292	3673	80	3	7.7
7293	3674	10	1	101.01
7294	3675	22	2	67.05
7295	3676	60	2	22.42
7296	3677	57	1	13.42
7297	3677	26	2	40.13
7298	3678	72	2	9.77
7299	3678	38	1	141.29
7300	3678	92	1	19.55
7301	3678	48	1	17.79
7302	3679	73	2	10.32
7303	3680	30	2	33.59
7304	3680	91	3	25.91
7305	3680	76	2	2.45
7306	3681	83	2	19.55
7307	3682	86	3	44.7
7308	3683	42	2	125.85
7309	3684	16	1	10.08
7310	3684	26	1	40.13
7311	3684	76	1	2.45
7312	3685	18	1	33.18
7313	3686	58	2	19.26
7314	3686	62	1	24.18
7315	3686	57	1	13.42
7316	3687	34	2	80.71
7317	3687	62	1	24.18
7318	3687	60	3	22.42
7319	3688	11	2	369.57
7320	3688	48	1	17.79
7321	3688	69	1	62.48
7322	3689	98	1	9.66
7323	3689	53	1	43.04
7324	3689	18	1	33.18
7325	3690	85	1	36.01
7326	3690	9	1	155.72
7327	3690	23	4	61.72
7328	3691	9	1	155.72
7329	3691	15	1	15.19
7330	3691	32	2	84.97
7331	3691	25	1	49.71
7332	3692	16	5	10.08
7333	3693	71	1	7.99
7334	3693	76	1	2.45
7335	3693	52	1	14.33
7336	3693	13	1	22.41
7337	3694	18	3	33.18
7338	3695	5	1	749.81
7339	3695	63	4	33.06
7340	3696	20	1	43.87
7341	3696	21	2	63.2
7342	3696	64	1	42.6
7343	3696	52	1	14.33
7344	3697	42	1	125.85
7345	3697	48	2	17.79
7346	3697	7	2	38.61
7347	3697	38	2	141.29
7348	3698	76	2	2.45
7349	3699	36	1	51.85
7350	3699	23	4	61.72
7351	3700	36	5	51.85
7352	3700	58	1	19.26
7353	3701	46	2	24.74
7354	3701	24	3	49.22
7355	3702	46	1	24.74
7356	3703	47	1	17.6
7357	3704	69	1	62.48
7358	3704	42	1	125.85
7359	3704	24	1	49.22
7360	3704	34	2	80.71
7361	3705	37	1	149.74
7362	3706	27	2	34.78
7363	3707	25	1	49.71
7364	3708	65	1	88.86
7365	3708	95	1	48.75
7366	3708	48	1	17.79
7367	3709	95	1	48.75
7368	3709	53	1	43.04
7369	3710	36	1	51.85
7370	3711	20	1	43.87
7371	3711	91	1	25.91
7372	3711	80	2	7.7
7373	3712	25	1	49.71
7374	3712	53	4	43.04
7375	3713	73	2	10.32
7376	3713	65	1	88.86
7377	3713	12	2	283.69
7378	3714	25	2	49.71
7379	3714	26	1	40.13
7380	3714	60	1	22.42
7381	3714	5	2	749.81
7382	3715	25	1	49.71
7383	3716	31	1	33.5
7384	3716	73	1	10.32
7385	3717	36	1	51.85
7386	3717	24	2	49.22
7387	3717	98	1	9.66
7388	3718	33	1	77.74
7389	3718	33	1	77.74
7390	3719	27	2	34.78
7391	3720	64	1	42.6
7392	3720	85	1	36.01
7393	3720	76	1	2.45
7394	3721	95	1	48.75
7395	3721	27	5	34.78
7396	3721	99	2	7.62
7397	3721	52	1	14.33
7398	3722	48	3	17.79
7399	3722	25	1	49.71
7400	3723	42	2	125.85
7401	3723	24	3	49.22
7402	3724	27	3	34.78
7403	3724	55	1	12.59
7404	3725	26	3	40.13
7405	3725	68	5	170.95
7406	3726	23	1	61.72
7407	3726	26	4	40.13
7408	3726	36	1	51.85
7409	3727	38	3	141.29
7410	3727	25	4	49.71
7411	3727	23	2	61.72
7412	3728	2	3	434.66
7413	3728	65	1	88.86
7414	3729	67	3	183.38
7415	3729	49	4	8.95
7416	3730	30	1	33.59
7417	3731	5	2	749.81
7418	3732	67	1	183.38
7419	3733	70	4	64.32
7420	3734	78	5	24.71
7421	3734	2	5	434.66
7422	3735	21	3	63.2
7423	3736	72	2	9.77
7424	3736	44	1	54.57
7425	3736	46	3	24.74
7426	3737	42	1	125.85
7427	3737	25	3	49.71
7428	3737	54	1	34.3
7429	3737	25	2	49.71
7430	3738	27	1	34.78
7431	3739	22	1	67.05
7432	3740	48	1	17.79
7433	3741	15	2	15.19
7434	3741	33	3	77.74
7435	3742	72	2	9.77
7436	3742	26	1	40.13
7437	3743	63	3	33.06
7438	3744	39	1	41.87
7439	3744	86	1	44.7
7440	3745	25	4	49.71
7441	3745	25	1	49.71
7442	3746	63	1	33.06
7443	3747	12	1	283.69
7444	3748	21	1	63.2
7445	3748	16	1	10.08
7446	3749	31	2	33.5
7447	3749	73	5	10.32
7448	3749	56	5	8.63
7449	3750	36	1	51.85
7450	3750	72	1	9.77
7451	3750	25	1	49.71
7452	3751	88	1	14.38
7453	3752	93	5	19.24
7454	3752	53	1	43.04
7455	3752	96	1	46.73
7456	3752	24	5	49.22
7457	3753	52	1	14.33
7458	3753	34	2	80.71
7459	3753	25	1	49.71
7460	3754	25	2	49.71
7461	3754	11	2	369.57
7462	3754	12	2	283.69
7463	3754	23	2	61.72
7464	3755	63	5	33.06
7465	3755	94	1	20.26
7466	3755	50	2	6.73
7467	3755	31	1	33.5
7468	3756	25	3	49.71
7469	3757	27	1	34.78
7470	3757	76	2	2.45
7471	3757	13	1	22.41
7472	3758	76	1	2.45
7473	3758	13	2	22.41
7474	3759	27	1	34.78
7475	3759	49	2	8.95
7476	3759	93	1	19.24
7477	3760	4	2	738.89
7478	3760	4	3	738.89
7479	3760	57	2	13.42
7480	3761	25	1	49.71
7481	3762	38	2	141.29
7482	3762	22	4	67.05
7483	3762	72	3	9.77
7484	3763	48	3	17.79
7485	3763	43	2	69.98
7486	3764	34	3	80.71
7487	3764	48	1	17.79
7488	3764	25	1	49.71
7489	3764	15	1	15.19
7490	3765	90	1	13.02
7491	3765	78	2	24.71
7492	3766	95	2	48.75
7493	3767	12	3	283.69
7494	3768	12	3	283.69
7495	3768	91	1	25.91
7496	3768	55	1	12.59
7497	3768	24	1	49.22
7498	3769	60	4	22.42
7499	3769	25	1	49.71
7500	3770	14	2	27.1
7501	3770	36	3	51.85
7502	3770	30	3	33.59
7503	3771	12	1	283.69
7504	3771	73	4	10.32
7505	3771	36	5	51.85
7506	3771	88	1	14.38
7507	3772	25	1	49.71
7508	3772	25	1	49.71
7509	3772	26	1	40.13
7510	3772	85	1	36.01
7511	3773	82	2	9.8
7512	3774	26	1	40.13
7513	3775	80	2	7.7
7514	3775	28	1	38.97
7515	3776	78	1	24.71
7516	3777	36	2	51.85
7517	3777	23	1	61.72
7518	3777	24	1	49.22
7519	3777	25	1	49.71
7520	3778	20	1	43.87
7521	3779	35	3	64.83
7522	3779	12	3	283.69
7523	3780	89	1	11.22
7524	3780	54	1	34.3
7525	3781	24	1	49.22
7526	3781	71	2	7.99
7527	3781	78	1	24.71
7528	3782	82	1	9.8
7529	3782	24	1	49.22
7530	3783	85	1	36.01
7531	3783	85	4	36.01
7532	3784	26	1	40.13
7533	3785	63	1	33.06
7534	3785	53	3	43.04
7535	3786	41	2	106.57
7536	3787	6	1	652.7
7537	3788	6	1	652.7
7538	3788	36	2	51.85
7539	3789	31	2	33.5
7540	3789	62	1	24.18
7541	3790	48	1	17.79
7542	3790	67	1	183.38
7543	3791	36	2	51.85
7544	3791	63	1	33.06
7545	3791	66	2	66.4
7546	3791	93	1	19.24
7547	3792	25	1	49.71
7548	3792	25	1	49.71
7549	3793	24	1	49.22
7550	3794	75	1	2.9
7551	3795	89	1	11.22
7552	3795	25	1	49.71
7553	3795	91	5	25.91
7554	3795	36	2	51.85
7555	3796	76	1	2.45
7556	3796	25	3	49.71
7557	3796	78	3	24.71
7558	3797	35	2	64.83
7559	3797	80	2	7.7
7560	3797	73	1	10.32
7561	3798	95	2	48.75
7562	3798	48	1	17.79
7563	3799	36	1	51.85
7564	3800	53	1	43.04
7565	3800	78	2	24.71
7566	3801	36	1	51.85
7567	3802	14	2	27.1
7568	3803	42	3	125.85
7569	3803	48	3	17.79
7570	3804	46	2	24.74
7571	3804	84	2	26.83
7572	3805	11	1	369.57
7573	3805	65	2	88.86
7574	3805	42	1	125.85
7575	3806	5	1	749.81
7576	3806	18	1	33.18
7577	3807	30	2	33.59
7578	3807	36	1	51.85
7579	3807	36	2	51.85
7580	3808	27	2	34.78
7581	3808	64	2	42.6
7582	3809	31	1	33.5
7583	3810	66	2	66.4
7584	3811	40	4	49.48
7585	3811	76	2	2.45
7586	3811	99	2	7.62
7587	3811	42	3	125.85
7588	3812	30	4	33.59
7589	3812	14	1	27.1
7590	3812	36	1	51.85
7591	3813	99	1	7.62
7592	3813	25	5	49.71
7593	3814	21	1	63.2
7594	3815	25	2	49.71
7595	3815	36	2	51.85
7596	3815	20	1	43.87
7597	3815	25	3	49.71
7598	3816	93	1	19.24
7599	3816	64	4	42.6
7600	3817	43	2	69.98
7601	3817	36	5	51.85
7602	3818	24	2	49.22
7603	3818	25	1	49.71
7604	3819	25	1	49.71
7605	3819	48	4	17.79
7606	3820	60	4	22.42
7607	3820	7	2	38.61
7608	3821	11	1	369.57
7609	3822	19	5	40.25
7610	3823	92	1	19.55
7611	3823	93	2	19.24
7612	3824	66	1	66.4
7613	3825	29	1	41.05
7614	3825	30	1	33.59
7615	3826	48	1	17.79
7616	3826	75	1	2.9
7617	3827	73	2	10.32
7618	3827	5	4	749.81
7619	3827	43	2	69.98
7620	3828	73	1	10.32
7621	3829	90	4	13.02
7622	3829	71	1	7.99
7623	3830	59	2	12.93
7624	3831	49	2	8.95
7625	3831	100	2	10.12
7626	3831	47	1	17.6
7627	3832	78	3	24.71
7628	3833	93	1	19.24
7629	3834	25	1	49.71
7630	3834	8	5	50.48
7631	3835	42	1	125.85
7632	3835	25	2	49.71
7633	3835	6	1	652.7
7634	3836	42	2	125.85
7635	3837	23	1	61.72
7636	3837	24	4	49.22
7637	3838	25	1	49.71
7638	3838	93	1	19.24
7639	3839	81	1	13.69
7640	3840	26	2	40.13
7641	3840	31	1	33.5
7642	3841	49	3	8.95
7643	3841	67	3	183.38
7644	3842	69	1	62.48
7645	3842	48	1	17.79
7646	3843	24	2	49.22
7647	3844	89	1	11.22
7648	3845	18	1	33.18
7649	3846	48	2	17.79
7650	3847	9	1	155.72
7651	3847	3	2	286.67
7652	3848	11	1	369.57
7653	3848	12	3	283.69
7654	3849	62	1	24.18
7655	3850	94	1	20.26
7656	3851	64	1	42.6
7657	3852	25	1	49.71
7658	3853	47	1	17.6
7659	3854	49	1	8.95
7660	3855	82	3	9.8
7661	3856	30	1	33.59
7662	3856	12	2	283.69
7663	3856	35	3	64.83
7664	3857	91	1	25.91
7665	3857	37	1	149.74
7666	3858	25	1	49.71
7667	3858	6	2	652.7
7668	3858	81	3	13.69
7669	3859	93	1	19.24
7670	3859	18	3	33.18
7671	3860	18	1	33.18
7672	3860	41	1	106.57
7673	3860	8	4	50.48
7674	3860	19	1	40.25
7675	3861	24	1	49.22
7676	3862	6	3	652.7
7677	3863	49	3	8.95
7678	3864	87	5	60.33
7679	3864	29	1	41.05
7680	3865	16	4	10.08
7681	3865	90	2	13.02
7682	3866	26	2	40.13
7683	3866	57	1	13.42
7684	3867	38	1	141.29
7685	3868	5	2	749.81
7686	3869	24	5	49.22
7687	3869	49	2	8.95
7688	3869	92	1	19.55
7689	3870	22	5	67.05
7690	3871	49	1	8.95
7691	3871	25	2	49.71
7692	3871	31	5	33.5
7693	3872	53	4	43.04
7694	3872	32	4	84.97
7695	3873	27	2	34.78
7696	3873	59	1	12.93
7697	3874	27	3	34.78
7698	3874	64	2	42.6
7699	3875	35	2	64.83
7700	3876	10	2	101.01
7701	3876	36	1	51.85
7702	3876	14	4	27.1
7703	3877	23	1	61.72
7704	3877	24	1	49.22
7705	3878	21	1	63.2
7706	3878	25	1	49.71
7707	3879	96	1	46.73
7708	3880	53	1	43.04
7709	3880	82	2	9.8
7710	3880	16	2	10.08
7711	3880	23	2	61.72
7712	3881	12	4	283.69
7713	3882	85	1	36.01
7714	3883	67	2	183.38
7715	3883	40	4	49.48
7716	3884	16	1	10.08
7717	3885	7	5	38.61
7718	3886	25	1	49.71
7719	3886	13	2	22.41
7720	3886	76	1	2.45
7721	3887	49	1	8.95
7722	3887	65	1	88.86
7723	3887	26	1	40.13
7724	3887	78	2	24.71
7725	3888	37	3	149.74
7726	3888	57	1	13.42
7727	3888	26	2	40.13
7728	3889	14	1	27.1
7729	3890	16	2	10.08
7730	3891	30	2	33.59
7731	3892	78	1	24.71
7732	3893	25	1	49.71
7733	3894	51	1	16.01
7734	3894	42	2	125.85
7735	3895	75	1	2.9
7736	3896	49	1	8.95
7737	3896	66	2	66.4
7738	3897	60	1	22.42
7739	3897	36	3	51.85
7740	3897	49	1	8.95
7741	3897	68	2	170.95
7742	3898	79	1	6.88
7743	3899	62	2	24.18
7744	3899	25	1	49.71
7745	3900	36	2	51.85
7746	3900	87	3	60.33
7747	3901	70	1	64.32
7748	3901	47	1	17.6
7749	3902	25	1	49.71
7750	3902	11	1	369.57
7751	3903	96	2	46.73
7752	3904	36	1	51.85
7753	3904	35	1	64.83
7754	3904	24	1	49.22
7755	3904	85	1	36.01
7756	3905	2	3	434.66
7757	3905	30	1	33.59
7758	3905	25	4	49.71
7759	3906	55	3	12.59
7760	3907	45	5	40.06
7761	3908	74	1	3.59
7762	3909	39	2	41.87
7763	3910	24	1	49.22
7764	3911	64	2	42.6
7765	3911	68	2	170.95
7766	3911	92	2	19.55
7767	3912	9	3	155.72
7768	3912	45	2	40.06
7769	3912	77	2	34.75
7770	3913	25	1	49.71
7771	3914	74	1	3.59
7772	3915	25	2	49.71
7773	3916	34	1	80.71
7774	3917	48	1	17.79
7775	3917	72	1	9.77
7776	3917	85	2	36.01
7777	3918	87	1	60.33
7778	3918	41	1	106.57
7779	3918	46	1	24.74
7780	3919	80	3	7.7
7781	3919	4	2	738.89
7782	3920	51	1	16.01
7783	3920	73	2	10.32
7784	3920	46	1	24.74
7785	3920	55	2	12.59
7786	3921	52	3	14.33
7787	3921	24	2	49.22
7788	3921	11	1	369.57
7789	3922	35	1	64.83
7790	3923	86	1	44.7
7791	3923	25	3	49.71
7792	3924	39	1	41.87
7793	3924	25	1	49.71
7794	3924	99	1	7.62
7795	3925	25	2	49.71
7796	3925	27	1	34.78
7797	3925	25	1	49.71
7798	3926	25	1	49.71
7799	3926	91	1	25.91
7800	3927	20	1	43.87
7801	3928	25	5	49.71
7802	3928	7	1	38.61
7803	3928	29	1	41.05
7804	3928	25	2	49.71
7805	3929	83	1	19.55
7806	3930	46	1	24.74
7807	3931	18	1	33.18
7808	3931	48	1	17.79
7809	3931	47	2	17.6
7810	3932	10	1	101.01
7811	3932	25	1	49.71
7812	3933	2	1	434.66
7813	3933	4	2	738.89
7814	3934	85	2	36.01
7815	3934	45	1	40.06
7816	3934	3	3	286.67
7817	3934	21	4	63.2
7818	3935	63	1	33.06
7819	3935	20	3	43.87
7820	3936	36	3	51.85
7821	3936	18	1	33.18
7822	3936	76	1	2.45
7823	3937	25	1	49.71
7824	3937	78	1	24.71
7825	3937	5	4	749.81
7826	3938	17	1	13.19
7827	3939	2	1	434.66
7828	3939	51	2	16.01
7829	3939	18	1	33.18
7830	3940	68	1	170.95
7831	3940	78	1	24.71
7832	3941	36	1	51.85
7833	3941	29	1	41.05
7834	3942	64	2	42.6
7835	3943	32	3	84.97
7836	3943	47	1	17.6
7837	3944	79	3	6.88
7838	3945	11	3	369.57
7839	3945	17	1	13.19
7840	3945	8	4	50.48
7841	3945	48	2	17.79
7842	3946	36	2	51.85
7843	3946	24	2	49.22
7844	3947	83	3	19.55
7845	3947	12	3	283.69
7846	3947	13	3	22.41
7847	3948	25	1	49.71
7848	3949	63	2	33.06
7849	3949	70	1	64.32
7850	3949	61	1	18.1
7851	3950	18	1	33.18
7852	3951	82	1	9.8
7853	3951	25	1	49.71
7854	3952	37	2	149.74
7855	3953	30	1	33.59
7856	3953	78	1	24.71
7857	3954	27	5	34.78
7858	3954	47	4	17.6
7859	3954	68	1	170.95
7860	3954	12	1	283.69
7861	3955	27	2	34.78
7862	3955	34	4	80.71
7863	3956	74	1	3.59
7864	3957	95	2	48.75
7865	3957	18	2	33.18
7866	3957	17	1	13.19
7867	3958	47	2	17.6
7868	3958	8	2	50.48
7869	3959	78	1	24.71
7870	3959	76	1	2.45
7871	3960	24	4	49.22
7872	3961	25	1	49.71
7873	3961	15	3	15.19
7874	3962	14	1	27.1
7875	3962	68	1	170.95
7876	3962	25	1	49.71
7877	3963	6	1	652.7
7878	3964	36	3	51.85
7879	3964	43	1	69.98
7880	3964	35	1	64.83
7881	3965	25	4	49.71
7882	3965	28	3	38.97
7883	3965	9	1	155.72
7884	3966	14	5	27.1
7885	3967	57	1	13.42
7886	3967	72	5	9.77
7887	3967	5	3	749.81
7888	3968	81	1	13.69
7889	3969	65	2	88.86
7890	3970	60	1	22.42
7891	3971	39	2	41.87
7892	3972	25	1	49.71
7893	3972	26	3	40.13
7894	3973	74	4	3.59
7895	3973	16	1	10.08
7896	3974	42	1	125.85
7897	3975	81	5	13.69
7898	3975	12	4	283.69
7899	3976	25	2	49.71
7900	3976	31	2	33.5
7901	3976	25	2	49.71
7902	3977	81	1	13.69
7903	3977	16	1	10.08
7904	3977	11	1	369.57
7905	3978	4	2	738.89
7906	3978	43	1	69.98
7907	3978	25	2	49.71
7908	3978	25	1	49.71
7909	3979	24	1	49.22
7910	3980	100	1	10.12
7911	3980	76	2	2.45
7912	3981	24	1	49.22
7913	3981	48	1	17.79
7914	3982	47	1	17.6
7915	3983	95	2	48.75
7916	3983	83	1	19.55
7917	3983	25	1	49.71
7918	3984	16	5	10.08
7919	3984	11	1	369.57
7920	3985	9	1	155.72
7921	3986	56	1	8.63
7922	3987	89	2	11.22
7923	3987	45	1	40.06
7924	3987	48	1	17.79
7925	3988	48	3	17.79
7926	3988	15	4	15.19
7927	3988	48	1	17.79
7928	3989	75	1	2.9
7929	3989	34	5	80.71
7930	3989	25	1	49.71
7931	3989	86	3	44.7
7932	3990	25	1	49.71
7933	3990	5	3	749.81
7934	3990	63	1	33.06
7935	3991	78	1	24.71
7936	3991	25	1	49.71
7937	3991	37	1	149.74
7938	3991	47	1	17.6
7939	3992	99	1	7.62
7940	3993	46	2	24.74
7941	3994	25	1	49.71
7942	3994	18	4	33.18
7943	3995	18	1	33.18
7944	3996	24	1	49.22
7945	3996	54	2	34.3
7946	3996	94	3	20.26
7947	3997	42	1	125.85
7948	3997	63	1	33.06
7949	3997	53	1	43.04
7950	3998	42	3	125.85
7951	3998	25	5	49.71
7952	3998	28	1	38.97
7953	3998	46	2	24.74
7954	3999	23	5	61.72
7955	4000	12	2	283.69
7956	4001	82	1	9.8
7957	4001	82	1	9.8
7958	4002	11	3	369.57
7959	4002	91	1	25.91
7960	4003	45	2	40.06
7961	4004	97	1	12.46
7962	4005	68	2	170.95
7963	4005	49	1	8.95
7964	4006	12	2	283.69
7965	4007	62	1	24.18
7966	4008	25	2	49.71
7967	4009	82	3	9.8
7968	4010	85	5	36.01
7969	4011	35	1	64.83
7970	4012	52	2	14.33
7971	4012	25	1	49.71
7972	4013	46	1	24.74
7973	4013	24	2	49.22
7974	4013	49	3	8.95
7975	4014	35	1	64.83
7976	4014	44	1	54.57
7977	4014	12	2	283.69
7978	4015	35	1	64.83
7979	4015	94	1	20.26
7980	4015	32	2	84.97
7981	4016	21	1	63.2
7982	4017	36	2	51.85
7983	4018	5	1	749.81
7984	4019	26	3	40.13
7985	4019	25	2	49.71
7986	4020	25	3	49.71
7987	4020	39	2	41.87
7988	4021	44	2	54.57
7989	4021	9	1	155.72
7990	4021	46	1	24.74
7991	4022	56	1	8.63
7992	4022	50	1	6.73
7993	4023	79	1	6.88
7994	4023	25	1	49.71
7995	4024	83	2	19.55
7996	4024	36	1	51.85
7997	4024	24	1	49.22
7998	4024	25	1	49.71
7999	4025	24	2	49.22
8000	4025	18	1	33.18
8001	4026	51	2	16.01
8002	4026	23	2	61.72
8003	4026	25	1	49.71
8004	4026	52	2	14.33
8005	4027	53	1	43.04
8006	4028	48	1	17.79
8007	4029	45	3	40.06
8008	4029	30	1	33.59
8009	4030	25	1	49.71
8010	4030	48	5	17.79
8011	4030	25	1	49.71
8012	4031	72	1	9.77
8013	4032	50	2	6.73
8014	4032	33	2	77.74
8015	4032	50	4	6.73
8016	4033	67	1	183.38
8017	4033	47	1	17.6
8018	4034	83	2	19.55
8019	4034	25	1	49.71
8020	4034	58	2	19.26
8021	4035	35	1	64.83
8022	4035	25	3	49.71
8023	4035	52	1	14.33
8024	4036	81	1	13.69
8025	4037	3	2	286.67
8026	4037	28	2	38.97
8027	4037	99	3	7.62
8028	4037	31	4	33.5
8029	4038	32	1	84.97
8030	4038	36	1	51.85
8031	4038	76	1	2.45
8032	4039	78	1	24.71
8033	4040	30	1	33.59
8034	4041	68	1	170.95
8035	4042	31	1	33.5
8036	4043	76	1	2.45
8037	4043	24	2	49.22
8038	4044	57	1	13.42
8039	4044	85	1	36.01
8040	4045	34	1	80.71
8041	4045	34	1	80.71
8042	4045	70	4	64.32
8043	4046	20	1	43.87
8044	4046	48	4	17.79
8045	4047	27	1	34.78
8046	4047	16	4	10.08
8047	4048	74	1	3.59
8048	4049	62	1	24.18
8049	4049	25	1	49.71
8050	4049	50	2	6.73
8051	4050	100	2	10.12
8052	4050	23	1	61.72
8053	4051	30	1	33.59
8054	4052	26	1	40.13
8055	4053	68	1	170.95
8056	4053	73	2	10.32
8057	4054	31	1	33.5
8058	4054	48	3	17.79
8059	4054	36	1	51.85
8060	4054	92	1	19.55
8061	4055	14	1	27.1
8062	4056	36	2	51.85
8063	4057	91	4	25.91
8064	4057	25	2	49.71
8065	4057	15	1	15.19
8066	4058	25	1	49.71
8067	4059	23	1	61.72
8068	4059	25	2	49.71
8069	4060	4	1	738.89
8070	4060	53	2	43.04
8071	4060	93	1	19.24
8072	4061	26	1	40.13
8073	4061	25	5	49.71
8074	4062	99	3	7.62
8075	4063	86	2	44.7
8076	4064	75	1	2.9
8077	4065	23	1	61.72
8078	4065	84	2	26.83
8079	4065	92	1	19.55
8080	4066	11	2	369.57
8081	4066	46	2	24.74
8082	4066	78	1	24.71
8083	4067	48	2	17.79
8084	4067	41	1	106.57
8085	4067	77	1	34.75
8086	4068	25	1	49.71
8087	4069	47	3	17.6
8088	4069	36	1	51.85
8089	4070	31	1	33.5
8090	4070	21	3	63.2
8091	4071	30	4	33.59
8092	4072	25	1	49.71
8093	4072	27	5	34.78
8094	4073	92	1	19.55
8095	4074	26	2	40.13
8096	4074	24	4	49.22
8097	4074	14	4	27.1
8098	4074	25	5	49.71
8099	4075	38	1	141.29
8100	4075	44	1	54.57
8101	4076	79	1	6.88
8102	4076	46	1	24.74
8103	4076	43	1	69.98
8104	4077	73	2	10.32
8105	4078	25	1	49.71
8106	4079	76	3	2.45
8107	4079	25	1	49.71
8108	4080	47	1	17.6
8109	4080	82	1	9.8
8110	4080	13	1	22.41
8111	4081	48	1	17.79
8112	4082	5	4	749.81
8113	4083	25	1	49.71
8114	4083	11	1	369.57
8115	4083	63	5	33.06
8116	4083	48	5	17.79
8117	4084	76	2	2.45
8118	4084	46	1	24.74
8119	4085	25	3	49.71
8120	4086	87	2	60.33
8121	4086	49	1	8.95
8122	4086	18	2	33.18
8123	4087	19	1	40.25
8124	4087	70	2	64.32
8125	4087	21	1	63.2
8126	4087	41	1	106.57
8127	4088	93	2	19.24
8128	4088	36	2	51.85
8129	4089	57	1	13.42
8130	4090	71	3	7.99
8131	4091	68	1	170.95
8132	4091	6	1	652.7
8133	4092	10	1	101.01
8134	4093	78	1	24.71
8135	4093	71	1	7.99
8136	4094	95	1	48.75
8137	4094	9	1	155.72
8138	4094	25	3	49.71
8139	4095	87	1	60.33
8140	4095	70	2	64.32
8141	4096	63	1	33.06
8142	4096	53	1	43.04
8143	4096	78	1	24.71
8144	4097	47	1	17.6
8145	4098	50	1	6.73
8146	4099	91	2	25.91
8147	4100	78	1	24.71
8148	4100	47	2	17.6
8149	4101	1	2	414.28
8150	4102	31	2	33.5
8151	4102	12	5	283.69
8152	4103	46	3	24.74
8153	4104	53	2	43.04
8154	4105	36	2	51.85
8155	4105	39	1	41.87
8156	4105	78	1	24.71
8157	4106	71	1	7.99
8158	4107	79	2	6.88
8159	4108	26	1	40.13
8160	4109	49	1	8.95
8161	4109	15	2	15.19
8162	4110	25	1	49.71
8163	4111	93	3	19.24
8164	4111	50	1	6.73
8165	4112	3	2	286.67
8166	4113	39	1	41.87
8167	4114	68	2	170.95
8168	4115	25	1	49.71
8169	4116	45	2	40.06
8170	4116	25	1	49.71
8171	4117	41	5	106.57
8172	4118	76	1	2.45
8173	4119	57	1	13.42
8174	4119	49	1	8.95
8175	4119	47	1	17.6
8176	4120	73	1	10.32
8177	4121	25	2	49.71
8178	4121	62	3	24.18
8179	4121	64	3	42.6
8180	4122	35	1	64.83
8181	4123	12	1	283.69
8182	4123	18	1	33.18
8183	4123	24	5	49.22
8184	4124	52	1	14.33
8185	4125	57	2	13.42
8186	4126	21	1	63.2
8187	4126	10	1	101.01
8188	4127	98	1	9.66
8189	4127	63	2	33.06
8190	4127	12	1	283.69
8191	4127	25	1	49.71
8192	4128	25	1	49.71
8193	4128	40	1	49.48
8194	4128	25	1	49.71
8195	4128	98	5	9.66
8196	4129	58	1	19.26
8197	4130	5	3	749.81
8198	4130	24	1	49.22
8199	4131	65	1	88.86
8200	4132	91	1	25.91
8201	4132	21	1	63.2
8202	4132	5	2	749.81
8203	4133	3	5	286.67
8204	4133	23	1	61.72
8205	4133	78	1	24.71
8206	4134	23	2	61.72
8207	4134	76	1	2.45
8208	4134	4	1	738.89
8209	4134	25	1	49.71
8210	4135	80	1	7.7
8211	4135	11	1	369.57
8212	4135	65	1	88.86
8213	4136	58	2	19.26
8214	4136	25	1	49.71
8215	4136	48	1	17.79
8216	4136	24	1	49.22
8217	4137	97	2	12.46
8218	4137	51	1	16.01
8219	4137	25	2	49.71
8220	4138	47	1	17.6
8221	4139	5	1	749.81
8222	4139	30	1	33.59
8223	4139	73	1	10.32
8224	4140	90	3	13.02
8225	4140	78	4	24.71
8226	4140	18	1	33.18
8227	4141	26	3	40.13
8228	4141	11	1	369.57
8229	4142	18	3	33.18
8230	4143	16	2	10.08
8231	4143	4	1	738.89
8232	4143	78	1	24.71
8233	4144	33	1	77.74
8234	4144	3	1	286.67
8235	4144	69	2	62.48
8236	4145	36	2	51.85
8237	4145	23	5	61.72
8238	4145	30	1	33.59
8239	4145	73	1	10.32
8240	4146	85	2	36.01
8241	4146	73	2	10.32
8242	4147	90	1	13.02
8243	4148	3	1	286.67
8244	4148	25	4	49.71
8245	4148	22	1	67.05
8246	4149	25	1	49.71
8247	4150	24	1	49.22
8248	4150	13	2	22.41
8249	4151	78	2	24.71
8250	4152	56	1	8.63
8251	4152	75	2	2.9
8252	4152	25	1	49.71
8253	4152	57	1	13.42
8254	4153	11	3	369.57
8255	4153	85	1	36.01
8256	4153	82	1	9.8
8257	4154	48	1	17.79
8258	4155	26	1	40.13
8259	4156	71	5	7.99
8260	4156	49	1	8.95
8261	4156	38	2	141.29
8262	4156	25	4	49.71
8263	4157	15	1	15.19
8264	4158	22	1	67.05
8265	4159	23	1	61.72
8266	4159	54	4	34.3
8267	4159	48	1	17.79
8268	4160	71	1	7.99
8269	4160	12	4	283.69
8270	4161	25	1	49.71
8271	4161	25	3	49.71
8272	4162	70	4	64.32
8273	4163	54	2	34.3
8274	4163	45	1	40.06
8275	4164	61	1	18.1
8276	4165	14	1	27.1
8277	4166	26	1	40.13
8278	4166	58	2	19.26
8279	4167	92	4	19.55
8280	4168	29	5	41.05
8281	4169	25	2	49.71
8282	4169	25	1	49.71
8283	4170	22	1	67.05
8284	4171	43	1	69.98
8285	4171	23	1	61.72
8286	4172	48	4	17.79
8287	4172	10	1	101.01
8288	4172	53	1	43.04
8289	4173	82	2	9.8
8290	4174	92	1	19.55
8291	4175	16	2	10.08
8292	4176	62	5	24.18
8293	4177	56	1	8.63
8294	4177	25	3	49.71
8295	4178	25	5	49.71
8296	4179	73	1	10.32
8297	4179	53	4	43.04
8298	4180	47	1	17.6
8299	4180	73	1	10.32
8300	4180	12	4	283.69
8301	4180	45	2	40.06
8302	4181	25	5	49.71
8303	4181	93	2	19.24
8304	4181	73	4	10.32
8305	4181	8	1	50.48
8306	4182	16	1	10.08
8307	4183	53	1	43.04
8308	4183	65	4	88.86
8309	4184	89	1	11.22
8310	4185	52	2	14.33
8311	4186	65	4	88.86
8312	4186	85	2	36.01
8313	4187	11	1	369.57
8314	4188	9	5	155.72
8315	4188	25	2	49.71
8316	4189	25	1	49.71
8317	4189	25	2	49.71
8318	4190	93	2	19.24
8319	4191	30	2	33.59
8320	4192	76	1	2.45
8321	4193	48	1	17.79
8322	4194	41	2	106.57
8323	4194	35	2	64.83
8324	4195	8	1	50.48
8325	4195	24	1	49.22
8326	4196	73	3	10.32
8327	4197	36	1	51.85
8328	4198	30	5	33.59
8329	4198	15	1	15.19
8330	4199	25	2	49.71
8331	4199	24	1	49.22
8332	4200	80	1	7.7
8333	4200	48	1	17.79
8334	4201	91	3	25.91
8335	4201	6	1	652.7
8336	4201	23	2	61.72
8337	4202	93	4	19.24
8338	4202	45	2	40.06
8339	4203	99	1	7.62
8340	4203	75	3	2.9
8341	4204	25	2	49.71
8342	4205	99	4	7.62
8343	4205	46	1	24.74
8344	4205	83	1	19.55
8345	4206	5	1	749.81
8346	4206	85	1	36.01
8347	4207	31	2	33.5
8348	4208	78	3	24.71
8349	4208	99	3	7.62
8350	4208	25	1	49.71
8351	4208	72	3	9.77
8352	4209	87	1	60.33
8353	4210	75	1	2.9
8354	4210	26	3	40.13
8355	4210	25	1	49.71
8356	4210	42	2	125.85
8357	4211	66	4	66.4
8358	4211	27	3	34.78
8359	4211	11	1	369.57
8360	4211	24	1	49.22
8361	4212	24	2	49.22
8362	4212	78	1	24.71
8363	4212	85	1	36.01
8364	4213	85	1	36.01
8365	4213	56	4	8.63
8366	4214	6	3	652.7
8367	4214	21	4	63.2
8368	4214	76	2	2.45
8369	4215	15	1	15.19
8370	4216	49	1	8.95
8371	4216	46	1	24.74
8372	4216	3	1	286.67
8373	4217	73	3	10.32
8374	4218	78	1	24.71
8375	4218	30	1	33.59
8376	4218	25	1	49.71
8377	4218	55	1	12.59
8378	4219	25	1	49.71
8379	4219	25	5	49.71
8380	4219	6	1	652.7
8381	4219	52	1	14.33
8382	4220	3	1	286.67
8383	4220	99	1	7.62
8384	4220	99	2	7.62
8385	4220	36	2	51.85
8386	4221	41	2	106.57
8387	4221	59	1	12.93
8388	4221	36	3	51.85
8389	4222	17	3	13.19
8390	4223	35	1	64.83
8391	4224	57	2	13.42
8392	4225	70	3	64.32
8393	4225	63	1	33.06
8394	4225	64	2	42.6
8395	4225	73	2	10.32
8396	4226	29	1	41.05
8397	4226	35	1	64.83
8398	4226	18	2	33.18
8399	4227	24	2	49.22
8400	4228	23	1	61.72
8401	4229	67	1	183.38
8402	4230	36	1	51.85
8403	4230	25	1	49.71
8404	4230	15	2	15.19
8405	4231	18	1	33.18
8406	4231	92	4	19.55
8407	4231	48	1	17.79
8408	4231	47	1	17.6
8409	4232	23	5	61.72
8410	4232	24	1	49.22
8411	4232	48	2	17.79
8412	4233	68	1	170.95
8413	4233	18	2	33.18
8414	4234	12	1	283.69
8415	4234	74	4	3.59
8416	4234	67	1	183.38
8417	4235	88	1	14.38
8418	4235	76	2	2.45
8419	4236	39	1	41.87
8420	4237	48	2	17.79
8421	4237	73	2	10.32
8422	4238	76	1	2.45
8423	4238	76	1	2.45
8424	4238	59	1	12.93
8425	4238	61	1	18.1
8426	4239	25	1	49.71
8427	4239	25	2	49.71
8428	4240	42	1	125.85
8429	4241	53	2	43.04
8430	4241	48	1	17.79
8431	4241	41	2	106.57
8432	4242	23	1	61.72
8433	4242	25	1	49.71
8434	4242	25	4	49.71
8435	4243	27	5	34.78
8436	4244	59	2	12.93
8437	4244	31	1	33.5
8438	4245	3	2	286.67
8439	4245	25	3	49.71
8440	4245	84	1	26.83
8441	4245	56	2	8.63
8442	4246	90	1	13.02
8443	4247	25	2	49.71
8444	4247	11	1	369.57
8445	4248	94	1	20.26
8446	4249	61	3	18.1
8447	4250	25	2	49.71
8448	4250	39	1	41.87
8449	4250	91	1	25.91
8450	4251	14	5	27.1
8451	4252	18	2	33.18
8452	4252	30	2	33.59
8453	4252	78	1	24.71
8454	4253	76	1	2.45
8455	4254	25	4	49.71
8456	4254	87	1	60.33
8457	4254	87	1	60.33
8458	4254	21	1	63.2
8459	4255	67	2	183.38
8460	4256	36	1	51.85
8461	4256	88	1	14.38
8462	4257	30	1	33.59
8463	4257	93	1	19.24
8464	4257	95	4	48.75
8465	4258	24	5	49.22
8466	4259	10	2	101.01
8467	4259	12	1	283.69
8468	4259	15	1	15.19
8469	4260	63	1	33.06
8470	4260	67	1	183.38
8471	4261	45	1	40.06
8472	4262	25	2	49.71
8473	4262	36	3	51.85
8474	4263	58	1	19.26
8475	4264	24	2	49.22
8476	4264	28	3	38.97
8477	4265	25	2	49.71
8478	4265	51	1	16.01
8479	4266	78	2	24.71
8480	4266	25	2	49.71
8481	4266	97	2	12.46
8482	4266	25	2	49.71
8483	4267	25	1	49.71
8484	4267	28	2	38.97
8485	4267	63	1	33.06
8486	4268	65	1	88.86
8487	4268	25	2	49.71
8488	4268	25	1	49.71
8489	4269	28	3	38.97
8490	4270	25	1	49.71
8491	4270	59	3	12.93
8492	4271	25	1	49.71
8493	4271	54	1	34.3
8494	4271	45	1	40.06
8495	4271	93	1	19.24
8496	4272	63	1	33.06
8497	4273	55	2	12.59
8498	4274	80	1	7.7
8499	4274	36	2	51.85
8500	4274	69	1	62.48
8501	4275	11	1	369.57
8502	4275	51	5	16.01
8503	4276	21	2	63.2
8504	4277	25	1	49.71
8505	4278	14	1	27.1
8506	4278	6	1	652.7
8507	4278	68	1	170.95
8508	4278	97	3	12.46
8509	4279	45	2	40.06
8510	4279	84	2	26.83
8511	4279	64	1	42.6
8512	4280	25	1	49.71
8513	4280	30	2	33.59
8514	4281	99	2	7.62
8515	4281	3	1	286.67
8516	4282	68	1	170.95
8517	4283	48	1	17.79
8518	4283	25	1	49.71
8519	4283	26	4	40.13
8520	4284	86	1	44.7
8521	4284	23	1	61.72
8522	4285	25	1	49.71
8523	4285	63	1	33.06
8524	4285	78	1	24.71
8525	4286	25	1	49.71
8526	4286	25	3	49.71
8527	4287	78	2	24.71
8528	4287	25	3	49.71
8529	4288	79	1	6.88
8530	4289	12	2	283.69
8531	4290	12	1	283.69
8532	4290	39	2	41.87
8533	4290	85	3	36.01
8534	4291	100	3	10.12
8535	4291	73	4	10.32
8536	4291	24	1	49.22
8537	4291	24	1	49.22
8538	4292	30	1	33.59
8539	4293	78	2	24.71
8540	4294	30	1	33.59
8541	4295	24	2	49.22
8542	4295	46	1	24.74
8543	4296	76	1	2.45
8544	4297	23	2	61.72
8545	4297	57	5	13.42
8546	4297	11	1	369.57
8547	4297	93	1	19.24
8548	4298	23	2	61.72
8549	4299	12	2	283.69
8550	4299	71	2	7.99
8551	4300	80	2	7.7
8552	4300	99	1	7.62
8553	4300	84	2	26.83
8554	4301	11	2	369.57
8555	4302	13	1	22.41
8556	4302	97	1	12.46
8557	4302	41	2	106.57
8558	4302	48	1	17.79
8559	4303	61	2	18.1
8560	4304	97	2	12.46
8561	4304	76	1	2.45
8562	4305	29	1	41.05
8563	4305	14	4	27.1
8564	4305	36	1	51.85
8565	4305	10	3	101.01
8566	4306	49	1	8.95
8567	4307	12	3	283.69
8568	4307	2	1	434.66
8569	4307	25	2	49.71
8570	4308	68	1	170.95
8571	4308	44	1	54.57
8572	4308	32	1	84.97
8573	4309	5	1	749.81
8574	4309	21	1	63.2
8575	4310	87	4	60.33
8576	4310	18	3	33.18
8577	4311	27	3	34.78
8578	4311	48	2	17.79
8579	4311	24	1	49.22
8580	4311	12	1	283.69
8581	4312	66	1	66.4
8582	4313	45	1	40.06
8583	4313	84	2	26.83
8584	4314	25	4	49.71
8585	4314	25	2	49.71
8586	4314	30	2	33.59
8587	4315	25	2	49.71
8588	4315	91	5	25.91
8589	4315	91	2	25.91
8590	4316	54	1	34.3
8591	4316	81	1	13.69
8592	4317	2	2	434.66
8593	4317	46	2	24.74
8594	4318	30	1	33.59
8595	4319	46	3	24.74
8596	4320	30	2	33.59
8597	4321	23	1	61.72
8598	4321	52	1	14.33
8599	4321	74	1	3.59
8600	4322	22	1	67.05
8601	4322	26	2	40.13
8602	4323	76	1	2.45
8603	4323	25	1	49.71
8604	4324	49	1	8.95
8605	4324	76	1	2.45
8606	4324	7	1	38.61
8607	4324	43	1	69.98
8608	4325	36	1	51.85
8609	4325	46	1	24.74
8610	4326	38	1	141.29
8611	4326	23	1	61.72
8612	4327	25	1	49.71
8613	4327	39	4	41.87
8614	4327	68	1	170.95
8615	4327	44	3	54.57
8616	4328	31	1	33.5
8617	4328	25	1	49.71
8618	4328	56	3	8.63
8619	4329	26	4	40.13
8620	4330	25	1	49.71
8621	4331	41	1	106.57
8622	4331	26	3	40.13
8623	4331	42	1	125.85
8624	4332	90	1	13.02
8625	4333	76	1	2.45
8626	4334	25	4	49.71
8627	4334	28	1	38.97
8628	4334	92	3	19.55
8629	4335	30	1	33.59
8630	4335	28	1	38.97
8631	4336	61	1	18.1
8632	4336	25	1	49.71
8633	4337	10	1	101.01
8634	4338	19	1	40.25
8635	4338	16	2	10.08
8636	4339	40	2	49.48
8637	4339	40	2	49.48
8638	4339	97	1	12.46
8639	4340	42	2	125.85
8640	4340	83	1	19.55
8641	4341	79	1	6.88
8642	4341	23	1	61.72
8643	4342	48	1	17.79
8644	4342	6	1	652.7
8645	4343	25	1	49.71
8646	4343	25	1	49.71
8647	4344	25	1	49.71
8648	4345	16	1	10.08
8649	4345	37	1	149.74
8650	4345	94	2	20.26
8651	4346	42	3	125.85
8652	4347	99	1	7.62
8653	4347	37	1	149.74
8654	4347	20	1	43.87
8655	4347	99	4	7.62
8656	4348	75	2	2.9
8657	4348	49	1	8.95
8658	4349	25	2	49.71
8659	4349	48	1	17.79
8660	4349	76	1	2.45
8661	4350	35	1	64.83
8662	4351	68	1	170.95
8663	4352	45	3	40.06
8664	4352	60	5	22.42
8665	4352	85	1	36.01
8666	4353	44	3	54.57
8667	4354	44	1	54.57
8668	4355	12	1	283.69
8669	4355	90	1	13.02
8670	4356	57	1	13.42
8671	4356	24	2	49.22
8672	4356	17	5	13.19
8673	4357	46	1	24.74
8674	4358	27	2	34.78
8675	4358	22	2	67.05
8676	4358	58	3	19.26
8677	4359	91	1	25.91
8678	4359	5	1	749.81
8679	4359	80	1	7.7
8680	4360	52	1	14.33
8681	4360	90	4	13.02
8682	4360	18	1	33.18
8683	4360	58	1	19.26
8684	4361	53	2	43.04
8685	4362	82	2	9.8
8686	4362	26	1	40.13
8687	4362	70	1	64.32
8688	4362	39	2	41.87
8689	4363	25	1	49.71
8690	4364	73	4	10.32
8691	4365	68	2	170.95
8692	4365	54	2	34.3
8693	4365	30	1	33.59
8694	4365	36	2	51.85
8695	4366	25	1	49.71
8696	4367	6	3	652.7
8697	4368	11	3	369.57
8698	4368	47	1	17.6
8699	4369	45	2	40.06
8700	4369	25	2	49.71
8701	4370	12	2	283.69
8702	4371	16	2	10.08
8703	4371	10	2	101.01
8704	4371	88	1	14.38
8705	4371	26	1	40.13
8706	4372	12	1	283.69
8707	4373	25	2	49.71
8708	4373	13	2	22.41
8709	4373	11	1	369.57
8710	4374	24	2	49.22
8711	4374	56	2	8.63
8712	4374	36	3	51.85
8713	4374	36	1	51.85
8714	4375	18	4	33.18
8715	4375	57	1	13.42
8716	4375	48	4	17.79
8717	4376	56	1	8.63
8718	4376	25	4	49.71
8719	4376	68	1	170.95
8720	4377	66	2	66.4
8721	4378	27	2	34.78
8722	4379	25	2	49.71
8723	4380	84	2	26.83
8724	4380	15	1	15.19
8725	4380	20	1	43.87
8726	4380	86	1	44.7
8727	4381	32	3	84.97
8728	4382	27	1	34.78
8729	4383	90	1	13.02
8730	4384	18	4	33.18
8731	4385	94	1	20.26
8732	4385	73	1	10.32
8733	4385	33	2	77.74
8734	4386	74	1	3.59
8735	4387	23	2	61.72
8736	4388	76	1	2.45
8737	4389	78	1	24.71
8738	4389	23	1	61.72
8739	4389	48	1	17.79
8740	4389	98	5	9.66
8741	4390	99	2	7.62
8742	4391	46	1	24.74
8743	4391	52	2	14.33
8744	4392	33	3	77.74
8745	4392	24	2	49.22
8746	4393	73	2	10.32
8747	4394	18	3	33.18
8748	4394	78	1	24.71
8749	4395	80	5	7.7
8750	4396	25	1	49.71
8751	4397	54	1	34.3
8752	4397	87	1	60.33
8753	4398	48	1	17.79
8754	4398	26	1	40.13
8755	4399	99	1	7.62
8756	4400	25	1	49.71
8757	4401	35	3	64.83
8758	4402	24	5	49.22
8759	4402	76	1	2.45
8760	4403	37	1	149.74
8761	4403	30	5	33.59
8762	4404	38	1	141.29
8763	4405	46	1	24.74
8764	4405	53	1	43.04
8765	4406	53	3	43.04
8766	4406	89	1	11.22
8767	4406	25	2	49.71
8768	4406	16	1	10.08
8769	4407	25	1	49.71
8770	4407	25	1	49.71
8771	4407	84	3	26.83
8772	4408	9	1	155.72
8773	4408	15	1	15.19
8774	4408	90	2	13.02
8775	4408	80	1	7.7
8776	4409	30	2	33.59
8777	4410	36	1	51.85
8778	4410	30	1	33.59
8779	4411	18	1	33.18
8780	4412	25	2	49.71
8781	4412	48	2	17.79
8782	4412	96	2	46.73
8783	4413	96	1	46.73
8784	4414	42	2	125.85
8785	4415	79	1	6.88
8786	4415	30	1	33.59
8787	4415	53	1	43.04
8788	4415	91	4	25.91
8789	4416	27	4	34.78
8790	4416	97	3	12.46
8791	4417	91	1	25.91
8792	4417	23	1	61.72
8793	4418	69	1	62.48
8794	4419	3	1	286.67
8795	4419	26	1	40.13
8796	4420	5	5	749.81
8797	4420	21	1	63.2
8798	4420	61	3	18.1
8799	4421	25	1	49.71
8800	4422	10	1	101.01
8801	4423	16	1	10.08
8802	4424	36	2	51.85
8803	4425	18	1	33.18
8804	4426	19	1	40.25
8805	4427	4	2	738.89
8806	4427	24	5	49.22
8807	4428	25	1	49.71
8808	4429	25	1	49.71
8809	4430	25	1	49.71
8810	4430	87	2	60.33
8811	4431	77	1	34.75
8812	4432	100	2	10.12
8813	4433	25	2	49.71
8814	4434	79	3	6.88
8815	4434	18	2	33.18
8816	4434	30	3	33.59
8817	4435	46	2	24.74
8818	4435	20	1	43.87
8819	4435	91	1	25.91
8820	4435	23	2	61.72
8821	4436	81	2	13.69
8822	4436	72	1	9.77
8823	4437	36	1	51.85
8824	4438	23	2	61.72
8825	4439	16	1	10.08
8826	4439	16	1	10.08
8827	4440	12	3	283.69
8828	4441	98	1	9.66
8829	4441	36	1	51.85
8830	4442	88	1	14.38
8831	4442	24	2	49.22
8832	4442	68	2	170.95
8833	4442	46	2	24.74
8834	4443	46	1	24.74
8835	4443	22	3	67.05
8836	4443	23	2	61.72
8837	4444	25	1	49.71
8838	4445	7	2	38.61
8839	4445	24	1	49.22
8840	4445	77	1	34.75
8841	4446	30	1	33.59
8842	4446	25	3	49.71
8843	4447	65	1	88.86
8844	4447	4	2	738.89
8845	4447	85	2	36.01
8846	4448	5	2	749.81
8847	4449	30	1	33.59
8848	4450	95	3	48.75
8849	4450	83	1	19.55
8850	4450	23	1	61.72
8851	4450	26	1	40.13
8852	4451	47	1	17.6
8853	4452	45	1	40.06
8854	4453	12	3	283.69
8855	4454	19	1	40.25
8856	4455	25	2	49.71
8857	4456	98	3	9.66
8858	4456	58	1	19.26
8859	4457	99	3	7.62
8860	4457	11	1	369.57
8861	4458	76	1	2.45
8862	4458	65	3	88.86
8863	4458	84	1	26.83
8864	4459	11	5	369.57
8865	4459	73	3	10.32
8866	4459	25	2	49.71
8867	4460	48	1	17.79
8868	4460	25	2	49.71
8869	4461	25	3	49.71
8870	4462	25	4	49.71
8871	4462	24	5	49.22
8872	4462	70	2	64.32
8873	4463	47	3	17.6
8874	4463	59	2	12.93
8875	4464	48	2	17.79
8876	4465	36	1	51.85
8877	4465	70	1	64.32
8878	4465	51	4	16.01
8879	4466	71	1	7.99
8880	4466	75	2	2.9
8881	4467	49	1	8.95
8882	4468	36	3	51.85
8883	4468	56	1	8.63
8884	4468	39	1	41.87
8885	4468	48	1	17.79
8886	4469	76	2	2.45
8887	4469	30	1	33.59
8888	4469	16	3	10.08
8889	4470	12	1	283.69
8890	4470	87	3	60.33
8891	4471	18	1	33.18
8892	4472	43	2	69.98
8893	4472	36	2	51.85
8894	4472	4	4	738.89
8895	4473	9	1	155.72
8896	4473	36	3	51.85
8897	4474	49	1	8.95
8898	4474	78	1	24.71
8899	4474	23	4	61.72
8900	4475	65	1	88.86
8901	4475	21	2	63.2
8902	4476	9	2	155.72
8903	4476	59	1	12.93
8904	4477	42	1	125.85
8905	4477	89	4	11.22
8906	4478	25	2	49.71
8907	4479	8	1	50.48
8908	4480	18	1	33.18
8909	4481	41	4	106.57
8910	4482	58	2	19.26
8911	4482	49	1	8.95
8912	4483	70	1	64.32
8913	4483	37	5	149.74
8914	4484	25	2	49.71
8915	4485	64	1	42.6
8916	4485	36	1	51.85
8917	4486	70	2	64.32
8918	4487	25	2	49.71
8919	4487	5	2	749.81
8920	4487	100	4	10.12
8921	4487	23	1	61.72
8922	4488	36	5	51.85
8923	4489	25	2	49.71
8924	4489	85	4	36.01
8925	4490	58	2	19.26
8926	4490	48	2	17.79
8927	4490	69	1	62.48
8928	4491	33	1	77.74
8929	4491	5	3	749.81
8930	4491	80	1	7.7
8931	4491	24	3	49.22
8932	4492	91	1	25.91
8933	4492	34	4	80.71
8934	4492	89	1	11.22
8935	4493	5	1	749.81
8936	4494	18	1	33.18
8937	4495	23	1	61.72
8938	4495	25	1	49.71
8939	4495	18	1	33.18
8940	4495	42	1	125.85
8941	4496	47	1	17.6
8942	4497	68	1	170.95
8943	4498	47	3	17.6
8944	4499	49	1	8.95
8945	4499	12	4	283.69
8946	4500	58	3	19.26
8947	4501	69	1	62.48
8948	4501	36	1	51.85
8949	4501	80	1	7.7
8950	4502	61	2	18.1
8951	4502	12	1	283.69
8952	4502	25	3	49.71
8953	4503	2	2	434.66
8954	4503	48	1	17.79
8955	4504	61	1	18.1
8956	4504	71	1	7.99
8957	4504	3	1	286.67
8958	4505	21	1	63.2
8959	4505	68	2	170.95
8960	4506	12	1	283.69
8961	4506	72	2	9.77
8962	4507	26	2	40.13
8963	4508	58	1	19.26
8964	4509	17	2	13.19
8965	4510	30	1	33.59
8966	4510	30	1	33.59
8967	4511	12	1	283.69
8968	4511	23	4	61.72
8969	4511	54	1	34.3
8970	4512	68	2	170.95
8971	4513	93	1	19.24
8972	4513	80	1	7.7
8973	4514	86	1	44.7
8974	4514	42	2	125.85
8975	4514	19	1	40.25
8976	4515	55	2	12.59
8977	4515	94	1	20.26
8978	4516	30	2	33.59
8979	4516	78	4	24.71
8980	4516	20	1	43.87
8981	4517	69	4	62.48
8982	4517	49	2	8.95
8983	4517	70	3	64.32
8984	4517	49	2	8.95
8985	4518	56	2	8.63
8986	4518	14	1	27.1
8987	4518	1	1	414.28
8988	4519	16	1	10.08
8989	4520	100	1	10.12
8990	4521	36	4	51.85
8991	4522	76	2	2.45
8992	4523	48	4	17.79
8993	4523	25	2	49.71
8994	4524	69	1	62.48
8995	4524	92	2	19.55
8996	4524	46	3	24.74
8997	4524	30	1	33.59
8998	4525	68	1	170.95
8999	4526	25	1	49.71
9000	4526	11	1	369.57
9001	4527	68	5	170.95
9002	4527	26	2	40.13
9003	4528	53	1	43.04
9004	4528	25	1	49.71
9005	4529	25	2	49.71
9006	4529	73	1	10.32
9007	4529	76	4	2.45
9008	4530	65	1	88.86
9009	4531	78	1	24.71
9010	4531	78	1	24.71
9011	4532	78	2	24.71
9012	4533	23	1	61.72
9013	4533	64	1	42.6
9014	4533	46	3	24.74
9015	4533	25	1	49.71
9016	4534	69	1	62.48
9017	4535	64	1	42.6
9018	4535	44	3	54.57
9019	4535	18	3	33.18
9020	4535	36	2	51.85
9021	4536	88	3	14.38
9022	4536	42	2	125.85
9023	4537	61	2	18.1
9024	4538	23	1	61.72
9025	4539	76	1	2.45
9026	4539	25	3	49.71
9027	4540	12	4	283.69
9028	4541	25	1	49.71
9029	4541	91	1	25.91
9030	4541	24	1	49.22
9031	4542	32	1	84.97
9032	4542	15	1	15.19
9033	4542	46	1	24.74
9034	4543	36	2	51.85
9035	4543	12	3	283.69
9036	4544	25	1	49.71
9037	4545	56	1	8.63
9038	4545	75	1	2.9
9039	4546	52	2	14.33
9040	4546	5	3	749.81
9041	4547	3	2	286.67
9042	4548	48	4	17.79
9043	4549	41	1	106.57
9044	4549	99	2	7.62
9045	4550	100	1	10.12
9046	4551	12	2	283.69
9047	4551	5	5	749.81
9048	4551	70	2	64.32
9049	4552	24	1	49.22
9050	4552	12	1	283.69
9051	4553	32	2	84.97
9052	4554	59	1	12.93
9053	4554	18	1	33.18
9054	4554	71	1	7.99
9055	4555	53	3	43.04
9056	4556	95	5	48.75
9057	4556	23	2	61.72
9058	4556	99	2	7.62
9059	4557	3	1	286.67
9060	4557	25	1	49.71
9061	4558	89	2	11.22
9062	4559	31	3	33.5
9063	4559	50	4	6.73
9064	4560	8	1	50.48
9065	4560	25	2	49.71
9066	4561	82	2	9.8
9067	4561	47	3	17.6
9068	4561	28	2	38.97
9069	4562	12	4	283.69
9070	4562	64	2	42.6
9071	4562	15	2	15.19
9072	4563	11	2	369.57
9073	4563	58	1	19.26
9074	4564	18	2	33.18
9075	4565	10	1	101.01
9076	4566	31	2	33.5
9077	4566	47	1	17.6
9078	4567	25	1	49.71
9079	4567	78	1	24.71
9080	4567	48	5	17.79
9081	4568	49	2	8.95
9082	4569	13	1	22.41
9083	4570	27	1	34.78
9084	4570	25	3	49.71
9085	4571	57	1	13.42
9086	4571	42	2	125.85
9087	4571	53	1	43.04
9088	4572	48	1	17.79
9089	4572	41	1	106.57
9090	4572	86	1	44.7
9091	4573	17	1	13.19
9092	4574	46	3	24.74
9093	4574	25	1	49.71
9094	4575	99	2	7.62
9095	4576	15	1	15.19
9096	4577	18	1	33.18
9097	4578	16	1	10.08
9098	4579	24	1	49.22
9099	4579	16	1	10.08
9100	4580	15	2	15.19
9101	4580	45	2	40.06
9102	4580	83	1	19.55
9103	4580	67	1	183.38
9104	4581	30	2	33.59
9105	4581	27	1	34.78
9106	4581	49	1	8.95
9107	4582	26	2	40.13
9108	4583	39	1	41.87
9109	4584	16	2	10.08
9110	4585	87	1	60.33
9111	4585	91	1	25.91
9112	4585	24	5	49.22
9113	4585	95	2	48.75
9114	4586	78	1	24.71
9115	4586	57	1	13.42
9116	4586	53	1	43.04
9117	4586	23	2	61.72
9118	4587	48	1	17.79
9119	4587	26	2	40.13
9120	4588	15	1	15.19
9121	4589	23	4	61.72
9122	4590	3	1	286.67
9123	4591	26	1	40.13
9124	4592	36	1	51.85
9125	4592	11	1	369.57
9126	4592	23	1	61.72
9127	4593	25	1	49.71
9128	4593	27	1	34.78
9129	4594	24	4	49.22
9130	4595	46	1	24.74
9131	4595	25	1	49.71
9132	4596	64	2	42.6
9133	4596	56	2	8.63
9134	4597	24	2	49.22
9135	4597	91	1	25.91
9136	4597	25	5	49.71
9137	4598	48	1	17.79
9138	4598	18	1	33.18
9139	4598	46	1	24.74
9140	4599	17	1	13.19
9141	4599	14	2	27.1
9142	4600	67	1	183.38
9143	4601	21	2	63.2
9144	4602	15	1	15.19
9145	4602	12	2	283.69
9146	4603	48	1	17.79
9147	4603	49	2	8.95
9148	4603	20	1	43.87
9149	4603	81	4	13.69
9150	4604	25	4	49.71
9151	4605	9	1	155.72
9152	4605	92	1	19.55
9153	4606	45	1	40.06
9154	4607	29	2	41.05
9155	4608	11	1	369.57
9156	4608	78	1	24.71
9157	4608	30	2	33.59
9158	4609	96	1	46.73
9159	4610	68	3	170.95
9160	4611	25	1	49.71
9161	4611	39	4	41.87
9162	4612	16	1	10.08
9163	4613	26	1	40.13
9164	4613	56	1	8.63
9165	4613	48	1	17.79
9166	4614	30	1	33.59
9167	4614	25	1	49.71
9168	4615	25	1	49.71
9169	4616	9	1	155.72
9170	4617	79	1	6.88
9171	4618	53	1	43.04
9172	4618	46	5	24.74
9173	4618	78	5	24.71
9174	4619	59	1	12.93
9175	4619	14	1	27.1
9176	4620	42	1	125.85
9177	4620	17	1	13.19
9178	4621	37	1	149.74
9179	4621	46	2	24.74
9180	4622	49	5	8.95
9181	4622	25	1	49.71
9182	4623	48	2	17.79
9183	4623	36	1	51.85
9184	4624	25	2	49.71
9185	4625	25	1	49.71
9186	4625	30	2	33.59
9187	4625	75	1	2.9
9188	4626	39	5	41.87
9189	4626	48	2	17.79
9190	4627	76	1	2.45
9191	4627	21	2	63.2
9192	4627	30	1	33.59
9193	4627	90	1	13.02
9194	4628	99	2	7.62
9195	4628	12	2	283.69
9196	4628	34	5	80.71
9197	4628	3	1	286.67
9198	4629	25	1	49.71
9199	4630	23	1	61.72
9200	4630	94	1	20.26
9201	4630	36	1	51.85
9202	4631	80	1	7.7
9203	4631	36	4	51.85
9204	4632	25	1	49.71
9205	4633	46	1	24.74
9206	4634	71	5	7.99
9207	4635	21	2	63.2
9208	4635	4	3	738.89
9209	4635	72	1	9.77
9210	4636	68	2	170.95
9211	4636	23	1	61.72
9212	4637	13	2	22.41
9213	4637	73	1	10.32
9214	4638	12	4	283.69
9215	4639	23	1	61.72
9216	4639	91	2	25.91
9217	4640	95	1	48.75
9218	4641	23	1	61.72
9219	4641	19	2	40.25
9220	4642	71	2	7.99
9221	4642	56	2	8.63
9222	4642	27	2	34.78
9223	4642	67	3	183.38
9224	4643	48	1	17.79
9225	4643	58	1	19.26
9226	4644	39	1	41.87
9227	4645	23	1	61.72
9228	4646	6	1	652.7
9229	4646	36	2	51.85
9230	4646	47	1	17.6
9231	4647	55	1	12.59
9232	4647	42	1	125.85
9233	4647	59	2	12.93
9234	4648	16	1	10.08
9235	4649	5	2	749.81
9236	4649	48	2	17.79
9237	4649	95	4	48.75
9238	4650	15	1	15.19
9239	4650	93	1	19.24
9240	4651	39	2	41.87
9241	4652	54	1	34.3
9242	4652	96	2	46.73
9243	4653	25	1	49.71
9244	4654	61	2	18.1
9245	4654	25	2	49.71
9246	4654	30	3	33.59
9247	4655	25	1	49.71
9248	4655	30	1	33.59
9249	4655	23	1	61.72
9250	4656	47	4	17.6
9251	4657	23	2	61.72
9252	4657	42	3	125.85
9253	4657	35	2	64.83
9254	4657	15	1	15.19
9255	4658	35	1	64.83
9256	4658	18	1	33.18
9257	4659	89	3	11.22
9258	4659	55	4	12.59
9259	4660	24	1	49.22
9260	4660	24	1	49.22
9261	4661	55	1	12.59
9262	4661	42	1	125.85
9263	4661	40	2	49.48
9264	4662	49	5	8.95
9265	4662	25	3	49.71
9266	4663	5	2	749.81
9267	4664	68	1	170.95
9268	4664	48	2	17.79
9269	4664	55	2	12.59
9270	4664	49	1	8.95
9271	4665	24	2	49.22
9272	4666	39	1	41.87
9273	4666	63	1	33.06
9274	4667	25	1	49.71
9275	4667	12	1	283.69
9276	4667	46	2	24.74
9277	4667	24	3	49.22
9278	4668	11	2	369.57
9279	4668	9	2	155.72
9280	4668	25	2	49.71
9281	4669	21	2	63.2
9282	4669	43	2	69.98
9283	4670	26	2	40.13
9284	4671	96	1	46.73
9285	4672	46	1	24.74
9286	4672	5	1	749.81
9287	4673	13	3	22.41
9288	4673	5	4	749.81
9289	4674	36	2	51.85
9290	4675	14	1	27.1
9291	4676	43	1	69.98
9292	4677	40	2	49.48
9293	4678	15	3	15.19
9294	4679	78	5	24.71
9295	4680	50	4	6.73
9296	4681	23	1	61.72
9297	4681	6	2	652.7
9298	4681	79	1	6.88
9299	4682	88	4	14.38
9300	4682	4	1	738.89
9301	4682	69	1	62.48
9302	4683	10	2	101.01
9303	4683	38	1	141.29
9304	4683	25	1	49.71
9305	4684	22	1	67.05
9306	4684	25	2	49.71
9307	4684	25	4	49.71
9308	4684	73	4	10.32
9309	4685	84	2	26.83
9310	4686	30	1	33.59
9311	4686	13	2	22.41
9312	4687	73	1	10.32
9313	4687	56	1	8.63
9314	4687	25	3	49.71
9315	4688	25	1	49.71
9316	4688	24	1	49.22
9317	4689	21	1	63.2
9318	4689	31	1	33.5
9319	4689	25	1	49.71
9320	4690	15	2	15.19
9321	4691	78	1	24.71
9322	4692	27	1	34.78
9323	4693	46	3	24.74
9324	4693	71	5	7.99
9325	4693	25	2	49.71
9326	4694	19	2	40.25
9327	4695	36	1	51.85
9328	4696	24	1	49.22
9329	4696	26	3	40.13
9330	4696	58	1	19.26
9331	4697	36	2	51.85
9332	4698	36	1	51.85
9333	4699	9	1	155.72
9334	4699	22	1	67.05
9335	4700	18	3	33.18
9336	4701	44	1	54.57
9337	4702	24	4	49.22
9338	4703	56	1	8.63
9339	4704	27	1	34.78
9340	4705	45	1	40.06
9341	4705	51	1	16.01
9342	4705	8	3	50.48
9343	4706	26	1	40.13
9344	4707	97	1	12.46
9345	4708	18	2	33.18
9346	4708	83	2	19.55
9347	4708	7	1	38.61
9348	4709	99	1	7.62
9349	4710	20	1	43.87
9350	4710	72	1	9.77
9351	4711	25	1	49.71
9352	4711	73	1	10.32
9353	4711	78	1	24.71
9354	4712	26	4	40.13
9355	4713	51	1	16.01
9356	4713	36	1	51.85
9357	4714	25	1	49.71
9358	4714	25	3	49.71
9359	4715	88	1	14.38
9360	4716	81	5	13.69
9361	4716	96	1	46.73
9362	4716	82	1	9.8
9363	4717	55	1	12.59
9364	4717	25	1	49.71
9365	4717	12	1	283.69
9366	4718	85	2	36.01
9367	4718	25	2	49.71
9368	4719	68	1	170.95
9369	4719	24	2	49.22
9370	4719	20	1	43.87
9371	4720	27	2	34.78
9372	4721	44	2	54.57
9373	4722	62	1	24.18
9374	4723	17	1	13.19
9375	4724	49	4	8.95
9376	4724	8	3	50.48
9377	4724	22	2	67.05
9378	4725	92	2	19.55
9379	4726	15	1	15.19
9380	4726	18	2	33.18
9381	4727	25	5	49.71
9382	4727	25	1	49.71
9383	4728	25	1	49.71
9384	4728	98	1	9.66
9385	4728	24	1	49.22
9386	4729	72	1	9.77
9387	4730	21	4	63.2
9388	4730	25	1	49.71
9389	4730	25	1	49.71
9390	4730	25	3	49.71
9391	4731	96	1	46.73
9392	4732	68	5	170.95
9393	4732	47	1	17.6
9394	4733	45	1	40.06
9395	4733	68	2	170.95
9396	4734	48	2	17.79
9397	4734	28	1	38.97
9398	4735	89	2	11.22
9399	4736	15	1	15.19
9400	4736	7	1	38.61
9401	4736	93	2	19.24
9402	4737	5	1	749.81
9403	4737	36	3	51.85
9404	4737	25	1	49.71
9405	4737	19	1	40.25
9406	4738	38	1	141.29
9407	4739	96	3	46.73
9408	4739	74	4	3.59
9409	4739	1	1	414.28
9410	4740	61	3	18.1
9411	4740	69	1	62.48
9412	4740	53	2	43.04
9413	4741	69	1	62.48
9414	4742	16	2	10.08
9415	4742	7	1	38.61
9416	4743	25	1	49.71
9417	4743	8	4	50.48
9418	4744	28	2	38.97
9419	4744	51	1	16.01
9420	4745	27	3	34.78
9421	4745	2	1	434.66
9422	4745	28	1	38.97
9423	4746	27	5	34.78
9424	4746	22	2	67.05
9425	4746	49	1	8.95
9426	4746	69	1	62.48
9427	4747	30	1	33.59
9428	4747	44	1	54.57
9429	4747	25	1	49.71
9430	4748	97	1	12.46
9431	4749	25	1	49.71
9432	4750	78	2	24.71
9433	4750	25	2	49.71
9434	4750	19	1	40.25
9435	4750	14	1	27.1
9436	4751	25	3	49.71
9437	4751	3	1	286.67
9438	4751	62	4	24.18
9439	4752	21	2	63.2
9440	4752	39	1	41.87
9441	4753	25	2	49.71
9442	4753	77	2	34.75
9443	4754	41	3	106.57
9444	4755	47	2	17.6
9445	4755	93	2	19.24
9446	4755	3	2	286.67
9447	4756	21	2	63.2
9448	4757	25	4	49.71
9449	4757	48	3	17.79
9450	4758	14	1	27.1
9451	4758	1	2	414.28
9452	4759	75	1	2.9
9453	4759	100	3	10.12
9454	4759	24	4	49.22
9455	4760	91	3	25.91
9456	4761	25	2	49.71
9457	4761	12	1	283.69
9458	4761	29	2	41.05
9459	4762	18	1	33.18
9460	4762	45	2	40.06
9461	4763	26	1	40.13
9462	4763	23	1	61.72
9463	4764	31	1	33.5
9464	4764	36	1	51.85
9465	4764	96	1	46.73
9466	4765	78	1	24.71
9467	4765	55	1	12.59
9468	4766	99	3	7.62
9469	4767	97	3	12.46
9470	4767	69	3	62.48
9471	4768	82	2	9.8
9472	4768	73	1	10.32
9473	4768	10	2	101.01
9474	4768	63	3	33.06
9475	4769	14	2	27.1
9476	4769	35	1	64.83
9477	4770	25	1	49.71
9478	4771	52	1	14.33
9479	4772	24	1	49.22
9480	4773	11	1	369.57
9481	4773	36	1	51.85
9482	4773	97	3	12.46
9483	4774	30	1	33.59
9484	4774	25	1	49.71
9485	4774	43	2	69.98
9486	4775	18	1	33.18
9487	4775	30	5	33.59
9488	4776	27	5	34.78
9489	4776	4	2	738.89
9490	4777	30	1	33.59
9491	4777	41	1	106.57
9492	4777	66	1	66.4
9493	4777	64	3	42.6
9494	4778	31	2	33.5
9495	4779	42	2	125.85
9496	4780	48	1	17.79
9497	4780	64	2	42.6
9498	4781	96	3	46.73
9499	4782	90	2	13.02
9500	4782	98	1	9.66
9501	4783	60	2	22.42
9502	4784	26	3	40.13
9503	4785	3	1	286.67
9504	4785	24	2	49.22
9505	4785	25	3	49.71
9506	4786	25	2	49.71
9507	4786	77	1	34.75
9508	4787	51	1	16.01
9509	4787	77	4	34.75
9510	4788	85	1	36.01
9511	4789	85	2	36.01
9512	4789	49	2	8.95
9513	4789	75	3	2.9
9514	4789	76	1	2.45
9515	4790	46	1	24.74
9516	4791	55	1	12.59
9517	4792	36	1	51.85
9518	4792	63	1	33.06
9519	4792	40	2	49.48
9520	4793	5	2	749.81
9521	4793	37	1	149.74
9522	4794	25	1	49.71
9523	4795	36	1	51.85
9524	4796	47	3	17.6
9525	4796	92	1	19.55
9526	4796	31	1	33.5
9527	4797	73	4	10.32
9528	4798	83	1	19.55
9529	4798	18	1	33.18
9530	4798	25	1	49.71
9531	4799	7	3	38.61
9532	4799	12	2	283.69
9533	4799	90	1	13.02
9534	4799	25	3	49.71
9535	4800	72	3	9.77
9536	4801	86	1	44.7
9537	4801	66	2	66.4
9538	4802	62	1	24.18
9539	4802	45	2	40.06
9540	4802	85	5	36.01
9541	4802	44	2	54.57
9542	4803	88	3	14.38
9543	4803	57	1	13.42
9544	4804	79	1	6.88
9545	4804	5	1	749.81
9546	4805	56	2	8.63
9547	4805	24	2	49.22
9548	4805	57	1	13.42
9549	4806	25	1	49.71
9550	4806	25	2	49.71
9551	4807	13	1	22.41
9552	4807	12	3	283.69
9553	4808	12	2	283.69
9554	4809	45	1	40.06
9555	4810	43	1	69.98
9556	4810	90	1	13.02
9557	4810	23	1	61.72
9558	4811	73	1	10.32
9559	4811	40	5	49.48
9560	4812	72	3	9.77
9561	4812	61	2	18.1
9562	4812	39	1	41.87
9563	4813	36	1	51.85
9564	4814	25	2	49.71
9565	4814	59	1	12.93
9566	4815	58	1	19.26
9567	4815	46	4	24.74
9568	4816	96	2	46.73
9569	4816	34	1	80.71
9570	4816	78	1	24.71
9571	4816	14	2	27.1
9572	4817	75	1	2.9
9573	4818	71	3	7.99
9574	4819	87	1	60.33
9575	4819	25	1	49.71
9576	4819	22	3	67.05
9577	4819	51	1	16.01
9578	4820	44	1	54.57
9579	4820	24	3	49.22
9580	4821	23	1	61.72
9581	4821	63	2	33.06
9582	4821	71	1	7.99
9583	4822	13	1	22.41
9584	4822	25	1	49.71
9585	4823	52	2	14.33
9586	4823	25	4	49.71
9587	4824	90	1	13.02
9588	4824	26	1	40.13
9589	4824	58	1	19.26
9590	4825	72	3	9.77
9591	4826	70	2	64.32
9592	4826	1	1	414.28
9593	4826	54	1	34.3
9594	4826	48	1	17.79
9595	4827	36	3	51.85
9596	4827	24	3	49.22
9597	4828	16	2	10.08
9598	4828	42	1	125.85
9599	4829	30	4	33.59
9600	4829	90	1	13.02
9601	4830	61	1	18.1
9602	4831	57	2	13.42
9603	4832	57	1	13.42
9604	4832	9	1	155.72
9605	4832	25	1	49.71
9606	4832	40	1	49.48
9607	4833	36	2	51.85
9608	4834	13	1	22.41
9609	4834	100	1	10.12
9610	4834	54	2	34.3
9611	4834	25	2	49.71
9612	4835	18	1	33.18
9613	4835	43	4	69.98
9614	4835	21	2	63.2
9615	4836	36	1	51.85
9616	4837	38	3	141.29
9617	4837	25	3	49.71
9618	4838	25	2	49.71
9619	4839	36	1	51.85
9620	4839	25	3	49.71
9621	4839	66	1	66.4
9622	4840	11	3	369.57
9623	4840	36	1	51.85
9624	4841	78	2	24.71
9625	4842	7	1	38.61
9626	4842	97	4	12.46
9627	4842	99	5	7.62
9628	4843	25	1	49.71
9629	4843	19	2	40.25
9630	4844	82	1	9.8
9631	4844	24	1	49.22
9632	4844	36	3	51.85
9633	4845	25	4	49.71
9634	4845	25	1	49.71
9635	4846	84	1	26.83
9636	4846	26	4	40.13
9637	4846	30	1	33.59
9638	4847	91	1	25.91
9639	4847	2	2	434.66
9640	4848	25	1	49.71
9641	4849	30	1	33.59
9642	4850	81	2	13.69
9643	4851	83	1	19.55
9644	4851	68	5	170.95
9645	4851	39	4	41.87
9646	4852	48	1	17.79
9647	4852	55	3	12.59
9648	4853	42	1	125.85
9649	4853	5	2	749.81
9650	4853	63	5	33.06
9651	4854	43	3	69.98
9652	4854	73	5	10.32
9653	4855	24	1	49.22
9654	4855	87	1	60.33
9655	4855	57	5	13.42
9656	4856	25	1	49.71
9657	4856	25	1	49.71
9658	4857	77	1	34.75
9659	4858	4	1	738.89
9660	4859	31	2	33.5
9661	4859	22	1	67.05
9662	4860	48	1	17.79
9663	4861	36	1	51.85
9664	4861	18	1	33.18
9665	4861	39	1	41.87
9666	4862	60	2	22.42
9667	4862	42	1	125.85
9668	4862	94	2	20.26
9669	4863	78	1	24.71
9670	4864	27	2	34.78
9671	4865	48	5	17.79
9672	4865	49	1	8.95
9673	4866	48	1	17.79
9674	4866	59	2	12.93
9675	4866	48	2	17.79
9676	4867	27	1	34.78
9677	4868	4	2	738.89
9678	4868	25	2	49.71
9679	4869	36	1	51.85
9680	4870	31	4	33.5
9681	4870	100	2	10.12
9682	4871	45	2	40.06
9683	4872	30	1	33.59
9684	4873	76	2	2.45
9685	4873	74	2	3.59
9686	4874	24	2	49.22
9687	4875	68	2	170.95
9688	4876	48	2	17.79
9689	4876	48	5	17.79
9690	4877	23	1	61.72
9691	4877	74	5	3.59
9692	4878	24	2	49.22
9693	4878	70	1	64.32
9694	4879	25	2	49.71
9695	4880	45	2	40.06
9696	4880	12	1	283.69
9697	4881	42	1	125.85
9698	4882	91	2	25.91
9699	4883	62	1	24.18
9700	4883	44	3	54.57
9701	4883	2	4	434.66
9702	4883	92	1	19.55
9703	4884	96	4	46.73
9704	4884	53	1	43.04
9705	4885	24	2	49.22
9706	4885	55	2	12.59
9707	4885	94	1	20.26
9708	4886	78	1	24.71
9709	4887	25	1	49.71
9710	4887	74	2	3.59
9711	4887	25	2	49.71
9712	4888	57	3	13.42
9713	4888	25	1	49.71
9714	4889	73	1	10.32
9715	4890	90	3	13.02
9716	4890	77	1	34.75
9717	4891	53	1	43.04
9718	4891	18	5	33.18
9719	4892	48	2	17.79
9720	4893	91	3	25.91
9721	4893	68	2	170.95
9722	4894	25	1	49.71
9723	4895	72	5	9.77
9724	4895	96	1	46.73
9725	4895	23	2	61.72
9726	4896	90	1	13.02
9727	4896	25	3	49.71
9728	4896	78	1	24.71
9729	4896	10	2	101.01
9730	4897	73	1	10.32
9731	4897	18	2	33.18
9732	4898	25	1	49.71
9733	4898	41	2	106.57
9734	4898	36	2	51.85
9735	4899	37	1	149.74
9736	4899	16	1	10.08
9737	4900	67	1	183.38
9738	4901	64	1	42.6
9739	4901	72	4	9.77
9740	4901	25	1	49.71
9741	4902	47	4	17.6
9742	4902	78	1	24.71
9743	4903	64	5	42.6
9744	4903	56	1	8.63
9745	4904	23	1	61.72
9746	4904	73	1	10.32
9747	4904	63	4	33.06
9748	4905	83	2	19.55
9749	4906	46	2	24.74
9750	4907	24	4	49.22
9751	4907	23	1	61.72
9752	4908	75	1	2.9
9753	4909	25	1	49.71
9754	4909	47	2	17.6
9755	4910	25	1	49.71
9756	4911	9	2	155.72
9757	4911	24	1	49.22
9758	4911	73	4	10.32
9759	4912	30	1	33.59
9760	4912	47	1	17.6
9761	4912	16	1	10.08
9762	4913	12	1	283.69
9763	4914	9	2	155.72
9764	4914	39	5	41.87
9765	4915	32	4	84.97
9766	4915	25	3	49.71
9767	4916	3	2	286.67
9768	4916	25	2	49.71
9769	4916	25	1	49.71
9770	4917	42	1	125.85
9771	4918	20	1	43.87
9772	4918	24	1	49.22
9773	4918	42	1	125.85
9774	4919	58	3	19.26
9775	4920	71	1	7.99
9776	4921	24	1	49.22
9777	4922	46	4	24.74
9778	4923	76	2	2.45
9779	4924	48	1	17.79
9780	4924	2	4	434.66
9781	4925	25	1	49.71
9782	4925	25	2	49.71
9783	4926	48	2	17.79
9784	4927	12	3	283.69
9785	4928	61	1	18.1
9786	4929	95	1	48.75
9787	4929	54	1	34.3
9788	4930	61	3	18.1
9789	4930	73	3	10.32
9790	4931	37	5	149.74
9791	4931	19	4	40.25
9792	4932	33	1	77.74
9793	4932	25	4	49.71
9794	4933	49	2	8.95
9795	4933	12	2	283.69
9796	4933	36	1	51.85
9797	4934	24	1	49.22
9798	4935	26	1	40.13
9799	4935	74	1	3.59
9800	4936	40	1	49.48
9801	4937	75	1	2.9
9802	4937	26	1	40.13
9803	4938	24	3	49.22
9804	4938	41	1	106.57
9805	4939	72	1	9.77
9806	4939	31	3	33.5
9807	4940	92	3	19.55
9808	4940	2	2	434.66
9809	4940	47	1	17.6
9810	4940	64	3	42.6
9811	4941	25	1	49.71
9812	4942	25	1	49.71
9813	4943	25	5	49.71
9814	4943	23	1	61.72
9815	4944	76	5	2.45
9816	4945	16	1	10.08
9817	4946	45	4	40.06
9818	4947	93	1	19.24
9819	4948	94	4	20.26
9820	4948	34	1	80.71
9821	4949	24	1	49.22
9822	4949	21	1	63.2
9823	4950	72	1	9.77
9824	4950	24	5	49.22
9825	4950	50	1	6.73
9826	4951	98	1	9.66
9827	4952	20	1	43.87
9828	4953	25	2	49.71
9829	4954	62	1	24.18
9830	4955	53	2	43.04
9831	4955	61	1	18.1
9832	4955	31	2	33.5
9833	4956	16	4	10.08
9834	4956	65	3	88.86
9835	4956	100	1	10.12
9836	4957	52	2	14.33
9837	4957	10	2	101.01
9838	4957	25	2	49.71
9839	4958	48	1	17.79
9840	4958	40	2	49.48
9841	4959	35	1	64.83
9842	4959	66	2	66.4
9843	4959	18	2	33.18
9844	4960	36	1	51.85
9845	4961	83	2	19.55
9846	4961	25	1	49.71
9847	4961	31	2	33.5
9848	4961	100	1	10.12
9849	4962	32	1	84.97
9850	4963	99	1	7.62
9851	4963	87	5	60.33
9852	4963	42	5	125.85
9853	4963	69	1	62.48
9854	4964	16	1	10.08
9855	4964	49	1	8.95
9856	4965	14	2	27.1
9857	4965	7	3	38.61
9858	4966	25	3	49.71
9859	4966	14	3	27.1
9860	4967	22	1	67.05
9861	4968	69	2	62.48
9862	4968	64	2	42.6
9863	4969	92	1	19.55
9864	4969	12	3	283.69
9865	4970	30	5	33.59
9866	4971	9	1	155.72
9867	4971	79	1	6.88
9868	4972	48	1	17.79
9869	4972	42	5	125.85
9870	4973	78	1	24.71
9871	4974	71	4	7.99
9872	4975	46	1	24.74
9873	4976	45	2	40.06
9874	4976	31	1	33.5
9875	4977	27	1	34.78
9876	4977	25	1	49.71
9877	4978	45	2	40.06
9878	4979	25	5	49.71
9879	4979	25	2	49.71
9880	4980	25	2	49.71
9881	4980	1	1	414.28
9882	4981	5	1	749.81
9883	4981	51	1	16.01
9884	4981	64	4	42.6
9885	4982	23	1	61.72
9886	4982	23	1	61.72
9887	4983	16	1	10.08
9888	4984	30	1	33.59
9889	4985	18	2	33.18
9890	4985	99	1	7.62
9891	4986	24	1	49.22
9892	4987	7	1	38.61
9893	4988	25	1	49.71
9894	4989	25	1	49.71
9895	4989	53	1	43.04
9896	4990	95	1	48.75
9897	4991	21	4	63.2
9898	4992	79	1	6.88
9899	4992	27	4	34.78
9900	4992	71	1	7.99
9901	4993	25	3	49.71
9902	4994	74	1	3.59
9903	4994	2	1	434.66
9904	4994	88	2	14.38
9905	4994	78	3	24.71
9906	4995	76	1	2.45
9907	4996	25	2	49.71
9908	4996	2	1	434.66
9909	4996	24	2	49.22
9910	4997	24	1	49.22
9911	4997	37	4	149.74
9912	4998	47	2	17.6
9913	4998	68	5	170.95
9914	4999	76	1	2.45
9915	4999	25	3	49.71
9916	4999	24	2	49.22
9917	5000	48	3	17.79
9918	5000	25	1	49.71
\.

SELECT setval(pg_get_serial_sequence('customers','id'), (SELECT MAX(id) FROM customers));
SELECT setval(pg_get_serial_sequence('categories','id'), (SELECT MAX(id) FROM categories));
SELECT setval(pg_get_serial_sequence('products','id'), (SELECT MAX(id) FROM products));
SELECT setval(pg_get_serial_sequence('employees','id'), (SELECT MAX(id) FROM employees));
SELECT setval(pg_get_serial_sequence('orders','id'), (SELECT MAX(id) FROM orders));
SELECT setval(pg_get_serial_sequence('order_items','id'), (SELECT MAX(id) FROM order_items));

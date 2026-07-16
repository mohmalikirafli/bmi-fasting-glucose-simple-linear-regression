###############################################################
# UAS Pemrograman - Regresi Linier Sederhana
# Topik: Hubungan Indeks Massa Tubuh (IMT) dengan Glukosa Darah Puasa
# Dataset sintetis: 250 observasi
# Nama : Mohammad Maliki Rafli
###############################################################

# 0. Set Awal
rm(list = ls())
options(digits = 4)
options(scipen = 999)

cat("\n============================================================\n")
cat("UAS PEMROGRAMAN - REGRESI LINIER SEDERHANA\n")
cat("Tema: Hubungan IMT dengan Glukosa Darah Puasa\n")
cat("Jumlah observasi: 250\n")
cat("============================================================\n\n")

# 1. Pembuatan Simulasi Dataset
data <- read.csv(text = "id,usia_tahun,jenis_kelamin,riwayat_keluarga_diabetes,aktivitas_fisik_menit_minggu,imt_kg_m2,kelompok_imt,glukosa_puasa_mg_dl,kategori_glukosa
1,30,Perempuan,Tidak,57,26.4,Overweight,91.2,Normal
2,46,Laki-laki,Tidak,252,27.2,Overweight,102.5,Prediabetes
3,30,Laki-laki,Tidak,200,28.2,Overweight,127.4,Diabetes
4,46,Perempuan,Tidak,115,26.9,Overweight,105.3,Prediabetes
5,65,Perempuan,Ya,199,18.2,Underweight,105.2,Prediabetes
6,53,Laki-laki,Tidak,255,26.9,Overweight,103.2,Prediabetes
7,54,Perempuan,Ya,91,28.2,Overweight,150.6,Diabetes
8,52,Perempuan,Ya,142,25.3,Overweight,130.7,Diabetes
9,44,Perempuan,Tidak,99,32.4,Obesitas,122.9,Prediabetes
10,39,Laki-laki,Tidak,256,28.9,Overweight,123.0,Prediabetes
11,49,Perempuan,Ya,205,28.9,Overweight,106.9,Prediabetes
12,50,Laki-laki,Ya,231,33.2,Obesitas,130.2,Diabetes
13,56,Perempuan,Tidak,83,26.7,Overweight,104.1,Prediabetes
14,43,Perempuan,Ya,81,31.4,Obesitas,116.1,Prediabetes
15,48,Perempuan,Tidak,235,32.5,Obesitas,111.1,Prediabetes
16,30,Laki-laki,Ya,249,28.4,Overweight,121.5,Prediabetes
17,44,Perempuan,Ya,105,27.9,Overweight,96.4,Normal
18,30,Perempuan,Tidak,224,25.3,Overweight,113.8,Prediabetes
19,49,Laki-laki,Ya,110,33.5,Obesitas,126.8,Diabetes
20,39,Perempuan,Ya,99,25.2,Overweight,109.1,Prediabetes
21,49,Laki-laki,Tidak,179,29.6,Overweight,109.1,Prediabetes
22,48,Perempuan,Ya,253,26.6,Overweight,132.2,Diabetes
23,57,Laki-laki,Tidak,249,21.0,Normal,93.1,Normal
24,49,Perempuan,Tidak,148,31.1,Obesitas,124.9,Prediabetes
25,37,Laki-laki,Ya,53,30.3,Obesitas,110.9,Prediabetes
26,59,Perempuan,Tidak,199,28.4,Overweight,102.8,Prediabetes
27,42,Laki-laki,Tidak,58,21.9,Normal,100.8,Prediabetes
28,51,Perempuan,Ya,111,26.5,Overweight,106.7,Prediabetes
29,35,Laki-laki,Tidak,218,26.0,Overweight,84.5,Normal
30,34,Laki-laki,Tidak,197,25.1,Overweight,101.6,Prediabetes
31,54,Laki-laki,Tidak,113,29.4,Overweight,123.4,Prediabetes
32,42,Laki-laki,Tidak,263,31.5,Obesitas,115.2,Prediabetes
33,41,Laki-laki,Ya,69,23.2,Normal,93.6,Normal
34,46,Laki-laki,Tidak,159,25.0,Overweight,105.2,Prediabetes
35,55,Perempuan,Tidak,103,29.6,Overweight,111.1,Prediabetes
36,65,Perempuan,Ya,361,25.7,Overweight,120.9,Prediabetes
37,30,Perempuan,Tidak,213,31.8,Obesitas,105.2,Prediabetes
38,42,Perempuan,Ya,164,21.7,Normal,100.9,Prediabetes
39,46,Laki-laki,Tidak,49,27.1,Overweight,109.9,Prediabetes
40,56,Laki-laki,Tidak,45,30.3,Obesitas,149.3,Diabetes
41,55,Perempuan,Tidak,140,29.9,Overweight,118.4,Prediabetes
42,59,Perempuan,Tidak,125,33.1,Obesitas,128.6,Diabetes
43,47,Laki-laki,Ya,129,24.8,Normal,123.7,Prediabetes
44,46,Laki-laki,Tidak,165,24.4,Normal,93.9,Normal
45,45,Perempuan,Tidak,185,25.7,Overweight,95.2,Normal
46,30,Laki-laki,Tidak,202,25.1,Overweight,86.0,Normal
47,36,Perempuan,Ya,113,31.5,Obesitas,122.5,Prediabetes
48,51,Laki-laki,Tidak,243,19.4,Normal,82.0,Normal
49,52,Perempuan,Ya,34,24.1,Normal,123.0,Prediabetes
50,59,Perempuan,Tidak,116,27.0,Overweight,122.3,Prediabetes
51,50,Laki-laki,Ya,273,25.6,Overweight,101.9,Prediabetes
52,58,Perempuan,Tidak,118,28.1,Overweight,129.6,Diabetes
53,38,Perempuan,Tidak,151,25.7,Overweight,125.1,Prediabetes
54,56,Perempuan,Ya,146,28.8,Overweight,132.6,Diabetes
55,40,Laki-laki,Tidak,270,24.6,Normal,105.8,Prediabetes
56,41,Perempuan,Tidak,52,28.2,Overweight,125.7,Prediabetes
57,48,Laki-laki,Tidak,303,26.9,Overweight,118.1,Prediabetes
58,54,Perempuan,Ya,192,31.1,Obesitas,137.8,Diabetes
59,45,Laki-laki,Tidak,392,28.8,Overweight,111.9,Prediabetes
60,35,Perempuan,Tidak,423,28.8,Overweight,107.4,Prediabetes
61,55,Laki-laki,Ya,90,32.8,Obesitas,136.3,Diabetes
62,59,Perempuan,Ya,132,26.4,Overweight,112.1,Prediabetes
63,38,Laki-laki,Tidak,30,29.4,Overweight,119.8,Prediabetes
64,42,Laki-laki,Ya,301,28.1,Overweight,126.0,Diabetes
65,36,Perempuan,Ya,204,25.0,Overweight,119.3,Prediabetes
66,46,Perempuan,Ya,97,25.8,Overweight,113.9,Prediabetes
67,55,Perempuan,Tidak,214,37.1,Obesitas,141.6,Diabetes
68,59,Perempuan,Ya,137,22.6,Normal,103.5,Prediabetes
69,42,Perempuan,Ya,147,22.9,Normal,119.3,Prediabetes
70,53,Perempuan,Tidak,204,31.3,Obesitas,101.9,Prediabetes
71,32,Laki-laki,Ya,147,30.5,Obesitas,118.0,Prediabetes
72,44,Perempuan,Tidak,107,26.0,Overweight,105.1,Prediabetes
73,57,Laki-laki,Tidak,201,28.1,Overweight,127.9,Diabetes
74,45,Laki-laki,Tidak,159,23.9,Normal,115.1,Prediabetes
75,48,Laki-laki,Tidak,85,29.2,Overweight,134.1,Diabetes
76,48,Perempuan,Tidak,337,24.1,Normal,117.9,Prediabetes
77,49,Laki-laki,Ya,69,21.8,Normal,88.5,Normal
78,59,Perempuan,Ya,235,25.9,Overweight,115.4,Prediabetes
79,50,Perempuan,Tidak,221,18.2,Underweight,91.8,Normal
80,65,Perempuan,Tidak,124,25.7,Overweight,117.6,Prediabetes
81,51,Laki-laki,Tidak,154,27.8,Overweight,120.4,Prediabetes
82,43,Perempuan,Ya,172,29.3,Overweight,112.2,Prediabetes
83,34,Laki-laki,Tidak,141,30.2,Obesitas,89.8,Normal
84,48,Laki-laki,Ya,249,25.6,Overweight,113.2,Prediabetes
85,44,Laki-laki,Tidak,173,33.1,Obesitas,124.1,Prediabetes
86,60,Perempuan,Tidak,232,25.1,Overweight,93.6,Normal
87,39,Perempuan,Ya,172,31.9,Obesitas,106.0,Prediabetes
88,48,Laki-laki,Tidak,80,28.9,Overweight,95.6,Normal
89,58,Perempuan,Ya,167,33.1,Obesitas,116.1,Prediabetes
90,39,Perempuan,Ya,221,23.9,Normal,123.9,Prediabetes
91,50,Laki-laki,Tidak,138,24.5,Normal,105.0,Prediabetes
92,49,Perempuan,Tidak,284,31.1,Obesitas,109.2,Prediabetes
93,46,Laki-laki,Ya,299,19.6,Normal,109.7,Prediabetes
94,37,Laki-laki,Tidak,426,34.2,Obesitas,115.7,Prediabetes
95,37,Laki-laki,Tidak,148,26.4,Overweight,98.3,Normal
96,41,Laki-laki,Tidak,106,30.0,Obesitas,123.6,Prediabetes
97,48,Laki-laki,Ya,345,19.2,Normal,94.5,Normal
98,65,Laki-laki,Ya,162,18.2,Underweight,109.6,Prediabetes
99,48,Laki-laki,Tidak,237,35.0,Obesitas,114.7,Prediabetes
100,52,Laki-laki,Ya,118,25.5,Overweight,109.3,Prediabetes
101,43,Laki-laki,Tidak,205,20.3,Normal,104.0,Prediabetes
102,43,Laki-laki,Tidak,107,26.7,Overweight,91.8,Normal
103,34,Laki-laki,Tidak,189,25.6,Overweight,123.4,Prediabetes
104,52,Laki-laki,Ya,114,28.4,Overweight,110.8,Prediabetes
105,62,Perempuan,Tidak,181,30.8,Obesitas,135.1,Diabetes
106,47,Perempuan,Ya,244,18.4,Underweight,110.2,Prediabetes
107,35,Perempuan,Tidak,107,26.0,Overweight,88.9,Normal
108,54,Laki-laki,Tidak,175,34.3,Obesitas,131.6,Diabetes
109,65,Laki-laki,Ya,162,30.7,Obesitas,137.5,Diabetes
110,47,Laki-laki,Ya,234,27.1,Overweight,111.2,Prediabetes
111,40,Perempuan,Tidak,38,35.8,Obesitas,125.9,Prediabetes
112,30,Laki-laki,Ya,457,30.4,Obesitas,117.2,Prediabetes
113,49,Perempuan,Tidak,172,26.6,Overweight,99.4,Normal
114,59,Laki-laki,Ya,96,26.1,Overweight,105.1,Prediabetes
115,64,Laki-laki,Tidak,161,30.8,Obesitas,95.1,Normal
116,55,Laki-laki,Tidak,82,22.8,Normal,106.4,Prediabetes
117,30,Laki-laki,Tidak,346,27.5,Overweight,119.4,Prediabetes
118,30,Laki-laki,Tidak,241,20.7,Normal,78.4,Normal
119,57,Perempuan,Tidak,95,35.4,Obesitas,122.6,Prediabetes
120,65,Perempuan,Tidak,144,20.8,Normal,100.9,Prediabetes
121,55,Perempuan,Ya,135,28.8,Overweight,108.6,Prediabetes
122,39,Laki-laki,Tidak,198,37.4,Obesitas,140.7,Diabetes
123,57,Perempuan,Ya,345,31.4,Obesitas,103.1,Prediabetes
124,49,Perempuan,Tidak,147,26.9,Overweight,115.6,Prediabetes
125,51,Laki-laki,Ya,200,22.5,Normal,116.3,Prediabetes
126,39,Laki-laki,Ya,191,28.5,Overweight,86.6,Normal
127,49,Laki-laki,Tidak,251,24.1,Normal,121.1,Prediabetes
128,39,Laki-laki,Ya,173,24.6,Normal,108.7,Prediabetes
129,39,Perempuan,Ya,451,29.4,Overweight,105.9,Prediabetes
130,37,Laki-laki,Tidak,252,30.8,Obesitas,112.6,Prediabetes
131,53,Laki-laki,Tidak,429,27.4,Overweight,122.3,Prediabetes
132,51,Laki-laki,Tidak,233,26.3,Overweight,108.8,Prediabetes
133,47,Laki-laki,Ya,184,21.6,Normal,113.3,Prediabetes
134,30,Perempuan,Tidak,239,23.2,Normal,106.2,Prediabetes
135,52,Perempuan,Ya,99,21.5,Normal,97.0,Normal
136,34,Laki-laki,Ya,445,22.9,Normal,96.1,Normal
137,47,Laki-laki,Ya,480,32.6,Obesitas,136.5,Diabetes
138,49,Perempuan,Tidak,71,23.8,Normal,121.3,Prediabetes
139,50,Perempuan,Tidak,201,23.9,Normal,100.7,Prediabetes
140,41,Laki-laki,Ya,83,35.9,Obesitas,135.2,Diabetes
141,47,Laki-laki,Ya,172,25.9,Overweight,110.4,Prediabetes
142,35,Perempuan,Ya,195,30.9,Obesitas,121.8,Prediabetes
143,41,Perempuan,Tidak,36,26.9,Overweight,104.5,Prediabetes
144,49,Laki-laki,Tidak,88,21.0,Normal,97.3,Normal
145,46,Laki-laki,Tidak,81,25.0,Overweight,108.9,Prediabetes
146,44,Perempuan,Ya,212,27.6,Overweight,97.6,Normal
147,31,Perempuan,Tidak,86,21.6,Normal,99.7,Normal
148,36,Perempuan,Ya,88,26.2,Overweight,112.3,Prediabetes
149,51,Laki-laki,Ya,160,25.2,Overweight,99.8,Normal
150,52,Perempuan,Tidak,229,23.9,Normal,100.9,Prediabetes
151,40,Laki-laki,Ya,263,37.3,Obesitas,139.7,Diabetes
152,42,Laki-laki,Tidak,192,28.9,Overweight,130.6,Diabetes
153,57,Perempuan,Tidak,119,26.5,Overweight,106.4,Prediabetes
154,35,Perempuan,Tidak,194,26.8,Overweight,103.0,Prediabetes
155,64,Laki-laki,Ya,184,25.9,Overweight,123.3,Prediabetes
156,39,Perempuan,Tidak,159,27.7,Overweight,115.3,Prediabetes
157,49,Laki-laki,Tidak,45,22.1,Normal,106.7,Prediabetes
158,43,Laki-laki,Ya,87,25.2,Overweight,132.5,Diabetes
159,57,Laki-laki,Tidak,159,30.5,Obesitas,138.5,Diabetes
160,43,Perempuan,Tidak,264,31.0,Obesitas,106.9,Prediabetes
161,41,Laki-laki,Tidak,170,20.9,Normal,88.0,Normal
162,65,Perempuan,Ya,176,23.4,Normal,105.1,Prediabetes
163,42,Perempuan,Ya,183,26.4,Overweight,103.3,Prediabetes
164,46,Perempuan,Tidak,398,22.3,Normal,102.0,Prediabetes
165,55,Laki-laki,Tidak,75,22.2,Normal,117.7,Prediabetes
166,34,Perempuan,Ya,401,33.2,Obesitas,127.6,Diabetes
167,43,Perempuan,Ya,172,28.1,Overweight,119.1,Prediabetes
168,41,Laki-laki,Ya,180,24.2,Normal,91.5,Normal
169,49,Perempuan,Ya,202,21.7,Normal,98.3,Normal
170,42,Perempuan,Tidak,448,26.4,Overweight,119.1,Prediabetes
171,39,Perempuan,Tidak,336,18.2,Underweight,98.9,Normal
172,45,Perempuan,Tidak,111,25.0,Overweight,101.4,Prediabetes
173,38,Laki-laki,Tidak,51,22.0,Normal,92.0,Normal
174,49,Perempuan,Tidak,56,21.5,Normal,95.6,Normal
175,46,Laki-laki,Tidak,202,26.3,Overweight,98.8,Normal
176,59,Perempuan,Ya,90,26.2,Overweight,149.0,Diabetes
177,38,Perempuan,Tidak,201,29.7,Overweight,119.3,Prediabetes
178,46,Laki-laki,Tidak,202,32.9,Obesitas,133.2,Diabetes
179,50,Laki-laki,Ya,153,31.9,Obesitas,134.5,Diabetes
180,44,Laki-laki,Ya,306,19.2,Normal,103.5,Prediabetes
181,39,Laki-laki,Ya,99,19.8,Normal,100.2,Prediabetes
182,59,Laki-laki,Ya,84,25.9,Overweight,112.6,Prediabetes
183,41,Perempuan,Ya,219,25.9,Overweight,105.2,Prediabetes
184,51,Laki-laki,Tidak,30,32.7,Obesitas,135.4,Diabetes
185,48,Perempuan,Ya,249,30.0,Obesitas,140.9,Diabetes
186,62,Perempuan,Ya,142,28.4,Overweight,123.2,Prediabetes
187,50,Laki-laki,Tidak,78,34.0,Obesitas,118.2,Prediabetes
188,35,Perempuan,Ya,150,29.1,Overweight,116.1,Prediabetes
189,38,Perempuan,Tidak,33,24.6,Normal,90.1,Normal
190,58,Perempuan,Ya,254,31.3,Obesitas,133.2,Diabetes
191,33,Laki-laki,Tidak,299,20.3,Normal,98.5,Normal
192,51,Perempuan,Tidak,184,25.9,Overweight,99.8,Normal
193,35,Laki-laki,Tidak,284,28.5,Overweight,116.9,Prediabetes
194,41,Perempuan,Tidak,139,23.0,Normal,93.6,Normal
195,47,Perempuan,Tidak,117,32.9,Obesitas,117.1,Prediabetes
196,62,Laki-laki,Tidak,130,30.3,Obesitas,123.6,Prediabetes
197,56,Laki-laki,Tidak,226,31.3,Obesitas,134.8,Diabetes
198,39,Perempuan,Tidak,73,34.0,Obesitas,136.8,Diabetes
199,52,Perempuan,Tidak,89,18.2,Underweight,88.2,Normal
200,48,Laki-laki,Ya,123,28.3,Overweight,144.6,Diabetes
201,33,Laki-laki,Ya,193,25.7,Overweight,103.2,Prediabetes
202,46,Perempuan,Tidak,144,24.1,Normal,90.2,Normal
203,46,Perempuan,Tidak,159,18.2,Underweight,107.5,Prediabetes
204,53,Laki-laki,Ya,136,38.8,Obesitas,116.6,Prediabetes
205,57,Perempuan,Tidak,480,31.9,Obesitas,116.8,Prediabetes
206,53,Perempuan,Ya,110,24.5,Normal,105.3,Prediabetes
207,46,Perempuan,Tidak,78,28.1,Overweight,111.6,Prediabetes
208,50,Perempuan,Tidak,188,28.2,Overweight,91.7,Normal
209,30,Laki-laki,Tidak,147,29.4,Overweight,104.7,Prediabetes
210,45,Laki-laki,Tidak,452,30.9,Obesitas,127.9,Diabetes
211,42,Perempuan,Tidak,165,30.5,Obesitas,134.4,Diabetes
212,41,Perempuan,Tidak,255,27.3,Overweight,96.3,Normal
213,48,Perempuan,Tidak,87,34.2,Obesitas,122.7,Prediabetes
214,45,Laki-laki,Ya,173,23.7,Normal,110.5,Prediabetes
215,50,Laki-laki,Tidak,82,22.1,Normal,97.9,Normal
216,55,Perempuan,Tidak,53,31.5,Obesitas,134.7,Diabetes
217,41,Perempuan,Tidak,195,26.5,Overweight,93.1,Normal
218,30,Laki-laki,Ya,107,27.8,Overweight,115.9,Prediabetes
219,60,Laki-laki,Tidak,167,29.2,Overweight,125.9,Prediabetes
220,47,Laki-laki,Tidak,228,24.2,Normal,107.6,Prediabetes
221,43,Perempuan,Tidak,65,26.7,Overweight,107.3,Prediabetes
222,43,Perempuan,Tidak,253,22.1,Normal,89.5,Normal
223,49,Laki-laki,Tidak,78,27.8,Overweight,116.7,Prediabetes
224,45,Perempuan,Tidak,212,30.1,Obesitas,125.3,Prediabetes
225,58,Perempuan,Ya,322,28.7,Overweight,135.5,Diabetes
226,54,Perempuan,Tidak,143,22.3,Normal,112.1,Prediabetes
227,38,Perempuan,Tidak,74,34.6,Obesitas,108.8,Prediabetes
228,46,Laki-laki,Ya,108,26.5,Overweight,121.3,Prediabetes
229,46,Perempuan,Tidak,300,23.0,Normal,95.6,Normal
230,46,Laki-laki,Ya,295,29.5,Overweight,81.4,Normal
231,42,Perempuan,Ya,422,20.2,Normal,114.1,Prediabetes
232,51,Perempuan,Tidak,157,23.5,Normal,119.3,Prediabetes
233,47,Laki-laki,Ya,93,23.4,Normal,105.6,Prediabetes
234,55,Perempuan,Tidak,196,28.0,Overweight,109.9,Prediabetes
235,64,Laki-laki,Ya,194,21.5,Normal,103.9,Prediabetes
236,47,Perempuan,Ya,66,29.2,Overweight,114.6,Prediabetes
237,47,Laki-laki,Ya,125,31.5,Obesitas,130.2,Diabetes
238,57,Perempuan,Ya,110,24.4,Normal,123.1,Prediabetes
239,46,Laki-laki,Tidak,269,23.0,Normal,85.5,Normal
240,30,Perempuan,Tidak,173,25.6,Overweight,84.3,Normal
241,43,Perempuan,Ya,107,22.3,Normal,112.4,Prediabetes
242,49,Laki-laki,Tidak,109,25.6,Overweight,105.8,Prediabetes
243,50,Laki-laki,Tidak,109,29.3,Overweight,118.1,Prediabetes
244,59,Perempuan,Tidak,189,25.8,Overweight,102.2,Prediabetes
245,39,Laki-laki,Tidak,182,27.3,Overweight,123.6,Prediabetes
246,62,Laki-laki,Ya,317,31.0,Obesitas,146.0,Diabetes
247,38,Perempuan,Tidak,306,30.1,Obesitas,116.8,Prediabetes
248,43,Perempuan,Tidak,132,32.2,Obesitas,109.7,Prediabetes
249,46,Perempuan,Tidak,241,29.6,Overweight,123.9,Prediabetes
250,49,Laki-laki,Ya,121,30.1,Obesitas,133.9,Diabetes
", stringsAsFactors = FALSE)

# 2. Pengaturan tipe data
data$id <- as.integer(data$id)
data$usia_tahun <- as.integer(data$usia_tahun)
data$jenis_kelamin <- as.factor(data$jenis_kelamin)
data$riwayat_keluarga_diabetes <- as.factor(data$riwayat_keluarga_diabetes)
data$aktivitas_fisik_menit_minggu <- as.integer(data$aktivitas_fisik_menit_minggu)
data$imt_kg_m2 <- as.numeric(data$imt_kg_m2)
data$kelompok_imt <- factor(data$kelompok_imt,
                            levels = c("Underweight", "Normal", "Overweight", "Obesitas"))
data$glukosa_puasa_mg_dl <- as.numeric(data$glukosa_puasa_mg_dl)
data$kategori_glukosa <- factor(data$kategori_glukosa,
                                levels = c("Normal", "Prediabetes", "Diabetes"))

# Membuat folder data dan output pada struktur repository
dir.create("03_Data", showWarnings = FALSE, recursive = TRUE)
dir.create("04_Output", showWarnings = FALSE, recursive = TRUE)

# 3. Preview dataset
cat("\n==================== 1. PREVIEW DATASET ====================\n")
cat("\nEnam baris pertama dataset:\n")
print(head(data))

cat("\nSepuluh baris pertama dataset:\n")
print(head(data, 10))

cat("\nJumlah baris dan kolom dataset:\n")
print(dim(data))

# 4. Struktur data
cat("\n==================== 2. STRUKTUR DATA ======================\n")
str(data)

# 5. Statistik deskriptif
cat("\n==================== 3. STATISTIK DESKRIPTIF ===============\n")
cat("\nRingkasan semua variabel:\n")
print(summary(data))

cat("\nStatistik deskriptif variabel numerik utama:\n")
deskriptif <- data.frame(
  Variabel = c("Usia (tahun)", "Aktivitas fisik (menit/minggu)",
               "IMT (kg/m2)", "Glukosa puasa (mg/dL)"),
  N = c(length(data$usia_tahun),
        length(data$aktivitas_fisik_menit_minggu),
        length(data$imt_kg_m2),
        length(data$glukosa_puasa_mg_dl)),
  Mean = c(mean(data$usia_tahun),
           mean(data$aktivitas_fisik_menit_minggu),
           mean(data$imt_kg_m2),
           mean(data$glukosa_puasa_mg_dl)),
  SD = c(sd(data$usia_tahun),
         sd(data$aktivitas_fisik_menit_minggu),
         sd(data$imt_kg_m2),
         sd(data$glukosa_puasa_mg_dl)),
  Median = c(median(data$usia_tahun),
             median(data$aktivitas_fisik_menit_minggu),
             median(data$imt_kg_m2),
             median(data$glukosa_puasa_mg_dl)),
  Minimum = c(min(data$usia_tahun),
              min(data$aktivitas_fisik_menit_minggu),
              min(data$imt_kg_m2),
              min(data$glukosa_puasa_mg_dl)),
  Maksimum = c(max(data$usia_tahun),
               max(data$aktivitas_fisik_menit_minggu),
               max(data$imt_kg_m2),
               max(data$glukosa_puasa_mg_dl))
)
print(deskriptif, row.names = FALSE)

cat("\nDistribusi kategori IMT:\n")
print(table(data$kelompok_imt))

cat("\nDistribusi kategori glukosa:\n")
print(table(data$kategori_glukosa))

# 6. Scatter plot hubungan X dan Y
cat("\n==================== 4. SCATTER PLOT =======================\n")
cat("Scatter plot ditampilkan di panel Plots dan disimpan sebagai PNG.\n")

plot_scatter <- function() {
  plot(data$imt_kg_m2, data$glukosa_puasa_mg_dl,
       main = "Hubungan IMT dengan Glukosa Darah Puasa",
       xlab = "Indeks Massa Tubuh (kg/m2)",
       ylab = "Glukosa Darah Puasa (mg/dL)",
       pch = 19,
       col = rgb(31/255, 119/255, 180/255, 0.72),
       cex = 1.15,
       las = 1)
  grid(col = "gray85", lty = "dotted")
  abline(model_regresi, col = "red3", lwd = 2.4)
  legend("topleft",
         legend = c("Observasi", "Garis regresi"),
         col = c(rgb(31/255, 119/255, 180/255, 0.72), "red3"),
         pch = c(19, NA),
         lty = c(NA, 1),
         lwd = c(NA, 2.4),
         bty = "n")
}

# 7. Regresi linier sederhana
cat("\n==================== 5. REGRESI LINIER SEDERHANA ===========\n")
cat("Model: glukosa_puasa_mg_dl = beta0 + beta1 * imt_kg_m2 + error\n\n")

model_regresi <- lm(glukosa_puasa_mg_dl ~ imt_kg_m2, data = data)

cat("Output lengkap fungsi summary(lm):\n")
print(summary(model_regresi))

cat("\nTabel koefisien regresi:\n")
koefisien <- summary(model_regresi)$coefficients
print(koefisien)

intercept <- coef(model_regresi)[1]
slope <- coef(model_regresi)[2]
p_value_slope <- koefisien["imt_kg_m2", "Pr(>|t|)"]
r_squared <- summary(model_regresi)$r.squared
adj_r_squared <- summary(model_regresi)$adj.r.squared
ci_95 <- confint(model_regresi, level = 0.95)

cat("\nIntercept:\n")
print(intercept)

cat("\nSlope / koefisien IMT:\n")
print(slope)

cat("\nP-value slope:\n")
print(p_value_slope)

cat("\nR-squared:\n")
print(r_squared)

cat("\nAdjusted R-squared:\n")
print(adj_r_squared)

cat("\nConfidence interval 95%:\n")
print(ci_95)

cat("\nKorelasi Pearson antara IMT dan glukosa puasa:\n")
print(cor(data$imt_kg_m2, data$glukosa_puasa_mg_dl))

# Tampilkan scatter plot setelah model dibuat
plot_scatter()
png("04_Output/01_bmi_fasting_glucose_scatter_plot.png", width = 1200, height = 850, res = 150)
plot_scatter()
dev.off()

# 8. Pemeriksaan residual
cat("\n==================== 6. PEMERIKSAAN RESIDUAL ===============\n")
residual_model <- residuals(model_regresi)
fitted_model <- fitted(model_regresi)

cat("\nRingkasan residual:\n")
print(summary(residual_model))

cat("\nUji Shapiro-Wilk residual:\n")
print(shapiro.test(residual_model))

cat("\nCatatan interpretasi asumsi:\n")
cat("- Histogram residual digunakan untuk melihat bentuk sebaran residual.\n")
cat("- Q-Q plot digunakan untuk melihat apakah residual mengikuti pola normal.\n")
cat("- Residual vs fitted digunakan untuk melihat pola linearitas dan homogenitas varians secara visual.\n")

# Histogram residual
plot_hist_residual <- function() {
  hist(residual_model,
       main = "Histogram Residual Model Regresi",
       xlab = "Residual",
       ylab = "Frekuensi",
       col = "skyblue",
       border = "white",
       breaks = 18,
       las = 1)
  abline(v = 0, col = "red3", lwd = 2, lty = 2)
  grid(col = "gray85", lty = "dotted")
}
plot_hist_residual()
png("04_Output/02_residual_histogram.png", width = 1200, height = 850, res = 150)
plot_hist_residual()
dev.off()

# Q-Q plot residual
plot_qq_residual <- function() {
  qqnorm(residual_model,
         main = "Q-Q Plot Residual",
         pch = 19,
         col = rgb(31/255, 119/255, 180/255, 0.72),
         las = 1)
  qqline(residual_model, col = "red3", lwd = 2.4)
  grid(col = "gray85", lty = "dotted")
}
plot_qq_residual()
png("04_Output/03_residual_qq_plot.png", width = 1200, height = 850, res = 150)
plot_qq_residual()
dev.off()

# Residual vs fitted
plot_residual_fitted <- function() {
  plot(fitted_model, residual_model,
       main = "Residual vs Fitted Values",
       xlab = "Nilai Prediksi / Fitted Values",
       ylab = "Residual",
       pch = 19,
       col = rgb(31/255, 119/255, 180/255, 0.72),
       cex = 1.15,
       las = 1)
  abline(h = 0, col = "red3", lwd = 2.4, lty = 2)
  grid(col = "gray85", lty = "dotted")
}
plot_residual_fitted()
png("04_Output/04_residual_vs_fitted.png", width = 1200, height = 850, res = 150)
plot_residual_fitted()
dev.off()

# 9. Interpretasi ringkas
cat("\n==================== 7. INTERPRETASI RINGKAS ===============\n")
cat(sprintf("Persamaan regresi: glukosa puasa = %.3f + %.3f * IMT\n",
            intercept, slope))
cat(sprintf("Setiap kenaikan 1 kg/m2 IMT diperkirakan meningkatkan glukosa darah puasa sebesar %.3f mg/dL.\n",
            slope))
cat(sprintf("P-value koefisien IMT = %.5f, sehingga hubungan IMT dengan glukosa darah puasa signifikan secara statistik pada alpha 0,05.\n",
            p_value_slope))
cat(sprintf("Nilai R-squared = %.3f, artinya sekitar %.1f%% variasi glukosa darah puasa dapat dijelaskan oleh IMT.\n",
            r_squared, r_squared * 100))
cat(sprintf("Adjusted R-squared = %.3f.\n", adj_r_squared))
cat(sprintf("Uji Shapiro-Wilk residual menghasilkan p-value = %.3f. Jika p-value > 0,05, residual dapat dianggap tidak menyimpang nyata dari normalitas.\n",
            shapiro.test(residual_model)$p.value))
cat("\nKesimpulan: pada dataset sintetis ini, IMT berhubungan positif dan signifikan dengan glukosa darah puasa.\n")
cat("Namun, karena analisis yang digunakan adalah regresi linier sederhana, hasil ini tidak dimaksudkan sebagai bukti kausal penuh dan belum mengontrol variabel lain seperti usia, aktivitas fisik, dan riwayat keluarga.\n")

# 10. Simpan dataset hasil pembuatan script
write.csv(data, "03_Data/bmi_fasting_glucose_synthetic_data.csv", row.names = FALSE)
cat("\nDataset juga disimpan ulang sebagai: 03_Data/bmi_fasting_glucose_synthetic_data.csv\n")
cat("Grafik disimpan di folder: 04_Output\n")
cat("\nScript selesai dijalankan.\n")

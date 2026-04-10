# BMI (Bitiruv Malakaviy Ishi) Generator Skill

## Vazifa

Foydalanuvchi mavzu berganda, Farg'ona Davlat Universiteti standartiga va metodik qo'llanma talablariga mos **to'liq BMI hujjatini** `.docx` formatda generatsiya qil.

---

## Ish tartibi

### 1-qadam: Mavzuni tahlil qilish

Foydalanuvchi mavzuni berganda:
- Mavzuning sohasini aniqlash (IT, pedagogika, iqtisod, matematika va h.k.)
- Loyiha kodi bor bo'lsa — papkalarni o'qib, texnologiyalarni aniqlash
- Agar kod bo'lmasa — mavzu bo'yicha nazariy va amaliy bo'limlar rejasini tuzish

### 2-qadam: Diagrammalar generatsiya qilish (matplotlib)

`bmi_build/diagrams/` papkasiga kamida **10-15 ta** professional diagramma yaratish:

**I Bob uchun (nazariy):**
- Asosiy tushunchalar sxemasi (model, tsikl, ierarxiya)
- Mavjud yechimlar qiyosiy tahlili (bar/grouped bar chart)
- Texnologiyalar arxitekturasi (qatlamli box diagramma)
- Algoritmlar/metodlar klassifikatsiyasi (daraxtsimon diagramma)

**II Bob uchun (amaliy):**
- Tizim arxitekturasi (3-tier yoki microservice diagramma)
- Ma'lumotlar bazasi ER diagrammasi
- API/modul tuzilmasi (ierarxik diagramma)
- Oqim diagrammasi (flowchart)

**III Bob uchun (sinash va natijalar):**
- Test natijalari (bar chart)
- Foydalanuvchi baholash (grouped bar chart)
- AI modullar samaradorligi (radar/spider chart)

**Qiyosiy jadval diagrammasi (III bob uchun):**
- Odatlan vs raqobatchilar (12 mezon bo'yicha)
- Yashil/qizil doiralar bilan Ha/Yo'q ko'rsatish
- Umumiy ball: Odatlan 9/12, Habitica 3/12, Streaks 2/12

**Diagramma uslubi:**
```python
# Ranglar palitrasi
C_PRIMARY = '#4A6CF7'    # Asosiy ko'k
C_SECONDARY = '#7B61FF'  # Binafsha
C_ACCENT = '#34C759'     # Yashil
C_WARN = '#FF9500'       # Sariq
C_DANGER = '#FF3B30'     # Qizil
C_DARK = '#1E293B'       # Qorong'u
C_LIGHT = '#F1F5F9'      # Och fon
C_BLUE_LIGHT = '#DBEAFE'
C_PURPLE_LIGHT = '#EDE9FE'
C_GREEN_LIGHT = '#DCFCE7'

# Stil
plt.rcParams['font.family'] = 'DejaVu Sans'
plt.rcParams['font.size'] = 11
plt.rcParams['axes.facecolor'] = '#FAFBFF'
plt.rcParams['figure.facecolor'] = 'white'

# FancyBboxPatch bilan professional box'lar
# Rasmlar 200 DPI, bbox_inches='tight'
```

**Diagramma sifat qoidalari (MUHIM):**
- Strelkalar boxlar orasida ko'rinadigan bo'lishi kerak — boxlar bilan bir xil rangda bo'lmasin
- Strelka qalinligi kamida lw=2.5, muhim oqimlarda lw=3
- Boxlar orasida yetarli bo'sh joy qoldirish (kamida 0.3 birlik gap) — strelkalar ko'rinsin
- ER diagrammada: faqat to'g'ri (gorizontal/vertikal) chiziqlar ishlatish, egri chiziqlar chalkashtirib yuboradi
- ER munosabat belgilari (1:1, 1:N) strelka USTIDA joylashsin, oq fon bilan
- API tuzilmasida: barcha endpointlar rasm chegarasidan CHIQMASIN — figsize ni kengaytirish yoki shrift kichraytirish
- Navigatsiya diagrammasida: Splash dan ikki yo'nalishga tarmoqlanish (Token bor → ShellRoute, Token yo'q → Login), shartli belgilar yozish
- AI arxitekturasida: kirish ma'lumotlaridan vertikal magistral chiziq, undan har modulga alohida gorizontal strelka, har bir modul rangli
- Matn o'qilishi uchun: fontsize kamida 8pt, muhim sarlavhalar 11-12pt
- Har bir diagramma sarlavhasida rasm raqami bo'lsin: "X.Y-rasm. Tavsif"

### 3-qadam: Matnni bo'lib-bo'lib .md fayllar qilib yozish

BMI matnini bo'limlarga ajratib, `bmi_parts/` papkasiga alohida `.md` fayllar sifatida yozish:
- `02_kirish.md` — KIRISH (Prezident iqtibosi + 10 ta majburiy element)
- `03_bob1.md` — I BOB (4 ta bo'lim)
- `04_bob2.md` — II BOB (4-5 ta bo'lim)
- `05_bob3.md` — III BOB (3 ta bo'lim)
- `06_xulosa.md` — XULOSA VA TAVSIYALAR
- `07_adabiyotlar.md` — FOYDALANILGAN ADABIYOTLAR (6 kategoriya)
- `08_glossariy.md` — TAYANCH SO'ZLAR (35 ta, 3 tilda)

**MUHIM:** Qo'shimcha matnlar alohida faylga yozilmasin — har bir bo'limning o'z `.md` fayliga to'g'ridan-to'g'ri yozilsin. Matn oxiriga qo'shish EMAS, tegishli bo'lim ichiga qo'yilsin.

### 4-qadam: Python bilan .docx ga yig'ish

Bitta `build_bmi.py` skript yozish. Quyidagi format qat'iy saqlanishi shart:

---

## Hujjat formati (Metodik qo'llanma standarti)

### Sahifa sozlamalari
| Parametr | Qiymat |
|----------|--------|
| Sahifa | A4 (21cm x 29.7cm) |
| Chap chekka | **3 cm (30 mm)** |
| O'ng chekka | **1.5 cm (15 mm)** |
| Yuqori chekka | **2.5 cm (25 mm)** |
| Pastki chekka | **2.5 cm (25 mm)** |
| Shrift | Times New Roman |
| Shrift o'lchami | 14 pt |
| Qator oralig'i | 1.5 |
| Xat boshi | 1.25 cm |
| Bet raqami | **varaqning pastki o'rta qismida** |

### Formatlash qoidalari

| Element | Alignment | Bold | Italic | Size | Boshqa |
|---------|-----------|------|--------|------|--------|
| Titul sarlavhalar | CENTER | Yes | No | 14pt | — |
| "BITIRUV MALAKAVIY ISHI" | CENTER | Yes | No | **16-18pt** | — |
| Muallif ma'lumotlari | RIGHT | No | No | 14pt | line_spacing=1.5 |
| Bob sarlavhasi (I BOB, II BOB, III BOB) | CENTER | Yes | No | 14pt | space_before=14pt, space_after=8pt |
| Bo'lim sarlavhasi (1.1, 2.1, 3.1) | CENTER | Yes | No | 14pt | space_before=14pt, space_after=8pt |
| Kichik sarlavha | JUSTIFY | Yes+Italic | Yes | 14pt | space_before=8pt, indent=1.25cm |
| Asosiy matn | JUSTIFY | No | No | 14pt | indent=1.25cm, spacing=1.5 |
| Rasm tavsifi | CENTER | No | Yes | 12pt | space_before=4pt, space_after=8pt |
| Adabiyotlar | JUSTIFY | No | No | 14pt | snoska tartibida |

**Muhim:** Kirish, boblar, xulosa va foydalanilgan adabiyotlar ro'yxati, shuningdek ilovalar **yangi betdan** yoziladi. Har bir bobning nomi asosiy matndan qo'shimcha interval bilan ajralib turishi kerak.

---

## Hujjat tuzilmasi

### HAJM TALABLARI (Metodik qo'llanma bo'yicha)

| # | Bo'lim | Hajmi |
|---|--------|-------|
| 1 | Mundarija | 1 bet |
| 2 | Kirish | **5-8 bet** |
| 3 | Asosiy qism (3 ta bob) | **55-60 bet** |
| 4 | Xulosa va tavsiyalar | **2-3 bet** |
| 5 | Foydalanilgan adabiyotlar | **3-4 bet** |

**Umumiy hajm: 70-80 bet** (ilovalardan tashqari)
**Minimal so'z soni: 10,000-15,000 so'z**

### TITUL VARAG'I
```
O'ZBEKISTON RESPUBLIKASI OLIY TA'LIM, FAN VA INNOVATSIYALAR VAZIRLIGI

FARG'ONA DAVLAT UNIVERSITETI
{FAKULTET} FAKULTETI
{YO'NALISH} YO'NALISHI

BITIRUV MALAKAVIY ISHI  (16-18pt)

Mavzu:
"{MAVZU TO'LIQ NOMI}"

                                    Bajardi:  {ISM}
                                    Guruh:  {GURUH}
                                    Ilmiy rahbar:  {RAHBAR}

Farg'ona — 2026
```

### MUNDARIJA
Barcha bo'limlar sahifa raqamlari bilan. Asosiy bo'limlar bold.

### KIRISH (5-8 sahifa)

**MUHIM: KIRISH Prezident gapi/iqtibosi bilan boshlanishi kerak!**

O'zbekiston Respublikasi Prezidenti Shavkat Mirziyoevning mavzuga mos iqtibosini keltirish (ta'lim, texnologiya, innovatsiya haqida). Keyin mavzuning dolzarbligi bilan davom etish.

Quyidagi elementlar **MAJBURIY** (metodik qo'llanma talabi):

1. **Mavzuning dolzarbligi** — 3-4 paragraf:
   - Prezident iqtibosi bilan boshlash
   - Global kontekst, statistika, WHO/UNESCO/davlat hujjatlari
   - O'zbekiston konteksti, PF farmonlari (PF-6079, PF-5853 va h.k.)
   - Mavjud muammolar va yechim zarurligi

2. **Mavzuning o'rganilish darajasi** — 2-3 paragraf:
   - Mavzu bo'yicha oldingi tadqiqotlar va mualliflar
   - Qaysi jihatlar o'rganilgan, qaysilari yetarli o'rganilmagan
   - Ilmiy bo'shliqni ko'rsatish

3. **Tadqiqotning maqsadi** — 1 paragraf

4. **Tadqiqotning vazifalari** — 7-9 ta vazifa, raqamlangan

5. **Tadqiqot ob'ekti** — 1 paragraf

6. **Tadqiqot predmeti** — 1 paragraf

7. **Nazariy va metodologik asoslari** — 1-2 paragraf:
   - Nazariy asos: qaysi nazariyalar, modellar
   - Metodologik asos: qanday usullar qo'llanilgan
   - Dasturiy ta'minot ishlab chiqish metodologiyasi

8. **Ishning ilmiy yangiligi** — 3-4 ta punkt (raqamlangan)

9. **Ishning amaliy ahamiyati** — 1-2 paragraf

10. **BMI tuzilmasi** — 1-2 paragraf (kirish, 3 bob, xulosa, adabiyotlar, ilovalar tavsifi)

### I BOB — NAZARIY ASOSLAR (18-22 sahifa)

4 ta bo'lim (1.1, 1.2, 1.3, 1.4):

**1.1** — Asosiy tushunchalar va nazariy asos
- Mavzu bo'yicha fundamental tushunchalar, ta'riflar
- Nazariya va modellar (muallif ismi, yili bilan)
- Ilmiy manbalar va tadqiqotlarga havolalar [1], [2], [3]
- Neyrobiologik, psixologik va ijtimoiy jihatlar
- **Diagram:** asosiy kontseptsiya vizualizatsiyasi

**1.2** — Mavjud yechimlarning qiyosiy tahlili
- 3-5 ta mavjud yechim/platforma/tizim tahlili
- Har biri uchun: tavsif, afzalliklar, kamchiliklar
- Bozor tahlili va statistika
- Qiyosiy jadval yoki grafik
- **Diagram:** qiyosiy tahlil grafigi

**1.3** — Texnologiyalar va vositalar
- Ishlatiladigan texnologiyalar nazariy asosi
- Framework, til, DB, server texnologiyalari
- Raqobatchi texnologiyalar bilan solishtirish
- Arxitektura yondashuvlari
- **Diagram:** texnologiya steki

**1.4** — Maxsus algoritm/metod/nazariya
- Mavzuga xos algoritmlar yoki metodologiyalar
- Matematik/statistik asoslar va formulalar
- Kam resurslarga ega tillar uchun NLP (zarur bo'lsa)
- **Diagram:** algoritm klassifikatsiyasi

**I bob xulosasi** — 1-2 paragraf

### II BOB — LOYIHALASH VA AMALGA OSHIRISH (20-25 sahifa)

4-5 ta bo'lim (2.1, 2.2, 2.3, 2.4):

**2.1** — Arxitektura va loyihalash
- Funksional talablar (MoSCoW)
- Nofunksional talablar
- Foydalanuvchi rollari
- Tizim arxitekturasi (3-tier/microservice)
- Ma'lumotlar bazasi loyihasi (normalizatsiya, indekslar)
- **Diagramlar:** arxitektura, ER diagramma

**2.2** — Backend/server qism
- Texnologiyalar va kutubxonalar ro'yxati
- Autentifikatsiya/xavfsizlik (JWT, bcrypt)
- API endpointlar va REST printsiplari
- Middleware va xato ishlov berish
- Pydantic validatsiya tafsilotlari
- **Diagramlar:** API tuzilmasi
- **Skrinshot:** Swagger UI

**2.3** — Frontend/ilova qism
- Arxitektura va state management
- Navigatsiya tizimi
- UI/UX dizayn qarorlari va psixologik asoslari
- Asosiy ekranlar tavsifi (har biri 1 paragraf)
- Ranglar palitrasi va WCAG muvofiqlik
- **Diagramlar:** navigatsiya tuzilmasi
- **Skrinshot'lar:** 6-8 ta asosiy ekran (yonma-yon juftlashtirilgan)

**2.4** — Maxsus modul (AI, algoritm, hisoblash)
- Modul arxitekturasi va orkestrator
- Har bir komponent tavsifi va matematik formulalari
- Algoritm parametrlari va ularning asoslari
- Xato tolerantligi va graceful degradation
- **Diagramlar:** modul arxitekturasi, algoritmlar vizualizatsiyasi

**II bob xulosasi** — 2-3 paragraf

### III BOB — SINASH, NATIJALAR VA TAVSIYALAR (15-18 sahifa)

3 ta bo'lim (3.1, 3.2, 3.3):

**3.1** — Tizimni sinash metodologiyasi va natijalari
- Testlash metodologiyasi (3 darajali: unit, funksional, UX)
- Backend testlash (pytest — test sonlari, qamrov)
- Ishlash samaradorligi ko'rsatkichlari (ms, FPS, MB)
- Foydalanuvchi tajribasi testi (10+ kishi, 5 ballik shkala, 4+ mezon)
- Xavfsizlik auditi (OWASP Top 10)
- **Diagram:** test natijalari, foydalanuvchi baholash

**3.2** — Natijalar tahlili va muhokama
- AI modullarining samaradorlik tahlili
- Mavjud yechimlar bilan qiyosiy solishtirish jadvali
- Tizimning afzalliklari va cheklovlari
- Ilmiy hissa va amaliy qiymat muhokamasi

**3.3** — Tizimni rivojlantirish bo'yicha tavsiyalar
- Qisqa muddatli tavsiyalar (3-4 ta)
- O'rta muddatli tavsiyalar (3-4 ta)
- Uzoq muddatli tavsiyalar (3-4 ta)
- Deploy va operatsion tavsiyalar

**III bob xulosasi** — 1-2 paragraf

### XULOSA VA TAVSIYALAR (2-3 sahifa)
- 5 ta asosiy xulosa (raqamlangan, har biri 1 paragraf)
- Tavsiyalar bo'limi: kelajakdagi rivojlanish yo'nalishlari (5-7 ta punkt)

### FOYDALANILGAN ADABIYOTLAR RO'YXATI (25-30 ta manba, 6 kategoriya)

Metodik qo'llanma bo'yicha **6 ta kategoriya** tartibida:

**I. Meyoriy-huquqiy hujjatlar** (2-3 ta)
- PF farmonlari, Qonunlar
- Format: Muallif. Nomi. — T.: Nashriyot, Yil.

**II. Rahbariy adabiyotlar** (1-2 ta)
- Prezident asarlari, nutqlari

**III. Ilmiy adabiyotlar va monografiyalar** (5-8 ta)
- Kitoblar (klassik va zamonaviy)
- Format: Muallif. Nomi // Nashriyot. — Yil. — Bet.

**IV. Jurnal va ilmiy maqolalar** (3-5 ta)
- Ilmiy jurnaldagi maqolalar
- Format: Muallif. Nomi // Jurnal nomi. — Yil. — Vol. — P.

**V. O'quv qo'llanmalar va texnik hujjatlar** (6-10 ta)
- Rasmiy texnik hujjatlar (framework, kutubxona)

**VI. Internet saytlari** (5-8 ta)
- Rasmiy veb-saytlar

Snoska tartibida beriladi. Ishga kiritilmagan manbalar ro'yxatga kiritilmaydi.

### FOOTNOTELAR (SNOSKALAR)

Matn ichida muhim iqtiboslar, statistik ma'lumotlar va ilmiy havolalar uchun **footnote** qo'yilishi shart. Footnote sahifa pastida 10pt shriftda ko'rinadi.

**Qayerlarga footnote qo'yish kerak:**
- Prezident iqtiboslari → manba ko'rsatilsin
- Statistik ma'lumotlar (WHO, Duke University, Grand View Research) → manba
- Ilmiy nazariyalar birinchi marta tilga olinganda → muallif va asarning to'liq bibliografik ma'lumoti
- PF farmonlari va qonunlar → to'liq raqam va sana
- Texnologiya benchmark ma'lumotlari → manba

**Footnote formati:** Times New Roman, 10pt, sahifa pastida avtomatik raqamlash

**python-docx da qo'shish:** `add_footnotes.py` skripti orqali — oxml yordamida Word footnotes part ga yoziladi. Paragraf matnida marker so'z topiladi va unga footnote reference biriktiriladi.

### ILOVALAR

**Majburiy ilovalar:**

**Ilova A.** Mavzuga oid tayanch so'zlar (GLOSSARIY)
- **30-35 ta so'z** (metodik qo'llanma talabi)
- **3 tilda**: O'zbekcha, Ruscha, Inglizcha
- Jadval shaklida

**Ilova B.** Texnik spetsifikatsiya (API endpointlar, komponentlar jadvali)

**Ilova C.** Ma'lumotlar modeli jadvali (DB schema)

**Ilova D.** Loyiha fayl tuzilmasi (Courier New, 9-10pt)

**Ilova E.** Algoritm/modul parametrlari jadvali

**Ilova rasmiylash qoidalari:**
- Ilovalar adabiyotlar ro'yxatidan so'ng yangi betdan yoziladi
- Har bir ilova yangi varaqdan boshlanadi
- O'ng yuqori burchakda "ilova" so'zi + arab raqami (1-ilova, 2-ilova)

---

## Yozish uslubi

### Paragraf qoidalari
- Har bir paragraf kamida **3-5 jumla**, 50-80 so'z
- Hech qachon 1-2 jumlalik qisqa paragraf yozma
- Har bir bo'limda kamida **4-6 yaxlit paragraf**
- Jumlalar ilmiy-akademik uslubda, aniq va ravon
- **YAXLIT PARAGRAF uslubida yoz** — list, ro'yxat, bullet-point ISHLATMA (faqat vazifalar va xulosalar raqamlangan bo'lishi mumkin)

### Matn miqdori (yangilangan — metodik qo'llanma bo'yicha)
- KIRISH: ~2500-3000 so'z
- I BOB: ~4000-5000 so'z
- II BOB: ~4000-5000 so'z
- III BOB: ~3000-4000 so'z
- XULOSA: ~1000-1200 so'z
- JAMI: **kamida 15,000 so'z** (ilovalardan tashqari)

### Ilmiy uslub qoidalari
- **Prezident iqtibosi bilan KIRISH boshlash** (ta'lim/texnologiya haqida)
- Muallif ismi va yili doim ko'rsatilsin: "Jeyms Klir (James Clear, 2018)"
- Statistika va raqamlar bilan asoslash
- "birinchidan, ikkinchidan, uchinchidan" bilan fikrlarni bog'lash
- O'zbek tilidagi terminologiya + qavs ichida inglizcha: "sun'iy intellekt (Artificial Intelligence, AI)"
- Passiv fe'l ishlatish: "ishlab chiqildi", "amalga oshirildi", "tahlil qilindi"
- Adabiyotlarga havola: matn ichida [1], [2], [3] ko'rinishida

---

## Python helper funksiyalar

```python
from docx import Document
from docx.shared import Pt, Cm, Inches
from docx.enum.text import WD_ALIGN_PARAGRAPH
from docx.oxml.ns import qn

doc = Document()

# Sahifa setup (metodik qo'llanma standarti)
for sec in doc.sections:
    sec.top_margin = Cm(2.5)      # 25mm
    sec.bottom_margin = Cm(2.5)   # 25mm
    sec.left_margin = Cm(3)       # 30mm
    sec.right_margin = Cm(1.5)    # 15mm

def R(para, text, bold=False, italic=False, size=14):
    """Run qo'shish."""
    run = para.add_run(text)
    run.font.name = 'Times New Roman'
    run.font.size = Pt(size)
    run.bold = bold
    run.italic = italic
    run._element.rPr.rFonts.set(qn('w:eastAsia'), 'Times New Roman')
    return run

def empty(n=1):
    """Bo'sh qator."""
    for _ in range(n):
        p = doc.add_paragraph(); R(p, "")

def center_bold(text, size=14):
    """Markazlashtirilgan qalin sarlavha."""
    p = doc.add_paragraph()
    p.alignment = WD_ALIGN_PARAGRAPH.CENTER
    p.paragraph_format.space_after = Pt(0)
    R(p, text, bold=True, size=size)

def right_text(text):
    """O'ngga tekislangan matn."""
    p = doc.add_paragraph()
    p.alignment = WD_ALIGN_PARAGRAPH.RIGHT
    p.paragraph_format.line_spacing = 1.5
    R(p, text)

def body(text, indent=True):
    """Asosiy matn paragrafi."""
    p = doc.add_paragraph()
    p.alignment = WD_ALIGN_PARAGRAPH.JUSTIFY
    p.paragraph_format.line_spacing = 1.5
    p.paragraph_format.space_after = Pt(0)
    p.paragraph_format.space_before = Pt(0)
    if indent:
        p.paragraph_format.first_line_indent = Cm(1.25)
    R(p, text)

def body_bold_start(bold_text, rest_text):
    """Qalin kalit so'z bilan boshlanadigan paragraf (masalan: 'Mavzuning dolzarbligi. ...')."""
    p = doc.add_paragraph()
    p.alignment = WD_ALIGN_PARAGRAPH.JUSTIFY
    p.paragraph_format.line_spacing = 1.5
    p.paragraph_format.space_after = Pt(0)
    p.paragraph_format.first_line_indent = Cm(1.25)
    R(p, bold_text, bold=True)
    R(p, " " + rest_text)

def sub_heading(text):
    """Kichik sarlavha (bold+italic)."""
    p = doc.add_paragraph()
    p.alignment = WD_ALIGN_PARAGRAPH.JUSTIFY
    p.paragraph_format.line_spacing = 1.5
    p.paragraph_format.space_before = Pt(8)
    p.paragraph_format.space_after = Pt(4)
    p.paragraph_format.first_line_indent = Cm(1.25)
    R(p, text, bold=True, italic=True)

def section_head(text):
    """Bo'lim sarlavhasi (1.1, 2.1, 3.1 kabi)."""
    p = doc.add_paragraph()
    p.alignment = WD_ALIGN_PARAGRAPH.CENTER
    p.paragraph_format.line_spacing = 1.5
    p.paragraph_format.space_before = Pt(14)
    p.paragraph_format.space_after = Pt(8)
    R(p, text, bold=True)

def chapter_head(text):
    """Bob sarlavhasi (I BOB, II BOB, III BOB)."""
    p = doc.add_paragraph()
    p.alignment = WD_ALIGN_PARAGRAPH.CENTER
    p.paragraph_format.line_spacing = 1.5
    p.paragraph_format.space_before = Pt(14)
    p.paragraph_format.space_after = Pt(8)
    R(p, text, bold=True)

def fig_caption(text):
    """Rasm tavsifi."""
    p = doc.add_paragraph()
    p.alignment = WD_ALIGN_PARAGRAPH.CENTER
    p.paragraph_format.space_before = Pt(4)
    p.paragraph_format.space_after = Pt(8)
    R(p, text, italic=True, size=12)

def add_image(path, width=5.5):
    """Rasm qo'shish."""
    if os.path.exists(path):
        p = doc.add_paragraph()
        p.alignment = WD_ALIGN_PARAGRAPH.CENTER
        p.add_run().add_picture(path, width=Inches(width))

def ref(text):
    """Adabiyot yozuvi."""
    p = doc.add_paragraph()
    p.alignment = WD_ALIGN_PARAGRAPH.JUSTIFY
    p.paragraph_format.line_spacing = 1.5
    p.paragraph_format.space_after = Pt(2)
    p.paragraph_format.first_line_indent = Cm(0)
    R(p, text)

def add_footnote(paragraph, footnote_text):
    """Paragrafga footnote (snoska) qo'shish.
    Matn oxirida [1] raqami chiqadi, sahifa pastida izoh yoziladi.
    """
    from docx.oxml import OxmlElement
    from docx.oxml.ns import qn as QN

    # Footnotes part yaratish (agar mavjud bo'lmasa)
    if not hasattr(doc, '_footnote_id'):
        doc._footnote_id = 0
        # footnotes.xml part ni yaratish
        footnotes_part = doc.part._package.part_related_by(
            'http://schemas.openxmlformats.org/officeDocument/2006/relationships/footnotes'
        ) if any(
            r.reltype == 'http://schemas.openxmlformats.org/officeDocument/2006/relationships/footnotes'
            for r in doc.part.rels.values()
        ) else None

    doc._footnote_id += 1
    fid = doc._footnote_id

    # Asosiy matnda footnote reference qo'shish
    run = paragraph.add_run()
    footnote_ref = OxmlElement('w:footnoteReference')
    footnote_ref.set(QN('w:id'), str(fid))
    run._element.append(footnote_ref)
    # Superscript stilida ko'rsatish
    rPr = run._element.get_or_add_rPr()
    vertAlign = OxmlElement('w:vertAlign')
    vertAlign.set(QN('w:val'), 'superscript')
    rPr.append(vertAlign)

    # Footnote kontentini yaratish
    footnotes_el = doc.element.body.getparent().find(
        QN('w:footnotes')
    )
    if footnotes_el is None:
        return  # fallback: footnotes part mavjud emas

    footnote = OxmlElement('w:footnote')
    footnote.set(QN('w:id'), str(fid))
    fp = OxmlElement('w:p')
    fpr = OxmlElement('w:pPr')
    fprstyle = OxmlElement('w:pStyle')
    fprstyle.set(QN('w:val'), 'FootnoteText')
    fpr.append(fprstyle)
    fp.append(fpr)

    # Footnote raqami
    fr_run = OxmlElement('w:r')
    fr_rpr = OxmlElement('w:rPr')
    fr_style = OxmlElement('w:rStyle')
    fr_style.set(QN('w:val'), 'FootnoteReference')
    fr_rpr.append(fr_style)
    fr_run.append(fr_rpr)
    fr_ref = OxmlElement('w:footnoteRef')
    fr_run.append(fr_ref)
    fp.append(fr_run)

    # Footnote matni
    ft_run = OxmlElement('w:r')
    ft_rpr = OxmlElement('w:rPr')
    ft_sz = OxmlElement('w:sz')
    ft_sz.set(QN('w:val'), '20')  # 10pt
    ft_rpr.append(ft_sz)
    ft_run.append(ft_rpr)
    ft_text = OxmlElement('w:t')
    ft_text.set(QN('xml:space'), 'preserve')
    ft_text.text = ' ' + footnote_text
    ft_run.append(ft_text)
    fp.append(ft_run)

    footnote.append(fp)
    footnotes_el.append(footnote)
    return fid

def add_two_images(path1, path2, width=2.3):
    """Ikki rasm yonma-yon (jadval orqali)."""
    tbl = doc.add_table(rows=1, cols=2)
    tbl.alignment = WD_ALIGN_PARAGRAPH.CENTER
    for ci, fp in enumerate([path1, path2]):
        cell = tbl.rows[0].cells[ci]
        p = cell.paragraphs[0]
        p.alignment = WD_ALIGN_PARAGRAPH.CENTER
        if os.path.exists(fp):
            p.add_run().add_picture(fp, width=Inches(width))

def add_glossary_table(terms):
    """Glossariy jadvali (30-35 ta so'z, 3 tilda).
    terms = [(no, uzbek, russian, english), ...]
    """
    from docx.enum.table import WD_TABLE_ALIGNMENT
    table = doc.add_table(rows=1, cols=4)
    table.style = 'Table Grid'
    table.alignment = WD_TABLE_ALIGNMENT.CENTER
    headers = ['T/r', "O'zbekcha", 'Ruscha', 'Inglizcha']
    for i, h in enumerate(headers):
        cell = table.rows[0].cells[i]
        cell.text = ''
        p = cell.paragraphs[0]
        p.alignment = WD_ALIGN_PARAGRAPH.CENTER
        R(p, h, bold=True, size=12)
    for t in terms:
        row = table.add_row().cells
        for i, val in enumerate(t):
            row[i].text = ''
            p = row[i].paragraphs[0]
            p.alignment = WD_ALIGN_PARAGRAPH.LEFT if i > 0 else WD_ALIGN_PARAGRAPH.CENTER
            R(p, str(val), size=12)
```

---

## Diagramma generatsiya qilish shabloni

```python
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from matplotlib.patches import FancyBboxPatch
import numpy as np

def draw_box(ax, x, y, w, h, text, color, text_color='white', fontsize=10):
    box = FancyBboxPatch((x-w/2, y-h/2), w, h,
        boxstyle="round,pad=0.15", facecolor=color, edgecolor='none', zorder=3)
    ax.add_patch(box)
    ax.text(x, y, text, ha='center', va='center',
        fontsize=fontsize, fontweight='bold', color=text_color, zorder=4)

def draw_arrow(ax, x1, y1, x2, y2, color='#1E293B'):
    ax.annotate('', xy=(x2,y2), xytext=(x1,y1),
        arrowprops=dict(arrowstyle='->', color=color, lw=2), zorder=2)

def save(fig, path):
    fig.savefig(path, dpi=200, bbox_inches='tight', pad_inches=0.3)
    plt.close(fig)
```

---

## Skrinshot olish (ixtiyoriy — loyiha kodi bo'lganda)

Agar loyihada web ilova yoki Flutter web bo'lsa:
1. `flutter build web --release`
2. `python -m http.server 8080` bilan serve qilish
3. Playwright + Chromium headless bilan mobil viewport (393x852, 2x scale) da skrinshot olish
4. API orqali login qilib, token'ni localStorage'ga inject qilish
5. Hash routing orqali sahifalarni navigatsiya qilish

---

## Baholash mezonlari (Metodik qo'llanma bo'yicha, 100 ball)

| # | Mezon | Maks. ball |
|---|-------|-----------|
| 1 | Mavzu dolzarbligining asoslanganligi | 10 |
| 2 | Mavzuning to'la yoritilganligi | 12 |
| 3 | Hajmi va matn talablariga mosligi | 8 |
| 4 | Tuzilishning to'g'ri tanlanganligi | 8 |
| 5 | Nazariy qism materiallarining yoritilishi | 12 |
| 6 | Amaliy qism materiallarining yoritilishi | 14 |
| 7 | Chizma va slaydlarning talablarga mosligi | 10 |
| 8 | Adabiyotlar va internetdan foydalanganlik | 8 |
| 9 | Taqdimot sifati | 10 |
| 10 | Savollarga javob berish | 8 |
| **JAMI** | | **100** |

Saralash ball: **55**, A'lo: **86-100**, Yaxshi: **71-85**, Qoniqarli: **55-70**

---

## Rasm va screenshotlarni hujjatga qo'shish tartibi

### Diagrammalar joylashuvi
| Bo'limdan keyin | Diagramma | Tavsif |
|----------------|-----------|--------|
| 1.1 | `1_1_*.png` | Asosiy kontseptsiya (masalan, odat halqasi) |
| 1.2 | `1_2_*.png` | Qiyosiy tahlil grafigi |
| 1.3 | `1_3_*.png` | Texnologiya arxitekturasi |
| 1.4 | `1_4_*.png` | Algoritm klassifikatsiyasi |
| 2.1 | `2_1_*.png`, `2_2_*.png` | Tizim arxitekturasi + ER diagramma |
| 2.2 | `2_3_*.png` | API tuzilmasi + Swagger skrinshot |
| 2.3 | Screenshotlar (juftlab) + `2_4_*.png` | Mobil ekranlar + navigatsiya |
| 2.4 | `2_5_*.png` — `2_11_*.png` | AI modullar diagrammalari |
| 3.1 | `3_1_*.png`, `3_2_*.png` | Test coverage + performance |
| 3.2 | `3_3_*.png`, `3_4_*.png` | UX baholash + qiyosiy jadval |

### Screenshotlar joylashuvi (2.3 bo'limda)
Juftlab, jadval orqali yonma-yon (width=2.3 inch):
1. Splash + Login → "2.13-rasm. Splash screen va Login ekrani"
2. Register + Login (to'ldirilgan) → "2.14-rasm. Ro'yxatdan o'tish"
3. Dashboard + Analytics (haftalik) → "2.15-rasm. Dashboard va statistika"
4. Analytics (oylik) + AI ekran → "2.16-rasm. Oylik statistika va AI"
5. Check-in + Yangi odat → "2.17-rasm. Check-in va odat yaratish"
6. Odat tafsiloti + Profil → "2.18-rasm. Tafsilot va profil"
7. Swagger UI (to'liq kenglik) → "2.12-rasm. FastAPI Swagger UI"

### Rasm tavsifi formati
```python
fig_caption("X.Y-rasm. Tavsif matni")  # 12pt, italic, center
```

---

## Foydalanish

Foydalanuvchi: "BMI yozib ber, mavzu: {MAVZU}"

Javob:
1. Mavzuni tahlil qil
2. Agar loyiha kodi bo'lsa — o'qi va texnologiyalarni aniqa
3. Matnni bo'lib-bo'lib `bmi_parts/*.md` fayllariga yoz (har bo'lim alohida fayl)
4. `bmi_build/generate_diagrams.py` — diagrammalar yaratish (kamida 15-19 ta)
5. Agar loyiha kodi bo'lsa va web build mumkin bo'lsa — skrinshot ol
6. `bmi_parts/build_bmi.py` — barcha .md + diagrammalar + screenshotlarni bitta .docx ga yig'ish
7. So'z sonini tekshirish (kamida 15,000)
8. Natija: `{LOYIHA_NOMI}_BMI.docx`

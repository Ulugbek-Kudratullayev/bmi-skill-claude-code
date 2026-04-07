# BMI (Bitiruv Malakaviy Ishi) Generator Skill

## Vazifa

Foydalanuvchi mavzu berganda, Farg'ona Davlat Universiteti standartiga mos **to'liq BMI hujjatini** `.docx` formatda generatsiya qil.

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
- Test natijalari (bar chart + foydalanuvchi baholash)
- Boshqa kerakli diagrammalar

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

### 3-qadam: Hujjat generatsiya qilish (python-docx)

Bitta `build_bmi.py` skript yozish. Quyidagi format qat'iy saqlanishi shart:

---

## Hujjat formati (Farg'ona Davlat Universiteti standarti)

### Sahifa sozlamalari
| Parametr | Qiymat |
|----------|--------|
| Sahifa | A4 (21cm x 29.7cm) |
| Chap chekka | 3 cm |
| O'ng chekka | 1.5 cm |
| Yuqori chekka | 2 cm |
| Pastki chekka | 2 cm |
| Shrift | Times New Roman |
| Shrift o'lchami | 14 pt |
| Qator oralig'i | 1.5 |
| Xat boshi | 0.49 inch (1.25 cm) |

### Formatlash qoidalari

| Element | Alignment | Bold | Italic | Size | Boshqa |
|---------|-----------|------|--------|------|--------|
| Titul sarlavhalar | CENTER | Yes | No | 14pt | — |
| "BITIRUV MALAKAVIY ISHI" | CENTER | Yes | No | **18pt** | — |
| Muallif ma'lumotlari | RIGHT | No | No | 14pt | line_spacing=1.5 |
| Bob sarlavhasi (I BOB, II BOB) | CENTER | Yes | No | 14pt | space_before=14pt, space_after=8pt |
| Bo'lim sarlavhasi (1.1, 2.1) | CENTER | Yes | No | 14pt | space_before=14pt, space_after=8pt |
| Kichik sarlavha | JUSTIFY | Yes+Italic | Yes | 14pt | space_before=8pt, indent=0.49in |
| Asosiy matn | JUSTIFY | No | No | 14pt | indent=0.49in, spacing=1.5 |
| Rasm tavsifi | CENTER | No | Yes | 12pt | space_before=4pt, space_after=8pt |
| Adabiyotlar | JUSTIFY | No | No | 14pt | hanging indent -0.59in |

---

## Hujjat tuzilmasi

### TITUL VARAG'I
```
O'ZBEKISTON RESPUBLIKASI OLIY TA'LIM, FAN VA INNOVATSIYALAR VAZIRLIGI

FARG'ONA DAVLAT UNIVERSITETI
{FAKULTET} FAKULTETI
{YO'NALISH} YO'NALISHI

BITIRUV MALAKAVIY ISHI  (18pt)

Mavzu:
"{MAVZU TO'LIQ NOMI}"

                                    Bajardi:  {ISM}
                                    Guruh:  {GURUH}
                                    Ilmiy rahbar:  {RAHBAR}

Farg'ona — 2026
```

### MUNDARIJA
Barcha bo'limlar sahifa raqamlari bilan. Asosiy bo'limlar bold.

### KIRISH (5-7 sahifa)
Quyidagi kichik bo'limlar majburiy:

1. **Mavzuning dolzarbligi** — 3-4 paragraf:
   - Global kontekst, statistika, WHO/UNESCO/davlat hujjatlari
   - O'zbekiston konteksti, PF farmonlari
   - Mavjud muammolar va yechim zarurligi
   - Mavzuning ilmiy va amaliy ahamiyati

2. **Muammoning qo'yilishi** — 2-3 paragraf:
   - 3-5 ta aniq muammo, raqamlangan

3. **Tadqiqotning maqsadi** — 1 paragraf

4. **Tadqiqotning vazifalari** — 7-9 ta vazifa, raqamlangan

5. **Tadqiqot obyekti** — 1 paragraf

6. **Tadqiqot predmeti** — 1 paragraf

7. **Ishning ilmiy yangiligi** — 3-4 ta punkt

8. **Ishning amaliy ahamiyati** — 1-2 paragraf, 3-4 ta punkt

9. **BMI tuzilmasi** — 1-2 paragraf (kirish, 2 bob, xulosa, adabiyotlar, ilovalar tavsifi)

### I BOB — NAZARIY ASOSLAR (15-20 sahifa)

4 ta bo'lim (1.1, 1.2, 1.3, 1.4):

**1.1** — Asosiy tushunchalar va nazariy asos
- Mavzu bo'yicha fundamental tushunchalar, ta'riflar
- Nazariya va modellar (muallif ismi, yili bilan)
- Ilmiy manbalar va tadqiqotlarga havolalar
- **Diagram:** asosiy kontseptsiya vizualizatsiyasi

**1.2** — Mavjud yechimlarning qiyosiy tahlili
- 3-4 ta mavjud yechim/platforma/tizim tahlili
- Har biri uchun: tavsif, afzalliklar, kamchiliklar
- Qiyosiy jadval yoki grafik
- **Diagram:** qiyosiy tahlil grafigi

**1.3** — Texnologiyalar va vositalar
- Ishlatiladigan texnologiyalar nazariy asosi
- Framework, til, DB, server texnologiyalari
- Arxitektura yondashuvlari
- **Diagram:** texnologiya steki

**1.4** — Maxsus algoritm/metod/nazariya
- Mavzuga xos algoritmlar yoki metodologiyalar
- Matematik/statistik asoslar
- **Diagram:** algoritm klassifikatsiyasi

**I bob xulosasi** — 1-2 paragraf

### II BOB — LOYIHALASH VA AMALGA OSHIRISH (25-30 sahifa)

5 ta bo'lim (2.1, 2.2, 2.3, 2.4, 2.5):

**2.1** — Arxitektura va loyihalash
- Funksional talablar (MoSCoW)
- Foydalanuvchi rollari
- Tizim arxitekturasi
- Ma'lumotlar bazasi loyihasi
- **Diagramlar:** arxitektura, ER diagramma

**2.2** — Backend/server qism
- Texnologiyalar va kutubxonalar
- Autentifikatsiya/xavfsizlik
- API endpointlar
- Middleware
- **Diagramlar:** API tuzilmasi
- **Skrinshot:** Swagger UI yoki admin panel

**2.3** — Frontend/ilova qism
- Arxitektura va state management
- Navigatsiya tizimi
- Asosiy ekranlar tavsifi (har biri 1 paragraf)
- UI dizayn tizimi
- **Diagramlar:** navigatsiya tuzilmasi
- **Skrinshot'lar:** 6-8 ta asosiy ekran (yonma-yon juftlashtirilgan)

**2.4** — Maxsus modul (AI, algoritm, hisoblash)
- Modul arxitekturasi
- Har bir komponent tavsifi
- Formulalar va algoritmlar
- **Diagramlar:** modul arxitekturasi, algoritmlar vizualizatsiyasi

**2.5** — Sinash va baholash
- Testlash metodologiyasi
- Unit/funksional testlar
- Ishlash samaradorligi
- Foydalanuvchi tajribasi testi (10+ kishi, 5 ballik shkala)
- Xavfsizlik auditi (OWASP Top 10)
- **Diagram:** test natijalari

**II bob xulosasi** — 2-3 paragraf

### XULOSA (2-3 sahifa)
- 5 ta asosiy xulosa (raqamlangan, har biri 1 paragraf)
- Kelajakdagi rivojlanish yo'nalishlari (5 ta punkt)

### FOYDALANILGAN ADABIYOTLAR (20-26 ta)
- Kitoblar (5-8 ta) — klassik va zamonaviy
- Ilmiy maqolalar (3-5 ta)
- O'zbekiston hukumat hujjatlari (1-2 ta)
- Texnik hujjatlar/dokumentatsiyalar (8-12 ta)
- Hanging indent format: `left_indent=0.59in, first_line_indent=-0.59in`

### ILOVALAR (4 ta)
- Ilova A: Texnik spetsifikatsiya jadvali (API endpointlar, komponentlar)
- Ilova B: Ma'lumotlar modeli jadvali
- Ilova C: Loyiha fayl tuzilmasi (Courier New, 9-10pt)
- Ilova D: Algoritm/modul parametrlari jadvali

---

## Yozish uslubi

### Paragraf qoidalari
- Har bir paragraf kamida **3-5 jumla**, 50-80 so'z
- Hech qachon 1-2 jumlalik qisqa paragraf yozma
- Har bir bo'limda kamida **4-6 yaxlit paragraf**
- Jumlalar ilmiy-akademik uslubda, aniq va ravon

### Matn miqdori
- KIRISH: ~1500 so'z
- I BOB: ~3000 so'z
- II BOB: ~3500 so'z
- XULOSA: ~800 so'z
- JAMI: ~8000-10000 so'z (ilovalardan tashqari)

### Ilmiy uslub qoidalari
- Muallif ismi va yili doim ko'rsatilsin: "Jeyms Klir (James Clear, 2018)"
- Statistika va raqamlar bilan asoslash
- "birinchidan, ikkinchidan, uchinchidan" bilan fikrlarni bog'lash
- O'zbek tilidagi terminologiya + qavs ichida inglizcha: "sun'iy intellekt (Artificial Intelligence, AI)"
- Passiv fe'l ishlatish: "ishlab chiqildi", "amalga oshirildi", "tahlil qilindi"

---

## Python helper funksiyalar

```python
from docx import Document
from docx.shared import Pt, Cm, Inches
from docx.enum.text import WD_ALIGN_PARAGRAPH
from docx.oxml.ns import qn

doc = Document()

# Sahifa setup
for sec in doc.sections:
    sec.top_margin = Cm(2)
    sec.bottom_margin = Cm(2)
    sec.left_margin = Cm(3)
    sec.right_margin = Cm(1.5)

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
        p.paragraph_format.first_line_indent = Inches(0.49)
    R(p, text)

def sub_heading(text):
    """Kichik sarlavha (bold+italic)."""
    p = doc.add_paragraph()
    p.alignment = WD_ALIGN_PARAGRAPH.JUSTIFY
    p.paragraph_format.line_spacing = 1.5
    p.paragraph_format.space_before = Pt(8)
    p.paragraph_format.space_after = Pt(4)
    p.paragraph_format.first_line_indent = Inches(0.49)
    R(p, text, bold=True, italic=True)

def section_head(text):
    """Bo'lim sarlavhasi (1.1, 2.1 kabi)."""
    p = doc.add_paragraph()
    p.alignment = WD_ALIGN_PARAGRAPH.CENTER
    p.paragraph_format.line_spacing = 1.5
    p.paragraph_format.space_before = Pt(14)
    p.paragraph_format.space_after = Pt(8)
    R(p, text, bold=True)

def chapter_head(text):
    """Bob sarlavhasi (I BOB, II BOB)."""
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
    """Adabiyot yozuvi (hanging indent)."""
    p = doc.add_paragraph()
    p.alignment = WD_ALIGN_PARAGRAPH.JUSTIFY
    p.paragraph_format.line_spacing = 1.5
    p.paragraph_format.space_after = Pt(0)
    p.paragraph_format.first_line_indent = Inches(-0.59)
    p.paragraph_format.left_indent = Inches(0.59)
    R(p, text)

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

## Foydalanish

Foydalanuvchi: "BMI yozib ber, mavzu: {MAVZU}"

Javob:
1. Mavzuni tahlil qil
2. Agar loyiha kodi bo'lsa — o'qi va texnologiyalarni aniqa
3. `bmi_build/generate_diagrams.py` — diagrammalar yaratish
4. `bmi_build/build_bmi.py` — hujjat generatsiya
5. Agar loyiha kodi bo'lsa va web build mumkin bo'lsa — skrinshot ol
6. Natija: `{LOYIHA_NOMI}_BMI.docx`

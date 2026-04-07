# Foydalanish misollari

## 1. Oddiy mavzu bilan

```
/bmi Sun'iy intellekt asosida talabalar bilimini baholash tizimi
```

Natija: `Suniy_intellekt_BMI.docx` — to'liq nazariy BMI, diagrammalar bilan.

## 2. Loyiha kodi bilan

Agar `D:/Projects/my-flutter-app/` papkasida Flutter loyiha bo'lsa:

```
/bmi Flutter asosida mobil ilova yaratish
```

Claude Code loyiha kodini o'qiydi, texnologiyalarni aniqlaydi va BMI'ni real loyihaga moslab yozadi.
Skrinshot'larni ham olishi mumkin (Playwright orqali).

## 3. IT bo'lmagan mavzu

```
/bmi O'zbek tilida matn tahlili metodlari
```

Nazariy BMI generatsiya qilinadi — diagrammalar, jadvallar va ilmiy manbalar bilan.

## 4. Ma'lumot kiritish

Claude Code quyidagilarni so'rashi mumkin:
- **Fakultet nomi** — masalan: "Fizika-matematika"
- **Yo'nalish** — masalan: "Amaliy matematika va informatika"
- **Talaba ismi** — masalan: "Kudratullayev Ulugbek"
- **Guruh** — masalan: "AM-20"
- **Ilmiy rahbar** — masalan: "dots. Karimov A.B."

## 5. Generatsiya jarayoni

1. Mavzu tahlil qilinadi
2. `bmi_build/diagrams/` — 10-15 ta diagramma yaratiladi
3. `bmi_build/build_bmi.py` — hujjat generatsiya skripti yoziladi
4. Skript ishga tushiriladi
5. Natija: `{NOMI}_BMI.docx`

## Eslatma

- Python 3.8+ kerak
- `pip install python-docx matplotlib numpy` — majburiy
- Internet kerak emas (offline ishlaydi)
- Hujjat 40-60 sahifa, 8000-10000 so'z

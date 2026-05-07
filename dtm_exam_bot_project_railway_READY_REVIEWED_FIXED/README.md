# DTM / Imtihon Telegram Bot

Bu loyiha Telegram bot bo'lib, admin PDF test yuklaydi, javob kalitini kiritadi, bir martalik kodlar yaratadi va user shu kod orqali test faylini oladi. User testni ishlab bo'lgach javoblarini yuboradi, bot natijani hisoblaydi.

## Ushbu versiyada tuzatilgan joylar

- Admin paneldagi `➕ Test qo'shish` FSM jarayoni qayta mustahkamlandi: menu tugmalari test nomi/izoh/javob kaliti sifatida adashib saqlanmaydi.
- Test qo'shish jarayoniga `❌ Bekor qilish` va yakuniy `✅ Saqlash` tasdiqlash bosqichi qo'shildi.
- Davomiylik kiritishda noto'g'ri matn avtomatik 180 daqiqa bo'lib ketishi tuzatildi; endi faqat raqam yoki `-` qabul qilinadi.
- Javob kaliti parseri `A-E` variantlarini qo'llab-quvvatlaydi.
- Railway/redeploy paytida user ma'lumotlari o'chib ketmasligi uchun `DB_PATH=/app/data/data.sqlite3` ga moslandi.
- Railway deploy uchun `/app/data` ga Volume ulash ko'rsatmasi aniq qo'shildi.
- Test natijasida 35 ta savol bilan cheklanib qoladigan tahlil limiti olib tashlandi. Endi barcha savollar tekshiriladi va uzun natija Telegram limitiga sig'ishi uchun bo'lib yuboriladi.
- Admin panelga `✏️ Kodni edit qilish` bo'limi qo'shildi. Admin yaratilgan kodni tanlab, yangi kodga o'zgartira oladi.
- Qo'llanma bo'limiga `Kodlarni admin orqali oling.` matni qo'shildi.
- `railway.json` start command `/app/start.sh` ga moslandi.
- Keraksiz `__pycache__` fayllar deploy paketidan olib tashlandi.


## Ushbu tekshiruvda yana mustahkamlangan joylar

- Eski Railway Volume ichidagi SQLite baza yangi kodga moslashishi uchun xavfsiz migration tekshiruvlari qo'shildi. `CREATE TABLE IF NOT EXISTS` eski jadvalga yangi ustun qo'shmaydi; endi kerakli ustunlar alohida tekshiriladi va mavjud data saqlangan holda qo'shiladi.
- SQLite ulanishida `foreign_keys` va `busy_timeout` yoqildi; bu Railway restart/redeploy paytida bazaga yozish barqarorligini yaxshilaydi.
- Bir martalik tekin test uchun beriladigan `FREE-user-exam` kodi orqali natijani tekshirish ishlashi uchun alohida free-demo code lookup qo'shildi.

## Lokal ishga tushirish

Windows PowerShell uchun:

```powershell
py -3.11 -m venv .venv
.\.venv\Scripts\Activate.ps1
python -m pip install --upgrade pip
python -m pip install -r requirements.txt
copy .env.example .env
python app/main.py
```

`.env` ichida lokal ish uchun xohlasangiz `DB_PATH=./data/data.sqlite3` ishlatishingiz mumkin:

```env
BOT_TOKEN=BotFather_token
ADMIN_IDS=123456789
DB_PATH=./data/data.sqlite3
BOT_BRAND_NAME=Maktab imtihon bot
HELP_ADMIN_URL=https://t.me/admin_username
HELP_ADMIN_LABEL=Admin bilan bog'lanish
```

## Railway deploy

Railway Variables qismiga quyidagilarni kiriting:

```env
BOT_TOKEN=BotFather_token
ADMIN_IDS=admin_telegram_id
DB_PATH=/app/data/data.sqlite3
BOT_BRAND_NAME=Maktab imtihon bot
HELP_ADMIN_URL=https://t.me/admin_username
HELP_ADMIN_LABEL=Admin bilan bog'lanish
```

### Eng muhim qadam: Railway Volume

Userlar ro'yxatdan o'tib kiritgan ma'lumotlar o'chib ketmasligi uchun Railway service ichida Volume qo'shing:

1. Railway loyihangizga kiring.
2. Bot service'ni oching.
3. `Volumes` bo'limidan yangi Volume qo'shing.
4. Mount path sifatida aynan quyidagini yozing:

```text
/app/data
```

5. Variables ichida `DB_PATH=/app/data/data.sqlite3` ekanini tekshiring.
6. Redeploy qiling.

Shundan keyin `data.sqlite3` Volume ichida saqlanadi va kodni edit qilib qayta deploy qilsangiz ham userlar, kodlar, testlar va natijalar o'chmaydi.

## Admin panel

Admin paneldagi asosiy bo'limlar:

- `➕ Test qo'shish` — PDF test, javob kaliti, fan/kategoriya/sinf qo'shadi.
- `🗑 Testni o'chirish` — testni faol ro'yxatdan chiqaradi.
- `📋 Testlar ro'yxati` — faol testlarni ko'rsatadi.
- `🔐 Kod yaratish` — test uchun bitta yoki ko'p kod yaratadi.
- `✏️ Kodni edit qilish` — yaratilgan kodni yangi kodga almashtiradi.
- `📈 Statistika` — umumiy statistika.
- `📤 Userlar export` va `📥 Natijalar export` — XLSX/PDF export.

## Muhim eslatmalar

- Telefon raqam qo'lda yozilsa qabul qilinmaydi, faqat Telegram kontakt tugmasi orqali olinadi.
- Admin test PDF faylini botning o'ziga yuklashi kerak.
- Bir martalik kod bir marta ishlatiladi; ishlatilgan kod boshqa userga test bermaydi.
- Railway Volume ulanmasa, redeploy/restart paytida SQLite bazadagi ma'lumotlar yo'qolishi mumkin.

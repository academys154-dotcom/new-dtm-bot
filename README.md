# DTM / Imtihon Telegram Bot

Bu loyiha Telegram bot bo'lib, admin PDF test yuklaydi, javob kalitini kiritadi, bir martalik kodlar yaratadi va user shu kod orqali test faylini oladi. User testni ishlab bo'lgach javoblarini yuboradi, bot natijani hisoblaydi.

## Oxirgi tuzatishlar

- Bir martalik kod ishlatilganda PDF yuborilmaslik xatosi tuzatildi. Sabab: ishlatilgan kodni qayta o'qishda `pdf_file_id` olinmayotgan edi.
- Ro'yxatdan o'tishda sinf tanlash bosqichi olib tashlandi. Endi user faqat ism-familiya va Telegram kontakt orqali ro'yxatdan o'tadi.
- Admin test qo'shayotganda sinf, kategoriya, fan, Ha/Yo'q kabi tanlovlar raqamli ro'yxat ko'rinishida chiqadi.
- Admin va user menyularida raqam yuborish orqali tanlash imkoniyati qo'shildi.
- Railway uchun `Procfile`, `Dockerfile`, `railway.json`, `.env.example` tayyor holatda qoldirildi.

## Lokal ishga tushirish

```bash
python -m venv .venv
.venv\Scripts\activate
pip install -r requirements.txt
copy .env.example .env
python app/main.py
```

`.env` ichida quyidagilarni to'ldiring:

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
DB_PATH=./data/data.sqlite3
BOT_BRAND_NAME=Maktab imtihon bot
HELP_ADMIN_URL=https://t.me/admin_username
HELP_ADMIN_LABEL=Admin bilan bog'lanish
```

Railway loyiha worker sifatida `python app/main.py` bilan ishga tushadi.

## Muhim eslatmalar

- Telefon raqam qo'lda yozilsa qabul qilinmaydi, faqat Telegram kontakt tugmasi orqali olinadi.
- Admin test PDF faylini botning o'ziga yuklashi kerak.
- Bir martalik kod bir marta ishlatiladi; ishlatilgan kod boshqa userga test bermaydi.
- SQLite bazani doimiy saqlash uchun Railway volume ulash tavsiya qilinadi.

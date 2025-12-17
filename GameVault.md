# 🎮 GameVerse Database Project

Bu proje, dijital oyun dağıtım platformları (örneğin Steam veya Epic Games) benzeri bir sistem için tasarlanmış ilişkisel veritabanı yapısını içermektedir. GameVerse veritabanı, oyun geliştirici firmalar, oyunlar ve oyun türleri arasındaki ilişkileri yönetmek amacıyla geliştirilmiştir. Proje, SQL komutları aracılığıyla veritabanı tasarımı, veri ekleme, güncelleme, silme ve raporlama işlemlerini kapsamaktadır.

---

## 🗄️ Veritabanı Mimarisi

Veritabanı dört ana tablodan oluşmaktadır:

### 1️⃣ `developers` — Geliştirici Firmalar
- Oyun üreticilerini temsil eder.
- Bir firma birden fazla oyun geliştirebilir.
- **1 → N ilişki** barındırır.

### 2️⃣ `games` — Oyunlar
- Oyun adı, fiyat, çıkış tarihi ve puan gibi bilgileri içerir.
- Her oyun yalnızca bir geliştiriciye bağlıdır.

### 3️⃣ `genres` — Türler
- Oyun türleri (Action, RPG, Shooter vb.) tutulur.

### 4️⃣ `games_genres` — Ara Tablo
- Bir oyunun birden çok türe sahip olmasını sağlar.
- **N ↔ N ilişki** oyunlar ile türler arasında kurulur.

---

## 🔗 İlişki Yapıları

- **developers → games**
  - One-to-Many

- **games ↔ genres**
  - Many-to-Many (ara tablo aracılığıyla)

Bu sayede veri tekrarının önüne geçilmiş ve normalize bir yapı oluşturulmuştur.

---

## 🧪 Uygulanan SQL İşlemleri

### ✔️ DDL — CREATE
- Tüm tablolar PRIMARY KEY ve FOREIGN KEY kısıtlarıyla oluşturulmuştur.
- ON DELETE CASCADE kullanılarak veri bütünlüğü sağlanmıştır.

### ✔️ DML — INSERT
- 5 geliştirici firma
- 5 oyun türü
- 10 oyun
- oyun–tür eşleştirmeleri

sisteme eklenmiştir.

### ✔️ UPDATE İşlemleri
- Tüm oyunlara %10 indirim uygulanmıştır.
- Bir oyunun puanı güncellenmiştir.

### ✔️ DELETE İşlemleri
- Silme işleminde veri bütünlüğü korunmuş,
- önce ara tablodan kayıtlar temizlenmiş,
- ardından oyun tablosundan silme yapılmıştır.

### ✔️ SELECT & JOIN Sorguları
Raporlama amaçlı:

- oyun & geliştirici bilgileri
- RPG türündeki oyunlar
- belirli fiyat üzerindeki oyunlar
- isim arama

gibi sorgular yazılmıştır.

---

## 🛠️ Kullanılan Teknolojiler

- SQL (PostgreSQL uyumlu)
- DrawSQL (ER Diyagramı)

---

## 🎯 Projenin Kazanımları

Bu proje kapsamında:

- ilişkisel veritabanı tasarımı
- normalizasyon
- PK/FK kavramları
- SQL sorgularını uygulama
- Many-to-Many ilişkileri yönetme
- JOIN ile raporlama

alanlarında deneyim kazanılmıştır.

---


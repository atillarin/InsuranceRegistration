# Sağlık Sigortası Kayıt Ekranı

2 Ayrı Solution içermektedir. 

Kayıt uygulamasının önyüzü Bootstrap ve Webform ile 5 ayrı sayfada hazırlanmıştır.  
Sigorta Ettiren Girişi->  Sigortalı Aday Girişi -> Ürün Seçimi -> Prim Görüntüleme -> Ödeme Ekranı  
5 proje katmanı ; Dal,Bl,Dto,WebApi .net 5.0 - Webform  .net Framework 4.7.2  
Sayfalar arasında veri transferi için Session ve Viewler kullanıldı.  
Tüm bilgiler ödeme ekranından backend e gönderildi.  
Kayıt yönetimi ise iş katmanındaki RegisterManager sınıfı ile sağlandı.  
  
Veritabanı Ms SQL Express, diagram ve db script repo ya eklenmiştir.  
Insert işlemleri Prosedürler ile yapılmıştır.  
Projenin çalıştırılması için, veri erişim katmanında database sınıfı ve webform-web.config dosyalarında connection string düzenlenmelidir.
  
ORM araçları kullanılmadı.

Ekran görüntüleri aşağıdaki gibidir. 

![alt text](https://github.com/atillarin/InsuranceRegistration/blob/master/Animation.gif?raw=true)
![alt text](https://github.com/atillarin/InsuranceRegistration/blob/master/diagram.jfif?raw=true)

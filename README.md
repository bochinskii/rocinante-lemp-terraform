<h1>Проект "Rocinante LEMP"</h1><br>
<p>
С помощью GitHub Action - "lemp" и terraform устанавливается LEMP.
</p>
<p>
В директории "gpg" находится gpg публичный ключ. При помощи данного action'а из переменной
GPG_KEY создается gpg ключ для дешифрования данных. Шифрованные данные находятся в
диретории - "data". Там лежит dump базы данных сайта и сам сайт.
</p>
<p>
В диреткори "configs" находятся все необходимые конфигурационные файлы и TLS сертификат
сайта ("rocinante.crt"). С помощью данного action'а из переменной - ROCINANTE_KEY создается
TLS ключ сайта для HTTPS.
</p>
<p>
С помощью GitHub Action - "destroy" удаляется AWS инфраструктура.
</p>
<p>
Вот какие "секреты" тут есть:<br>
<br>
TERRAFORM_AWS_ACCESS_KEY_ID - ключ доступа к AWS;<br>
TERRAFORM_AWS_SECRET_ACCESS_KEY - секретный ключ доступа к AWS;<br>
<br>
SSH_KEY - SSH ключ для доступа к ec2 инстансу;<br>
SSH_PORT - кастомный SSH порт;<br>
<br>
ROCINANTE_KEY - ключ валидного сертификата;<br>
<br>
MYSQL_ROOT_PASS - root пароль для базы данных;<br>
<br>
MYSQL_ADMIN_USER - имя администратора mysql;<br>
MYSQL_ADMIN_USER_PASS - пароль администратора;<br>
<br>
MYSQL_DRUPAL_DB - база данных сайта;<br>
MYSQL_DRUPAL_USER - пользователь базы данных сайта;<br>
MYSQL_DRUPAL_USER_PASS - пароль пользователя базы данных сайта;<br>
<br>
SITE_DIR - префикс директории с сайтом;
</p>
<p>
GPG_KEY - ключи для дешифрования данных;
GPG_PASSWORD - пароль к ключу;
</p>
<p>
Status of our Actions:
</p>
<img src="https://github.com/bochinskii/rocinante-lemp-terraform/workflows/lemp/badge.svg?branch=main"><br>
<img src="https://github.com/bochinskii/rocinante-lemp-terraform/workflows/destroy/badge.svg?branch=main"><br>
<p>
Denis Bochinskii
</p>

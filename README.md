# APP demo de autenticacion con google

Esta App es un demo de una tienda con autenticación por devise


### El enlace para los usuarios 
[http://localhost:3000](http://localhost:3000)

### El enlace para los administradores
[http://localhost:3000/administradores](http://localhost:3000/administradores)

# Características

  - Autenticación con google 

También puede:
  - Autenticar/crear/entrar con el método de la gema devise
  - Crear/ver/guardar/imprimir documentos en PDF

### Instalación

```sh
$ bundle install
$ rails db:migrate
```

### Versiones de Ruby y Rails

```sh
$ ruby -v
```
ruby 2.6.6 [x86_64-linux]
```sh
$ rails -v
```
Rails 5.0.7.2

### Gemas destacadas

Gemas para convertir documentos html en pdf (wicked_pdf, wkhtmltopdf-binary), esto es especialmente útil para mandar documentos a los usuarios como informes/facturas/información en general y con los estilos que el portal quiere, este documento se puede ver/imprimir/descargar.

Esta gema recomienda (no es mandatorio) instalar un software para confirmar que se pueden generar los documentos pdf.

El enlace de la gema wkhtmltopdf-binary):
[https://github.com/zakird/wkhtmltopdf_binary_gem](https://github.com/zakird/wkhtmltopdf_binary_gem)

El enlace de los creadores de la gema en donde se encuentra el binario que recomiendan:
[https://wkhtmltopdf.org/downloads.html](https://wkhtmltopdf.org/downloads.html)


### Gemas con mención especial

| Gema | Característica |
| ------ | ------ |
| devise | Gestión de usuarios localmente |
| byebug | Depurador de Ruby por excelencia |
| pry-rails | Permite usar pry como consola |
| letter_opener | Para recibir correos localmente en desarrollo |
| omniauth-google-oauth2 | Autenticación con google |
| gem carrierwave | Sube archivos a una app de Ruby |
| gem mini_magick | Manipula imagenes con uso minimo de memoria |


**E N J O Y**
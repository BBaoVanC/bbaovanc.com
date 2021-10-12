---

title: Poner `(edited)` en medio de un mensaje de Discord
date: 2021-03-25T18:48:34-05:00
toc: false
comments: true

authors:
  - bbaovanc

tags:
  - tutorial
  - discord
  - discord-tricks

resources:
  - name: feature
    src: example.webp
    title: Imagen ejemplo

---

Usando (a bit of trickery) con el carácter [RLE -- right to left embedding],
puedes poner el texto `(edited)` dentro del mensaje.

<!--more-->

## Tutorial

1. Copie el carácter [RLE -- same as above] (U+202A) a tu portapapeles.
2. Edite el mensaje anterior
3. Elimina todo el texto
4. Pega la carácter
5. Escribe el texto que quieres a la derecha de `(edited)`
6. Pulsa espacio y pega la carácter
7. Escribe el texto que quieres a la izquierda de `(edited)`

*Esto entrada de blog fue adaptado de [gitea:bbaovanc/discord-tricks][1]*

[1]: https://git.bbaovanc.com/bbaovanc/discord-tricks

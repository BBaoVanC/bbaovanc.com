---

title: Substitución de texto en Discord con `sed`
date: 2021-03-25T18:48:15-05:00
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
    src: example.mov
    title: Video ejemplo

---

Discord permite usar sintaxis `sed` para reemplazar texto.

<!--more-->

## Tutorial

Si envias un mensaje con el formato de `sed` (`s/texto viejo/texto nuevo`),
Discord ejecutará en el último mensaje que enviaste.

## Advertencía

- No permite regex
- No puede reemplazar globamente

*Esto entrada de blog fue adaptado de [gitea:bbaovanc/discord-tricks][1]*

[1]: https://git.bbaovanc.com/bbaovanc/discord-tricks

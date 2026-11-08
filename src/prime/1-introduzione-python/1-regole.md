---
layout: cover
---

# Introduzione a Python

### Le regole d'oro per scrivere codice

<div class="pt-12">
  <span class="px-2 py-1 rounded bg-primary text-[#141418]">Marini Mattia - Informatica</span>
</div>

---

# Il computer prende alla lettera

Noi, tra umani, ci capiamo anche con errori e ambiguità: una parola storta, una virgola fuori posto, e ci arrangiamo.

> "vai a comprare il pane e, se ci sono, prendi anche le uova"

Un computer **no**: esegue esattamente, e solo, ciò che è scritto. Non indovina l'intenzione e non perdona una svista.

> **N.B.** Imparare a programmare è soprattutto imparare a essere **precisi**. Un errore non è una fatalità: è un'informazione da leggere.

---

# Regola 1 — Una istruzione alla volta

Il codice viene eseguito **istruzione per istruzione**, **dall'alto verso il basso**.

```python
print("prima")     # 1ª
print("seconda")   # 2ª
print("terza")     # 3ª
```

- l'ordine in cui scrivi è l'ordine in cui le cose succedono;
- ogni riga termina prima che parta la successiva;
- **non** tutte le righe vengono eseguite: dipende dai rami (`if`) e dai cicli.

> **N.B.** "Riga per riga" non significa "tutte le righe": un ramo di `if` escluso non viene eseguito **affatto**.

---

# L'eccezione: i cicli

Un **ciclo** ripete lo stesso blocco più volte. È l'unico punto in cui l'esecuzione **torna indietro**.

```python
i = 0
while i < 3:
    print(i)
    i = i + 1
print("fine")
```

Passo passo: `i = 0` → stampa `0` → `i = 1` → stampa `1` → `i = 2` → stampa `2` → `i = 3` → condizione falsa → esci → `fine`.

> **N.B.** A ogni **iterazione** il blocco riparte dall'alto verso il basso. Quando il ciclo finisce, si riprende dalla riga **successiva** al ciclo.

---

# Regola 2 — La sintassi è precisa

In italiano, con una parola inventata o una punteggiatura sbagliata, spesso ti capiscono lo stesso.
**Da un computer no**: se qualcosa è scritto male, il programma **non parte** e segnala un errore.

Per il computer **conta tutto**:

- gli **spazi a inizio riga** (l'indentazione);
- **un carattere in più o in meno**;
- **una parentesi in più o in meno**;
- **maiuscole e minuscole**: `Voto` e `voto` sono due cose diverse.

> **N.B.** Python non tira a indovinare: o il codice è esatto, o si ferma con un **errore di sintassi**.

---

# Dove possiamo scrivere "liberamente"

Visto che quasi tutto conta, conviene elencare i (pochi) posti in cui il computer **ignora** ciò che scrivi:

- le **righe vuote**;
- gli **spazi bianchi non a inizio riga** (tra i simboli, dopo una virgola, ecc.);
- il **testo dopo un `#`**: è un **commento**, Python lo ignora;
- il **testo tra virgolette**: è una stringa e può contenere qualsiasi cosa;
- gli **spazi alla fine di una riga**.

Dentro questi confini puoi formattare come vuoi: il programma non cambia.

> **N.B.** Tutto il resto è sintassi: se lo cambi, cambi (o rompi) il programma.

---

# "Andare a capo" non è sempre libero

Puoi andare a capo liberamente **tra un'istruzione e l'altra**:

```python
print("ciao")
print("mondo")
```

E **dentro parentesi, quadre o graffe**, perché la riga continua finché la parentesi non è chiusa:

```python
totale = (prezzo
          + iva
          - sconto)
```

**Non** puoi spezzare a metà un'istruzione senza parentesi: esiste il carattere `\` per farlo, ma a questo livello **evitalo**.

---
layout: two-cols-header
---

# Indentazione

L'**indentazione** è lo spazio vuoto all'inizio di una riga. In Python non è decorazione: è **sintassi**.

- si usa **1 tab** per ogni livello;
- **non** si mescolano tab e spazi;
- tutte le righe dello stesso blocco hanno la **stessa** indentazione.

::left::
```python
# corretto
if a<b:
    print("a")
    a = a+1
```
::right::
```python
# sbagliato
if a<b:
    print("a")
   a = a + 1
```
::bottom::


> **N.B.** Se l'indentazione non è coerente Python si ferma con un `IndentationError`, **prima ancora** di eseguire il programma.

---
layout: two-cols-header
class: table-sm
---

# Regola 3 — Esegui tu il codice, a mano

Quando il programma non fa quello che pensavi, **non tirare a indovinare**: prendi carta e penna e fai la **traccia**, cioè esegui il codice **una riga alla volta**, annotando il valore delle variabili.


::left::

```python {1|2|3|4|2|3|4|2|3|4|2|5} {at: 1}
i = 0
while i < 3:
    print(i)
    i = i + 1
print("fine")
```


::right::

<table>
  <thead>
    <tr>
      <th>valore di i</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <v-switch at="+0" class="font-mono">
          <template #1-4>i = 0</template>
          <template #4-7>i = 1</template>
          <template #7-10>i = 2</template>
          <template #10-13>i = 3</template>
        </v-switch>
      </td>
    </tr>
  </tbody>
</table>

::bottom::
> **Hint!** Questa slide è interattiva, fai andare avanti il codice con le frecce `←` `→`, oppure clicca sulla barra qui sotto

<ClicksSlider class="mt-2" />

---

# Le tre regole d'oro

1. **Una istruzione alla volta**, dall'alto verso il basso; l'eccezione sono i cicli.
2. **La sintassi è precisa**: spazi, caratteri, parentesi e maiuscole contano.
3. **Fai la traccia**: esegui il codice a mano, una riga alla volta, per capire e correggere.

> **N.B.** Essere precisi e sapersi immaginare il programma passo passo: è quasi tutto qui.

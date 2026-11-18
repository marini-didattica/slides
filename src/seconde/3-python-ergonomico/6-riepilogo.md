---
layout: cover
---

# Riepilogo
Dallo stesso problema alla soluzione più leggibile

<div class="pt-12">
  <span class="px-2 py-1 rounded bg-primary text-[#141418]">Marini Mattia - Informatica</span>
</div>

---
class: table-sm
---

# Prima e dopo

| Problema | Soluzione non ergonomica | Soluzione ergonomica |
| -------- | ------------------------ | -------------------- |
| Un elemento è presente? | ciclo + variabile `trovato` | `x in lista` |
| Somma / media | ciclo + accumulatore | `sum(lista)` / `len(lista)` |
| Massimo / minimo | ciclo + accumulatore | `max(lista)` / `min(lista)` |
| Scorrere i valori | `for i in range(len(v))` | `for x in v` |
| Indice e valore | `range(len(v))` + `v[i]` | `enumerate(v)` |
| Ordinare | selection sort | `sorted(v)` |
| Costruire una frase | `+` e `str()` | `f"..."` |
| Ultimo elemento | `v[len(v) - 1]` | `v[-1]` |
| Invertire | ciclo di scambio | `v[::-1]` o `v.reverse()` |
| Palindroma | due indici | `s == s[::-1]` |
---

# Come scegliere

```text
Mi serve solo il valore di ogni elemento?
    -> for x in lista

Mi servono indice e valore?
    -> for i, x in enumerate(lista)

Devo modificare la lista, confrontare vicini o usare posizioni speculari?
    -> for i in range(...)

Il problema è "somma", "massimo", "minimo", "ordina"?
    -> sum / max / min / sorted

Devo prendere una parte della sequenza?
    -> slicing

Devo costruire una frase con dei valori?
    -> f-string
```

> **N.B.** Non esiste una sintassi migliore in assoluto: esiste la sintassi che descrive meglio **quel** problema.
---

# Il codice resta vostro

Le soluzioni ergonomiche non sono "trucchi" per evitare la fatica: sono il vocabolario di Python.

- Scrivere `for x in lista` significa *"per ogni elemento"*.
- Scrivere `enumerate` significa *"mi servono posizione e valore"*.
- Scrivere `sorted` significa *"voglio una versione ordinata"*.
- Scrivere `f"..."` significa *"questa è la frase finale"*.

Più il codice assomiglia all'enunciato, meno errori contiene e più facile è rileggerlo.
---

# Esercizi proposti

1. Data una lista di numeri, stampa solo quelli **pari** usando il `for each`.
2. Data una lista di nomi, stampali numerati da `1` con `enumerate`.
3. Trova la **posizione** del voto minimo con `enumerate`.
4. Data una lista, crea una nuova lista con gli elementi in ordine **decrescente** usando `sorted`.
5. Data una frase, stampa il numero di parole e la parola più lunga usando `split`, `len` e `max(key=len)`.
6. Stampa una tabella con nome, voto e media formattata a due decimali con le f-string.
7. Controlla se una stringa è palindroma usando `[::-1]`.
8. Estrai da una lista gli elementi in posizione pari e quelli in posizione dispari con lo slicing.

> **Consiglio** Per ogni esercizio confrontate la versione con gli strumenti di base e quella ergonomica: è il modo migliore per capire **perché** la seconda è preferibile.

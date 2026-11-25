---
layout: cover
---

# Riepilogo
Dalle ripetizioni alle funzioni

<div class="pt-12">
  <span class="px-2 py-1 rounded bg-primary text-[#141418]">Marini Mattia - Informatica</span>
</div>

---
class: table-sm
---

# La sintassi in un colpo d'occhio

```python
def nome_funzione(parametro1, parametro2=valore_default):
    """Cosa fa la funzione."""
    risultato = parametro1 + parametro2
    return risultato

valore = nome_funzione(3, 5)
```

| Elemento             | Ruolo                                    |
| -------------------- | ---------------------------------------- |
| `def`                | introduce la definizione                 |
| `nome_funzione`      | nome in *snake_case*, di solito un verbo |
| `parametro`          | input della funzione                     |
| `= valore_default`   | rende il parametro opzionale             |
| righe rientrate      | corpo della funzione                     |
| `return`             | output restituito a chi chiama           |
| `nome_funzione(...)` | chiamata: esegue il corpo                |

---

# Parametri e ritorno: le regole d'oro

- I parametri sono gli **input**; gli argomenti sono i valori concreti.
- Gli argomenti posizionali vengono associati **in ordine**.
- I parametri con default vanno **dopo** quelli obbligatori.
- Gli argomenti per nome rendono la chiamata più chiara.
- Le variabili locali **non escono** dalla funzione: serve `return`.
- `return` **termina** subito la funzione.
- Senza `return`, il risultato è `None`.
- `print` mostra; `return` consegna.

---
class: table-sm
---

# Errori comuni

| Errore                                   | Cosa succede                          |
| ---------------------------------------- | ------------------------------------- |
| dimenticare i `:` dopo `def`             | `SyntaxError`                         |
| corpo non rientrato                      | `IndentationError`                    |
| chiamare prima di definire               | `NameError`                           |
| numero di argomenti sbagliato            | `TypeError`                           |
| usare una variabile locale fuori         | `NameError`                           |
| dimenticare `return`                     | il risultato è `None`                 |
| default prima di un parametro obbligatorio | `SyntaxError`                       |
| pensare che le annotazioni controllino i tipi | nessun errore, ma bug possibile   |

> **N.B.** Leggere il messaggio d'errore è metà del lavoro: Python dice quasi sempre **riga** e **motivo**.

---

# Esercizi proposti

1. Scrivi `e_pari(n)` che restituisce `True` se `n` è pari.
2. Scrivi `massimo(a, b, c)` che restituisce il maggiore tra tre numeri.
3. Scrivi `conta_vocali(testo)` che restituisce quante vocali contiene una stringa.
4. Scrivi `calcola_media(voti)` e usala su tre liste diverse.
5. Scrivi `minimo_e_massimo(lista)` che restituisce **due** valori.
6. Scrivi `saluta(nome, saluto="Ciao")` e prova entrambe le forme di chiamata.
7. Scrivi `trova_indice(lista, cercato)` che restituisce la posizione oppure `None`.
8. Aggiungi le annotazioni di tipo a tutte le funzioni degli esercizi precedenti.

> **Consiglio** Per ogni funzione scrivete prima **input**, **output** e **nome**, poi il corpo. Se non sapete scrivere l'output, il problema non è ancora chiaro.

---

# Checklist prima di consegnare

- [ ] Ogni funzione ha un nome che descrive **cosa fa**?
- [ ] Ogni funzione fa **una sola** cosa?
- [ ] I parametri sono quelli che servono davvero?
- [ ] Il risultato esce con `return` e non solo con `print`?
- [ ] Ho evitato di copiare lo stesso codice più volte?
- [ ] Ho aggiunto le annotazioni di tipo?
- [ ] Ho provato la funzione con un caso normale e uno limite?
- [ ] `main()` costruisce il programma usando le funzioni?

> **N.B.** Una funzione scritta bene si può leggere e capire **senza** guardare il resto del programma.

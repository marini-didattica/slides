# Parametri: dare input alla funzione

Una funzione senza input fa sempre lo stesso lavoro: aggiungiamo i **parametri**:

```python
def saluta(nome):
    print("Ciao", nome)

saluta("Ada")
saluta("Alan")
```

Output:

```text
Ciao Ada
Ciao Alan
```

- `nome` è un **parametro**: una variabile che esiste solo dentro la funzione;
- `"Ada"` e `"Alan"` sono gli **argomenti**: i valori concreti passati a ogni chiamata.

> **N.B.** I parametri sono gli **input** del nostro modello input → funzione → output.

---

# Parametri e argomenti

| Termine      | Dove si trova            | Esempio              |
| ------------ | ------------------------ | -------------------- |
| **parametro** | nella **definizione**    | `nome` in `def saluta(nome):` |
| **argomento** | nella **chiamata**       | `"Ada"` in `saluta("Ada")` |

Alla chiamata, Python **associa** ogni argomento al parametro corrispondente:

```python
def saluta(nome):
    print("Ciao", nome)

saluta("Ada")      # nome = "Ada"
```

> **N.B.** Nel linguaggio comune i due termini si usano spesso come sinonimi; la distinzione aiuta a capire cosa succede.

---

# Più parametri

Basta separarli con una virgola:

```python
def presentati(nome, eta):
    print("Mi chiamo", nome, "e ho", eta, "anni")

presentati("Ada", 17)
```

Output:

```text
Mi chiamo Ada e ho 17 anni
```

- i parametri sono **due**, quindi servono **due** argomenti;
- con un numero diverso di argomenti Python segnala un errore.

---
layout: two-cols-header
---

# L'ordine conta

::left::

### Chiamata corretta

```python
def presentati(nome, eta):
    print("Mi chiamo", nome, "e ho", eta, "anni")

presentati("Ada", 17)
```

```text
Mi chiamo Ada e ho 17 anni
```

::right::

### Chiamata sbagliata

```python
def presentati(nome, eta):
    print("Mi chiamo", nome, "e ho", eta, "anni")

presentati(17, "Ada")
```

```text
Mi chiamo 17 e ho Ada anni
```

::bottom::
Gli argomenti vengono associati ai parametri **per posizione**: primo con primo, secondo con secondo. Invertirli non dà errore, ma produce un risultato senza senso.

---

# Parametri con valore di default

Possiamo rendere un parametro **opzionale** dandogli un valore di default:

```python
def saluta(nome, saluto="Ciao"):
    print(saluto, nome)

saluta("Ada")                  # Ciao Ada
saluta("Ada", "Buongiorno")    # Buongiorno Ada
```

- se l'argomento manca, si usa il valore di default;
- se l'argomento c'è, sostituisce il default.

Regola: i parametri **con default** vanno **dopo** quelli obbligatori.

```python
def saluta(nome, saluto="Ciao"):   # corretto
    ...

def saluta(saluto="Ciao", nome):   # SyntaxError
    ...
```

---

# Argomenti per nome (keyword)

Possiamo indicare esplicitamente a quale parametro assegnare un valore:

```python
def saluta(nome, saluto="Ciao"):
    print(saluto, nome)

saluta(saluto="Buongiorno", nome="Ada")
```

Output:

```text
Buongiorno Ada
```

Vantaggi:

- il codice si legge meglio e l'ordine non conta più;
- possiamo saltare un parametro con default.

> **N.B.** `saluta(nome="Ada", "Ciao")` è un errore: i posizionali vanno prima.

---

# Variabili locali e scope

Le variabili create dentro una funzione esistono **solo** dentro la funzione:

```python
def calcola_media(voti):
    somma = sum(voti)
    media = somma / len(voti)
    return media

print(calcola_media([7, 4, 9]))   # 6.666...
print(media)                        # NameError
```

- `somma` e `media` sono **variabili locali**;
- alla fine della chiamata spariscono;
- per far uscire un valore serve `return`.

> **N.B.** Questo è un vantaggio: due funzioni possono usare lo stesso nome senza interferire.

---

# Ricapitolando gli input

```python
def area_rettangolo(base, altezza=1):
    return base * altezza

area_rettangolo(3, 5)          # 15
area_rettangolo(3)             # 3
area_rettangolo(base=3, altezza=5)   # 15
```

- parametri **obbligatori**: `base`;
- parametro **opzionale**: `altezza`, con default `1`;
- argomenti **posizionali** o **per nome**.

Il prossimo passo è capire come il risultato esce dalla funzione.

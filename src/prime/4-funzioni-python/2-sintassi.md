# La sintassi: definire una funzione

```python
def saluta():
    print("Ciao!")
```

| Parte        | Significato                                  |
| ------------ | -------------------------------------------- |
| `def`        | parola chiave che introduce una definizione  |
| `saluta`     | nome della funzione                          |
| `()`         | elenco degli input (per ora vuoto)           |
| `:`          | apre il blocco di istruzioni                 |
| indentazione | il corpo appartiene alla funzione            |

> **N.B.** `def` è l'abbreviazione di *define*: "definisci una funzione".

---

# Definire non significa eseguire

La definizione **prepara** la funzione, ma il suo corpo non viene eseguito finché non la chiamiamo.

```python
def saluta():
    print("Ciao!")

print("Prima")
saluta()
print("Dopo")
```

Output:

```text
Prima
Ciao!
Dopo
```

- `def` → registra la funzione;
- `saluta()` → la **chiama**, ed è qui che il corpo viene eseguito.

---

# Il corpo e l'indentazione

Il corpo della funzione è tutto ciò che è **rientrato** rispetto a `def`:

```python
def saluta():
    print("Ciao!")
    print("Benvenuto")
```

```python
def saluta():
    print("Ciao!")
print("Questa riga è fuori dalla funzione")
```

- Le righe rientrate appartengono alla funzione;
- la prima riga **non** rientrata chiude la funzione;
- l'indentazione standard è di **4 spazi**;
- righe vuote e commenti non interrompono il blocco.

> **N.B.** In Python l'indentazione non è stile: è **sintassi**. Uno spazio di troppo cambia il significato del programma.

---

# Chiamare una funzione più volte

```python
def saluta():
    print("Ciao!")

saluta()
saluta()
saluta()
```

Output:

```text
Ciao!
Ciao!
Ciao!
```

La funzione viene eseguita **da capo** a ogni chiamata: è questo che la rende riutilizzabile.

---

# Dove si mettono le funzioni

Python deve **conoscere** una funzione prima di eseguirla.

```python
def calcola_media(voti):
    return sum(voti) / len(voti)

def main():
    print(calcola_media([7, 4, 9]))

main()
```

- prima si **definiscono** le funzioni;
- poi si scrive il codice che le usa (spesso dentro `main`);
- infine si chiama `main()`.

> **N.B.** In Python l'ordine conta: una chiamata prima della `def` produce `NameError`.

---

# Scegliere il nome giusto

Il nome deve descrivere **cosa fa** la funzione, non come lo fa.

| Nome debole | Nome migliore       |
| ----------- | ------------------- |
| `f`         | `calcola_media`     |
| `cosa`      | `e_pari`            |
| `roba`      | `stampa_tabella`    |
| `funzione1` | `conta_vocali`      |

Regole e convenzioni:

- minuscole, con `_` tra le parole (*snake_case*);
- di solito inizia con un **verbo**: `calcola_`, `stampa_`, `trova_`, `conta_`;
- niente spazi, accenti o caratteri speciali;
- il nome non può essere una parola chiave (`if`, `for`, `return`, ...).

---

# Un primo esempio completo

```python
def area_rettangolo(base, altezza):
    area = base * altezza
    return area

def main():
    a = area_rettangolo(3, 5)
    print("Area:", a)

main()
```

Output:

```text
Area: 15
```

Abbiamo già tutte le parti: `def`, nome, parametri, corpo e `return`. Le prossime slide le esaminano una per una.

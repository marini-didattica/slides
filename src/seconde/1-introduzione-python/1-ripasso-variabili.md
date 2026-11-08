---
layout: cover
---

# Ripasso - Variabili
Immagazzinare e modificare dati

<div class="pt-12">
  <span class="px-2 py-1 rounded bg-primary text-[#141418]">Marini Mattia - Informatica</span>
</div>

---

# Variabili

Una **variabile** è un nome che riferisce a un valore: una "scatola" in memoria a cui diamo un'etichetta per riutilizzarne il contenuto nel programma.

- Il **nome** identifica la variabile
- Il **valore** è il dato memorizzato
- Il valore può **cambiare** durante l'esecuzione

Ad esempio:
```python
my_string = "Hello world"       # Crea una variabile di tipo 'str' chiamata my_string
my_int = 2                      # Crea una variabile di tipo 'int' chiamata my_int
my_float = 2.2                  # Crea una variabile di tipo 'float' chiamata my_float
```

---

# I tipi di Python

| Tipo    | Esempio          | Cosa rappresenta      |
| ------- | ---------------- | --------------------- |
| `int`   | `42`             | Numeri interi         |
| `float` | `3.14`           | Numeri con la virgola |
| `str`   | `"ciao"`         | Testo                 |
| `bool`  | `True` / `False` | Valori di verità      |
| `None`  | `None`           | Assenza di valore     |

---
layout: center
---

# Inizializzazione vs assegnamento

**Inizializzazione** ed **assegnamento** possono sembrare la stessa operazione ma non è proprio così

```python
x = 2       # Inizializzazione; il programma incontra per la prima volta la variabile x, per questo la inizializza
print(x)
x = 13      # Assegnamento; il programma incontra per la seconda volta la variabile x, per questo la aggiorna
print(x)
```

> **N.B.** Una variabile deve essere inizializzata prima di essere utilizzata, altrimenti ci sarà un'errore!

```python
x = 2       # Inizializzazione; il programma incontra per la prima volta la variabile x, per questo la inizializza
print(x)
x = 13      # Assegnamento; il programma incontra per la seconda volta la variabile x, per questo la aggiorna
print(x)
```

---
layout: two-cols-header
---

# Inizializzazione vs assegnamento

<div class="w-fit mx-auto">

```python
my_var = 42
```

</div>

L'inizializzazione avviene solo la **prima** volta che si incontra una variabile. L' istruzione si comporta in maniera diversa, a seconda che sia una inizializzazione o un assegnamento



::left::
### Inizializzazione
Intuitivamente avviene questo

- Cerco posto per variabile in memoria
- Lo "etichetto" con `my_var`
- Ci inserisco il valore specificato


::right::
### Assegnamento
Intuitivamente avviene questo

- Cerco memoria etichettata da `my_var`
- Una volta trovato lo "etichetto"
- Ci inserisco il valore specificato

---
layout: two-cols-header
---

# Esempi

::left::

### Testo e numeri

```python
nome = "Ada"
eta = 36
print(f"Ciao {nome}, hai {eta} anni.")
```

`Output:`
```python
"Ciao Ada, hai 36 anni."
```

::right::

### Calcolo

```python
prezzo = 19.99
quantita = 3
totale = prezzo * quantita
print(f"Totale: {totale}")
```
`Output:`
```python
"Totale: 59.97"
```

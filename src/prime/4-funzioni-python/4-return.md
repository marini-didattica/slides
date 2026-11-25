# Il valore di ritorno

`return` è il modo in cui una funzione **restituisce** un risultato a chi l'ha chiamata:

```python
def somma(a, b):
    return a + b

risultato = somma(2, 3)
print(risultato)      # 5
```

Il valore prodotto da `somma(2, 3)` **sostituisce** la chiamata:

```python
print(somma(2, 3))    # equivale a print(5)
```

> **N.B.** `return` è l'**output** del nostro modello input → funzione → output.

---
layout: two-cols-header
---

# `print` non è `return`

::left::

### Solo `print`

```python
def somma_stampa(a, b):
    print(a + b)

x = somma_stampa(2, 3)
print("x =", x)
```

```text
5
x = None
```

::right::

### Con `return`

```python
def somma_ritorna(a, b):
    return a + b

y = somma_ritorna(2, 3)
print("y =", y)
```

```text
y = 5
```

::bottom::
`print` **mostra** un valore sullo schermo, ma non lo consegna al programma. `return` **consegna** il valore a chi ha chiamato la funzione: solo così possiamo riusarlo, salvarlo o passarlo a un'altra funzione.

---

# `None`: quando non c'è un ritorno

In Python **ogni funzione restituisce qualcosa**. Se manca `return`, il risultato è `None`:

```python
def saluta(nome):
    print("Ciao", nome)

risultato = saluta("Ada")
print(risultato)
```

Output:

```text
Ciao Ada
None
```

- `None` è un valore speciale che significa "niente";
- le funzioni che **stampano soltanto** sono spesso chiamate **procedure**;
- le funzioni che **calcolano** usano `return`.

---

# `return` termina subito la funzione

Quando Python incontra `return`, esce immediatamente dalla funzione:

```python
def classifica(voto):
    if voto < 6:
        return "insufficiente"
    if voto < 8:
        return "sufficiente"
    return "ottimo"

print(classifica(5))    # insufficiente
print(classifica(7))    # sufficiente
print(classifica(9))    # ottimo
```

- non serve un `else` dopo un `return`;
- il codice dopo il `return` **non viene eseguito**;
- i controlli precoci rendono la funzione più leggibile.

---

# Restituire più valori

`return` può restituire più valori separati da virgole: in realtà restituisce una **tupla**.

```python
def minimo_e_massimo(lista):
    minimo = lista[0]
    massimo = lista[0]
    for valore in lista:
        if valore < minimo:
            minimo = valore
        if valore > massimo:
            massimo = valore
    return minimo, massimo

basso, alto = minimo_e_massimo([3, 7, 2, 9])
print(basso)    # 2
print(alto)     # 9
```

```python
risultato = minimo_e_massimo([3, 7, 2, 9])
print(risultato)    # (2, 9)
```

> **N.B.** A sinistra dell'assegnazione possiamo "scompattare" la tupla in due variabili.

---

# Comporre funzioni

Il valore restituito da una funzione può diventare l'input di un'altra:

```python
def area_rettangolo(base, altezza):
    return base * altezza

def prezzo(area, prezzo_mq):
    return area * prezzo_mq

def main():
    a = area_rettangolo(3, 4)
    costo = prezzo(a, 10)
    print("Costo:", costo)    # Costo: 120

main()
```

- ogni funzione risolve **un solo** problema;
- i risultati si incastrano come mattoncini;
- `main` coordina i passaggi.

---

# Tornare `None` per segnalare "non trovato"

Un uso frequente di `None` è indicare che il risultato non esiste:

```python
def trova_indice(lista, cercato):
    for i in range(len(lista)):
        if lista[i] == cercato:
            return i
    return None

print(trova_indice([4, 8, 15], 8))     # 1
print(trova_indice([4, 8, 15], 99))    # None
```

Chi chiama la funzione deve controllare il risultato:

```python
posizione = trova_indice([4, 8, 15], 99)
if posizione is None:
    print("Non trovato")
```

> **N.B.** `is None` è il modo corretto di confrontare con `None`, non `== None`.

#2. viikko

Viikon aiheina tulevat olemaan:
  * Tyypit
  * Tyyppiluokat


**Huom** Tästä viikosta *eteenpäin* ```xWeek.hs```-tiedostossa tulee olemaan myös [HUnit](https://hackage.haskell.org/package/HUnit)-testejä, joten on suositeltavaa ladata uusin haskell-platform käytettäväksi. Jos materiaalissa esiintyy ohjelmointitehtäviä, joissa kerrotaan tekemään muutoksia ```xWeek.hs```-tiedostoon, on hyvä suorittaa aina komento
``` haskell
runTestTT tests
```
tekemiesi muutoksien jälkeen. Tämä testaa tekemiesi funktioiden oikeellisuutta ja testien mennessä läpi funktiosi toimii kuten pitääkin.

#Tyypit

Haskell on staattisesti tyypitetty, mutta mitä tämä tarkoittaa? Se tarkoittaa sitä, että jokaisen ilmaisun tyyppi evaluoidaan käännettäessä. Tämä estää virheet kuten boolean-arvon jakamisen kokonaisluvulla ajoissa, joka taas johtaa turvallisempaan koodiin, koska ohjelma kaatuu harvemmin. Tästä syystä myös jokaisella Haskell-kielen funktiolla ja tietorakenteella on tyyppi.

Yksi suuri ero Javan ja Haskell-kielen välillä on, että kirjoittaessamme esimerkiksi numeron Haskell tekee johtopäätöksen numeron tyypistä ja luo tämän perusteella jatkon toimenpiteet. Voimme esimerkiksi aloittaa kirjoittamalla ghci-tulkkiin komennon
```haskell
  > :t 'a'
```
Saammamme vastaus ```'a' :: Char ``` kertoo, että määrittely ```'a'```oli tyyppia kirjain.

---
Määrittele seuraavat ghci-tulkissa komennolla ```:t ```: True, "Hello World", (True, 5), 5 == 5. Mitä luulet tuloksiesi tarkoittavan ja miksi "Hello World" evaluoitui taulukoksi?

---

Funktioilla on myös tyyppi ja kun kirjoitamme omia funktioita, voimme määritellä ekspiliittisen tyypin sille, jolloin Haskell ei yritä arvata sen tyyppiä. Tästä eteenpäin anna kaikille omille funktioillesi tyyppi. Tyypityksen määritelmän opit seuraavaksi.

##### Tyypitys funktioille

```haskell
removeNonUppercase :: [Char] -> [Char]  
removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']]
```

Kuten huomamme funktiolla ```removeNonUppercase``` on tyyppinä ```[Char] -> [Char]```. Tämä tarkoittaa käytännössä, että funktio ottaa parametrina ```String``` -tyypin ja palauttaa samaa tyyppia olevan tuloksen.

Esimerkkinä voimme ottaa myös seuraavan

```haskell
addThree :: Int -> Int -> Int -> Int  
addThree x y z = x + y + z
```

---
  Mieti mitä funktio tekee ja miksi tyypityksiä on 4, vaikka funktio ottaa vain 3 parametria.

---

Jos ihmettelet mitä funktio ```->``` tarkoittaa, se tarkoittaa, että A -> B =  A palauttaa tyypin B:lle.

### Yleisimmät tyypit

##### Int

* Kokonaisluku. 32-bittisissä järjestelmissä max = 2147483647 ja min = -2147483647.

##### Integer

* Myös tarkoittaa kokonaislukua, mutta käytännössä äärettömän kokonoinen.

```haskell
factorial :: Integer -> Integer  
factorial n = product [1..n]  
```
```haskell
ghci> factorial 50  
30414093201713378043612608166064768844377641568960512000000000000
```

##### Float

Desimaali.
```haskell
circumference :: Float -> Float  
circumference r = 2 * pi * r
```
```haskell
ghci> circumference 4.0  
25.132742  
```
##### Double

Tuplasti tarkempi, kuin ```Float```.

```haskell
circumference' :: Double -> Double  
circumference' r = 2 * pi * r  
```
```haskell
ghci> circumference' 4.0  
25.132741228718345
```
##### Bool

Sisältää arvot ```True``` ja ```False```.

##### Char

Yksittäinen kirjain, mutta taulukkona toimii, kuin String.


# Tyyppiluokat

Funktioiden tyyppi on helppo selvittää. Se tapahtuu käytännössä samalla tavalla, kuin tyyppienkin selvittäminen. Kokeilemme seuraavaksi evaluoida ```head```-funktion

```haskell
ghci> :t head  
head :: [a] -> a
```

Saimme palautteena 'a':n, mutta mikä 'a' on? 'a' on tyyppimuttuja, koska se ei ole kirjoitettu isolla kirjaimella toisin kuin yleensä tyypit kirjoitetaan. Käytännössä tämä tarkoittaa, että 'a' voi olla mitä tahansa tietotyyppiä. Funktioilla, jotka hyödyntävät tätä tyypitystä ovat nimeltään polymorfisia funktioita, koska ne eivät välitä saamastaan tyypistä ja täten palauttavat aina samaa tyyppiä olevat alkion, kuin parametrina saatu taulukko.

---
Evaluoi funktio ```fst```. Mikä sen tyyppi on ja mistä luulet palaututyypin johtuvat?.

---
***jatkuu***

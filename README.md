# Haskell-opas
Tämän oppaan tarkoitus on opettaa Haskell-ohjelmointikieltä ihmisille joilla on jotain kokemusta jostain muusta ohjelmointikielestä (esim. Java) ja halu oppia funktionaalista ohjelmointia. Opasta **ei** pidä kuitenkaan ottaa
"oikeana" oppaana, vaan se on tarkoitettu lähinnä kirjoittajan omiin kokeiluihin ja yleiseen oppimiseen (johtuu mm. siitä ettei kirjoittaja ole mikään Haskell-guru tätä kirjoittaessa, vaan itsekkin oppimassa kyseistä kieltä). Jos kuitenkin koit hyötyväsi oppaasta jotain, on se aina positiivista.

![](http://upload.wikimedia.org/wikipedia/commons/thumb/1/1c/Haskell-Logo.svg/120px-Haskell-Logo.svg.png)

http://haskell.org/

# Mikä on Haskell?
Haskell on standardoitu, puhtaasti funktionaalinen sekä avoimen lähdekoodin (open source) ohjelmointikieli. Se on nimetty loogikko Haskell Curryn mukaan ja sitä on kehitetty vuodesta 1987. Päästandardi on Haskell 98, joka määrittelee kielen ytimen, jossa on kaikki perustoiminnallisuus, joka on siirrettävä ja joka on sopiva opetuskäyttöön. Lähes kaikki kielen toteutukset tuovat näiden päälle omia laajennuksiaan. Tunnetuimpia toteutuksia ovat **GHC** (Glasgow Haskell Compiler) ja **Hugs** (interaktiivinen tulkki).

Kielen tärkeitä ominaispiirteitä ovat **hahmonsovitus** (engl. pattern matching), **funktion osittainen soveltaminen** (eli partial application), **listankäsittely**, **vartiolausekkeet** ja **määriteltävät operaattorit**. Kieli myös tukee rekursiivisia funktioita, algebrallisia tietotyyppejä ja laiskaa laskemista. Erityisiä piirteitä ovat **monadit** ja tyyppiluokat. Näiden ansiosta Haskellilla on helppo kirjoittaa tietyntyyppisiä ohjelmia, joiden kirjoittaminen olisi huomattavasti vaikeampaa proseduraalisilla ohjelmointikielillä.

http://en.wikipedia.org/wiki/Haskell_%28programming_language%29

Haskell-kielen tärkeimmät tiedostopäätteet ovat `.hs` sekä `.lhs`. Käytännössä vastaavat esimerkiksi Javan `.java`-päätteisiä tiedostoja.

# Miten Haskell asennetaan?

###Ubuntu

Ubuntulle asentaminen on erittäin helppoa.

Aja konsolissasi komento `sudo apt-get install haskell-platform` ja saat käyttöösi koko Haskell-kielen peruskirjaston. http://packages.ubuntu.com/trusty/haskell-platform

Näistä tärkein tulee todennäköisesti olemaan komento `ghci` tai `ghc` (http://en.wikipedia.org/wiki/Glasgow_Haskell_Compiler), joka on interaktiinen kääntäjä Haskell-kielelle. Sen avulla voidaan ajaa Haskell-koodia suoraan terminaalista käsin, jolloin erilainen kokeilu on erittäin helppoa.

Jos kaikki onnistui kuten piti, pitäisi sinun pystyä nyt ajamaan esimerkiksi komentosarja

`ghci`

*interaktiivinen konsoli aukeaa*
```haskell
Prelude> 5+5
10
```
Huom. `Prelude>` jälkeen oleva koodi suoritetaan.


# Miten teen tehtäviä?

1. Tee forkki reposta
2. Lue materiaali tehtävän kansiosta ja tee annetut tehtävät, jotka on jaettu omiin kansiohinsa
3. Jos testit (testejä tulee aina sitten, kun ehdin) menevät läpi laita pull request
4. Muista suorittaa komento `git pull` tasaisin väliajoin, jotta saat aina uusimman version




# Materiaali

https://www.haskell.org/hoogle/ - Haskelin "Javadocit"

http://learnyouahaskell.com/ - Tämä on käytännössä se materiaali, jota opas seuraa 1:1

# IDE
Haskeliin ei yleisesti ole mitään yleistä IDEä, mutta hyviä ohjelmia Haskelin kirjoittamiseen ovat mm. VIM, Atom ja Leksah.

* http://leksah.org/
* `sudo apt-get install vim`
* https://atom.io/ (vaatii seuraavat plugarit)
  * https://atom.io/packages/language-haskell
  * https://atom.io/packages/ide-haskell

Käytännössä suurin hyöty "IDE":n käyttämisestä voi olla code complition sekä ghci:n yhdistäminen, mutta edelliset eivät missään nimessä ole pakollisia. Voit kirjoittaa vaikka `gedit`:in kautta, jos siltä tuntuu.

![](http://www.quickmeme.com/img/e0/e00e114f5d08e0cc248325797774e74e986efcfdbb084865c5ce9d83936dfdf8.jpg)

(alussa saattaa tuntua tältä)

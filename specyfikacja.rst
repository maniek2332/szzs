=====================================================
System zarządzania związkiem sportowym - specyfikacja
=====================================================

| Wykonanie: Paweł Maksimek, Mariusz Okulanis

.. raw:: pdf

    PageBreak

.. contents:: Spis treści

.. sectnum::

.. raw:: pdf

    PageBreak


Historia zmian
==============

.. note::

    TODO


Wstęp
=====

Dokument ten jest specyfikacją informatycznego systemu służącego
do zarządzania związkiem sportowym. Zdefiniowane zostały tutaj: słownik
pojęć, definicje typów danych, zarys systemu, wymagania funkcjonalne
i niefunkcjonalne.

System ten przeznaczony jest do wykorzystania w dowolnym związku sportowym.
Ma on na celu ułatwienie zadania jakim jest zarządzanie owym związkiem.
Ułatwia on również również pracę klubom sportowym zarejestrowanym w związku.


Słownik pojęć
=============

    * *Administrator systemu* - osoba zarządzająca całym systemem.
      Jest odpowiedzialny za rejestrację kont klubów.
      Administrator posiada władzę do zatwierdzania akcji moderowanych.
    * *Klub* - użytkownik reprezentujący klub
      (zwany również menedżerem klubu), ma on możliwość rejestracji
      zawodników.
    * *Rejestracja konta klubu* - założenie konta klubu przez
      administratora.
    * *Zawodnik* - informacje o realnej osobie przypisanej do klubu,
      zawodnik nie ma możliwości logowania się do systemu.
    * *Użytkownik* - Administrator lub Klub
    * *Akcja moderowana* - akcja, która musi zostać zatwierdzona przez
      administratora
    * *Wydarzenie* - wydarzenie sportowe, wprowadzane do systemu przez
      administratora.


Definicje typów danych
======================

Użytkownik
----------

``Użytkownik`` jest klasą reprezentującą użytkowników systemu
którzy mogą się do niego logować. To czy użytkownik jest administratorem
czy klubem jest określane poprzez sprawdzenie pola ``uprawnienia``.
Klasa ``Użytkownik`` określona jest polami:

    * ``login`` - login do systemu pole tekstowe - 4-32 znaków, może
      zawierać litery łacińskie (wielkie i małe), cyfry oraz podkreślenia.
    * ``hasło`` - hasło do systemu pole tekstowe - 8-32 znaków, może
      zawierać drukowalne znaki z tabeli ASCII, w bazie danych hasło
      przechowywane jest w formie zahashowanej (funkcja skrótu SHA-1).
    * ``email`` - adres e-mail, pole tekstowe wg. specyfikacji RFC
      adresu email.
    * ``uprawnienia`` - uprawnienia użytkownika, jednoznakowe pole
      tekstowe, może przybierać wartości ``A`` (oznacza Administratora)
      oraz ``K`` (oznacza Klub); pole te może być zmienione z poziomu
      systemu, wszystkie utworzone z poziomu systemu konta otrzymują
      tą wartość ustawioną na ``K``.

Klub
----

``Klub`` jest klasą przechowującą podstawowe informacje na temat
klubu, listę zawodników grających w danym klubie oraz powiązanego
użytkownika systemu. Zdefiniowane są pola:

    * ``użytkownik`` - powiązany użytkownik systemu, relacja 1-1 do
      obiektu ``Użytkownik`` (do każdego klubu przypisany jest
      dokładnie jeden użytkownik, ten sam użytkownik nie może być
      przypisany do więcej niż jednego klubu).
    * ``nazwa`` - nazwa klubu, pole tekstowe - 4-48 znaków, może
      zawierać polskie litery (wielkie i małe) oraz cyfry.
    * ``licencja`` - numer licencji klubu, pole tekstowe 4-50 znaków.

Zawodnik
--------

Klasa ``Zawodnik`` reprezentuje realnego zawodnika:

    * ``klub`` - klub do którego przypisany jest zawodnik, każdy
      zawodnik może być przypisany do tylko jednego klubu.
    * ``imie`` - imię zawodnika, pole tekstowe 4-32 znaków,
      zawiera polskie znaki.
    * ``nazwisko`` - nazwisko zawodnika, pole tekstowe 4-32 znaków,
      zawiera polskie znaki.
    * ``stan`` - stan zdrowia zawodnika, pole wyboru,
      może przybierać wartości: ``zdrowy``, ``lekka kontuzja``,
      ``ciężka kontuzja``, ``inne``.
    * ``stan_opis`` - dodatkowy opis stanu zdrowia zawodnika,
      jeśli wartość pola ``stan`` jest inna niż ``inne`` to pole
      jest nieobowiązkowe.
    * ``zdjęcie`` - zdjęcie zawodnika, zdjęcie w formacie JPG o rozmiarze
      do 100 kB, pole nieobowiązkowe.
    * ``ostatnie_badanie`` - data ostatniego badania okresowego,
      pole wyboru daty.

Wydarzenie
----------

Klasa reprezentująca wydarzenia sportowe, określona jest polami:

    * ``nazwa`` - krótka nazwa wydarzenia, pole tekstowe 4-64 znaków.
    * ``data`` - dzień w którym ma się odbyć wydarzenie, pole wyboru
      daty.
    * ``czas`` - godzina o której ma się odbyć wydarzenie, pole wyboru
      godziny, pole nieobowiązkowe.
    * ``opis`` - opis wydarzenia, pole tekstowe 10-5000 znaków.
    * ``kluby`` - lista klubów zapisanych na wydarzenie, lista obiektów
      klasy ``Klub``.


Zarys systemu
=============

Celem systemu jest usprawnienia zarządzania związkiem sportowym.
Administrator systemu ma możliwość dodawania nowych klubów do systemu.
Dodane kluby mają możliwość edycji swoich danych oraz dodawanie
zawodników do swojej listy. System ułatwia zarządzanie klubem
poprzez przypominanie o wydarzeniach okresowych. Administrator
ma możliwość dodawania wydarzeń. O dodanych wydarzeniach informowani
są menedżerowie klubów, którzy mogą zgłosić swoją chęć uczestnictwa
w wydarzeniu.


Wymagania funkcjonalne
======================

.. note::

    TODO

Autoryzacja
-----------

Logowanie
^^^^^^^^^

* System umożliwia logowanie się użytkowników do systemu.

.. note::

    Tu obrazek

* W tym celu wymagane jest od użytkownika podanie loginu i hasła.
* Podane login i hasło są porównywane z obiektami klasy ``Użytkownik``.
* Jeśli nie udało się dopasować żadnego użytkownika
  wyświetlony zostaje komunikat "Niepoprawny login lub hasło".

.. note::

    Tu też obrazek

Zmiana hasła
^^^^^^^^^^^^

Przypomnienie hasła
^^^^^^^^^^^^^^^^^^^


Zarządzanie klubami
-------------------

Dodanie klubu
^^^^^^^^^^^^^

Lista klubów
^^^^^^^^^^^^

Edycja klubu
^^^^^^^^^^^^


Zarządzanie zawodnikami
-----------------------

Dodanie zawodnika
^^^^^^^^^^^^^^^^^

Zatwierdzenie zawodnika
^^^^^^^^^^^^^^^^^^^^^^^

Edycja zawodnika
^^^^^^^^^^^^^^^^


Wymagania niefunkcjonalne
=========================

.. note::

    TODO

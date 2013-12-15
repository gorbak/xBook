using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Ksiegarnia
{
    public enum UserDBTables
    {
        id_user = 0,
        imie = 2,
        nazwisko,
        login,
        haslo,
        adres,
        mail,
        uprawnienia
    }
    public enum KsiazkaDBTables
    {
        id_ksiazki = 0,
        id_kategoria,
        cena,
        id_magazyn,
        nazwa,
        opis,
        dostepnosc
    }
    public class DBTableRows
    {
    }
}
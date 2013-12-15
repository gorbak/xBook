using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.Routing;

namespace Ksiegarnia
{
    public class Global : System.Web.HttpApplication
    {
        public int sprawdzTypUzytkownika()
        {
            int typUzytkownika = 0;

            if (Session["uprawnienia"] == null)
            {
            }

            return typUzytkownika;
        }
        public static void mapujSciezke(String sciezka, String adres)
        {
            RouteCollection routes = RouteTable.Routes;
            
            routes.MapPageRoute("",
                sciezka,
                adres);
        }
        public static void MapowanieSciezek(RouteCollection routes)
        {
            //menu
            mapujSciezke("szukaj", "~/szukaj.aspx");
            mapujSciezke("kontakt", "~/kontakt.aspx");

            //user
            mapujSciezke("logowanie", "~/user/logowanie.aspx");
            mapujSciezke("rejestracja", "~/user/rejestracja.aspx");
            mapujSciezke("konto", "~/user/konto.aspx");
            mapujSciezke("wyloguj", "~/user/wyloguj.aspx");
            mapujSciezke("koszyk", "~/koszyk.aspx");

            //admin
            mapujSciezke("admin/", "~/useradmin/admin.aspx");
            mapujSciezke("admin/{menu_admin}", "~/useradmin/admin.aspx");

            //ksiazki
            mapujSciezke("kategoria/{kategoria}", "~/kategoria.aspx");
            mapujSciezke("ksiazka/{id_ksiazka}", "~/ksiazka.aspx");
            //mapujSciezke("wyloguj", "~/user/wyloguj.aspx");

        }
        protected void Application_Start(object sender, EventArgs e)
        {
            MapowanieSciezek(RouteTable.Routes);
        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}
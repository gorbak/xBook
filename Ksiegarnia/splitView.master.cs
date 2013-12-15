using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ksiegarnia
{
    public partial class splitView : System.Web.UI.MasterPage
    {
        protected void niewidoczne_opcje()
        {
            //uzytkownicy_admin.Visible = false;
            //ksiazki_admin.Visible = false;
            //magazyn_admin.Visible = false;
            //kategorie_admin_menu.Visible = false;
            //zamowienia_menu.Visible = false;
        }
        protected void opcja_wybrana(int opcja)
        {
            //switch(opcja){
            //    case 1:
            //        niewidoczne_opcje();
            //        produkty_admin.Visible = true;
            //        break;
            //    case 2:
            //        niewidoczne_opcje();
            //        uzytkownicy_admin.Visible = true;
            //        break;
            //    case 3:
            //        niewidoczne_opcje();
            //        magazyn_admin.Visible = true;
            //        break;
            //    case 4:
            //        niewidoczne_opcje();
            //        kategorie_admin_menu.Visible = true;
            //        break;

            //    default:
            //niewidoczne_opcje();
            //produkty_admin.Visible = true;
            //        break;
            //}
        }
        protected void Sprawdz_opcje_menu_admina()
        {

            if (Page.RouteData.Values["menu_admin"] != null)
            {

                switch (int.Parse(Page.RouteData.Values["menu_admin"].ToString()))
                {

                    case 1:
                        menuAdm1.Attributes.Add("class", "label_menu_admin menuAdminSelected");
                        opcja_wybrana(1);
                        break;

                    case 2:
                        menuAdm2.Attributes.Add("class", "label_menu_admin menuAdminSelected");
                        opcja_wybrana(2);
                        break;

                    case 3:
                        menuAdm3.Attributes.Add("class", "label_menu_admin menuAdminSelected");
                        opcja_wybrana(3);
                        break;

                    case 4:
                        menuAdm4.Attributes.Add("class", "label_menu_admin menuAdminSelected");
                        opcja_wybrana(4);
                        break;

                    case 5:
                        menuAdm5.Attributes.Add("class", "label_menu_admin menuAdminSelected");
                        opcja_wybrana(4);
                        break;

                    case 6:
                        menuAdm6.Attributes.Add("class", "label_menu_admin menuAdminSelected");
                        opcja_wybrana(6);
                        break;

                    default:
                        menuAdm1.Attributes.Add("class", "label_menu_admin menuAdminSelected");
                        opcja_wybrana(1);
                        break;

                }
            }
            else
            {
                menuAdm1.Attributes.Add("class", "label_menu_admin menuAdminSelected");
                opcja_wybrana(1);
            }




        }
        protected void Page_Load(object sender, EventArgs e)
        {
            Sprawdz_opcje_menu_admina();
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Ksiegarnia
{
    public partial class kategoria : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Koszyk_dodaj_Click(object sender, EventArgs e)
        {
            int ilosc = 0;
            int koszyk_ile = 0;

            Button btn = sender as Button;
            DataListItem item = btn.NamingContainer as DataListItem;
            TextBox il = item.FindControl("input_bialy_ilosc") as TextBox;
            //try
            //{
            //    int.Parse(il.Text);
            //}
            //catch
            //{
            //    il.Text = "1";
            //}


            if (Session.Count > 0 && Session["koszyk_ile"].ToString() != null)
            {
                koszyk_ile = int.Parse(Session["koszyk_ile"].ToString());
            }
            if (Session.Count > 0 && Session["login"].ToString() != null)
            {

                koszyk_ile += 1;
                Session["koszyk_ile"] = koszyk_ile;
                //




                Label lab = item.FindControl("labelIDKsiazka") as Label;



                SqlConnection kosz_con, mag_con;
                SqlCommand kosz_cmd_insert, mag_cmd_sel;
                SqlDataReader czyt_mag;
                mag_con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CS"].ConnectionString);
                //mag_con.Open();
                //mag_cmd_sel = new SqlCommand("SELECT ilosc FROM Magazyn "
                //    + "WHERE id_magazynu = '" + Page.RouteData.Values["produkt"] + "'");

                //mag_cmd_sel.Connection = mag_con;
                //czyt_mag = mag_cmd_sel.ExecuteReader();

                //if (czyt_mag.HasRows)
                //{
                //    while (czyt_mag.Read())
                //    {

                //        ilosc = int.Parse(czyt_mag.GetValue(0).ToString());
                //    }
                //}

                //mag_con.Close();

                //if (ilosc < 1)
                //{  // zabezpiecza przed tak zwanym "wyścigiem" kiedy ktoś już wykupi dany produkt z magazynu

                // //   Response.Redirect("/ksiazka/" + Page.RouteData.Values["produkt"]);

                //}
                //else
                //{

                int ile_dodac = 1;

                    //if (ile_dodac > ilosc) { ile_dodac = ilosc; }
                    kosz_con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CS"].ConnectionString);
                    kosz_con.Open();
                    kosz_cmd_insert = new SqlCommand("INSERT INTO Koszyk"
                        + "  (id_usera,id_ksiazki,ilosc)"
                        + "VALUES "
                        + "  ('" + Convert.ToInt32(Session["userID"].ToString()) + "','" + lab.Text + "','" + ile_dodac + "')");


                    kosz_cmd_insert.Connection = kosz_con;
                    kosz_cmd_insert.ExecuteNonQuery();
                    kosz_con.Close();
                //}



            }

           
        }
    }
}
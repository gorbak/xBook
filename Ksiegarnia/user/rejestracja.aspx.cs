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
    public partial class rejestracja : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            divBledy.Style["display"] = "none";
        }
        protected void rejestrujClick(object sender, EventArgs e)
        {



            Imie_text.Style["color"] = "black";
            Login_text.Style["color"] = "black";
            Haslo_text.Style["color"] = "black";
            Powtorz_text.Style["color"] = "black";
            List<String> bledy = new List<String>();

            SqlConnection rej_con;
            SqlCommand rej_cmd_Sel, rej_cmd_insert;
            SqlDataReader rd;


            String login2 = login.Text;  //\/\/\/\/\//

            rej_con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CS"].ConnectionString);
            rej_con.Open();
            rej_cmd_Sel = new SqlCommand("Select * from [User] where login = '" + login.Text + "'");

            /*
            SqlParameter param;
            param = new SqlParameter("imie", SqlDbType.VarChar);
            param.Value = imie.Text;
            rej_cmd_Sel.Parameters.Add(param);
            */

            rej_cmd_Sel.Connection = rej_con;
            rd = rej_cmd_Sel.ExecuteReader();

            if (rd.HasRows)
            {

                bledy.Add("Uzytkownik o loginie " + login2 + " juz istnieje!");
                Login_text.Style["color"] = "red";


            }

            /*
                DropDownListMiasta.DataSource = rd;
                DropDownListMiasta.DataTextField = "nazwa";
                DropDownListMiasta.DataValueField = "miastoID";
                DropDownListMiasta.DataBind();
             */

            rej_con.Close();

            if (imie.Text.Length == 0)
            {

                bledy.Add("Pole \"imie\" nie może być puste!");
                Imie_text.Style["color"] = "red";
            }
            if (login.Text.Length == 0)
            {

                bledy.Add("Pole \"login\" nie może być puste!");
                Login_text.Style["color"] = "red";

            }
            if (haslo.Text.Length == 0)
            {

                bledy.Add("Pole \"haslo\" nie może być puste!");
                Haslo_text.Style["color"] = "red";

            }
            if (powtorz.Text.Length == 0)
            {
                bledy.Add("Brak powtórzenia hasla!");
                Powtorz_text.Style["color"] = "red";
            }
            else if (haslo.Text != powtorz.Text)
            {
                bledy.Add("Powtórzenie hasła różni sie od hasła!");
                Powtorz_text.Style["color"] = "red";
                Haslo_text.Style["color"] = "red";
            }

            Label1_b.Text = "";
            if (bledy.Count > 0)
            {
                divBledy.Style["display"] = "block";
                for (int z = 0; z < bledy.Count; z++)
                {

                    Label1_b.Text += "" + bledy[z] + "<br />";
                }

            }
            else
            {

                rej_con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CS"].ConnectionString);
                rej_con.Open();
                rej_cmd_insert = new SqlCommand("INSERT INTO [User]"
                    + "  (imie, nazwisko, mail, login, haslo)"
                    + "VALUES "
                    + "  (@imie,@nazwisko,@mail,@login,@haslo)");

                SqlParameter param1, param2, param3, param4, param5;
                param1 = new SqlParameter("imie", SqlDbType.VarChar);
                param2 = new SqlParameter("nazwisko", SqlDbType.VarChar);
                param3 = new SqlParameter("mail", SqlDbType.VarChar);
                param4 = new SqlParameter("login", SqlDbType.VarChar);
                param5 = new SqlParameter("haslo", SqlDbType.VarChar);
                param1.Value = imie.Text;
                param2.Value = nazwisko.Text;
                param3.Value = mail.Text;
                param4.Value = login.Text;
                param5.Value = haslo.Text;
                rej_cmd_insert.Parameters.Add(param1);
                rej_cmd_insert.Parameters.Add(param2);
                rej_cmd_insert.Parameters.Add(param3);
                rej_cmd_insert.Parameters.Add(param4);
                rej_cmd_insert.Parameters.Add(param5);

                rej_cmd_insert.Connection = rej_con;
                rej_cmd_insert.ExecuteNonQuery();
                rej_con.Close();

                Response.Redirect("/");
            }
        }

    }
}
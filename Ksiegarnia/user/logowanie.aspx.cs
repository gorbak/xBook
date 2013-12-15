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
    public partial class logowanie : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            divBledy.Style["display"] = "none";
        }
        protected void zalogujClick(object sender, EventArgs e)
        {
            List<String> bledy = new List<String>();

            SqlConnection con;
            SqlCommand cmdSel;
            SqlDataReader reader;

            String loginSTR = login.Text;

            con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CS"].ConnectionString);
            con.Open();

            SqlParameter loginParam, hasloParam;         // zabezpiecznie przed sql injection
            loginParam = new SqlParameter("login", SqlDbType.VarChar);
            hasloParam = new SqlParameter("haslo", SqlDbType.VarChar);
            loginParam.Value = login.Text;
            hasloParam.Value = haslo.Text;

            cmdSel = new SqlCommand("SELECT * FROM [User] WHERE login = '" + login.Text + "' AND haslo = '" + haslo.Text + "'");

            cmdSel.Parameters.Add(loginParam);
            cmdSel.Parameters.Add(hasloParam);

            cmdSel.Connection = con;
            reader = cmdSel.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    Session["userID"] = reader.GetValue((int)UserDBTables.id_user);
                    Session["login"] = reader.GetValue((int)UserDBTables.login);

                    Session["Imie"] = reader.GetValue((int)UserDBTables.imie);
                    Session["Nazwisko"] = reader.GetValue((int)UserDBTables.nazwisko);
                    Session["Mail"] = reader.GetValue((int)UserDBTables.mail);

                    Session["uprawnienia"] = reader.GetValue((int)UserDBTables.uprawnienia);

                    Session.Timeout = 60;

                    if (checkboxZapamietaj.Checked)
                    {
                        Session.Timeout = 30 * 60;
                    }
                }
            }
            else
            {
                bledy.Add("Niepoprawne dane logowania!");
                loginText.Style["color"] = "red";
                hasloText.Style["color"] = "red";
            }

            con.Close();

            if (Session.Count > 0 && Session["login"].ToString() != null)
            {

                SqlConnection con2;
                SqlCommand cmdSel2;
                SqlDataReader reader2;
                con2 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CS"].ConnectionString);
                con2.Open();
                cmdSel2 = new SqlCommand("SELECT COUNT(*) from Koszyk WHERE id_usera = '" + Convert.ToInt32(Session["userID"].ToString()) + "'");

                cmdSel2.Connection = con2;
                reader2 = cmdSel2.ExecuteReader();

                if (reader2.HasRows)
                {
                    while (reader2.Read())
                    {
                        Session["koszyk_ile"] = reader2.GetValue(0);
                    }

                }

                con2.Close();
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
                Response.Redirect("/");
            }
        }
    }
}
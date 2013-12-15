using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Ksiegarnia.useradmin
{
    public partial class admin : System.Web.UI.Page
    {
        protected void dodaj_autora_ksiazki(int id_ksiazki, int id_autora)
        {
            SqlConnection mag_con, prod_con_upd2;
            SqlCommand mag_cmd_insert, prod_cmd_upd2;
            mag_con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CS"].ConnectionString);
            mag_con.Open();
            mag_cmd_insert = new SqlCommand("INSERT INTO "
                + "Autor_ksiazki "
                + "VALUES ('" + id_ksiazki + "','" + id_autora + "')");

            mag_cmd_insert.Connection = mag_con;
            mag_cmd_insert.ExecuteNonQuery();
            mag_con.Close(); 
        }
        protected void utworz_magazyn(int jaki)
        {
            SqlConnection mag_con, prod_con_upd2;
            SqlCommand mag_cmd_insert, prod_cmd_upd2;
            mag_con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CS"].ConnectionString);
            mag_con.Open();
            mag_cmd_insert = new SqlCommand("INSERT INTO "
                + "Magazyn "
                + "VALUES ('" + jaki + "','1')");

            SqlParameter param;
            param = new SqlParameter("jaki", SqlDbType.Int);
            param.Value = int.Parse(jaki.ToString());

            mag_cmd_insert.Parameters.Add(param);

            mag_cmd_insert.Connection = mag_con;
            mag_cmd_insert.ExecuteNonQuery();
            mag_con.Close();


            prod_con_upd2 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CS"].ConnectionString);
            prod_con_upd2.Open();
            prod_cmd_upd2 = new SqlCommand("UPDATE [Ksiazka] "
                + "SET id_magazynu=@jaki "
                + "WHERE ( id_ksiazki = '" + jaki + "')");

            SqlParameter param_mag;
            param_mag = new SqlParameter("jaki", SqlDbType.Int);
            param_mag.Value = jaki;

            prod_cmd_upd2.Parameters.Add(param_mag);

            prod_cmd_upd2.Connection = prod_con_upd2;
            prod_cmd_upd2.ExecuteNonQuery();
            prod_con_upd2.Close();

        }
        protected void niewidoczne_opcje()
        {
            uzytkownicy_admin.Visible = false;
            ksiazki_admin.Visible = false;
            magazyn_admin.Visible = false;
            kategorie_admin_menu.Visible = false;
            admin_menu_autorzy.Visible = false;
            //zamowienia_menu.Visible = false;
        }
        protected void opcja_wybrana(int opcja)
        {
            switch(opcja){
                case 1:
                    ksiazki_admin.Visible = true;
                    break;
                case 2:
                    kategorie_admin_menu.Visible = true;

                    break;
                case 3:
                    uzytkownicy_admin.Visible = true;
                    break;
                case 4:
                    magazyn_admin.Visible = true;
                    break;
                case 5:
                    uzytkownicy_admin.Visible = true;
                    break;
                case 6:
                    admin_menu_autorzy.Visible = true;
                    break;
                default:
            niewidoczne_opcje();
            ksiazki_admin.Visible = true;
                    break;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session.Count == 0)
            {
                Response.Redirect("/");
            }
            niewidoczne_opcje();
            if (Page.RouteData.Values["menu_admin"] != null)
            {
                switch (int.Parse(Page.RouteData.Values["menu_admin"].ToString()))
                {
                    case 1:
                        opcja_wybrana(1);
                        break;

                    case 2:
                        opcja_wybrana(2);
                        break;

                    case 3:
                        opcja_wybrana(3);
                        break;

                    case 4:
                        opcja_wybrana(4);
                        break;

                    case 5:
                        opcja_wybrana(5);
                        break;

                    case 6:
                        opcja_wybrana(6);
                        break;

                    default:
                        opcja_wybrana(1);
                        break;

                }
            }
            else
            {
                opcja_wybrana(1);
            }

        }

        protected void insertButtonKategoria_Click(object sender, EventArgs e)
        {
            sql_kategorie_admin.InsertParameters["nazwa"].DefaultValue = 
                ((TextBox)GridView3.FooterRow.FindControl("TextBox1")).Text;

            sql_kategorie_admin.InsertParameters["opis"].DefaultValue =
                ((TextBox)GridView3.FooterRow.FindControl("TextBox2")).Text;

            sql_kategorie_admin.Insert();
            GridView3.DataBind();

        
        }
        protected void insertButtonAutor_Click(object sender, EventArgs e)
        {
            SqlDataSource3.InsertParameters["imie"].DefaultValue =
                ((TextBox)GridView2.FooterRow.FindControl("TextBox1")).Text;

            SqlDataSource3.InsertParameters["nazwisko"].DefaultValue =
                ((TextBox)GridView2.FooterRow.FindControl("TextBox2")).Text;

            SqlDataSource3.Insert();
            GridView2.DataBind();


        }
        protected void buttonDodajKsiazkeClick(object sender, EventArgs e)
        {
            SqlConnection prod_con;
            SqlCommand prod_cmd_insert;
            prod_con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CS"].ConnectionString);
            prod_con.Open();
            prod_cmd_insert = new SqlCommand("INSERT INTO "
                + "Ksiazka(nazwa,opis, cena,id_kategoria)"
                + "VALUES (@nazwa,@opis, @cena,@kategoria)");

            SqlParameter param1, param3, param4, param_opis, param_autor;
            param1 = new SqlParameter("nazwa", SqlDbType.VarChar);
            param3 = new SqlParameter("cena", SqlDbType.Float);
            param4 = new SqlParameter("kategoria", SqlDbType.Int);
            param_opis = new SqlParameter("opis", SqlDbType.VarChar);
            param_autor = new SqlParameter("id_autor", SqlDbType.Int);
            param1.Value = TextBoxnazwa.Text;
            param3.Value = TextBoxcena.Text;
            param4.Value = DropDownkat.SelectedValue;
            param_autor.Value = DropDownListAutor.SelectedValue;
            param_opis.Value = text_opis_admin.Text;

            String nazwa = Convert.ToString(param1.Value);

            prod_cmd_insert.Parameters.Add(param1);
            prod_cmd_insert.Parameters.Add(param_autor);
            prod_cmd_insert.Parameters.Add(param3);
            prod_cmd_insert.Parameters.Add(param4);
            prod_cmd_insert.Parameters.Add(param_opis);

            prod_cmd_insert.Connection = prod_con;
            prod_cmd_insert.ExecuteNonQuery();



            prod_con.Close();

            String idx = "1";
            int id_autora = Convert.ToInt16(DropDownListAutor.SelectedValue);
            SqlConnection log_con;
            SqlCommand log_cmd_Sel, log_cmd_sel2;
            SqlDataReader rd;


            log_con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CS"].ConnectionString);
            log_con.Open();
            log_cmd_Sel = new SqlCommand("select top 1 * from [Ksiazka] order by id_ksiazki desc");


            log_cmd_Sel.Connection = log_con;
            rd = log_cmd_Sel.ExecuteReader();

            if (rd.HasRows)
            {
                while (rd.Read())
                {
                    idx = Convert.ToString(rd.GetValue(0));
                   
                }


            }
            log_con.Close();

            if (FileUploadmin.HasFile)
            {
                string subPath = "~/img/" + idx + "/";
                bool IsExists = System.IO.Directory.Exists(Server.MapPath(subPath));
                if (!IsExists)
                    System.IO.Directory.CreateDirectory(Server.MapPath(subPath));

                FileUploadmin.SaveAs(Server.MapPath("~/img/"+idx+"/") + idx + ".jpg");

            }

       //     dodaj_galerie(int.Parse(idx), TextBoxnazwa.Text);
            utworz_magazyn(int.Parse(idx.ToString()));
            dodaj_autora_ksiazki(int.Parse(idx.ToString()),id_autora);
            Response.Redirect("/admin/");

        }
        protected void DataList1_EditCommand(object source, DataListCommandEventArgs e)
        {
            DataList1_magazyn.EditItemIndex = e.Item.ItemIndex;
            DataList1_magazyn.DataBind();
        }

        protected void DataList1_magazyn_UpdateCommand(object source, DataListCommandEventArgs e)
        {

            String ProduktID =
                  DataList1_magazyn.DataKeys[e.Item.ItemIndex].ToString();
            Int32 ilosc =
                 int.Parse(((TextBox)e.Item.FindControl("iloscLabel_e")).Text);

            DS_magazyn_admin.UpdateParameters["ProduktID_org"].DefaultValue
               = ProduktID;
            DS_magazyn_admin.UpdateParameters["ilosc"].DefaultValue
                = ilosc.ToString();
            DS_magazyn_admin.Update();

            DataList1_magazyn.EditItemIndex = -1;
            DataList1_magazyn.DataBind();
        }

        protected void DS_Produkty_EditCommand(object source, DataListCommandEventArgs e)
        {
            DataList_produkty.EditItemIndex = e.Item.ItemIndex;
            DataList_produkty.DataBind();
        }

        protected void DS_Produkty_UpdateCommand(object source, DataListCommandEventArgs e)
        {
            String ProduktID =
      DataList_produkty.DataKeys[e.Item.ItemIndex].ToString();
            Int32 ilosc =
                 int.Parse(((TextBox)e.Item.FindControl("iloscLabel_e")).Text);

            SqlDataSource_produkty.UpdateParameters["ProduktID_org"].DefaultValue
               = ProduktID;
            SqlDataSource_produkty.UpdateParameters["ilosc"].DefaultValue
                = ilosc.ToString();
            SqlDataSource_produkty.Update();

            DataList_produkty.EditItemIndex = -1;
            DataList_produkty.DataBind();
        }
        protected void DataList_produkty_DeleteCommand(object source, DataListCommandEventArgs e)
        {
            SqlConnection con;
            SqlCommand coman = new SqlCommand();
            con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CS"].ConnectionString);

            int Ksiazka_ID = (int)DataList_produkty.DataKeys[(int)e.Item.ItemIndex];

            coman.Connection = con;
            coman.CommandText = "Delete from [Autor_ksiazki] where id_ksiazki=" + Ksiazka_ID;

            coman.Connection.Open();

            coman.ExecuteNonQuery();

            coman.Connection.Close();


            coman.Connection = con;
            coman.CommandText = "Delete from [Ksiazka] where id_ksiazki=" + Ksiazka_ID;

            coman.Connection.Open();

            coman.ExecuteNonQuery();

            coman.Connection.Close();


            DataList_produkty.EditItemIndex = -1;
            DataList_produkty.DataBind();
        }
    }
}